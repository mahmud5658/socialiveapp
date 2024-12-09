import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:socialive/api/model/picture_model.dart';
import '../api/model/network_response.dart';
import '../api/network_caller/network_caller.dart';

class PictureController extends GetxController{
  List<PictureDataModel> pictureModelData = [];
  Future<void> getPicture() async {
    update();
    NetworkResponse response = await NetworkCaller.getRequest();

    if (response.isSuccess) {
    PictureModel pictureModel = PictureModel.fromJson(response.responseData);
    pictureModelData = pictureModel.pictureModelList??[];
    debugPrint('Abdullah');
    debugPrint(pictureModelData[1].picture);
    update();
    } else {
      debugPrint('Abdullah');
    }
    update();
  }
}