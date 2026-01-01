# LDC Store - Linux DO 积分商城

基于 **Cloudflare Workers** + **D1 Database** 的 Serverless 虚拟商品自动发货系统，面向 Linux DO 生态，支持 **Linux DO Credit** 积分支付与 **Linux DO Connect** 登录。

## ✅ 特性

- **Serverless 架构**：运行在 Cloudflare 边缘网络，低成本高性能。
- **自动发货**：支付成功后自动展示卡密/CDK。
- **Linux DO 深度集成**：
  - **Linux DO Connect** (OIDC) 一键登录
  - **Linux DO Credit** (EasyPay) 积分支付
- **后台管理**：商品、库存、订单管理，支持退款操作。
- **快速补货**：在库存页面可一键批量添加相同卡密。
- **安全可靠**：数据存储在 Cloudflare D1。

## 🚀 部署指南

### 1) 环境准备

```bash
npm install -g wrangler
wrangler login
```

### 2) 初始化 D1 数据库

```bash
wrangler d1 create ldc-shop-db
wrangler d1 execute ldc-shop-db --file=schema.sql
```

如果是线上数据库：
```bash
wrangler d1 execute ldc-shop-db --remote --file=schema.sql
```

### 3) 配置 Secrets

你可以用脚本快速配置（已提供模板）：

```bash
powershell -ExecutionPolicy Bypass -File .\secrets.local.example.ps1
```

或手动设置：

```bash
wrangler secret put MERCHANT_ID
wrangler secret put MERCHANT_KEY
wrangler secret put OAUTH_CLIENT_ID
wrangler secret put OAUTH_CLIENT_SECRET
wrangler secret put ADMIN_USERS
```

如果使用环境（如 `production`），命令后加 `--env production`。

### 4) 部署

```bash
wrangler deploy
```

## 🛠 后台管理

1. 访问站点并使用 Linux DO 登录。
2. 你的用户名必须在 `ADMIN_USERS` 中，登录后导航栏会出现 **Admin**。
3. 后台功能：
   - **Products**：新建/编辑商品
   - **Stock**：导入卡密、快速批量添加相同卡密
   - **Orders**：查看订单、发起退款

> 退款说明：如果退款接口返回浏览器挑战页面，系统会提示你在新标签页打开退款页面完成操作。

## 📄 License

MIT
