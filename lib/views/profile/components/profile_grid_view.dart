import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PictureController>(builder: (pictureController) {
      return MasonryGridView.builder(
          itemCount: pictureController.pictureList.length,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(2.0),
                child: InstaImageViewer(
                  child: Image.network(
                      pictureController.pictureList[index].picture.toString()),
                ));
          });
    });
  }
}
