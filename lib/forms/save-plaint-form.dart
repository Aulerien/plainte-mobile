import 'package:file_picker/file_picker.dart';

class SavePlaintForm {
  String lieu;
  String description;
  PlatformFile fileSelected;

  SavePlaintForm({
    this.lieu,
    this.description,
    this.fileSelected
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'lieu' : lieu,
      'description' : description,
    };
  }

}
