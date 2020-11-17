// Copyright (c) 2020, 'Manuel Urbano'. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'covid19country.dart';

/// Summary class.
///
/// You can retrieve several informations from this class
/// Here's an example of a JSON API responce:
/// ```json
/// {
///   "Message": "",
///   "Global": {
///     "NewConfirmed": 606451,
///     "TotalConfirmed": 52725633,
///     "NewDeaths": 9020,
///     "TotalDeaths": 1293096,
///     "NewRecovered": 342034,
///     "TotalRecovered": 34261480
///   },
///   "Countries": [
///     {
///       "Country": "Afghanistan",
///       "CountryCode": "AF",
///       "Slug": "afghanistan",
///       "NewConfirmed": 186,
///       "TotalConfirmed": 42795,
///       "NewDeaths": 10,
///       "TotalDeaths": 1591,
///       "NewRecovered": 57,
///       "TotalRecovered": 35024,
///       "Date": "2020-11-13T07:55:56Z",
///       "Premium": {}
///      },
///      ...
///   ]
/// }
/// ```
class Covid19Summary {
  final Map _map;

  Covid19Summary(this._map);

  String get message => _map['Message'];
  Covid19GlobalData get global => Covid19GlobalData(_map['Global']);
  List<Covid19Country> get countries {
    List<Covid19Country> list = List();

    for (var i in _map['Countries']) {
      list.add(Covid19Country(
          country: i['Country'],
          countryCode: i['CountryCode'],
          slug: i['Slug'],
          newConfirmed: i['NewConfirmed'],
          totalConfirmed: i['TotalConfirmed'],
          newDeaths: i['NewDeaths'],
          totalDeaths: i['TotalDeaths'],
          newRecovered: i['NewRecovered'],
          totalRecovered: i['TotalRecovered'],
          date: i['Date'],
          premium: i['Premium']));
    }
    return list;
  }

  DateTime get date => DateTime.parse(_map['Date']);
}

/// You can retrieve global data from this class.
///
/// Here's an example of a JSON API responce:
/// ```json
/// {
///   "NewConfirmed": 606451,
///   "TotalConfirmed": 52725633,
///   "NewDeaths": 9020,
///   "TotalDeaths": 1293096,
///   "NewRecovered": 342034,
///   "TotalRecovered": 34261480
/// }
/// ```
class Covid19GlobalData {
  final Map<String, dynamic> _map;

  Covid19GlobalData(this._map);

  int get newConfirmed => _map['NewConfirmed'];
  int get totalConfirmed => _map['TotalConfirmed'];
  int get newDeaths => _map['NewDeaths'];
  int get totalDeaths => _map['TotalDeaths'];
  int get newRecovered => _map['NewRecovered'];
  int get totalRecovered => _map['TotalRecovered'];
}

/// You can retrieve global data from this class.
///
/// Here's an example of a JSON API responce:
/// ```json
/// {
///   "TotalConfirmed": 52725633,
///   "TotalDeaths": 1293096,
///   "TotalRecovered": 34261480
/// }
/// ```
class Covid19GlobalDataTotal {
  final Map<String, dynamic> _map;

  Covid19GlobalDataTotal(this._map);

  int get totalConfirmed => _map['TotalConfirmed'];
  int get totalDeaths => _map['TotalDeaths'];
  int get totalRecovered => _map['TotalRecovered'];
}
