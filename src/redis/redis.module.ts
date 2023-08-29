import { Logger, Module } from '@nestjs/common';
import { Redis } from 'ioredis';

@Module({
  providers: [
    {
      provide: 'REDIS_CONNECTION',
      useFactory: () => {
        const logger = new Logger('RedisModule');
        const redisClient = new Redis({
          host: 'localhost',
          port: 6379,
        });

        redisClient.on('connect', () => {
          logger.log('Connected to Redis');
        });

        redisClient.on('error', (error) => {
          logger.error('Redis Error:', error);
        });

        return redisClient;
      },
    },
  ],
  exports: ['REDIS_CONNECTION'],
})
export class RedisModule {}
