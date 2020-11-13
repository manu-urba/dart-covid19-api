# dart-covid19-api
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
- API is fetched from https://api.covid19api.com
- This is my first API wrapper and my first project in dart, I'll be happy to get any recommendation ❤️
