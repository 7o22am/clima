import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'location_screen.dart';

const apikay = '14883d072e1242f6d2296a4cdd5561e3';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void getlocationData() async {
    Location location = Location();
    await location.GetCurrenLocation();
    var long = location.longitude;
    var lat = location.latitiude;
    NetworkHelper networkHelper = NetworkHelper(
       'https://www.googleapis.com/books/v1/volumes?q={http}');
    print(networkHelper);
    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen( locationScreen: weatherData,);
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getlocationData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
