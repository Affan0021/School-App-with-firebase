import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'sidebar.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

class Staff extends StatefulWidget {
  const Staff({Key? key}) : super(key: key);


  @override
  _StaffState createState() => _StaffState();
}

class _StaffState extends State<Staff> {
   @override

   var studentName , studentAge  , studentPhone;


   getStudentName(name)
   {
     this.studentName = name;
   }
   getAge(age)
   {
     this.studentAge = age;
   }

   getPhone(phone)
   {
     this.studentPhone = phone;
   }



   createData()
   {
     DocumentReference documentReference =
     FirebaseFirestore.instance.collection("MyStaff").doc(studentName);

     Map<String,dynamic> staff=
     {
       "studentName": studentName,
       "studentAge": studentAge,
       "studentPhone": studentPhone,



     };
     documentReference.set(staff).whenComplete(() {
       print("staff created");
     });

   }


   updateData(){

     DocumentReference documentReference =
     FirebaseFirestore.instance.collection("MyStaff").doc(studentName);

     Map<String,dynamic> staff=
     {
       "studentName": studentName,
       "studentAge": studentAge,
       "studentPhone": studentPhone,

     };
     // documentReference.update(students);
     documentReference.set(staff).whenComplete(() {
       print("staff updated");
     });


   }

   deleteData(){
     DocumentReference documentReference =
     FirebaseFirestore.instance.collection("MyStaff").doc(studentName);
     documentReference.delete().whenComplete(() {
       print("staff deleted");
     });


   }

