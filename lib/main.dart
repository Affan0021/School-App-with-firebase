import 'package:flutter/material.dart';
import 'sidebar.dart';
import 'package:flutter/services.dart';

void main()
{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(

    statusBarColor: Colors.transparent,

  )
  );
  runApp(MaterialApp(


    home: Main(),
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
          title: Text('\t\t\t\t  Welcome to Fast',
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



                ],
              )




      ]
    )
      )
    );
  }
}


