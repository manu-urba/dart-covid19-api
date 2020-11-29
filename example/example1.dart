// Copyright (c) 2020, 'Manuel Urbano'. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:covid19/covid19.dart';

void main() async {
  var covid = Covid19Client();

  var summary = await covid.getSummary();
  print('''
  -- GLOBAL DATA --

      New confirmed: ${summary.global.newConfirmed}
      Total confirmed: ${summary.global.totalConfirmed}
      New deaths: ${summary.global.newDeaths}
      Total deaths: ${summary.global.totalDeaths}
      New recovered: ${summary.global.newRecovered}
      Total recovered: ${summary.global.totalRecovered}
      ''');

  var countries = await covid.getCountries();
  print('''
  -- COUNTRIES LIST -- (showing only the first 5)
        ''');
  for (int i = 0; i < 5; i++) {
    print('''
      Country: ${countries[i].country}'s iso2 is ${countries[i].iso2}. ''');
  }

  var dayone = await covid.getDayOne(
      country: 'Austria', status: 'confirmed', live: false);
  print('''

    -- DAYONE DATA --

        Country name: ${dayone[0].country}'s country code is ${dayone[0].countryCode}.
        ''');

  var dayonetotal =
      await covid.getDayOneTotal(country: 'Austria', status: 'recovered');
  print('''

  -- DAYONE TOTAL DATA --

      Country name: ${dayonetotal[0].country} has ${dayonetotal[dayonetotal.length - 1].cases} cases.
      ''');

  var singlecountry = await covid.getByCountry(country: 'Malaysia');
  print('''

  -- SINGLE COUNTRY DATA --

      Country name: ${singlecountry[1].country} has ${singlecountry[singlecountry.length - 1].confirmed} confirmed cases.
      ''');
  var countrytotal = await covid.getByCountryTotal(
      country: 'Canada',
      from: '2020-11-10T00:00:00Z',
      to: '2020-11-19T00:00:00Z');
  print('''
  -- COUNTRY TOTAL DATA --
      ''');
  for (int i = 0; i < 10; i++) {
    print(''' 
    On November ${i + 10}, 2020: ${countrytotal[1].country} has ${countrytotal[i].confirmed} confirmed cases.''');
  }

  var live = await covid.getLive(country: 'Canada');
  print('''

  -- SINGLE COUNTRY DATA --

    On live update, ${live[1].country} has ${live[live.length - 1].confirmed} confirmed cases.
      ''');

  var worldtotal = await covid.getWorldTotal();
  print('''
  -- WORLD TOTAL --

    Total confirmed: ${worldtotal.totalConfirmed}
    Total deaths:    ${worldtotal.totalDeaths}
    Total recovered: ${worldtotal.totalRecovered}.
      ''');
  covid.close();
}
