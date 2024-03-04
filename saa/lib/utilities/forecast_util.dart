import 'package:intl/intl.dart';

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d').format(dateTime); //Tue, May 5, 2022
  }

  static String findIcon(String name, bool type) {
    if (type) {
      switch (name) {
        case "Clouds":
          return "asset/cloud.png";
        case "Rain":
          return "asset/rain.png";
        case "Drizzle":
          return "asset/drizzle.png";
        case "Thunderstorm":
          return "asset/thunder.png";
        case "Snow":
          return "asset/snow.png";
        default:
          return "asset/a.png";
      }
    } else {
          switch (name) {
        case "Clouds":
          return "asset/cloud.png";
        case "Rain":
          return "asset/rain.png";
        case "Drizzle":
          return "asset/drizzle.png";
        case "Thunderstorm":
          return "asset/thunder.png";
        case "Snow":
          return "asset/snow.png";
        default:
          return "asset/a.png";
      }
    }
  }
}