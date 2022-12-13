import 'package:pr_2/domain/entity/polzovatelEntity.dart';

class Polzovatel extends PolzovatelEntity {
  late int id;
  final String login;
  final String password;
  final int roleId;

  Polzovatel({
    required this.login,
    required this.password,
    required this.roleId,
  }) : super(
          login: login,
          password: password,
          roleId: roleId,
        );

  Map<String, dynamic> toMap() {
    return {'login': login, 'password': password, 'roleId': roleId};
  }

  factory Polzovatel.toFromMap(Map<String, dynamic> json) {
    return Polzovatel(
      login: json['login'],
      password: json['password'],
      roleId: json['roleId'],
    );
  }
}
