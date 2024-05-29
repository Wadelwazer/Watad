// ignore_for_file: unnecessary_string_interpolations, non_constant_identifier_names

import 'package:watad/constant/messages.dart';

ValidInput(String val, int min, int max) {
  if (val.isEmpty) {
    return "$messageinputEmpty";
  }
  if (val.length > max) {
    return "$messageinputMax $max";
  }
  if (val.length < min) {
    return "$messageinputMin $min";
  }
}
