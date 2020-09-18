import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:covid_ui_flutter/model/country_wise_data.dart';
import 'package:covid_ui_flutter/components/search_box.dart';
import 'package:covid_ui_flutter/components/country_info_card.dart';

class CountriesScreen extends StatefulWidget {
  CountriesScreen({this.countryData});

  final countryData;

  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  List<CountryWiseData> countryWiseData = [];
  List<CountryWiseData> duplicateData = [];

  void loadData() {
    for (var data in widget.countryData) {
      CountryWiseData addItem = CountryWiseData(
        country: data['country'],
        cases: data['cases'],
        todayCases: data['todayCases'],
        activeCases: data['active'],
        deaths: data['deaths'],
        todayDeaths: data['todayDeaths'],
        recovered: data['recovered'],
        critical: data['critical'],
      );
      countryWiseData.add(addItem);
      duplicateData.add(addItem);
    }
  }

  void filterSearchResults(String query) {
    List<CountryWiseData> dummySearchList = [];
    dummySearchList.addAll(countryWiseData);
    if (query.isNotEmpty) {
      List<CountryWiseData> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.country.toLowerCase().contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        countryWiseData.clear();
        countryWiseData.addAll(dummyListData);
      });
      // return;
    } else {
      setState(() {
        countryWiseData.clear();
        countryWiseData.addAll(duplicateData);
      });
    }
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coronavirus by Country'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0),
            child: SearchBox(
              trigger: (value) {
                filterSearchResults(value);
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: countryWiseData.length,
              itemBuilder: (BuildContext context, int index) {
                return CountryInfoCard(
                  title: countryWiseData[index].country,
                  cases: countryWiseData[index].cases,
                  casesToday: countryWiseData[index].todayCases,
                  casesActive: countryWiseData[index].activeCases,
                  deaths: countryWiseData[index].deaths,
                  deathsToday: countryWiseData[index].todayDeaths,
                  recovered: countryWiseData[index].recovered,
                  critical: countryWiseData[index].critical,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(height: 1.0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
