import 'package:flutter/material.dart';
import 'package:hackthon/scan/domain/model/dwe.dart';
import 'package:hackthon/scan/ui/details_medicne.dart';
import 'package:hackthon/scan/widgets/medicine_tile.dart';

class MedicineListView extends StatelessWidget {
  final List<Medicine> medicines;
  final int counter;

  const MedicineListView({
    super.key,
    required this.medicines,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    final post = medicines[counter - 1];
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 0,
      ),
      child: Container(
        height: MediaQuery.sizeOf(context).height / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.name,
              style: TextStyle(fontSize: 20),
            ),
            Image.asset(
              post.image,
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 16),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                primary: Colors.white,
                elevation: 5,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(
                              plus: post.positiveDescription,
                              nega: post.negativeDescription,
                              name: post.name,
                              dosage: post.dosage,
                              image: post.image,
                              instruction: post.instruction,
                            )));
              },
              child: Text('مزيد التفاصيل'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
