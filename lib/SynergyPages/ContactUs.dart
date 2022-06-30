// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:synergy_flutter/SynergyPages/ModuleList.dart';
class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  Future<bool?> showWarning(BuildContext context) async => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context)=>const ModuleList()), (Route<dynamic>route) => false);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
      ),
      body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Contact Info ",style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold,fontSize:40),),
                  SizedBox(width: 5.0,),
                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("PrimaryEmail: "),
                  SizedBox(width: 5.0,),
                  Flexible(child: Text(
                      "uhisdu@gmail.com"
                  )
                  )
                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("SecondaryEmail: "),
                  SizedBox(width: 5.0,),
                  Flexible(child: Text(
                      "msaleem@who.int"
                  )
                  )
                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("PrimaryContactNo: "),
                  SizedBox(width: 5.0,),
                  // ignore: prefer_const_constructors
                  Flexible(child: Text(
                      "04299206173"
                  )
                  )
                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("SecondaryContactNo: "),
                  SizedBox(width: 5.0,),
                  Flexible(child: Text(
                      "+923006725925"
                  )
                  )
                ],
              ),
            ],
          )
      ),
    ), onWillPop: () async{
      final shouldPop = await showWarning(context);
      return shouldPop ?? false;
    }
    );

  }
}
