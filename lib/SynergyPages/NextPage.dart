import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:synergy_flutter/SynergyController/SynerListController.dart';
import 'package:synergy_flutter/SynergyPages/ModuleList.dart';

import '../SynergyResponse/Module1check.dart';
class Nextpage extends StatefulWidget {
  final int ModuleId;
  const Nextpage({Key? key, this.ModuleId=0}) : super(key: key);

  @override
  State<Nextpage> createState() => _NextpageState();
}

class _NextpageState extends State<Nextpage> {
  Future<bool?> showWarning(BuildContext context) async => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context)=> ModuleList()), (Route<dynamic>route) => false);
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
    return WillPopScope(
        child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: Obx(() {
                    if (indicatorcontroller.IndicatorsChecklist.isEmpty)
                      return Center(child: Text("No Module & Checklist",style: TextStyle(fontWeight: FontWeight.bold)));
                    else {
                      return ListView.builder(
                          controller: controller,
                          shrinkWrap: true,
                          itemCount:indicatorcontroller.IndicatorsChecklist.length,
                          itemBuilder: (BuildContext context, int index) {
                            return buildNumber(index, indicatorcontroller.IndicatorsChecklist);
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
                  Text(
                    indicatorcontroller.IndicatorsChecklist[indx].indicators!.first.question.toString(),
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
