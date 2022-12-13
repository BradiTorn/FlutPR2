class PolzovatelEntity {
  late int id;
  final String login;
  final String password;
  final int roleId;

  PolzovatelEntity(
      {required this.login, required this.password, required this.roleId});
}
