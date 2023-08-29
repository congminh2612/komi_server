import { Module } from '@nestjs/common';
import { AuthController } from './auth.controller';
import { GoogleStrategy } from './google/google.strategy';
import { PrismaService } from 'src/prisma/prisma.service';
import { AuthService } from './auth.service';
import { JwtModule } from '@nestjs/jwt';
import { RedisService } from 'src/redis/redis.service';
import { RedisModule } from 'src/redis/redis.module';

@Module({
  imports: [
    JwtModule.register({
      global: true,
    }),
    RedisModule,
  ],
  controllers: [AuthController],
  providers: [GoogleStrategy, PrismaService, AuthService, RedisService],
})
export class AuthModule {}
