#!/bin/bash

# لیست آدرس‌های IP یا دامنه‌های سرورهای VPN
servers=(
  "8.8.8.8"       # نمونه آدرس گوگل
  "1.1.1.1"       # نمونه آدرس کلودفلر
  "your-vpn-server.com" # سرور VPN شما
)

# تنظیم مدت‌زمان Timeout برای ping (به ثانیه)
timeout=3

echo "بررسی وضعیت سرورهای VPN"
echo "========================"

for server in "${servers[@]}"; do
  echo -n "بررسی سرور: $server ... "
  # اجرای دستور ping
  if ping -c 1 -W $timeout $server &> /dev/null; then
    echo "فعال ✅"
  else
    echo "غیرفعال ❌"
  fi
done

echo "========================"
echo "پایان بررسی."
