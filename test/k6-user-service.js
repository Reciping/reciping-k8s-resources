import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  scenarios: {
    steady: {
      executor: 'constant-arrival-rate',
      rate: __ENV.RATE ? parseInt(__ENV.RATE) : 300, // req/s
      timeUnit: '1s',
      duration: __ENV.DURATION || '15m',
      preAllocatedVUs: __ENV.VUS ? parseInt(__ENV.VUS) : 100,
      maxVUs: __ENV.MAX_VUS ? parseInt(__ENV.MAX_VUS) : 200,
    },
  },
  thresholds: {
    http_req_failed: ['rate<0.01'],
    http_req_duration: ['p(95)<300'], // p95 < 300ms 기본 SLO
  },
};

const BASE = __ENV.BASE || 'http://reciping-user-service.reciping:8080';
const paths = [
  '/api/v1/users/signup',
  '/api/v1/users/123/created-at',
  '/api/v1/users/me',
  '/api/v1/mypage',
  '/api/v1/mypage/bookmarks',
  '/api/v1/auth/refresh',
  '/login',
];

export default function () {
  const p = paths[Math.floor(Math.random() * paths.length)];
  const res = http.get(`${BASE}${p}`, { tags: { endpoint: p } });
  check(res, { 'status<400': (r) => r.status < 400 });
  sleep(0.05);
}

