import 'dart:math';

import 'package:http/http.dart' as http;

const _headers = {'x-rapidapi-host': 'numbersapi.p.rapidapi.com', 'x-rapidapi-key': 'a9a982829bmsh8b99666fb3a72bbp1cbbb3jsn747e577ba242'};
const _baseYear = 1400;

/// Returns a future request for a new fun fact related to today's date
Future<String> newFactForDate(DateTime date) async {
  final response = await http.get('https://numbersapi.p.rapidapi.com/${date.month}/${date.day}/date', headers: _headers);
  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return response.body;
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load new fact for current date');
  }
}

/// Returns a future request for a new fun fact related to the given year
Future<String> newFactForYear(int year) async {
  final response = await http.get('https://numbersapi.p.rapidapi.com/$year/year', headers: _headers);
  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return response.body;
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load new fact for the year $year');
  }
}

/// Returns a random year between 1500 and today
int getRandomYear() {
  final currentYear = new DateTime.now().year;
  //We'll only consider events between 1400 up to the current year
  final diff = currentYear - _baseYear;
  final random = Random();
  //We'll add the diff to the result so we get the proper year in our accepted range
  return random.nextInt(diff) + _baseYear;
}
