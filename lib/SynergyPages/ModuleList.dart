// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synergy_flutter/SynergyPages/ContactUs.dart';
import 'package:synergy_flutter/SynergyPages/LoginPage.dart';
import 'package:synergy_flutter/SynergyPages/NextPage.dart';
import 'package:synergy_flutter/SynergyResponse/EPIstoreResponse.dart';

import '../SynergyController/SynerListController.dart';
import '../SynergyResponse/ModuleResponse.dart';
import 'EpiStoreMonitoring.dart';
class ModuleList extends StatefulWidget {
  const ModuleList({Key? key}) : super(key: key);

  @override
  State<ModuleList> createState() => _ModuleListState();
}

class _ModuleListState extends State<ModuleList> {
  Future<bool?> showWarning(BuildContext context) async => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context)=>const ModuleList()), (Route<dynamic>route) => false);
  static int? ModuleId;
   List choices =  ["Home", "Setting"
  ];
  static String? UcName;
  final modulecontroller = Get.put(ModuleListController());
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return WillPopScope(
        child:Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text(
                    'Synergy Evalutaion System',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/cover.jpg'))),
                ),
                ListTile(
                  leading: Icon(Icons.input),
                  title: Text('Dashboard'),
                  onTap: () => {
                  Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context)=>ModuleList()), (Route<dynamic>route) => false),
                  },
                ),
                ListTile(
                  leading: Icon(Icons.verified_user),
                  title: Text('Resource Material'),
                  onTap: () => {

                    Navigator.of(context).pop()},
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Contact Us'),
                  onTap: () => {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context)=>ContactUs()), (Route<dynamic>route) => false),
                    //Navigator.of(context).pop()
                  },
                ),
                ListTile(
                  leading: Icon(Icons.border_color),
                  title: Text('Feedback'),
                  onTap: () => {Navigator.of(context).pop()},
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Logout'),
                  onTap: () => {
                    _logout(),
                    Navigator.of(context).pop()
                  },
                ),
              ],
            ),
          ),
      /*  appBar: AppBar(
          title: Text("Synergy Evolution System"),
        )*/
        body: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
                color: Colors.blue,
              ),
                child:Stack(
                  children: [
                    Positioned(
                        top:80,
                        left: 0 ,
                        child: Container(
                          height: 100,
                          width: 320,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                        )
                    ),
                    Positioned(
                        top: 115,
                        left: 20,
                      child:GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 0.9,
                              crossAxisCount: 2,
                              crossAxisSpacing: 1,
                              mainAxisExtent: 100),
                          itemCount: choices.length,
                          itemBuilder: (context, indx) {
                            return buildNumber(indx, choices[indx]);
                          })
                        ),
                  ],
                )
            ),
          Expanded(
              child: Obx(() {
                if (modulecontroller.Modulelist.isEmpty) {
                  return Center(child: Text("No Task Assigned ...",style: TextStyle(fontWeight: FontWeight.bold),));
                } else {
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 0.9,
                          crossAxisCount: 3,
                          crossAxisSpacing: 1,
                          mainAxisExtent: 150),
                      controller: controller,
                      shrinkWrap: true,
                      itemCount: modulecontroller.Modulelist.length,
                      itemBuilder: (context, indx) {
                        return buildNumber(indx, modulecontroller.Modulelist);
                      }
                      );
                }
              }),
            ),
          ],
        )
    ), onWillPop: () async{
      final shouldPop = await showWarning(context);
      return shouldPop ?? false;
    }
    );
  }
  _logout() async {
    SharedPreferences sharePrefs = await SharedPreferences.getInstance();
    await sharePrefs.remove('token');
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context)=>Login()), (Route<dynamic>route) => false);
  }
  Widget buildNumber(int indx, List<AllModuleList> taskstList) {
    return GestureDetector(
      onTap: ()async{
        ModuleId = modulecontroller.Modulelist[indx].appModuleId;
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setInt("AppModuleId", ModuleId!);
        if(ModuleId==1){
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context)=>EpiStoreMonitoringModule(
                ModuleId: ModuleId!,)), (Route<dynamic>route) => false);
        }else if(ModuleId==2){
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context)=>Nextpage(

              )), (Route<dynamic>route) => false);
        }else if(ModuleId==3){}
        else if(ModuleId==4){}
        else if(ModuleId==5){}
        else if(ModuleId==6){}
        else if(ModuleId==7){}

      },
      child: Card(
       // color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      if(modulecontroller.Modulelist[indx].appModuleId==1)
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  fit: BoxFit.fill, image: AssetImage("assets/images/store_monitoring.png")
                              )
                          ),
                        ),
                    ],
                  ),
                  Column(
                    children: [
                      if(modulecontroller.Modulelist[indx].appModuleId==2)
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  fit: BoxFit.fill, image: AssetImage("assets/images/site.png")
                              )
                          ),
                        ),
                    ],
                  ),
                  Column(
                    children: [
                      if(modulecontroller.Modulelist[indx].appModuleId==3)
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  fit: BoxFit.fill, image: AssetImage("assets/images/outreach.png")
                              )
                          ),
                        ),
                    ],
                  ),
                  Column(
                    children: [
                      if(modulecontroller.Modulelist[indx].appModuleId==5)
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  fit: BoxFit.fill, image: AssetImage("assets/images/zero_dose.png")
                              )
                          ),
                        ),
                    ],
                  ),
                  Column(
                    children: [
                      if(modulecontroller.Modulelist[indx].appModuleId==4)
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  fit: BoxFit.fill, image: AssetImage("assets/images/hh.png")
                              )
                          ),
                        ),
                    ],
                  ),
                  Column(
                    children: [
                      if(modulecontroller.Modulelist[indx].appModuleId==7)
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  fit: BoxFit.fill, image: AssetImage("assets/images/weak.png")
                              )
                          ),
                        ),
                    ],
                  ),
                  Column(
                    children: [
                      if(modulecontroller.Modulelist[indx].appModuleId==6)
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  fit: BoxFit.fill, image: AssetImage("assets/images/afp.png")
                              )
                          ),
                        ),
                    ],
                  ),
                     SizedBox(height: 5.0,),
                  Text(
                    modulecontroller.Modulelist[indx].appModuleName.toString(),
                  )
                ],
              ),
            ],
          ),
        ),

      ),
    );
  }

}


