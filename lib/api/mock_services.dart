// import 'dart:convert';
// import 'package:flutter/services.dart';

// class MockFooderlichService {
//   Future<ExploreData> getExploreData() async {
//     final friendMedicines = await _getMedicines();
//     return ExploreData(friendMedicines);
//   }

//   Future<List<Medicine>> _getMedicines() async {
//     await Future.delayed(const Duration(milliseconds: 300));
//     final dataString =
//         await _loadAsset('assets/dwe.json');
//     final Map<String, dynamic> jsonData = jsonDecode(dataString);

//     if (jsonData['medicines'] != null) {
//       final medicines = <Medicine>[];
//       for (var medicineData in jsonData['medicines']) {
//         medicines.add(Medicine.fromMap(medicineData));
//       }
//       return medicines;
//     } else {
//       return [];
//     }
//   }

//   Future<String> _loadAsset(String path) async {
//     return rootBundle.loadString(path);
//   }
// }
