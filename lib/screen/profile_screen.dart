import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
              decoration: BoxDecoration(
                  border: Border.all(color:Color(0xFF3D998A),width: 2.0),
                borderRadius: BorderRadius.circular(50.0)
              ),
              child:  Image.asset(
                'assets/learning-concept.png',
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
          SizedBox(height: 20),
          Text(
            'Ye Lwin Oo',
            style: TextStyle(
                fontSize: 27,
                color: Color(0xFF3D998A),
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(children: <Widget>[
            Expanded(
                child: Divider(
              thickness: 2.0,
              color: Color(0xFF3D998A),
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                Icons.menu_book_outlined,
                color: Color(0xFF3D998A),
              ),
            ),
            Expanded(
                child: Divider(
              thickness: 2.0,
              color: Color(0xFF3D998A),
            )),
          ]),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ListView(shrinkWrap: true, children: [
              ListTile(
                leading: Icon(
                  Icons.date_range,
                  color: Color(0xFF3D998A),
                ),
                title: Text('23/5/2001'),
              ),
              SizedBox(
                height: 10.0,
              ),
              ListTile(
                leading: Icon(Icons.email, color: Color(0xFF3D998A)),
                title: Text('yelwinoo@ucsm.edu.mm'),
              ),
              SizedBox(
                height: 10.0,
              ),
              ListTile(
                leading: Icon(Icons.phone, color: Color(0xFF3D998A)),
                title: Text('+959696846653'),
              ),
              SizedBox(
                height: 10.0,
              ),
              ListTile(
                leading: Icon(Icons.location_city, color: Color(0xFF3D998A)),
                title: Text('Myit Chay City'),
              ),
              SizedBox(
                height: 10.0,
              ),
              ListTile(
                leading: Icon(Icons.school, color: Color(0xFF3D998A)),
                title: Text('University of Computer Studies, Mandalay'),
              ),
              SizedBox(
                height: 10.0,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
