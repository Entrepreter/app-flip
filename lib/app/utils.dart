import 'dart:io';

import 'package:intl/intl.dart';

class Utils {
  String getCurrency() {
    var format = NumberFormat.simpleCurrency(locale: Platform.localeName);
    return format.currencySymbol;
  }
}
