
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:socialive/utils/assets_paths.dart';
import '../../../my_imports.dart';
class ProfileListView extends StatefulWidget {
  const ProfileListView({
    super.key,
  });

  @override
  State<ProfileListView> createState() => _ProfileListViewState();
}

class _ProfileListViewState extends State<ProfileListView> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: DummyGridViewPath.demoImageList.length,
        itemBuilder: (context,index){
      return InstaImageViewer(
          child: Padding(padding: const EdgeInsets.all(8.0),
              child: Image.network(DummyGridViewPath.demoImageList[index])
          )
      );

    });
  }
}
