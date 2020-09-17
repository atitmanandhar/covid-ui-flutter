class CountryWiseData {
  CountryWiseData({
    this.country,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.critical,
  });

  String country;
  int cases, todayCases, deaths, todayDeaths, recovered, critical;
}
