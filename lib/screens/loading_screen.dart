import 'package:flutter/material.dart';
import 'package:covid_ui_flutter/services/network_helper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:covid_ui_flutter/screens/home_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getInfo() async {
    NetworkHelper globalAPI =
        NetworkHelper(url: 'https://coronavirus-19-api.herokuapp.com/all');
    NetworkHelper countryAPI = NetworkHelper(
        url: 'https://coronavirus-19-api.herokuapp.com/countries');

    var globalData = await globalAPI.getData();
    var countryData = await countryAPI.getData();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          globalData: globalData,
          countryData: countryData,
        ),
      ),
    );
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitWave(
        color: Theme.of(context).primaryColor,
        size: 60.0,
      ),
    );
  }
}
