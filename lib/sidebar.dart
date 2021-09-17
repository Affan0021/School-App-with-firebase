import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'contact.dart';
import 'main.dart';
import 'signin.dart';
import 'staff.dart';
import 'student.dart';
import 'teacher.dart';



class NavBar extends StatelessWidget {
  @override
  final auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {

    var query = MediaQuery.of(context);
    var height = query.size.height;
    var width =  query.size.width;


    return Drawer(

      child: ListView(
        // Remove padding

        padding: EdgeInsets.zero,
        children: [

          UserAccountsDrawerHeader(
            accountName: Text('Fast Nuces (Chiniot-Faislabad Campus)'),
            accountEmail: Text('Top IT University of Pakistan'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image:  AssetImage(
                      'assets/back.jpg')),
            ),

          ),

          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.blue,

            ),
            title: Text('Home',
              style: TextStyle(

                color: Colors.black,
                fontFamily: 'OpenSans',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,


              ),

            ),
              onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Main()),
                );
              }
          ),

          ListTile(
            leading: Icon(
              Icons.school,
              color: Colors.blue,

            ),
            title: Text('Students',
              style: TextStyle(

                color: Colors.black,
                fontFamily: 'OpenSans',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,


              ),

            ),
            onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Student()),
                );
              }
          ),

          ListTile(
            leading: Icon(Icons.person,
              color: Colors.blue,),
            title: Text('Teachers',
              style: TextStyle(

                color: Colors.black,
                fontFamily: 'OpenSans',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,


              ),),
            onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Teacher()),
                );
              }
          ),
          ListTile(
            leading: Icon(Icons.people,
              color: Colors.blue,),
            title: Text('Workers',
              style: TextStyle(

                color: Colors.black,
                fontFamily: 'OpenSans',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,


              ),),
              onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Staff()),
                );
              }
          ),
           ListTile(
            leading: Icon(Icons.contacts,
              color: Colors.blue,
            ),
            title: Text('Contact Us',
              style: TextStyle(

                color: Colors.black,
                fontFamily: 'OpenSans',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,


              ),),
               onTap: ()
               {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Contact()),
                 );
               }
          ),

          SizedBox(
            height: height / 12,
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: Text('Sign Out',
              style: TextStyle(

                color: Colors.red,
                fontFamily: 'OpenSans',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,


              ),),
            onTap: ()
              {
                  auth.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );

              }

          ),
        ],
      ),
    );
  }
}