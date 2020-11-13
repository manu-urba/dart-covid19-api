# dart-covid19-api [![pub package](https://img.shields.io/pub/v/badge.svg)](https://pub.dartlang.org/packages/covid19)
Covid-19 API wrapper for Dart

## Basic usage
```dart
import 'package:covid19/covid19.dart';

void main() async {
  var covid = Covid19Client();
  var summary = await covid.getSummary();

  print('Global new confirmed coronavirus cases: ${summary.global.newConfirmed}');

  covid.close();
}
```

## Documentation
https://pub.dev/documentation/covid19/latest/covid19/covid19-library.html

## More info
- API is fetched from https://api.covid19api.com (JHU CSSE COVID-19 Data)
- This is my first API wrapper and my first project in dart, I'll be happy to get any recommendation ❤️
