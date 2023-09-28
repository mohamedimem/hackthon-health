import 'package:flutter/material.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({super.key});

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Discover',
              style: TextStyle(fontSize: 42),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 70,
                  width: 350,
                  child: SearchAnchor(builder:
                      (BuildContext context, SearchController controller) {
                    return SearchBar(
                      controller: controller,
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16.0)),
                      onTap: () {
                        controller.openView();
                      },
                      onChanged: (_) {
                        controller.openView();
                      },
                      leading: const Icon(Icons.search),
                    );
                  }, suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    return List<ListTile>.generate(5, (int index) {
                      final String item = 'item $index';
                      return ListTile(
                        title: Text(item),
                        onTap: () {
                          setState(() {
                            controller.closeView(item);
                          });
                        },
                      );
                    });
                  }),
                ),
              ),
            ),
            Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return widgetChips[index];
                  }),
            ),
            Text('disease'),
            Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return widgetContainer[index];
                  }),
            ),
            Text('medicamenet'),
            Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return widgetContainer2[index];
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> widgetChips = [
  Chip(label: Text('eyes dises')),
  SizedBox(
    width: 4,
  ),
  Chip(label: Text('eyes dises')),
  SizedBox(
    width: 4,
  ),
  Chip(label: Text('eyes dises')),
  SizedBox(
    width: 4,
  ),
  Chip(label: Text('eyes dises')),
  SizedBox(
    width: 4,
  ),
  Chip(label: Text('eyes dises')),
  SizedBox(
    width: 4,
  ),
];

List<Widget> widgetContainer = [
  Container(
    color: Colors.black,
    width: 100,
    height: 120,
  ),
  SizedBox(
    width: 4,
  ),
  Container(
    color: Colors.black,
    width: 100,
    height: 120,
  ),
  SizedBox(
    width: 4,
  ),
  Container(
    color: Colors.black,
    width: 100,
    height: 120,
  ),
  SizedBox(
    width: 4,
  ),
  Container(
    color: Colors.black,
    width: 100,
    height: 120,
  ),
  SizedBox(
    width: 4,
  ),
];
List<Widget> widgetContainer2 = [
  Container(
    color: Colors.black,
    width: 100,
    height: 120,
  ),
  SizedBox(
    height: 4,
  ),
  Container(
    color: Colors.black,
    width: 100,
    height: 120,
  ),
  SizedBox(
    height: 4,
  ),
  Container(
    color: Colors.black,
    width: 100,
    height: 120,
  ),
  SizedBox(
    height: 4,
  ),
];
