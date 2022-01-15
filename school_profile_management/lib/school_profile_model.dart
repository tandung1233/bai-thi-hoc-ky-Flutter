class SchoolProfileModel {
  final int? studentId;
  final String? studentName;
  final SchoolProfilePerYear? firstYearProfile;
  final SchoolProfilePerYear? secondYearProfile;
  final SchoolProfilePerYear? thirdYearProfile;

  SchoolProfileModel({
    this.studentId,
    this.studentName,
    this.firstYearProfile,
    this.secondYearProfile,
    this.thirdYearProfile,
  });
}

class SchoolProfilePerYear {
  final double? averageFirstSemester;
  final double? averageSecondSemester;

  SchoolProfilePerYear({
    this.averageFirstSemester,
    this.averageSecondSemester,
  });

  String averageScore() {
    if (averageFirstSemester != null && averageSecondSemester != null) {
      final avg = (averageFirstSemester! + averageSecondSemester!) / 2;
      return avg.toStringAsFixed(1);
    }
    return "0";
  }
}
