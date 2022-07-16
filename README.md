# Multi Translator App
<b>An app utilizes to translate any text to multiple languages.</b>

[![Codemagic build status](https://api.codemagic.io/apps/62b9b53b58fcc97673f288e5/62b9b53b58fcc97673f288e4/status_badge.svg)](https://codemagic.io/apps/62b9b53b58fcc97673f288e5/62b9b53b58fcc97673f288e4/latest_build)

<img width=180 src="https://user-images.githubusercontent.com/46201537/177821784-688d3b39-57f0-40dd-9342-41f6a1314bd9.png"/>

<br/>

## Features
- [X] Localization
- [X] Multiple Translation
- [X] Single Translation 
- [X] Deep Links
- [X] Translation History
- [X] Translation Share & Copy 
- [ ] Reminder Notification for Translation History
- [ ] Auto Language Detection
- [ ] Listenable Translations

<br/>

## Domain-Driven Design
Domain-driven design is a concept in order structure software projects and maintain the domain layer of the source code by [Eric Evans](https://www.linkedin.com/in/ericevansddd/). For further reading, [here](https://www.domainlanguage.com/ddd/). DDD is robust, solid & be applicable to various fields of software development. Thanks to DDD, massive projects are much maintainable with its principles. 

<br/>

## Flutter with DDD
In Flutter development, DDD might be used with different state management libraries; such as BLOC, provider, redux... This project uses BLOC. The directory of the project is mainly seperated into 4 subdirectories: Application, Domain, Presentation, Infrastructure. Each subdirectory has a valuable role in DDD. Every one of them should be considered as a layer of a building. Some layers contact other layers, some do not. For further reading, [here](https://resocoder.com/2020/03/09/flutter-firebase-ddd-course-1-domain-driven-design-principles/).

<br/>

## CI/CD For Flutter
Continuous Integration and Continuous Delivery is an one of the most essential topics of software development. For mobile development, it strongly depends on SDKs and platforms both iOS & Android. This project uses Codemagic CI/CD configuration without any addition to source code. For further reading, [here](https://blog.codemagic.io/flutter-step-by-step-tutorial/).

<br/>


## Deep Links
Multi Translator App supports deep links for both iOS and Android. Deep links are useful when navigating the app from outside of it. This app takes two different parameters by deep link for translating. Also, Flutter supports universal links as well. For further reading about Deep Linking [here](https://docs.flutter.dev/development/ui/navigation/deep-linking).

#### Parameters
- text
- lan (default: en)

<br/>

#### Example - 1
Parameters
```
text=hello
```
Command for iOS Simulator
```
xcrun simctl openurl booted "ibksteltranslate:translation?text=hello"
```
Command for Android Emulator
```
adb shell am start  "ibksteltranslate://translation?text=hello"
```


<br/>

#### Example - 2
Parameters
```
text=merhaba
lan=tr
```
Command for iOS Simulator
```
xcrun simctl openurl booted "ibksteltranslate:translation?text=merhaba&lan=tr"
```
Commands for Android Emulator
```
adb shell am start  "ibksteltranslate://translation?text=merhaba&lan=tr"
```

<br/>


## Setup

This project uses generated files to run. Before running the app, please run.

```
git clone https://github.com/stelselim/translation_app.git
cd translation_app
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

<br/>

## Run
Runs the project.
```
flutter pub get
flutter run
```


<br/>

## Test
Runs unit tests.
```
flutter pub get
flutter test
```

<br/>

## Authors

👤 **Selim Ustel**

- GitHub: [@stelselim](https://github.com/stelselim)
- LinkedIn: [@selimustel](https://www.linkedin.com/in/selimustel/)

<br/>


<view style="display: flex;
  flex-direction: row-reverse;">
<img src="https://user-images.githubusercontent.com/46201537/177822117-0e7d204e-2d82-4084-813b-56a77e304005.PNG" width=240/>
<img src="https://user-images.githubusercontent.com/46201537/177822129-a4548110-1a71-4804-a7e7-5876982e925b.PNG" width=240/>
<img src="https://user-images.githubusercontent.com/46201537/177822135-b0dbe0a7-c70d-4127-92b3-194e13a21c55.PNG" width=240/>
<img src="https://user-images.githubusercontent.com/46201537/177822155-a08e6038-c416-4251-9aa6-7d62ec779205.PNG" width=240/>  

</view>
