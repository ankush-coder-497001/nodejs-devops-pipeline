const request = require('supertest');
const express = require('express');
const app = require('../index');

describe('Health Check', () => {
  it('should return status UP', async () => {
    const res = await request(app).get('/health');
    expect(res.statusCode).toBe(200);
    expect(res.body.status).toBe('UP');
  });
});
