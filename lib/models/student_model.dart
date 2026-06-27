class StudentModel {
  final String? id;
  final String studentName;
  final int studentRoll;

  StudentModel({required this.studentName , required this.studentRoll , this.id});

  factory StudentModel.fromJson(String docId, Map<String, dynamic> jsonData) {
    return StudentModel(
      id: docId,
      studentName: jsonData['studentName'],
      studentRoll: jsonData['studentRoll']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'studentName':studentName,
      'studentRoll':studentRoll
    };
  }
}
