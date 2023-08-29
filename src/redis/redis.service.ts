// redis.service.ts
import { Injectable, Inject } from '@nestjs/common';
import * as Redis from 'ioredis';

@Injectable()
export class RedisService {
  constructor(
    @Inject('REDIS_CONNECTION') private readonly redisClient: Redis.Redis,
  ) {}

  async set(key: string, value: string) {
    await this.redisClient.set(key, value);
  }

  async get(key: string): Promise<string | null> {
    return await this.redisClient.get(key);
  }

  async delete(key: string) {
    await this.redisClient.del(key);
  }
}
