# Cloudflare Pages Setup Guide

## D1 Database Binding (REQUIRED FOR LEADERBOARD & WINS)

Your Cloudflare Pages deployment needs to be connected to the D1 database manually.

### Steps to bind D1 database:

1. Go to your Cloudflare Pages dashboard
2. Select your `datadivas-org` project
3. Go to **Settings** → **Functions**
4. Scroll down to **D1 database bindings**
5. Click **Add binding**
6. Set:
   - **Variable name**: `DB`
   - **D1 database**: `datadivas_wins`
7. Click **Save**

### KV Namespace Binding (Optional for caching):

1. In the same **Functions** settings page
2. Scroll to **KV namespace bindings**
3. Click **Add binding**
4. Set:
   - **Variable name**: `KV`
   - **KV namespace**: Select your KV namespace
5. Click **Save**

### After binding:

1. Go to **Deployments** tab
2. Click **Retry deployment** on the latest deployment
3. The leaderboard and wins should now load with data

## Verify Test Data

To verify the database has test data, use Wrangler CLI:

```bash
npx wrangler d1 execute datadivas_wins --remote --command "SELECT COUNT(*) FROM wins"
```

You should see 10 records.

## Local Development with D1

For local development with D1 bindings:

```bash
npm run build
npx wrangler pages dev dist
```

This will run the site locally with access to your D1 database.
