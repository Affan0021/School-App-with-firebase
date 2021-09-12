import 'package:flutter/material.dart';
import 'sidebar.dart';
import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'signin.dart';

void main() async
{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(

    statusBarColor: Colors.transparent,

  )
  );
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MaterialApp(

    home: Login(),
  ));

}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);


  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override

  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    var height = query.size.height;
    var width =  query.size.width;

    return Scaffold(
         drawer: new NavBar(),
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('\t\t\t\t      \t\t  Home',
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

        body: Container(

        child: Stack(
            children: <Widget>[

              Container(
                margin:  const EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height,
                decoration:   BoxDecoration(
                  image:  const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/home.jpg'),

                  ),


                ),

              ),

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
                      'Congratulations',
                      style: TextStyle(

                        color: Colors.redAccent,
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
                      'You are Successfully Logged in',
                      style: TextStyle(

                        color: Colors.white,
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
                    margin:  const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    width: MediaQuery.of(context).size.width/2,
                    height:MediaQuery.of(context).size.height/4,
                    // color: Colors.orangeAccent,
                    decoration:   BoxDecoration(
                      image:  const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/nu.png'),

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
                      'Welcome',
                      style: TextStyle(

                        color: Colors.red,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,


                      ),


                    ),



                  ),

                  Container(
                    margin:  const EdgeInsets.fromLTRB(10, 0, 0,0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/4,
                    color: Colors.transparent,
                    child: Text(
                      'FAST is one of the Top IT Institute of Pakistan Offering BS , M-Phil and PHD Degrees in Computer Science , Bussiness Administration , Software Engineering and Electrical Engineering',


                      style: TextStyle(

                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,


                      ),


                    ),

                  ),


                ],
              )




      ]
    )
      )
    );
  }
}


