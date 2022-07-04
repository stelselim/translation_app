# Multi Translator App
<b>An app utilizes to translate any text to multiple languages.</b>

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

## Authors

👤 **Selim Ustel**

- GitHub: [@stelselim](https://github.com/stelselim)
- LinkedIn: [@selimustel](https://www.linkedin.com/in/selimustel/)

<br/>

## Setup
This project uses generated files to run. Before running the app, please run.

```
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

