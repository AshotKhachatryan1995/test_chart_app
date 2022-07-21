import 'package:json_annotation/json_annotation.dart';
import 'package:test_chart_project/middleware/models/address.dart';
import 'package:test_chart_project/middleware/models/company.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
