# 使用 Node.js 官方映像
FROM node:lts

# 設定工作目錄
WORKDIR /app

# 複製 package.json 和 package-lock.json
COPY package*.json ./

# 安裝依賴
RUN npm ci

# 複製專案所有檔案
COPY . .

# 建立 production build
RUN npm run build-prod

# 使用 nginx 提供靜態檔案
RUN npm install -g serve

# 預設執行 serve，提供 dist 目錄
CMD ["serve", "-s", "dist", "-l", "8271"]