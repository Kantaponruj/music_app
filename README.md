# music_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# BaoMove Application

The application is developed for the purpose of tracking the transportation status between drivers, planners (control tower), and partner stores. Its aim is to provide a clearer and more efficient view of the delivery process.

By utilizing this application, users can easily monitor and track the movement of deliveries, ensuring enhanced visibility and clarity throughout the transportation process.

## Project Setup

### Install FVM

FVM is Flutter Version Management

```
brew tap leoafarias/fvm
brew install fvm
```

Use `.fvmrc` file to configure Flutter version

e.g.

```
{
  "flutter": "3.19.6"
}
```

Switch Flutter version by `fvm use` at root of repository.

```
fvm use 3.19.6
```

#### First, direct to app directory

```
  cd truck-driver
```

#### Get dependencies

```
fvm  flutter pub get
```

#### Local run

```
fvm  flutter run
```

Run this command for only device log

```
fvm  flutter run | grep -v "D/EGL_emulation"
```

## Deployment step

Deployment application to publish on Google Play Console and App Store Connect.

### Build application for Android

#### Build APK file app

```
fvm flutter build apk
```

#### Build App Bundle for publishing

```
fvm  flutter build appbundle
```

### Build&Deploy step for UAT (Andriod)

1.  update .env.production to variable
    ```
    API_ANDROID = ?
    API_IOS = ?
    API_ANDROID_CJ = ?
    API_IOS_CJ = ?
    ```
    replace "?" with desired API Endpoint
2.  update app version in pubspec.yaml
    ```
    > example: 2.9.0+2135
    >
    > app version = 2.9.0
    >
    > build number = 2135 (running number)
    ```
3.  update dependency
    ```
    $ fvm flutter pub get
    ```
4.  build apk file and deploy
    ```
    $ make build-deploy-uat
    ```
