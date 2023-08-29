import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UserModule } from './users/user.module';
import { AuthModule } from './auth/auth.module';
import { RoleModule } from './role/role.module';
import { RedisModule } from './redis/redis.module';

@Module({
  imports: [UserModule, AuthModule, RoleModule, RedisModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
