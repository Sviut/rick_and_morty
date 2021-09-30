import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';

class LocationModal extends LocationEntity {
  LocationModal({name, url}) : super(name: name, url: url);

  factory LocationModal.fromJson(Map<String, dynamic> json) {
    return LocationModal(name: json['name'], url: json['url']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'url': url};
  }
}
