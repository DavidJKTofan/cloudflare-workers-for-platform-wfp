#!/bin/bash

npx wrangler deploy -c saas-api/wrangler.toml

npx wrangler deploy -c dispatch-worker/wrangler.toml
npx wrangler deploy -c outbound-worker/wrangler.toml

npx wrangler@beta deploy -c user-worker/wrangler.toml --dispatch-namespace demo
