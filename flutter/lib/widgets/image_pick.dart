import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  // ignore: avoid_print
  final ImagePicker _picker = ImagePicker();
  XFile? _file = await _picker.pickImage(source: source);
  if (_file != null) {
    return _file.readAsBytes();
  }
  print('image not selected');
  return null;
}