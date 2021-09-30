import 'dart:convert';

import 'package:rick_and_morty/core/error/exception.dart';
import 'package:rick_and_morty/feature/data/models/person_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PersonLocalDataSource {
  Future<List<PersonModel>> getLastPersonsFromCache();

  Future<void> personsToCache(List<PersonModel> persons);
}

const cachedPersonsList = 'CACHED_PERSONS_LIST';

class PersonLocalDataSourceImpl implements PersonLocalDataSource {
  final SharedPreferences sharedPreferences;

  PersonLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<PersonModel>> getLastPersonsFromCache() {
    final jsonPersonList = sharedPreferences.getStringList(cachedPersonsList);
    if (jsonPersonList != null && jsonPersonList.isNotEmpty) {
      return Future.value(jsonPersonList
          .map((person) => PersonModel.fromJson(json.decode(person)))
          .toList());
    } else {
      throw CacheException;
    }
  }

  @override
  Future<void> personsToCache(List<PersonModel> persons) {
    final List<String> jsonPersonList =
        persons.map((person) => json.encode(person.toJson())).toList();

    sharedPreferences.setStringList(cachedPersonsList, jsonPersonList);
    return Future.value();
  }
}
