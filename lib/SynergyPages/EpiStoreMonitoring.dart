import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synergy_flutter/SynergyPages/ContactUs.dart';
import 'package:synergy_flutter/SynergyPages/EPIMonitoringCheckList.dart';
import 'package:synergy_flutter/SynergyPages/LoginPage.dart';
import 'package:synergy_flutter/SynergyPages/ModuleList.dart';
import 'package:synergy_flutter/SynergyPages/NextPage.dart';
import 'package:synergy_flutter/SynergyResponse/EPIstoreResponse.dart';

import '../SynergyController/SynerListController.dart';
class EpiStoreMonitoringModule extends StatefulWidget {
   final int ModuleId;
   EpiStoreMonitoringModule({Key? key, this.ModuleId=0}) : super(key: key);

  @override
  State<EpiStoreMonitoringModule> createState() => _EpiStoreMonitoringModuleState();
}

class _EpiStoreMonitoringModuleState extends State<EpiStoreMonitoringModule> {
  Future<bool?> showWarning(BuildContext context) async => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context)=>const ModuleList()), (Route<dynamic>route) => false);
  TextEditingController _storename = TextEditingController();
  TextEditingController _name = TextEditingController(text: "BILAWAL ALI ASHRAF MR");
  String? storename, name;
  bool _showTextField = false;
  final storecontroller = Get.put(ModuleListController());
  final controller = ScrollController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  static Dio _dio = Dio(
    BaseOptions(
      baseUrl:        'https://sesapi.pshealthpunjab.gov.pk/api/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );
  static String? token;
  String? selectStoreType;
  EpiStoreState? epiStoreState;
  List<StoreType> storetypeList = [];

   Future<List<StoreType>> fetchAllStore(String bearer) async {
    SharedPreferences prefrences = await SharedPreferences.getInstance();
    token = prefrences.getString("Token");
    _dio.options.headers['content-Type'] = 'application/x-www-form-urlencoded';
    _dio.options.headers['Authorization']='Bearer $token';
    var response = await _dio.get('Profile/GetStoreTypes');

    if (response.statusCode == 200) {
      EpiStoreState res = EpiStoreState.fromJson(response.data);
      storetypeList = res.storelist!.toList();
      return storetypeList;
    } else {
      throw Exception('Failed to load internet');
    }

  }

  @override
  void initState() {
    super.initState();
    fetchAllStore("bearer").then((res) => {
      print('List of StoreType is loaded'),
      setState(() {
      }),
    });
  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return WillPopScope(
        child: Scaffold(
          key: _scaffoldState,
    appBar: AppBar(
      backgroundColor: Colors.blue,
      elevation: 0.0,
    ),
            drawer: Drawer(
              child:SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
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
              )


            ),
    body: Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        image: new DecorationImage(
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(Colors.grey.withOpacity(.5),BlendMode.dstATop),
          image: new AssetImage(
              "assets/images/punjab.png"
          ),
        ),
      ),
      height: height,
      width: width,
        child:Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                    color: Colors.white,
                    elevation: 50,
                    child: Column(
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                              border: new Border.all(color: Colors.purple,
                                  width: 2.0),
                              borderRadius: BorderRadius.circular(15.0
                              )
                          ),
                          child: Stack(
                            children: [
                              DropdownButtonFormField<String>(
                                value: selectStoreType,
                                isExpanded: true,
                                items: storetypeList.map((StoreType storeTypelist) {
                                  return DropdownMenuItem<String>(
                                      value: storeTypelist.name,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(storeTypelist.name.toString().trim()),
                                      )
                                  );
                                }).toList(),
                                onChanged: (_)=>{
                                },
                                hint:Center(
                                    child:Text("Store Type")),
                                disabledHint:Text("Select Store Type"),
                                elevation: 10,
                                style:TextStyle(color:Colors.black, fontSize: 16,fontWeight: FontWeight.bold),
                                icon: Icon(Icons.arrow_drop_down_circle),
                                iconDisabledColor: Colors.red,
                                iconEnabledColor: Colors.purple,
                                iconSize: 20,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        TextFormField(
                          textAlign: TextAlign.left,
                          controller: _storename,
                          onChanged: (val){
                            storename=val;
                          },
                          cursorColor: Colors.black,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              height: 1
                          ),
                          decoration: InputDecoration(
                            labelText: ' Store Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.purple,
                                width: 2.0,
                              ),
                            ),
                            hintStyle: TextStyle(
                              color:Colors.black,
                            ),
                            hintText: 'Store Name',
                            hintTextDirection: TextDirection.rtl,
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,

                        ),
                        SizedBox(height: 15.0,),
                        TextFormField(
                          textAlign: TextAlign.left,
                          controller: _name,
                          onChanged: (val){
                            name=val;
                          },
                          cursorColor: Colors.black,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              height: 1
                          ),
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.purple,
                                width: 2.0,
                              ),
                            ),
                            hintStyle: TextStyle(
                              color:Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        ButtonTheme(
                          height: 50,
                          minWidth: width -200,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text('Show Data'),
                            onPressed: (){
                              //5085233
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (  context) => Nextpage(ModuleId: widget.ModuleId),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    )
    ),

        onWillPop: () async{
          final shouldPop = await showWarning(context);
          return shouldPop ?? false;
        }
        );
  }
  _logout() async {
    SharedPreferences sharePrefs = await SharedPreferences.getInstance();
    await sharePrefs.remove('Tok'
        '0en');
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context)=>Login()), (Route<dynamic>route) => false);
  }
}