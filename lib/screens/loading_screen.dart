import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';




class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlocationdata();
    print('geo);');


  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('deactivated');
  }
  void getlocationdata()async {
    WeatherModel weatherModel =WeatherModel();
var weathermodel= await weatherModel.getweather();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(location: weathermodel);
    }));
  }



  @override
  Widget build(BuildContext context) {

    print('build called');
    return Scaffold(
body: Center(
  child: SpinKitSpinningLines(
    size: 300,

    color: Colors.cyan,
  ),
),
    );

  }
}
