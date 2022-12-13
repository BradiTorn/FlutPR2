class EmployeeEntity {
  late int id;
  final String surname;
  final String name;
  final String patronymic;
  final int accountId;

  EmployeeEntity(
      {required this.surname,
      required this.name,
      required this.patronymic,
      required this.accountId});
}
