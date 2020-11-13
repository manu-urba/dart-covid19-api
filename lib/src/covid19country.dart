// Copyright (c) 2020, 'manu-urba'. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// Basic informations of a country.
///
/// Example JSON API responce of a [List] of [Covid19CountryBase]:
/// ```json
/// [
///   ...
///   {
///     "Country": "Nicaragua",
///     "Slug": "nicaragua",
///     "ISO2": "NI"
///   },
///   {
///     "Country": "Puerto Rico",
///     "Slug": "puerto-rico",
///     "ISO2": "PR"
///   },
///   {
///     "Country": "China",
///     "Slug": "china",
///     "ISO2": "CN"
///   },
///   ...
/// ]
/// ```
class Covid19CountryBase {
  final String country;
  final String slug;
  final String iso2;

  const Covid19CountryBase({this.country, this.slug, this.iso2});
}

/// Several country informations.
///
/// Example JSON API responce of a [List] of [Covid19Country]:
/// ```json
/// [
///   ...
///   {
///     "Country": "United Kingdom",
///     "CountryCode": "GB",
///     "Slug": "united-kingdom",
///     "NewConfirmed": 33517,
///     "TotalConfirmed": 1293715,
///     "NewDeaths": 563,
///     "TotalDeaths": 51020,
///     "NewRecovered": 13,
///     "TotalRecovered": 3031,
///     "Date": "2020-11-13T07:55:56Z",
///     "Premium": {}
///   },
///   {
///     "Country": "United States of America",
///     "CountryCode": "US",
///     "Slug": "united-states",
///     "NewConfirmed": 153496,
///     "TotalConfirmed": 10552821,
///     "NewDeaths": 919,
///     "TotalDeaths": 242423,
///     "NewRecovered": 54081,
///     "TotalRecovered": 4051256,
///     "Date": "2020-11-13T07:55:56Z",
///     "Premium": {}
///   },
///   ...
/// ]
/// ```
class Covid19Country {
  final String country;
  final String countryCode;
  final String slug;
  final int newConfirmed;
  final int totalConfirmed;
  final int newDeaths;
  final int totalDeaths;
  final int newRecovered;
  final int totalRecovered;
  final String date;
  final Map<String, dynamic> premium;

  const Covid19Country(
      {this.country,
      this.countryCode,
      this.slug,
      this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered,
      this.date,
      this.premium});
}

/// Several country informations.
///
/// Example JSON API responce of a [List] of [Covid19CountryAllStatus]:
/// ```json
/// [
///   ...
///   {
///     "Country": "Italy",
///     "CountryCode": "IT",
///     "Province": "",
///     "City": "",
///     "CityCode": "",
///     "Lat": "0",
///     "Lon": "0",
///     "Confirmed": 1066401,
///     "Deaths": 43589,
///     "Recovered": 387758,
///     "Active": 635054,
///     "Date": "2020-11-12T00:00:00Z"
///   },
///   ...
/// ]
/// ```
class Covid19CountryAllStatus {
  final String country;
  final String countryCode;
  final String province;
  final String city;
  final String cityCode;
  final String lat;
  final String lon;
  final int confirmed;
  final int deaths;
  final int recovered;
  final int active;
  final String date;

  const Covid19CountryAllStatus(
      {this.country,
      this.countryCode,
      this.province,
      this.city,
      this.cityCode,
      this.lat,
      this.lon,
      this.confirmed,
      this.deaths,
      this.recovered,
      this.active,
      this.date});
}

/// Several country informations.
///
/// Example JSON API responce of a [List] of [Covid19CountryAllStatus]:
/// ```json
/// [
///   ...
///   {
///     "Country": "Italy",
///     "CountryCode": "",
///     "Province": "",
///     "City": "",
///     "CityCode": "",
///     "Lat": "41.87",
///     "Lon": "12.57",
///     "Cases": 143626,
///     "Status": "confirmed",
///     "Date": "2020-04-09T00:00:00Z"
///   },
///   ...
/// ]
/// ```
class Covid19CountryEx {
  final String country;
  final String countryCode;
  final String province;
  final String city;
  final String cityCode;
  final String lat;
  final String lon;
  final int cases;
  final String status;
  final String date;

  const Covid19CountryEx(
      {this.country,
      this.countryCode,
      this.province,
      this.city,
      this.cityCode,
      this.lat,
      this.lon,
      this.cases,
      this.status,
      this.date});
}
