import 'package:hive/hive.dart';
part 'sign_up_model.g.dart';
@HiveType(typeId: 2)
class SignUpModel extends HiveObject {
  @HiveField(0)
  late String email;
  @HiveField(1)
  late String password;
  @HiveField(2)
  late String pharmacyName;
  SignUpModel(
      {required this.email,
      required this.password,
      required this.pharmacyName});
}
