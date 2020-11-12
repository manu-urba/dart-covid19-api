// Copyright (c) 2020, 'manu-urba'. All rights reserved. Use of this source code
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

  covid.close();
}
