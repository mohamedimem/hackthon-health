import 'dart:convert';
import 'package:hackthon/scan/domain/model/dwe.dart';

void main() {
  // Replace this with the actual JSON string you have
  String jsonString = '''
    {
       {
        "id": 1,
        "name": "Aspirin",
        "dosage": "100mg",
        "positive_description": "Relieves pain and reduces fever",
        "negative_description": "May cause stomach irritation",
        "image": "aspirin_image.jpg",
        "instruction": "Take with food"
      },
       {
        "id": 2,
        "name": "Ibuprofen",
        "dosage": "200mg",
        "positive_description": "Reduces inflammation and pain",
        "negative_description": "May cause dizziness",
        "image": "ibuprofen_image.jpg",
        "instruction": "Take after meals"
      },
      {
        "id": 3,
        "name": "Paracetamol",
        "dosage": "500mg",
        "positive_description": "Effective against pain and fever",
        "negative_description": "Rare side effects",
        "image": "paracetamol_image.jpg",
        "instruction": "Take as needed"
      }
    }
  ''';

  Map<String, dynamic> medicineData = json.decode(jsonString);

  // Counter as a string
  String counterString = "1";

  // Convert the counter string to an integer
  int counter = int.tryParse(counterString) ?? 0;

  // Print medicine details for the given counter
  printMedicineDetails(counter, medicineData);
}

void printMedicineDetails(int counter, Map<String, dynamic> medicineData) {
  if (medicineData.containsKey(counter.toString())) {
    Medicine medicine = Medicine.fromMap(medicineData[0]);

    print("Medicine ID: ${medicine.id}");
    print("Name: ${medicine.name}");
    print("Dosage: ${medicine.dosage}");
    print("Positive Description: ${medicine.positiveDescription}");
    print("Negative Description: ${medicine.negativeDescription}");
    print("Image: ${medicine.image}");
    print("Instruction: ${medicine.instruction}");
  } else {
    print("No medicine found with ID: $counter");
  }
}
