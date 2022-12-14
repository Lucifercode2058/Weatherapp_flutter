import 'location.dart';
import 'networking.dart';
import 'package:clima/screens/city_screen.dart';

const appkey = '2a486330e9d57494540f28e2a6568d08';
const website = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future citynamed(String citynamed) async {
    networkhelper city = await networkhelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?q=$citynamed&appid=$appkey&units=metric');
    var citydata = await city.getdata();
    return citydata;
    print('fine');
  }

  Future getweather() async {
    location getcurrentlocations = location();
    await getcurrentlocations.getcurrentlocation();

    networkhelper locationdata = await networkhelper(
        url:
            '$website?lat=${getcurrentlocations.latitude}&lon=${getcurrentlocations.longitude}&appid=$appkey&units=metric');
    var locations = await locationdata.getdata();

    return locations;
    print('worksuptohere');
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
