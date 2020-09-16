import 'package:covid_ui_flutter/components/global_info_card.dart';
import 'package:covid_ui_flutter/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GlobalScreen extends StatefulWidget {
  GlobalScreen({this.globalData});

  final globalData;

  @override
  _GlobalScreenState createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  int totalCases, totalDeaths, totalRecovered;
  final digitFormatter = new NumberFormat("#,###");

  @override
  void initState() {
    updateUI(widget.globalData);
    super.initState();
  }

  void updateUI(dynamic data) {
    totalCases = data['cases'];
    totalDeaths = data['deaths'];
    totalRecovered = data['recovered'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global Coronavirus Information'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoadingScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GlobalInfoCard(
            title: 'Coronavirus cases',
            data: digitFormatter.format(totalCases),
          ),
          GlobalInfoCard(
            title: 'Deaths',
            data: digitFormatter.format(totalDeaths),
          ),
          GlobalInfoCard(
            title: 'Recovered',
            data: digitFormatter.format(totalRecovered),
          ),
        ],
      ),
    );
  }
}


