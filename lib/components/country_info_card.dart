import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountryInfoCard extends StatelessWidget {
  CountryInfoCard({
    this.title,
    this.cases,
    this.casesToday,
    this.casesActive,
    this.deaths,
    this.deathsToday,
    this.recovered,
    this.critical,
  });

  final String title;
  final int cases,
      casesToday,
      casesActive,
      deaths,
      deathsToday,
      recovered,
      critical;

  final digitFormatter = new NumberFormat("#,###");

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4.0),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14.0,
                  height: 1.4,
                ),
                children: [
                  TextSpan(
                    text:
                        'Cases: ${digitFormatter.format(cases)} | Today: ${digitFormatter.format(casesToday)} | Active: ${casesActive != null ? digitFormatter.format(casesActive) : 'unavailable'} \n',
                  ),
                  TextSpan(
                    text:
                        'Deaths: ${digitFormatter.format(deaths)} | Today: ${digitFormatter.format(deathsToday)}\n',
                  ),
                  TextSpan(
                    text:
                        'Recovered: ${recovered != null ? digitFormatter.format(recovered) : 'unavailable'} | Critical: ${digitFormatter.format(critical)}',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