   Widget build(BuildContext context) {

    var query = MediaQuery.of(context);
    var height = query.size.height;
    var width =  query.size.width;

    return Scaffold(
        drawer: new NavBar(),
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          centerTitle: true,
          title: Text(
            'Workers',
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
                        height: height / 35,
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
                        height: height/ 12,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width/1.9,
                          height: MediaQuery.of(context).size.height/15,
                          margin: const EdgeInsets.only(left: 2.0),
                          child: ElevatedButton(
                            onPressed: ()

                            {
                              showDialog(context: context,
                                  builder: (BuildContext context){
                                    return SimpleDialog(
                                      title: Text('Add Worker'),
                                      backgroundColor: Colors.teal,

                                      children: [

                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: TextFormField(
                                              decoration: InputDecoration(
                                                  hintText: "Enter your Name",
                                                  // fillColor: Colors.indigo,

                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.indigo,
                                                        width: 3,



                                                      )

                                                  )

                                              ),
                                              onChanged: (String name)
                                              {
                                                getStudentName(name);
                                              }

                                          ),
                                        ),
                                        SizedBox (
                                          height: height / 45,
                                        ),

                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: TextFormField(
                                              decoration: InputDecoration(
                                                  hintText: "Enter Your Age",
                                                  fillColor: Colors.blueGrey,

                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.indigo,
                                                        width: 3,



                                                      )

                                                  )

                                              ),
                                              onChanged: (String age)
                                              {
                                                getAge(age);
                                              }

                                          ),
                                        ),
                                        SizedBox (
                                          height: height / 45,

                                        ),

                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child:  TextFormField(

                                              decoration: InputDecoration(
                                                  hintText: "Enter Phone Number",
                                                  fillColor: Colors.blueGrey,

                                                  focusedBorder: OutlineInputBorder(

                                                      borderSide: BorderSide(
                                                        color: Colors.indigo,
                                                        width: 3,



                                                      )

                                                  )

                                              ),

                                              onChanged: (String phone)
                                              {

                                                getPhone(phone);
                                              }

                                          ),
                                        ),

                                        Padding(
                                            padding: EdgeInsets.fromLTRB(50, 10, 50,0),
                                            child: ElevatedButton(
                                              onPressed: ()

                                              {
                                                createData();

                                              },


                                              style: ButtonStyle(

                                                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                                      (Set<MaterialState> states) {
                                                    if (states.contains(MaterialState.pressed))
                                                      return Colors.white10;
                                                    return Colors.indigo;
                                                  },
                                                ),
                                                shape:
                                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(20.0),
                                                        side: BorderSide(
                                                            color: Colors.white)
                                                    )
                                                ),

                                              ),

                                              child: Text(
                                                'ADD',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'OpenSans',
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                        )
                                      ],





                                    );
                                  }
                              );

                            },


                            style: ButtonStyle(

                              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed))
                                    return Colors.white10;
                                  return Colors.blueGrey;
                                },
                              ),
                              shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                      side: BorderSide(
                                          color: Colors.white)
                                  )
                              ),

                            ),

                            child: Text(
                              'Add Worker',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                      ),


                      SizedBox(
                        height: height/ 14,
                      ),

                      Container(
                          width: MediaQuery.of(context).size.width/1.9,
                          height: MediaQuery.of(context).size.height/15,
                          margin: const EdgeInsets.only(left: 2.0),
                          child: ElevatedButton(
                            onPressed: ()

                            {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SimpleDialog(
                                      title: Text('Update Worker'),
                                      backgroundColor: Colors.teal,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: TextFormField(
                                              decoration: InputDecoration(
                                                  hintText: "Enter your Name",
                                                  // fillColor: Colors.indigo,

                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.indigo,
                                                        width: 3,



                                                      )

                                                  )

                                              ),
                                              onChanged: (String name)
                                              {
                                                getStudentName(name);
                                              }

                                          ),
                                        ),
                                        SizedBox (
                                          height: height / 45,
                                        ),

                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: TextFormField(
                                              decoration: InputDecoration(
                                                  hintText: "Enter Your Age",
                                                  fillColor: Colors.blueGrey,

                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.indigo,
                                                        width: 3,



                                                      )

                                                  )

                                              ),
                                              onChanged: (String age)
                                              {
                                                getAge(age);
                                              }

                                          ),
                                        ),
                                        SizedBox (
                                          height: height / 45,

                                        ),

                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child:  TextFormField(

                                              decoration: InputDecoration(
                                                  hintText: "Enter Phone Number",
                                                  fillColor: Colors.blueGrey,

                                                  focusedBorder: OutlineInputBorder(

                                                      borderSide: BorderSide(
                                                        color: Colors.indigo,
                                                        width: 3,



                                                      )

                                                  )

                                              ),

                                              onChanged: (String phone)
                                              {

                                                getPhone(phone);
                                              }

                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                                            child: ElevatedButton(
                                              onPressed: ()
                                              {
                                                 updateData();
                                              },
                                              style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty
                                                    .resolveWith<Color>(
                                                      (Set<MaterialState> states) {
                                                    if (states.contains(
                                                        MaterialState.pressed))
                                                      return Colors.white10;
                                                    return Colors.indigo;
                                                  },
                                                ),
                                                shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(20.0),
                                                        side: BorderSide(
                                                            color: Colors.white))),
                                              ),
                                              child: Text(
                                                'Update',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'OpenSans',
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ))
                                      ],
                                    );
                                  });
                            },
                            style: ButtonStyle(

                              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed))
                                    return Colors.white10;
                                  return Colors.green;
                                },
                              ),
                              shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                      side: BorderSide(
                                          color: Colors.white)
                                  )
                              ),

                            ),

                            child: Text(
                              'Update Worker',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                      ),

                      SizedBox(
                        height: height/ 14,
                      ),


                      Container(
                          width: MediaQuery.of(context).size.width/1.9,
                          height: MediaQuery.of(context).size.height/15,
                          margin: const EdgeInsets.only(left: 2.0),
                          child: ElevatedButton(
                            onPressed: ()

                            {
                              showDialog(context: context,
                                  builder: (BuildContext context){
                                    return SimpleDialog(
                                      title: Text('Delete Worker'),
                                      backgroundColor: Colors.teal,

                                      children: [

                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: TextFormField(
                                              decoration: InputDecoration(
                                                  hintText: "Enter your Name",
                                                  // fillColor: Colors.indigo,

                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.indigo,
                                                        width: 3,



                                                      )

                                                  )

                                              ),
                                              onChanged: (String name)
                                              {
                                                getStudentName(name);
                                              }

                                          ),
                                        ),
                                        SizedBox (
                                          height: height / 45,
                                        ),

                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: TextFormField(
                                              decoration: InputDecoration(
                                                  hintText: "Enter Your Age",
                                                  fillColor: Colors.blueGrey,

                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.indigo,
                                                        width: 3,



                                                      )

                                                  )

                                              ),
                                              onChanged: (String age)
                                              {
                                                getAge(age);
                                              }

                                          ),
                                        ),
                                        SizedBox (
                                          height: height / 45,

                                        ),

                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child:  TextFormField(

                                              decoration: InputDecoration(
                                                  hintText: "Enter Phone Number",
                                                  fillColor: Colors.blueGrey,

                                                  focusedBorder: OutlineInputBorder(

                                                      borderSide: BorderSide(
                                                        color: Colors.indigo,
                                                        width: 3,



                                                      )

                                                  )

                                              ),

                                              onChanged: (String phone)
                                              {

                                                getPhone(phone);
                                              }

                                          ),
                                        ),

                                        Padding(
                                            padding: EdgeInsets.fromLTRB(50, 10, 50,0),
                                            child: ElevatedButton(
                                              onPressed: ()

                                              {
                                                deleteData();

                                              },


                                              style: ButtonStyle(

                                                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                                      (Set<MaterialState> states) {
                                                    if (states.contains(MaterialState.pressed))
                                                      return Colors.white10;
                                                    return Colors.indigo;
                                                  },
                                                ),
                                                shape:
                                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(20.0),
                                                        side: BorderSide(
                                                            color: Colors.white)
                                                    )
                                                ),

                                              ),

                                              child: Text(
                                                'DELETE',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'OpenSans',
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                        )
                                      ],





                                    );
                                  }
                              );

                            },


                            style: ButtonStyle(

                              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed))
                                    return Colors.white10;
                                  return Colors.deepPurple;
                                },
                              ),
                              shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                      side: BorderSide(
                                          color: Colors.white)
                                  )
                              ),

                            ),

                            child: Text(
                              'Delete Worker',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                      ),

                      SizedBox(

                        height: height / 18,
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




                ]
            )
        )
    );

  }
}
