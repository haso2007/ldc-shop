# Example secrets setup for Wrangler (safe to commit).
# Replace placeholders and run in PowerShell.
# If you deploy to a specific environment, add --env <name> to each command.

@'
YOUR_MERCHANT_ID_HERE
'@ | wrangler secret put MERCHANT_ID

@'
YOUR_MERCHANT_KEY_HERE
'@ | wrangler secret put MERCHANT_KEY

@'
YOUR_OAUTH_CLIENT_ID_HERE
'@ | wrangler secret put OAUTH_CLIENT_ID

@'
YOUR_OAUTH_CLIENT_SECRET_HERE
'@ | wrangler secret put OAUTH_CLIENT_SECRET

@'
YOUR_ADMIN_USERS_HERE
'@ | wrangler secret put ADMIN_USERS
