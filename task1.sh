#!/bin/bash

# Визначення масиву з URL вебсайтів, які потрібно перевірити
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Назва файлу логів, в який будуть записані результати
log_file="website_status.log"

# Видалення файлу логів, якщо він вже існує, щоб створити новий файл
> $log_file

# Проходження всіх вебсайтів у масиві
for site in "${websites[@]}"
do
  # Використання curl для перевірки HTTP-відповіді вебсайту
  response=$(curl -Is "$site" | head -n 1)

  # Перевірка, чи є HTTP-статус код 200
  if echo "$response" | grep -q "200"; then
    # Якщо вебсайт доступний, записуємо "is UP" у файл логів
    echo "$site is UP" >> $log_file
  else
    # Якщо вебсайт недоступний, записуємо "is DOWN" у файл логів
    echo "$site is DOWN" >> $log_file
  fi
done

# Виведення повідомлення про те, що результати записані у файл логів
echo "Перевірка завершена. Результати були записані у файл $log_file."
