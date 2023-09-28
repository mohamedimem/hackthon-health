import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return ListView(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFF26CBE6),
            Color(0xFF26CBC0),
          ], begin: Alignment.topCenter, end: Alignment.center)),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: _height / 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/healthy.png'),
                        radius: _height / 10,
                      ),
                      SizedBox(
                        height: _height / 30,
                      ),
                      Text(
                        'Sadiq Mehdi',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _height / 2.2),
                child: Container(
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _height / 2.6, left: _width / 20, right: _width / 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                blurRadius: 2.0,
                                offset: Offset(0.0, 2.0))
                          ]),
                      child: Padding(
                        padding: EdgeInsets.all(_width / 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              headerChild('Medicaments', 2),
                              headerChild('jours', 15),
                            ]),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Card(
          child: ListTile(
            title: Text("Anchor"),
            subtitle: Text("vitamines"),
            leading: Image.asset(
              "assets/1.png",
              height: 100, // Set the height to make the image larger
              width: 100, // Set the width to make the image larger
            ),
            trailing: Icon(Icons.star),
          ),
        ),
        Card(
          child: ListTile(
            title: Text("Anchor"),
            subtitle: Text("2 pills in 1 day"),
            leading: Image.asset(
              "assets/2.png",
              height: 100, // Set the height to make the image larger
              width: 100, // Set the width to make the image larger
            ),
            trailing: Icon(Icons.star),
          ),
        ),
        Card(
          child: ListTile(
            title: Text("Anchor"),
            subtitle: Text("50g /5h"),
            leading: Image.asset(
              "assets/3.png",
              height: 100, // Set the height to make the image larger
              width: 100, // Set the width to make the image larger
            ),
            trailing: Icon(Icons.star),
          ),
        ),
      ],
    );
  }

  Widget headerChild(String header, int value) => Expanded(
          child: Column(
        children: <Widget>[
          Text(header),
          SizedBox(
            height: 8.0,
          ),
          Text(
            '$value',
            style: TextStyle(
                fontSize: 14.0,
                color: const Color(0xFF26CBE6),
                fontWeight: FontWeight.bold),
          )
        ],
      ));

  Widget infoChild(double width, IconData icon, data) => Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: InkWell(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: width / 10,
              ),
              Icon(
                icon,
                color: const Color(0xFF26CBE6),
                size: 36.0,
              ),
              SizedBox(
                width: width / 20,
              ),
              Text(data)
            ],
          ),
          onTap: () {
            print('Info Object selected');
          },
        ),
      );
}
