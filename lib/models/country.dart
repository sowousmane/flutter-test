class Country {
  final String name;
  final String capital;
  final String flag;
  Country({required this.name, required this.capital, required this.flag});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        name: json["name"], capital: json["capital"], flag: json["flag"]);
  }
}
