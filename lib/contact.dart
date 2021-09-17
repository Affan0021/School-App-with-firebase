import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'sidebar.dart';
import 'signin.dart';


class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);


  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override

  late String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    var query = MediaQuery.of(context);
    var height = query.size.height;
    var width =  query.size.width;


    return  Scaffold(
        drawer: new NavBar(),
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          centerTitle: true,

          title: Text(
            'Contact US',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
              fontSize: 27.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: new Icon(
                Icons.menu,
                color: Colors.white,
                size: 33,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),

        body: SingleChildScrollView(

            child: Stack(
                children: <Widget>[



                  Column(
                    children: [

                      SizedBox(
                        height: height/17,
                      ),
                      Container(
                        margin:  const EdgeInsets.fromLTRB(10, 0, 130,0),
                        width: MediaQuery.of(context).size.width/1.5,
                        height:MediaQuery.of(context).size.height/18,
                        color: Colors.transparent,
                        child: const Text(
                          'Contact US',
                          style: TextStyle(

                            color: Colors.red,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,


                          ),


                        ),



                      ),

                      // SizedBox(
                      //   height: height/20,
                      // ),
                      Container(
                        margin:  const EdgeInsets.fromLTRB(10, 0, 0,0),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/18,
                        color: Colors.transparent,
                        child: Text(
                          'Take every information at home',
                          style: TextStyle(

                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,


                          ),


                        ),

                      ),

                      SizedBox(
                        height: height/17,
                      ),

                      Container(
                        margin:  const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        width: MediaQuery.of(context).size.width/1.79,
                        height:MediaQuery.of(context).size.height/3.7,
                        child : CircleAvatar(
                          child: ClipOval(
                            child: Image.asset(
                              'assets/logo.png',
                            ),
                          ),
                        ),

                      ),


                      SizedBox(

                        height: height/16,
                      ),

                      Container(
                        margin:  const EdgeInsets.fromLTRB(10, 0, 130,0),
                        width: MediaQuery.of(context).size.width/1.5,
                        height:MediaQuery.of(context).size.height/18,
                        color: Colors.transparent,
                        child: const Text(
                          'Contacts',
                          style: TextStyle(

                            color: Colors.red,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,


                          ),


                        ),



                      ),

                      Column(
                        children: [


                          SizedBox(
                            height: height / 28,
                          ),

                          Container(
                            margin:  const EdgeInsets.fromLTRB(10, 0, 0,0),
                            width: MediaQuery.of(context).size.width/2.5,
                            height: MediaQuery.of(context).size.height/23,
                            color: Colors.transparent,
                            child: Text(
                              '063-22739125',

                              style: TextStyle(

                                color: Colors.pink,
                                fontFamily: 'OpenSans',
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,


                              ),


                            ),

                          ),

                          // SizedBox(
                          //   height: height / 28,
                          // ),

                          Container(
                            margin:  const EdgeInsets.fromLTRB(10, 0, 0,0),
                            width: MediaQuery.of(context).size.width/2.5,
                            height: MediaQuery.of(context).size.height/23,
                            color: Colors.transparent,
                            child: Text(
                              '063-22739834',

                              style: TextStyle(

                                color: Colors.lightGreen,
                                fontFamily: 'OpenSans',
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,


                              ),


                            ),

                          ),

                          // SizedBox(
                          //   height: height / 28,
                          // ),

                          Container(
                            margin:  const EdgeInsets.fromLTRB(10, 0, 0,0),
                            width: MediaQuery.of(context).size.width/2.5,
                            height: MediaQuery.of(context).size.height/23,
                            color: Colors.transparent,
                            child: Text(
                              '063-22799851',

                              style: TextStyle(

                                color: Colors.black,
                                fontFamily: 'OpenSans',
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,


                              ),


                            ),

                          ),

                          SizedBox(
                            height: height / 30,
                          ),


                          Container(
                            margin:  const EdgeInsets.only(left: 70),
                            width: MediaQuery.of(context).size.width/1.17,
                            height:MediaQuery.of(context).size.height/18,
                            color: Colors.transparent,
                            child: const Text(
                              'FAST-Nuces (Chiniot-Faislabad Campus)',
                              style: TextStyle(

                                color: Colors.red,
                                fontFamily: 'OpenSans',
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,


                              ),


                            ),


                          ),





                        ],
                      )





                    ],
                  )




                ]
            )
        )
    );
  }
}

