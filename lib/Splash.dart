import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synergy_flutter/SynergyPages/LoginPage.dart';
import 'package:synergy_flutter/SynergyPages/ModuleList.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTime() async{
var duration=Duration(seconds:3);

return Timer(duration, navigationPage);
  }

  Future<void> navigationPage() async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'Token';
    final read_value = prefs.getString(key);
      if(read_value==null){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context) => ModuleList()));
      }
      }
  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/punjab.png',
                width: 200,
                height: 200,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
