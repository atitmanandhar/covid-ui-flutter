import 'package:flutter/material.dart';
import 'package:covid_ui_flutter/screens/global_screen.dart';
import 'package:covid_ui_flutter/screens/countries_screen.dart';
import 'package:covid_ui_flutter/screens/about_us_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.globalData, this.countryData});

  final globalData, countryData;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  dynamic currentPage;

  GlobalScreen screen1;
  CountriesScreen screen2;
  AboutUsScreen screen3;
  List<Widget> pages;

  @override
  void initState() {
    screen1 = GlobalScreen(
      globalData: widget.globalData,
    );
    screen2 = CountriesScreen(
      countryData: widget.countryData,
    );
    screen3 = AboutUsScreen();

    pages = [screen1, screen2, screen3];

    currentPage = screen1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30.0,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white60,
        selectedItemColor: Color(0xFFe16428),
        currentIndex: _currentTab,
        onTap: (int index) {
          setState(() {
            _currentTab = index;
            currentPage = pages[index];
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.public,
            ),
            title: Text('Global'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.flag,
            ),
            title: Text('Countries'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.help_outline,
            ),
            title: Text('About'),
          ),
        ],
      ),
    );
  }
}
