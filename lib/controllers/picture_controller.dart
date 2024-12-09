
import 'package:get/get.dart';
import 'package:socialive/api/model/picture_model.dart';
import 'package:socialive/api/network_caller/urls.dart';
import '../api/model/network_response.dart';
import '../api/network_caller/network_caller.dart';

class PictureController extends GetxController{
  List<PictureDataModel> pictureList = [];
  Future<void> getPicture() async {
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.pictureUrl);
    if (response.isSuccess) {
    PictureModel pictureModel = PictureModel.fromJson(response.responseData);
    pictureList = pictureModel.pictureModelList??[];
    update();
    } else {
    }
    update();
  }
}