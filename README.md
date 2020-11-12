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