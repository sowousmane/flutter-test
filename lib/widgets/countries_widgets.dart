import 'package:flutter/material.dart';
import 'package:my_http_project/models/country.dart';

class CountriesWidget extends StatelessWidget {
  final List<Country> countries;

  CountriesWidget({required this.countries});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (context, index) {
        final country = countries[index];

        return ListTile(
          title: Row(
            children: [
              SizedBox(
                  width: 100,
                  child: ClipRRect(
                    child: Image.network(country.flag),
                    borderRadius: BorderRadius.circular(10),
                  )),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(country.name),
                    Text(country.capital),
                  ],
                ),
              ))
            ],
          ),
        );
      },
    );
  }
}
