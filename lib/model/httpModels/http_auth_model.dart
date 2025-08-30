

class UserModel {
  final int id;
  final String fullName;
  final String email;
  final String imageUrl;
  final int customerId;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.imageUrl,
    required this.customerId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['full_name'],
      email: json['email'],
      imageUrl: json['image_url'],
      customerId: json['customer_id'],
    );
  }
}


class ApiResponse {
  final bool success;
  final String message;
  final String? token;
  final UserModel? user;

  ApiResponse({
    required this.success,
    required this.message,
    this.token,
    this.user,
  });
}

/// Category
class GroupResponse {
  final bool status;
  final List<Group> groups;
  final String message;

  GroupResponse({
    required this.status,
    required this.groups,
    required this.message,
  });

  factory GroupResponse.fromJson(Map<String, dynamic> json) {
    return GroupResponse(
      status: json['status'] ?? false,
      groups: (json['group'] as List).map((e) => Group.fromJson(e)).toList(),
      message: json['message'] ?? '',
    );
  }
}

class Group {
  final int id;
  final String name;
  final String arabicName;
  final String description;
  final String image;
  final String imageUrl;

  Group({
    required this.id,
    required this.name,
    required this.arabicName,
    required this.description,
    required this.image,
    required this.imageUrl,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id']??'',
      name: json['name']??'',
      arabicName: json['arabic_name']??'',
      description: json['description']??'',
      image: json['image']??'',
      imageUrl: json['image_url']??'',
    );
  }
}