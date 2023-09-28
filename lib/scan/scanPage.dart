import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:hackthon/scan/domain/model/dwe.dart';
import 'package:hackthon/scan/domain/model/explore_data.dart';
import 'package:hackthon/scan/ui/medicine_list_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  int numberOfFingers = 0;

  List<Offset> detectedCorners = [];
  bool isTouching = false;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    final mockService = MockFooderlichService();

    return Scaffold(
      floatingActionButton: SizedBox(
        width: 100,
        child: FloatingActionButton(
            isExtended: true,
            child: Container(child: Text('حط دواء اخر')),
            onPressed: () {
              setState(() {
                counter = 0;
              });
            }),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'انشاء الله لباس ',
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    CircleAvatar(
                      child: Image.asset('assets/doctor.png'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: RawGestureDetector(
                gestures: {
                  PanGestureRecognizer: GestureRecognizerFactoryWithHandlers<
                      PanGestureRecognizer>(
                    () => PanGestureRecognizer(),
                    (PanGestureRecognizer instance) {
                      instance.onUpdate = (details) {
                        setState(() {
                          isTouching = true;

                          // Check if the coordinate already exists in the list or is close to (30, 30)
                          bool coordinateExists = false;
                          for (Offset existingCoordinate in detectedCorners) {
                            if ((existingCoordinate - details.localPosition)
                                    .distanceSquared <
                                100) {
                              coordinateExists = true;
                              break;
                            }
                          }

                          if (!coordinateExists) {
                            detectedCorners.add(details.localPosition);
                            print(details.localPosition);
                            print(detectedCorners.length);
                          }
                        });
                      };

                      instance.onEnd = (details) {
                        setState(() {
                          isTouching = false;
                          counter = detectedCorners.length;
                          detectedCorners.clear();
                          // save how many and treat them
                        });
                      };
                    },
                  ),
                },
                child: CustomPaint(
                  painter: CirclePainter(detectedCorners, isTouching),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Consumer(
                          builder: (context, ref, child) {
                            if (counter == 0) {
                              return Center(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Image.asset(
                                          'assets/flesh.png',
                                          scale: 2,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.location_on),
                                        Text(' حط دواء هنا',
                                            style: TextStyle(
                                                fontSize: 28,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            } else if (counter < 4) {
                              return FutureBuilder(
                                future: mockService.getExploreData(),
                                builder: (context,
                                    AsyncSnapshot<ExploreData> snapshot) {
                                  // return Text(counter.toString());
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Container(
                                      child: MedicineListView(
                                        counter: counter,
                                        medicines:
                                            snapshot.data?.medicines ?? [],
                                      ),
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                },
                              );
                            } else {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.location_on),
                                  Text('  عاود حط دواء هنا',
                                      style: TextStyle(
                                          fontSize: 28,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600)),
                                ],
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final List<Offset> points;
  final bool isTouching;

  CirclePainter(this.points, this.isTouching);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    Paint paint1 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    if (isTouching) {
      for (Offset point in points) {
        canvas.drawCircle(point, 30.0, paint);
        canvas.drawCircle(point, 21.0, paint1);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class MockFooderlichService {
  Future<ExploreData> getExploreData() async {
    final friendMedicines = await _getMedicines();
    return ExploreData(friendMedicines);
  }

  Future<List<Medicine>> _getMedicines() async {
    await Future.delayed(const Duration(milliseconds: 300));
    final dataString = await _loadAsset('assets/dwe.json');
    final Map<String, dynamic> jsonData = jsonDecode(dataString);

    if (jsonData['medicines'] != null) {
      final medicines = <Medicine>[];
      for (var medicineData in jsonData['medicines']) {
        medicines.add(Medicine.fromMap(medicineData));
      }
      return medicines;
    } else {
      return [];
    }
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}

void main() {
  runApp(MaterialApp(
    home: ProviderScope(child: ScanPage()),
  ));
}
