import 'package:pr_2/domain/entity/providerEntity.dart';

class Provider extends ProviderEntity {
  late int id;
  final String providerName;
  final String phone;

  Provider({
    required this.providerName,
    required this.phone,
  }) : super(
          providerName: providerName,
          phone: phone,
        );

  Map<String, dynamic> toMap() {
    return {
      'providerName': providerName,
      'phone': phone,
    };
  }

  factory Provider.toFromMap(Map<String, dynamic> json) {
    return Provider(
      providerName: json['providerName'],
      phone: json['phone'],
    );
  }
}
