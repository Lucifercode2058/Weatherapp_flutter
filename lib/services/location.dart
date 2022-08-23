import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class location{
  double latitude;
  double longitude;
  Future<void> getcurrentlocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
     latitude=position.latitude;
     longitude=position.longitude;
    }catch(e){
      print(e);
    }

  }
}