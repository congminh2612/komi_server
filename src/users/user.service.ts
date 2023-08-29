import {
  Injectable,
  NotFoundException,
  UnauthorizedException,
} from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class UserService {
  constructor(private prisma: PrismaService) {}

  async getAllUser() {
    return this.prisma.users.findMany();
  }
  async deleteUser(id: string) {
    try {
      const user = await this.prisma.users.delete({
        where: { id },
      });
      if (!user) {
        throw new NotFoundException('User not found');
      }
      return `user ${user.id} is deleted`;
    } catch (error) {
      throw new UnauthorizedException(error);
    }
  }
}
