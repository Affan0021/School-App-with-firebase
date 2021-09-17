import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'signin.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);


  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override

  late String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    var query = MediaQuery.of(context);
    var height = query.size.height;
    var width =  query.size.width;


    return  Scaffold(

        body: SingleChildScrollView(

            child: Stack(
                children: <Widget>[



                  Column(
                    children: [


                      SizedBox(
                        height: height /2,
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.white,
                      ),



                    ],
                  ),

                  Column(

                    children: [


                      //
                      SizedBox(
                        height: height /6,
                      ),


                      Container(

                        // alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width/1.79,
                        height:MediaQuery.of(context).size.height/3.7,
                        margin:  EdgeInsets.only(left: 50),
                        child : CircleAvatar(
                          child: ClipOval(
                            child: Image.asset(
                                'assets/logo.png',
                            ),
                          ),
                        ),

                      ),



                      //
                      SizedBox(
                        height: height /14,
                      ),


                      Container(
                        width: MediaQuery.of(context).size.width/1.3,
                        height: MediaQuery.of(context).size.height/15,
                        margin: EdgeInsets.only(left: 50),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'OpenSans',

                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(top: 11.0),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(20),

                            ),
                            hintText: 'Enter your Email',
                            hintStyle: TextStyle(
                              color: Colors.blueGrey, // <-- Change this
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _email = value.trim();
                            });
                          },
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black26,
                            width: 0.7,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          // color: const Color(0xff7cb1b6),
                        ),
                      ),




                      SizedBox(
                        height: height /25,
                      ),



                      Container(
                        width: MediaQuery.of(context).size.width/1.3,
                        height: MediaQuery.of(context).size.height/15,
                        margin: EdgeInsets.only(left: 50),
                        child: TextField(
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'OpenSans',

                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(top: 11.0),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.blue,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(20),

                            ),
                            hintText: 'Enter your Password',
                            hintStyle: TextStyle(
                              color: Colors.blueGrey, // <-- Change this
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _password = value.trim();
                            });
                          },
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black26,
                            width: 0.7,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          // color: const Color(0xff7cb1b6),
                        ),
                      ),


                      //
                      SizedBox(
                        height: height /20,
                      ),




                      Container(
                          width: MediaQuery.of(context).size.width/2.5,
                          height: MediaQuery.of(context).size.height/18,
                          margin: const EdgeInsets.only(left: 35.0),
                          child: ElevatedButton(

                            onPressed: () {
                              auth.createUserWithEmailAndPassword(
                                  email: _email, password: _password).then((_) {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (context) => Login()));
                              }
                              );
                            },

                            style:
                            ButtonStyle(

                              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed))
                                    return Colors.red;
                                  return Colors.blue;
                                },
                              ),
                              shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(
                                          color: Colors.white)
                                  )
                              ),

                            ),
                            child: Text(
                              '\tSign Up ',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )

                      )



                    ],
                  )



                ]
            )

        )
    );
  }
}

