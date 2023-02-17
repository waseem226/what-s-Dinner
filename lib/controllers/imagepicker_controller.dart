import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class ImagePickerController extends GetxController {
  RxString imagePath = "".obs;
  void showImagePicker(bool fromGallery) async {
    final ImagePicker picker = ImagePicker();

    final photo = await picker.pickImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera);
    if (photo != null) {
      imagePath.value = photo.path.toString();
    } else
      print("You don't select the image");
  }
}
