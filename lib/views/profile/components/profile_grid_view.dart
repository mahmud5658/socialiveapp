import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import '../../../api/model/network_response.dart';
import '../../../api/model/picture_model.dart';
import '../../../api/network_caller/network_caller.dart';
import '../../../controllers/picture_controller.dart';
import '../../../my_imports.dart';
class ProfileGridView extends StatefulWidget {
  const ProfileGridView({
    super.key,
  });

  @override
  State<ProfileGridView> createState() => _ProfileGridViewState();
}


class _ProfileGridViewState extends State<ProfileGridView> {

  final PictureController pictureController = Get.find<PictureController>();
  List<PictureDataModel> pictureModelDataList = [];
  @override
  void initState() {
    super.initState();
    getPicture();
  }

  Future<void> getPicture() async {

    NetworkResponse response = await NetworkCaller.getRequest();
    if (response.isSuccess) {
      PictureModel pictureModel = PictureModel.fromJson(response.responseData);
      pictureModelDataList = pictureModel.pictureModelList??[];
      debugPrint(response.statusCode.toString());
      debugPrint(pictureModelDataList[0].picture.toString());
      setState(() {

      });
    } else {
      setState(() {
      });
    }
  }
  @override
  Widget build(BuildContext context) {
        return MasonryGridView.builder(
          itemCount: pictureModelDataList.length,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (context,index){
          return Padding(padding: const EdgeInsets.all(2.0),
            child: InstaImageViewer(
              child: Image.network(pictureModelDataList[index].picture.toString(),
              ),
            )
          );
        
        });
  }

}
