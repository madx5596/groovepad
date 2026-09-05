# 📱 GroovePad - Импорт в Android Studio

## 🚀 Быстрый старт для Android Studio

Проект полностью подготовлен для импорта и компиляции в **Android Studio**.

---

## 📋 Требования

- **Android Studio** 2021.3.1 или выше
- **Java JDK 8** или выше
- **Android SDK** с API level 21+
- **Gradle 7.5** (автоматически загружается через gradle-wrapper)
- **Flutter SDK** (если нужна сборка из Flutter)

---

## 📥 Инструкция по импорту в Android Studio

### Шаг 1: Клонирование репозитория
```bash
git clone https://github.com/madx5596/groovepad.git
cd groovepad
```

### Шаг 2: Открытие проекта в Android Studio

1. Откройте **Android Studio**
2. Нажмите **File → Open** (или **Ctrl+O / Cmd+O**)
3. Перейдите в папку проекта `groovepad/android`
4. Выберите папку `android` и нажмите **Open**

### Шаг 3: Синхронизация Gradle
После открытия проекта:
1. Android Studio автоматически начнет синхронизацию проекта
2. Дождитесь завершения загрузки зависимостей
3. Если потребуется, установите предложенные SDK версии

### Шаг 4: Конфигурация Flutter (опционально)

Если вы хотите работать с Flutter кодом:

1. Откройте `android/gradle.properties`
2. Установите путь к Flutter SDK:
```properties
flutter.sdk=/path/to/flutter
```

На **Linux/Mac**:
```bash
flutter.sdk=/Users/username/flutter
```

На **Windows**:
```bash
flutter.sdk=C:\\flutter
```

### Шаг 5: Сборка проекта

#### Способ 1: Через Android Studio
1. Нажмите **Build → Make Project** (Ctrl+F9)
2. Или нажмите **Build → Build Bundle(s) / APK(s) → Build APK(s)**

#### Способ 2: Через командную строку
```bash
cd android
./gradlew build
```

На **Windows**:
```bash
cd android
gradlew.bat build
```

---

## 🔧 Структура файлов Gradle

```
android/
├── app/
│   ├── build.gradle          # Конфиг модуля приложения
│   ├── proguard-rules.pro    # Правила оптимизации
│   └── src/
│       └── main/
│           ├── AndroidManifest.xml
│           └── kotlin/       # Код на Kotlin
├── build.gradle             # Корневой конфиг
├── gradle.properties         # Свойства Gradle
├── settings.gradle          # Конфиг подпроектов
├── gradle/
│   └── wrapper/
│       └── gradle-wrapper.properties  # Версия Gradle
└── .idea/                   # Конфиги IntelliJ IDEA
```

---

## 🛠️ Основные команды Gradle

### Сборка Debug APK
```bash
./gradlew assembleDebug
```
APK будет в: `app/build/outputs/apk/debug/app-debug.apk`

### Сборка Release APK
```bash
./gradlew assembleRelease
```
APK будет в: `app/build/outputs/apk/release/app-release.apk`

### Запуск тестов
```bash
./gradlew test
```

### Очистка проекта
```bash
./gradlew clean
```

### Синхронизация зависимостей
```bash
./gradlew sync
```

---

## ⚙️ Ос��овные конфигурации

### android/build.gradle (корневой)
- Версия Gradle: **7.3.0**
- Kotlin версия: **1.7.10**
- Android Gradle Plugin: **7.3.0**

### android/app/build.gradle (модуль приложения)
- **compileSdkVersion**: 33
- **targetSdkVersion**: 33
- **minSdkVersion**: 21
- **namespace**: com.example.groovepad

### android/gradle.properties
- **JVM памяти**: 4096m
- Поддержка Material3 дизайна

---

## 📦 Зависимости проекта

Основные зависимости (из Flutter pubspec.yaml):
- `provider` - управление состоянием
- `audioplayers` - воспроизведение аудио
- `file_picker` - выбор файлов
- `permission_handler` - разрешения

Android зависимости (в app/build.gradle):
- `androidx.appcompat:appcompat:1.6.1`
- `androidx.constraintlayout:constraintlayout:2.1.4`

---

## 🐛 Решение проблем

### Проблема: "Flutter SDK not found"
**Решение**: Добавьте путь в `android/gradle.properties`:
```properties
flutter.sdk=/path/to/flutter
```

### Проблема: "Gradle sync failed"
**Решение**: 
1. Удалите `.gradle` папку в проекте
2. Нажмите **File → Invalidate Caches** в Android Studio
3. Пересинхронизируйте проект

### Проблема: "Cannot find symbol"
**Решение**:
1. Очистите проект: `./gradlew clean`
2. Пересоберите: `./gradlew build`

### Проблема: "Out of memory"
**Решение**: Увеличьте JVM память в `android/gradle.properties`:
```properties
org.gradle.jvmargs=-Xmx8192m
```

---

## 📝 Разработка

После успешного импорта вы можете:
1. **Изменять Kotlin код** в `app/src/main/kotlin/`
2. **Добавлять новые ресурсы** в `app/src/main/res/`
3. **Модифицировать AndroidManifest.xml**
4. **Работать с Flutter кодом** в корневой папке `lib/`

---

## 🚢 Публикация в Play Store

### Подписание APK для релиза
1. Создайте keystore:
```bash
keytool -genkey -v -keystore my-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias my-key-alias
```

2. Добавьте в `android/app/build.gradle`:
```gradle
signingConfigs {
    release {
        keyAlias 'my-key-alias'
        keyPassword 'password'
        storeFile file('/path/to/my-release-key.jks')
        storePassword 'password'
    }
}
```

3. Соберите подписанный APK:
```bash
./gradlew assembleRelease
```

---

## 📞 Контакты и поддержка

- **GitHub**: [madx5596/groovepad](https://github.com/madx5596/groovepad)
- **Issues**: [GitHub Issues](https://github.com/madx5596/groovepad/issues)

---

## 📄 Лицензия

MIT License - см. LICENSE файл

---

**Готово! 🎉 Проект полностью настроен для работы в Android Studio.**
