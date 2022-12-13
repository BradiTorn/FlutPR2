import 'package:pr_2/domain/entity/employeeEntity.dart';

class Employee extends EmployeeEntity {
  late int id;
  final String surname;
  final String name;
  final String patronymic;
  final int accountId;

  Employee({
    required this.surname,
    required this.name,
    required this.patronymic,
    required this.accountId,
  }) : super(
          surname: surname,
          name: name,
          patronymic: patronymic,
          accountId: accountId,
        );

  Map<String, dynamic> toMap() {
    return {
      'surname': surname,
      'name': name,
      'patronymic': patronymic,
      'accountId': accountId
    };
  }

  factory Employee.toFromMap(Map<String, dynamic> json) {
    return Employee(
      surname: json['surname'],
      name: json['name'],
      patronymic: json['patronymic'],
      accountId: json['accountId'],
    );
  }
}
