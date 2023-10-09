class UserDto {
  final int idx;
  final String userID;
  final String userName;
  final String userCallNumber;
  final int schoolIdx;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserDto({
    required this.idx,
    required this.userID,
    required this.userName,
    required this.userCallNumber,
    required this.schoolIdx,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      idx: json['idx'],
      userID: json['userID'],
      userName: json['userName'],
      userCallNumber: json['userCallNumber'],
      schoolIdx: json['schoolIdx'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
