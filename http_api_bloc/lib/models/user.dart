// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {

  final String title;
  final String body;
  UserModel({
    required this.title,
    required this.body,
  });


  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(
  //     firstname: json['firstname'] ?? 'firstname',
  //     lastname: json['lastname'] ?? 'lastname',
  //     atvatar: json['atvatar'] ?? '',
  //   );
  // }

  




  UserModel copyWith({
    String? title,
    String? body,
  }) {
    return UserModel(
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);


  @override
  String toString() => 'UserModel(title: $title, body: $body)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.body == body;
  }

  @override
  int get hashCode => title.hashCode ^ body.hashCode;
}
