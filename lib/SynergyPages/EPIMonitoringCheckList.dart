import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:synergy_flutter/SynergyController/SynerListController.dart';
import 'package:synergy_flutter/SynergyPages/EpiStoreMonitoring.dart';
import 'package:synergy_flutter/SynergyResponse/Module1check.dart';
class EPICheckList extends StatefulWidget {
   final int ModuleId;
  const EPICheckList({Key? key, this.ModuleId=0}) : super(key: key);

  @override
  State<EPICheckList> createState() => _EPICheckListState();
}

class _EPICheckListState extends State<EPICheckList> {
  Future<bool?> showWarning(BuildContext context) async => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context)=> EpiStoreMonitoringModule()), (Route<dynamic>route) => false);
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final indicatorcontroller = Get.put(ModuleListController());
  final controller = ScrollController();
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 0),
            () =>
            setState((){
              indicatorcontroller.fetchAllIndicatorsList(widget.ModuleId);
            }));
    super.initState();
    print(widget.ModuleId);

  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return WillPopScope(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Obx(() {
                  if (indicatorcontroller.Indicatorslist.isEmpty)
                    return Center(child: Text("No Module & Checklist",style: TextStyle(fontWeight: FontWeight.bold)));
                  else {
                    return ListView.builder(
                        controller: controller,
                        shrinkWrap: true,
                        itemCount:indicatorcontroller.Indicatorslist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return buildNumber(index, indicatorcontroller.Indicatorslist);
                        }
                    );
                  }
                },
                ),
              ),
            ],
          )
        ), onWillPop: ()async{
      final shouldPop = await showWarning(context);
      return shouldPop ?? false;
    }
    );
  }
  Widget buildNumber(int indx, List<Datum> taskstList) {
    return GestureDetector(
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
                /*  Column(
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
                  ),*/
                  SizedBox(height: 5.0,),
                  Text(
                    indicatorcontroller.Indicatorslist[indx].name.toString(),
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
