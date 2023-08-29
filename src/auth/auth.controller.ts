import {
  Body,
  Controller,
  Get,
  HttpStatus,
  Post,
  Req,
  Res,
  UseGuards,
} from '@nestjs/common';
import { GoogleAuthGuard } from '../guard/google.guard';
import { AuthService } from './auth.service';
import { LoginUserDto } from './dto/login.dto';
import { RegisterUserDto } from './dto/register.dto';
import { Request, Response } from 'express';

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post('register')
  async register(@Body() registerData: RegisterUserDto) {
    const newUser = await this.authService.registerUser(registerData);
    return newUser;
  }
  @Post('login')
  async login(
    @Body() loginData: LoginUserDto,
    @Res({ passthrough: true }) res: Response,
  ) {
    const user = await this.authService.loginUser(loginData);
    res.cookie('refreshToken', user.refreshToken, {
      httpOnly: true,
      secure: false,
    });
    res.status(HttpStatus.OK).json(user);
  }

  @Post('token/reset')
  async reset(@Req() req: Request) {
    return await this.authService.getAccessTokenFromRefreshToken(
      req.cookies.refreshToken,
    );
  }

  @Get('google/login')
  @UseGuards(GoogleAuthGuard)
  handleLogin() {
    return { msg: 'Google Authentication' };
  }
  @Get('google/redirect')
  @UseGuards(GoogleAuthGuard)
  handleRedirect() {
    return { msg: 'OK' };
  }
}
