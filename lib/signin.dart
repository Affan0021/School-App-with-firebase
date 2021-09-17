import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'main.dart';
import 'signup.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                        margin:  const EdgeInsets.fromLTRB(30, 0, 0, 0),
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

                      //
                      SizedBox(
                        height: height /14,
                      ),


                      Container(

                        width: MediaQuery.of(context).size.width/1.3,
                        height: MediaQuery.of(context).size.height/15,
                        margin: EdgeInsets.only(left: 10),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,

                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'OpenSans',

                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            // contentPadding: const EdgeInsets.only(top: 11.0),
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
                            width: 0.7 ,
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
                        margin: EdgeInsets.only(left: 10),

                        child: TextField(
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'OpenSans',

                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            // contentPadding: const EdgeInsets.only(top: 11.0),
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
                          margin: const EdgeInsets.only(left: 20.0),
                          child: ElevatedButton(

                            onPressed: (){
                              auth.signInWithEmailAndPassword(email: _email, password: _password).then((_){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Main()));
                              });

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
                                      // side: BorderSide(
                                          // color: Colors.white)
                                  )
                              ),

                            ),
                            child: Text(
                              '\tSign in ',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )

                      ),

                      SizedBox(
                        height: height/ 13,
                      ),

                          Row(
                            children: [
                              SizedBox(

                                width: width /6,
                              ),
                            Container(
                              // margin:EdgeInsets.only(left: 100),
                              child: Text(
                                'Create an account?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'OpenSans',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                              SizedBox(

                                width: width / 115,
                              ),
                              Container(
                                  child: TextButton(
                                    onPressed: ()

                                    {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Signup()),
                                      );

                                    },
                                    child: Text(
                                      '\tSign up',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontFamily: 'OpenSans',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                              ),

                            ],
                          ),




                      //
                      //
                      //     SizedBox(
                      //
                      //       width: width / 60,
                      //     ),
                      //
                      //     Container(
                      //         width: MediaQuery.of(context).size.width/2.1,
                      //         height: MediaQuery.of(context).size.height/18,
                      //         // margin: const EdgeInsets.only(left: 15.0),
                      //         child: ElevatedButton(
                      //           onPressed: ()
                      //
                      //           {
                      //             Navigator.push(
                      //               context,
                      //               MaterialPageRoute(builder: (context) => Phone()),
                      //             );
                      //
                      //           },
                      //
                      //
                      //           style: ButtonStyle(
                      //
                      //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      //                   (Set<MaterialState> states) {
                      //                 if (states.contains(MaterialState.pressed))
                      //                   return Colors.white;
                      //                 return Colors.indigoAccent;
                      //               },
                      //             ),
                      //             shape:
                      //             MaterialStateProperty.all<RoundedRectangleBorder>(
                      //                 RoundedRectangleBorder(
                      //                     borderRadius: BorderRadius.circular(30.0),
                      //                     side: BorderSide(
                      //                         color: Colors.white)
                      //                 )
                      //             ),
                      //
                      //           ),
                      //
                      //           child: Text(
                      //             '\tSign in with Phone',
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontFamily: 'OpenSans',
                      //               fontSize: 15.0,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           ),
                      //         )
                      //     ),
                      //
                      //
                      //   ],
                      // )



                    ],
                  )



                ]
            )

        )
    );
  }
}



