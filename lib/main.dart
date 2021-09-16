import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_http_project/models/country.dart';
import 'package:my_http_project/widgets/countries_widgets.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _App createState() => _App();
}

class _App extends State<App> {
  List<Country> _countries = [];
  @override
  void initState() {
    super.initState();
    _populateAllCountries();
  }

  void _populateAllCountries() async {
    final countries = await _fetchAllMovies();
    setState(() {
      _countries = countries;
    });
  }

  Future<List<Country>> _fetchAllMovies() async {
    final response =
        await http.get(Uri.parse("https://restcountries.eu/rest/v2/all"));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result;
      return list.map((country) => Country.fromJson(country)).toList();
    } else {
      throw Exception("Failed to load countries!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade300,
        primarySwatch: Colors.grey,
      ),
      title: "test Http",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Http test"),
          centerTitle: true,
          backgroundColor: Colors.grey,

        ),
        body: CountriesWidget(countries: _countries),
      ),
    );
  }
}
