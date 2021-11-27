import 'package:file_picker/file_picker.dart';

class SavePlaintForm {
  String localisation;
  String description;
  PlatformFile fileSelected;

  SavePlaintForm({
    this.localisation,
    this.description,
    this.fileSelected
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'localisation' : localisation,
      'description' : description,
    };
  }

}
