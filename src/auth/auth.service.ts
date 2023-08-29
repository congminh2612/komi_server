import {
  BadRequestException,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import * as bcrypt from 'bcrypt';
import { RegisterUserDto } from './dto/register.dto';
import { LoginUserDto } from './dto/login.dto';
import { Prisma } from '@prisma/client';
import { Profile } from 'passport';
import { JwtService } from '@nestjs/jwt';
import { PayloadType } from './types/payload.type';
import { RedisService } from 'src/redis/redis.service';

@Injectable()
export class AuthService {
  constructor(
    private prisma: PrismaService,
    private jwtService: JwtService,
    private redisService: RedisService,
  ) {}

  async registerUser(user: RegisterUserDto) {
    if (user.role) {
      throw new BadRequestException('Invalid role specified');
    }

    try {
      const newUser = await this.prisma.users.create({
        data: {
          name: user.name,
          email: user.email,
          password: await this.hashedPassword(user.password),
          phone: user.phone,
          address: user.address,
        },
      });
      return newUser;
    } catch (error) {
      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        if (error.code === 'P2002' && typeof error.meta.target === 'string') {
          const duplicatedFields = error.meta.target.split('_');
          const duplicatedField = duplicatedFields[1];

          const errorMessage =
            this.getDuplicateFieldErrorMessage(duplicatedField);
          throw new BadRequestException(errorMessage);
        }
      }
      throw new BadRequestException(error);
    }
  }

  async loginUser(userLogin: LoginUserDto) {
    try {
      const user = await this.prisma.users.findUnique({
        where: { email: userLogin.email },
      });
      if (!user) {
        throw new UnauthorizedException('Invalid email or password');
      }
      const isPasswordValid = await bcrypt.compare(
        userLogin.password,
        user.password,
      );
      if (!isPasswordValid) {
        throw new UnauthorizedException('Invalid email or password');
      }
      const payload = { sub: user.id, username: user.name, role: user.role };
      const accessToken = await this.generateAccessToken(payload);
      const refreshToken = await this.generateRefreshToken(payload);

      return {
        ...user,
        accessToken,
        refreshToken,
      };
    } catch (error) {
      throw new UnauthorizedException(error);
    }
  }

  async getAccessTokenFromRefreshToken(refreshToken: string) {
    try {
      const tokenDecoded = await this.jwtService.verify(refreshToken, {
        secret: process.env.JWT_SECRET_REFRESH,
      });
      if (!tokenDecoded) {
        throw new UnauthorizedException();
      }
      const user = await this.prisma.users.findUnique({
        where: { id: await tokenDecoded.sub },
      });
      if (!user) {
        throw new UnauthorizedException('User not found');
      }
      const payload = { sub: user.id, username: user.name, role: user.role };
      const accessToken = await this.generateAccessToken(payload);
      const newRefreshToken = await this.generateRefreshToken(payload);
      await this.redisService.set(payload.sub, newRefreshToken);

      return {
        accessToken: accessToken,
        refreshToken: newRefreshToken,
      };
    } catch (error) {
      throw new UnauthorizedException(error);
    }
  }

  private async generateAccessToken(payload: PayloadType): Promise<string> {
    const accessToken = await this.jwtService.signAsync(payload, {
      expiresIn: '30m',
      secret: process.env.JWT_SECRET_ACCESS,
    });

    return accessToken;
  }

  private async generateRefreshToken(payload: PayloadType): Promise<string> {
    const refreshToken = await this.jwtService.signAsync(payload, {
      expiresIn: '30d',
      secret: process.env.JWT_SECRET_REFRESH,
    });

    await this.redisService.set(payload.sub, refreshToken);

    return refreshToken;
  }

  async googleLoginOrRegister(profile: Profile) {
    const hashedPassword = await bcrypt.hash('google', 10);
    try {
      const user = await this.prisma.users.findUnique({
        where: { email: profile.emails[0].value },
      });
      if (!user) {
        const newUser = await this.prisma.users.create({
          data: {
            name: profile.displayName,
            email: profile.emails[0].value,
            password: hashedPassword,
            phone: '',
            address: '',
          },
        });
        return newUser;
      }
      return user;
    } catch (error) {
      throw new BadRequestException(error);
    }
  }

  private getDuplicateFieldErrorMessage(duplicatedField: string) {
    const errorMessages: Record<string, string> = {
      email: 'Email is already taken',
      phone: 'Phone number is already taken',
    };
    return errorMessages[duplicatedField];
  }

  private async hashedPassword(password: string): Promise<string> {
    const saltRound = 10;
    const salt = await bcrypt.genSalt(saltRound);
    const hash = await bcrypt.hash(password, salt);

    return hash;
  }
}
