class CountryWiseData {
  CountryWiseData({
    this.country,
    this.cases,
    this.todayCases,
    this.activeCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.critical,
  });

  String country;
  int cases, todayCases, activeCases, deaths, todayDeaths, recovered, critical;
}
