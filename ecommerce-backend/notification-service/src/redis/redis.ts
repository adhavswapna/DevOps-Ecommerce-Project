import Redis from 'ioredis';

const redis = new Redis({
  host: process.env.REDIS_HOST || 'localhost',
  port: Number(process.env.REDIS_PORT) || 6379,
  password: process.env.REDIS_PASSWORD || undefined,
  db: 1, // separate DB for notification service
});

redis.on('connect', () => console.log('✅notification Service Redis connected'));
redis.on('error', (err) => console.error('❌notification Service Redis error:', err));

export default redis;

