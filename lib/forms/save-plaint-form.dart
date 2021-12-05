import 'package:file_picker/file_picker.dart';
import 'package:plainte/models/category-plaint.dart';
import 'package:plainte/models/etat-plaint.dart';
import 'package:plainte/models/user.dart';

class SavePlaintForm {
  String localisation;
  String description;
  PlatformFile fileSelected;
  CategoryPlaint categoryPlaint;
  EtatPlaint etatPlaint;
  User user;

  SavePlaintForm({
    this.localisation,
    this.description,
    this.fileSelected,
    this.categoryPlaint
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'localisation' : localisation,
      'description' : description,
    };
  }

}
