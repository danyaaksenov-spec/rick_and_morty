import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/core/error/exception.dart';
import 'package:rick_and_morty/feature/data/models/person_model.dart';

abstract class RemoteDataSource {
  // 'https://rickandmortyapi.com/api/character/?page=$page'
  Future<List<PersonModel>> getAllPersons(int page);
  // 'https://rickandmortyapi.com/api/character/?name=$query'
  Future<List<PersonModel>> searchPerson(String query);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  http.Client client;
  RemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<PersonModel>> getAllPersons(int page) => _getPersonsFromUrl(
      'https://rickandmortyapi.com/api/character/?page=$page');

  @override
  Future<List<PersonModel>> searchPerson(String query) => _getPersonsFromUrl(
      'https://rickandmortyapi.com/api/character/?name=$query');

  Future<List<PersonModel>> _getPersonsFromUrl(String url) async {
    print(url);
    final response = await client
        .get(Uri.parse(url), headers: {'Content-type': 'application/json'});

    if (response.statusCode == 200) {
      final persons = json.decode(response.body);
      return (persons['results'] as List)
          .map((person) => PersonModel.fromJson(person))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
