// Copyright (c) 2020, 'manu-urba'. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

class Covid19CountryBase {
  final String country;
  final String slug;
  final String iso2;

  const Covid19CountryBase({this.country, this.slug, this.iso2});
}

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
