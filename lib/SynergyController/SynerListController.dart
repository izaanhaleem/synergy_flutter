
import 'package:get/get.dart';
import 'package:synergy_flutter/SynergyResponse/EPIstoreResponse.dart';
import 'package:synergy_flutter/SynergyResponse/Module1check.dart';
import '../SynergyResponse/ModuleResponse.dart';
import '../dio_client.dart';

class ModuleListController extends GetxController{
  var isLoading = true.obs;

  var Modulelist =  <AllModuleList>[].obs;

 var Indicatorslist = <Datum>[].obs;

 var IndicatorsChecklist= <Datum>[].obs;

 var SubIndicatorCheclist = <Indicator>[].obs;

 var IndicatorQueationList = <Indicator>[].obs;
@override
  void onInit() {
  fetchAllModuleList();
  //fetchAllIndicatorsList(ModuleId);
  super.onInit();
  }
/*  void fetchAllCheckList(int ModuleId) async {
    try {
      isLoading(true);
      var indicatorschecklist = await DioClient.fetchAllIndicatorsCheckList(ModuleId);
      if (indicatorschecklist != null) {
        IndicatorsChecklist.value = indicatorschecklist as List<Indicator>;
       // indicators.value.assignAll(IndicatorsChecklist.map((IndicatorsChecklistt) => IndicatorsChecklistt).toList().cast());
        indicators.value.assignAll(IndicatorsChecklist.map((indicatorschecklist) => indicatorschecklist).toList());
      }
    } finally {
      isLoading(false);
    }
  }*/

  void fetchAllIndicatorsList(int ModuleId) async {
    try {
      isLoading(true);
      var indicatorslist = await DioClient.fetchAllIndicators(ModuleId);
      if (indicatorslist != null) {
        Indicatorslist.clear();
        IndicatorsChecklist.clear();

        Indicatorslist.value = indicatorslist;

        for(var i=0; Indicatorslist.length>0; i++){

          IndicatorsChecklist.assignAll(Indicatorslist[i].indicators!.length.obs.toJson());
        }
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchAllModuleList() async {
    try {
      isLoading(true);
      var modulelist = await DioClient.fetchAllModule("bearer");
      if (modulelist != null) {
        Modulelist.value = modulelist;
      }
    } finally {
      isLoading(false);
    }
  }

}