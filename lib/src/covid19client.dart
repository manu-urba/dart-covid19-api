// Copyright (c) 2020, 'manu-urba'. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import 'covid19summary.dart';
import 'covid19country.dart';

/// The base class which allows to create a covid19 client.
///
/// You have to create an instance of this class to start working with this package.
class Covid19Client {
  final _dio = Dio(BaseOptions(baseUrl: 'https://api.covid19api.com'));

  /// Shuts down the covid19 client.
  ///
  /// If [force] is `false` (the default) the [Covid19Client] will be kept alive
  /// until all active connections are done. If [force] is `true` any active
  /// connections will be closed to immediately release all resources. These
  /// closed connections will receive an error event to indicate that the client
  /// was shut down. In both cases trying to establish a new connection after
  /// calling [close] will throw an exception.
  void close({bool force = false}) => _dio.close(force: force);

  /// Fetches summary informations, see [Covid19Summary].
  Future<Covid19Summary> getSummary() async {
    var res = await _dio.get('/summary');
    var data = Covid19Summary(res.data);
    return data;
  }

  /// Fetches countries informations.
  ///
  /// It returns a list of [Covid19CountryBase].
  Future<List<Covid19CountryBase>> getCountries() async {
    var res = await _dio.get('/countries');
    var data = res.data;
    List<Covid19CountryBase> list = List();

    for (var i in data) {
      list.add(Covid19CountryBase(
          country: i['Country'], slug: i['Slug'], iso2: i['ISO2']));
    }

    return list;
  }

  /// Fetches countries information since the day one.
  ///
  /// It returns a list of [Covid19CountryAllStatus].
  ///
  /// The [status] can be: 'confirmed', 'recovered' or 'deaths'.
  Future<List<Covid19CountryAllStatus>> getDayOne(
      {@required String country, String status, bool live = false}) async {
    if (live && status == null) status = 'confirmed';
    var res = await _dio.get('/dayone/country/$country' +
        (status != null ? '/status/$status' : '') +
        (live ? '/live' : ''));
    var data = res.data;
    List<Covid19CountryAllStatus> list = List();

    for (var i in data) {
      list.add(
        Covid19CountryAllStatus(
          country: i['Country'],
          countryCode: i['CountryCode'],
          province: i['Province'],
          city: i['City'],
          cityCode: i['CityCode'],
          lat: i['Lat'],
          lon: i['Lon'],
          confirmed: i['Confirmed'],
          deaths: i['Deaths'],
          recovered: i['Recovered'],
          active: i['Active'],
          date: i['Date'],
        ),
      );
    }
    return list;
  }

  /// Fetches countries information since the day one.
  ///
  /// If the [status] is set, the method returns a list of [Covid19CountryEx]
  /// Otherwise it returns a list of [Covid19CountryAllStatus].
  ///
  /// The [status] can be: 'confirmed', 'recovered' or 'deaths'.
  Future<List> getDayOneTotal({@required String country, String status}) async {
    var res = await _dio.get('/total/dayone/country/$country' +
        (status != null ? '/status/$status' : ''));
    var data = res.data;
    List list = List();

    if (status != null) {
      for (var i in data) {
        list.add(
          Covid19CountryEx(
            country: i['Country'],
            countryCode: i['CountryCode'],
            province: i['Province'],
            city: i['City'],
            cityCode: i['CityCode'],
            lat: i['Lat'],
            lon: i['Lon'],
            cases: i['Cases'],
            status: i['Status'],
            date: i['Date'],
          ),
        );
      }
      return list;
    }

    for (var i in data) {
      list.add(
        Covid19CountryAllStatus(
          country: i['Country'],
          countryCode: i['CountryCode'],
          province: i['Province'],
          city: i['City'],
          cityCode: i['CityCode'],
          lat: i['Lat'],
          lon: i['Lon'],
          confirmed: i['Confirmed'],
          deaths: i['Deaths'],
          recovered: i['Recovered'],
          active: i['Active'],
          date: i['Date'],
        ),
      );
    }
    return list;
  }

