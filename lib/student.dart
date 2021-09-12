import 'package:flutter/material.dart';

import 'sidebar.dart';

class Student extends StatefulWidget {
  const Student({Key? key}) : super(key: key);


  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {

    var query = MediaQuery.of(context);
    var height = query.size.height;
    var width =  query.size.width;

    return Scaffold(
        drawer: new NavBar(),
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text(
            '\t\t\t\t      \t\tStudent',
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

                 Column(
                   children: [

                     SizedBox(
                       height: height/ 2,
                     ),
                     Container(
                         width: MediaQuery.of(context).size.width/2.1,
                         height: MediaQuery.of(context).size.height/18,
                         margin: const EdgeInsets.only(left: 35.0),
                         child: ElevatedButton(
                           onPressed: ()

                           {
                             // Navigator.push(
                             //   context,
                             //   MaterialPageRoute(builder: (context) => Signup()),
                             // );

                           },


                           style: ButtonStyle(

                             backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                   (Set<MaterialState> states) {
                                 if (states.contains(MaterialState.pressed))
                                   return Colors.white;
                                 return Colors.indigoAccent;
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
                             '\tAdd',
                             style: TextStyle(
                               color: Colors.white,
                               fontFamily: 'OpenSans',
                               fontSize: 15.0,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         )
                     ),




                   ],


                 )




                ]
            )
        )
    );

  }
}
