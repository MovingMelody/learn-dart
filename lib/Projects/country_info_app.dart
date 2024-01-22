// ignore_for_file: public_member_api_docs, sort_constructors_first
/*
* Created on 13 January 2023
* @author Sai Sumanth
*/

import 'dart:convert';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  print('Entry the country Name to fetch details : ');
  final countryName = stdin.readLineSync() ?? 'Japan';
  fetchAndDisplayInfo(countryFullName: countryName);
}

Future<void> fetchAndDisplayInfo({required String countryFullName}) async {
  /// API
  final api =
      'https://restcountries.com/v3.1/name/$countryFullName?fullText=true';
  try {
    /// Invoke API and wait for response
    final response = await http.get(Uri.parse(api));

    ///
    /// Read more about API Status Codes here - https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#client_error_responses
    ///
    print('API Status Code ${response.statusCode}');

    final decodedResponse = jsonDecode(response.body);
    final countryInfo =
        CountryInfo.fromMap(decodedResponse[0] as Map<String, dynamic>);
    print(countryInfo);
  } catch (e) {
    print(
        'Error occurred while fetching information about country : $countryFullName');
    print('Error : $e');
  }
}

///
/// class [CountryInfo] represents information about a country
///
class CountryInfo extends Equatable {
  final String name;
  final bool independent;
  final String flag;
  final int population;
  final List<String>? capital;

  /// Constructor for creating a CountryInfo object
  const CountryInfo({
    required this.name,
    required this.independent,
    required this.flag,
    required this.population,
    this.capital,
  });

  /// Factory method to create a CountryInfo object from a Map.
  factory CountryInfo.fromMap(Map<String, dynamic> map) {
    /// using Constructor to create object
    return CountryInfo(
      name: map['name']['common'] as String,
      independent: map['independent'] as bool,
      flag: map['flag'] as String,
      population: map['population'] as int,
      capital: map['capital'] != null
          ? List<String>.from(map['capital'] as List<dynamic>)
          : null,
    );
  }

  factory CountryInfo.fromJson(String source) =>
      CountryInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CountryInfo(name: $name, independent: $independent, flag: $flag, population: $population, capital: $capital)';
  }

  /// list of properties for Equatable comparison
  @override
  @override
  List<Object?> get props => [name, independent, flag, population, capital];
}
