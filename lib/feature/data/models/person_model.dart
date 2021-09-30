import 'package:rick_and_morty/feature/data/models/location_modal.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';

class PersonModel extends PersonEntity {
  const PersonModel({
    required id,
    required name,
    required species,
    required type,
    required gender,
    required image,
    required created,
    required episode,
    required location,
    required origin,
    required status,
  }) : super(
          created: created,
          episode: episode,
          gender: gender,
          id: id,
          image: image,
          location: location,
          name: name,
          origin: origin,
          species: species,
          status: status,
          type: type,
        );

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'],
      image: json['image'],
      created: DateTime.parse(json['created'] as String),
      gender: json['gender'],
      location: json['location'] != null
          ? LocationModal.fromJson(json['location'])
          : null,
      name: json['name'],
      origin: json['origin'] != null
          ? LocationModal.fromJson(json['origin'])
          : null,
      species: json['species'],
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      status: json['status'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'created': created.toIso8601String(),
      'episode': episode,
      'gender': gender,
      'id': id,
      'image': image,
      'location': location,
      'name': name,
      'origin': origin,
      'species': species,
      'status': status,
      'type': type,
    };
  }
}
