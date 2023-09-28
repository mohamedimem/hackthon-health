// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Medicine {
  final String id;
  final String name;
  final String dosage;
  final String positiveDescription;
  final String negativeDescription;
  final String image;
  final String instruction;

  Medicine(
      {required this.id,
      required this.name,
      required this.dosage,
      required this.positiveDescription,
      required this.negativeDescription,
      required this.image,
      required this.instruction});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'dosage': dosage,
      'positiveDescription': positiveDescription,
      'negativeDescription': negativeDescription,
      'image': image,
      'instruction': instruction,
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      id: map['id'] as String,
      name: map['name'] as String,
      dosage: map['dosage'] as String,
      positiveDescription: map['positiveDescription'] as String,
      negativeDescription: map['negativeDescription'] as String,
      image: map['image'] as String,
      instruction: map['instruction'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Medicine.fromJson(String source) =>
      Medicine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Medicine other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.dosage == dosage &&
        other.positiveDescription == positiveDescription &&
        other.negativeDescription == negativeDescription &&
        other.image == image &&
        other.instruction == instruction;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        dosage.hashCode ^
        positiveDescription.hashCode ^
        negativeDescription.hashCode ^
        image.hashCode ^
        instruction.hashCode;
  }
}