  /// Fetches informations about a single country.
  ///
  /// If the [status] is set, the method returns a list of [Covid19CountryEx]
  /// In this case you have to specify [from] and [to] parameters.
  ///
  /// Otherwise it returns a list of [Covid19CountryAllStatus].
  ///
  /// The [status] can be: 'confirmed', 'recovered' or 'deaths'.
  Future<List> getByCountry(
      {@required String country,
      String status,
      bool live = false,
      String from,
      String to}) async {
    var res = await _dio.get(
        '/country/$country' +
            (status != null
                ? live
                    ? '/status/$status/live'
                    : '/status/$status'
                : ''),
        queryParameters: {'from': from, 'to': to});

    var data = res.data;
    List list = List();

    if (status != null) {
      for (var i in data) {
        list.add(
          Covid19CountryEx(
            country: i['Country'],
            countryCode: i['CountryCode'],
            province: i['Province'],
            city: i['City'],
            cityCode: i['CityCode'],
            lat: i['Lat'],
            lon: i['Lon'],
            cases: i['Cases'],
            status: i['Status'],
            date: i['Date'],
          ),
        );
      }
      return list;
    }
    for (var i in data) {
      list.add(
        Covid19CountryAllStatus(
          country: i['Country'],
          countryCode: i['CountryCode'],
          province: i['Province'],
          city: i['City'],
          cityCode: i['CityCode'],
          lat: i['Lat'],
          lon: i['Lon'],
          confirmed: i['Confirmed'],
          deaths: i['Deaths'],
          recovered: i['Recovered'],
          active: i['Active'],
          date: i['Date'],
        ),
      );
    }
    return list;
  }

  /// Fetches total informations about a single country.
  ///
  /// If the [status] is set, the method returns a list of [Covid19CountryEx]
  /// In this case you have to specify [from] and [to] parameters.
  ///
  /// Otherwise it returns a list of [Covid19CountryAllStatus].
  ///
  /// The [status] can be: 'confirmed', 'recovered' or 'deaths'.
  Future<List> getByCountryTotal(
      {@required String country, String status, String from, String to}) async {
    var res = await _dio.get(
        '/total/country/$country' + (status != null ? '/status/$status' : ''),
        queryParameters: status != null ? {'from': from, 'to': to} : null);
    var data = res.data;

    List list = List();

    if (status != null) {
      for (var i in data) {
        list.add(
          Covid19CountryEx(
            country: i['Country'],
            countryCode: i['CountryCode'],
            province: i['Province'],
            city: i['City'],
            cityCode: i['CityCode'],
            lat: i['Lat'],
            lon: i['Lon'],
            cases: i['Cases'],
            status: i['Status'],
            date: i['Date'],
          ),
        );
      }
      return list;
    }

    for (var i in data) {
      list.add(
        Covid19CountryAllStatus(
          country: i['Country'],
          countryCode: i['CountryCode'],
          province: i['Province'],
          city: i['City'],
          cityCode: i['CityCode'],
          lat: i['Lat'],
          lon: i['Lon'],
          confirmed: i['Confirmed'],
          deaths: i['Deaths'],
          recovered: i['Recovered'],
          active: i['Active'],
          date: i['Date'],
        ),
      );
    }
    return list;
  }

  /// Fetches live informations about a single country after a specific [date].
  ///
  /// Don't forget to specify the [date] parameter
  /// While specifying [status] parameter.
  ///
  /// It returns a list of [Covid19CountryAllStatus].
  ///
  /// The [status] can be: 'confirmed', 'recovered' or 'deaths'.
  Future<List<Covid19CountryAllStatus>> getLive(
      {@required String country, String status, String date}) async {
    var res = await _dio.get('/live/country/$country' +
        (status != null
            ? date != null
                ? '/status/$status/date/$date'
                : '/status/$status'
            : ''));
    var data = res.data;
    List<Covid19CountryAllStatus> list = List();

    for (var i in data) {
      list.add(
        Covid19CountryAllStatus(
          country: i['Country'],
          countryCode: i['CountryCode'],
          province: i['Province'],
          city: i['City'],
          cityCode: i['CityCode'],
          lat: i['Lat'],
          lon: i['Lon'],
          confirmed: i['Confirmed'],
          deaths: i['Deaths'],
          recovered: i['Recovered'],
          active: i['Active'],
          date: i['Date'],
        ),
      );
    }
    return list;
  }

  /// Fetches countries informations.
  ///
  /// It returns a list of [Covid19GlobalDataTotal].
  Future<Covid19GlobalDataTotal> getWorldTotal() async {
    var res = await _dio.get('/world/total');
    var data = Covid19GlobalDataTotal(res.data);
    return data;
  }
}
