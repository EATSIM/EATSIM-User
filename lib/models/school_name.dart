class School {
  final String schoolName;
  final int schoolIdx;

  School({required this.schoolName, required this.schoolIdx});

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      schoolName: json['schoolName'] ?? '',
      schoolIdx:
          json['idx'] is int ? json['idx'] : int.parse(json['idx'] ?? '0'),
    );
  }
}
