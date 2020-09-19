import 'package:covid_ui_flutter/constants.dart';
import 'package:covid_ui_flutter/screens/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InternetUnavailableScreen extends StatelessWidget {
  InternetUnavailableScreen(this.context);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Whoops!',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              SizedBox(height: 30.0),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    height: 1.6,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: 'Slow or no internet connection\n',
                    ),
                    TextSpan(
                      text: 'Please check your internet settings',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              FlatButton(
                color: Color(0xFFe16428),
                padding: kDefaultPadding,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoadingScreen(),
                    ),
                  );
                },
                child: Text(
                  'Try Again',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
