import dotenv from 'dotenv';

dotenv.config();

const config = {
    node_env: process.env.NODE_ENV ?? 'dev',
};

export default config;
