# Монитор Сетевого Подключения

iOS приложение для мониторинга сетевого подключения в реальном времени с визуальной обратной связью.

## 🚀 Возможности

- **Мониторинг сети в реальном времени** - Определяет наличие интернета и тип подключения (Wi-Fi, Сотовая связь, Ethernet)
- **Мгновенная визуальная обратная связь** - Цвет фона меняется (зеленый/красный) в зависимости от статуса подключения
- **Детальный статус** - Показывает текущий тип подключения и статус
- **Поддержка нескольких языков** - Полная локализация на английский и русский
- **Безопасность и эффективность** - Потокобезопасность с правильным управлением памятью

## 🛠 Технологии

- Swift 5
- UIKit
- Network.framework
- NWPathMonitor
- NotificationCenter
- Auto Layout

## 📱 Использование

1. **Запустите** приложение на реальном iPhone
2. **Сверните** приложение (на домашний экран)
3. **Включите/выключите** интернет в Настройках
4. **Наблюдайте** за визуальными изменениями и логами в консоли

## ⚠️ Важно

Для точного тестирования используйте **реальный iPhone, подключенный через USB-кабель**.
Симулятор может не определять реальные изменения сетевого статуса.

## 🏗 Архитектура

- Singleton NetworkMonitor с NWPathMonitor
- Паттерн Наблюдатель через NotificationCenter
- Программный UI с Auto Layout
- Локализация через Localizable.strings

## 🔧 Установка

1. Клонируйте репозиторий
2. Откройте в Xcode
3. Подключите iPhone через USB
4. Выберите устройство как цель сборки
5. Соберите и запустите

## 📸 Демонстрация возможностей

- **Зеленый фон** = Подключено
- **Красный фон** = Нет интернета
- **Статус лейбл** = Детали подключения
- **Логи в консоли** = Мониторинг в реальном времени


# Network Connectivity Monitor

iOS application for real-time network connectivity monitoring with instant visual feedback.

## 🚀 Features

- **Real-time Network Monitoring** - Detects internet availability and connection type (Wi-Fi, Cellular, Ethernet)
- **Instant Visual Feedback** - Background color changes (green/red) based on connection status
- **Detailed Status Display** - Shows current connection type and status
- **Multi-language Support** - Full localization for English and Russian
- **Safe & Efficient** - Thread-safe with proper memory management

## 🛠 Technologies

- Swift 5
- UIKit
- Network.framework
- NWPathMonitor
- NotificationCenter
- Auto Layout

## 📱 Usage

1. **Launch** the app on a real iPhone device
2. **Minimize** the app (home screen)
3. **Toggle** internet connection in Settings
4. **Observe** visual changes and console logs

## ⚠️ Important

For accurate testing, use a **real iPhone device connected via USB cable**. 
Simulator may not detect actual network status changes correctly.

## 🏗 Architecture

- Singleton NetworkMonitor with NWPathMonitor
- Observer pattern via NotificationCenter
- Programmatic UI with Auto Layout
- Localization with Localizable.strings

## 🔧 Setup

1. Clone the repository
2. Open in Xcode
3. Connect iPhone via USB
4. Select device as build target
5. Build and run

## 📸 Features Demo

- **Green background** = Connected
- **Red background** = No internet
- **Status label** = Connection details
- **Console logs** = Real-time monitoring

<img width="279" height="626" alt="Simulator Screenshot - iPhone 15 - 2025-11-06 at 16 28 25" src="https://github.com/user-attachments/assets/ef37d51b-e228-410d-b3cd-3e8ee1759e18" /><img width="279" height="626" alt="Simulator Screenshot - iPhone 15 - 2025-11-06 at 16 28 18" src="https://github.com/user-attachments/assets/a35f6e02-cc22-42f6-a9b1-3028931f1d2a" />


