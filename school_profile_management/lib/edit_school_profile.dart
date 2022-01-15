import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';
import 'package:school_profile_management/c_button.dart';
import 'package:school_profile_management/c_text.dart';
import 'package:school_profile_management/dialog_mixin.dart';
import 'package:school_profile_management/int_extension.dart';
import 'package:school_profile_management/school_profile_model.dart';

class EditSchoolProfile extends StatefulWidget {
  final BehaviorSubject? profile;
  final int? id;
  const EditSchoolProfile({Key? key, this.profile, this.id}) : super(key: key);

  @override
  State<EditSchoolProfile> createState() => _AddNewSchoolProfileState();
}

class _AddNewSchoolProfileState extends State<EditSchoolProfile>
    with DialogsMixin {
  final studentName = TextEditingController();
  final firstYear01 = TextEditingController();
  final firstYear02 = TextEditingController();
  final secondYear01 = TextEditingController();
  final secondYear02 = TextEditingController();
  final thirdYear01 = TextEditingController();
  final thirdYear02 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sửa học bạ'),
        backgroundColor: const Color(0xFF098a8f),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(12.r),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                12.h.toInt().height,
                CText(
                  text: 'Tên học sinh:',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                12.h.toInt().height,
                TextField(
                  controller: studentName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nhập tên học sinh',
                  ),
                ),
                12.h.toInt().height,
                CText(
                  text: 'Lớp 10:',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                12.h.toInt().height,
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: firstYear01,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Điểm trung bình kì 1',
                        ),
                      ),
                    ),
                    8.width,
                    Expanded(
                      flex: 1,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: firstYear02,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Điểm trung bình kì 2',
                        ),
                      ),
                    ),
                  ],
                ),
                12.h.toInt().height,
                CText(
                  text: 'Lớp 11:',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                12.h.toInt().height,
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: secondYear01,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Điểm trung bình kì 1',
                        ),
                      ),
                    ),
                    8.width,
                    Expanded(
                      flex: 1,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: secondYear02,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Điểm trung bình kì 2',
                        ),
                      ),
                    ),
                  ],
                ),
                12.h.toInt().height,
                CText(
                  text: 'Lớp 12:',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
                12.h.toInt().height,
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: thirdYear01,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Điểm trung bình kì 1',
                        ),
                      ),
                    ),
                    8.width,
                    Expanded(
                      flex: 1,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: thirdYear02,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Điểm trung bình kì 2',
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CButton(
                  radius: 10.r,
                  width: double.infinity,
                  height: 56.h,
                  title: 'Sửa học bạ',
                  titleFontSize: 12.sp,
                  titleFontWeight: FontWeight.bold,
                  titleColor: Colors.white,
                  backgroundColor: const Color(0xFF098a8f),
                  buttonTapped: () {
                    List<SchoolProfileModel> list = widget.profile?.value;
                    for (int i = 0; i < list.length; i++) {
                      if (list[i].studentId == widget.id) {
                        final item = SchoolProfileModel(
                          studentName: studentName.text,
                          firstYearProfile: SchoolProfilePerYear(
                            averageFirstSemester:
                                double.parse(firstYear01.text),
                            averageSecondSemester:
                                double.parse(firstYear02.text),
                          ),
                          secondYearProfile: SchoolProfilePerYear(
                            averageFirstSemester:
                                double.parse(secondYear01.text),
                            averageSecondSemester:
                                double.parse(secondYear02.text),
                          ),
                          thirdYearProfile: SchoolProfilePerYear(
                            averageFirstSemester:
                                double.parse(thirdYear01.text),
                            averageSecondSemester:
                                double.parse(thirdYear02.text),
                          ),
                        );
                        list[i] = item;
                      }
                    }
                    widget.profile?.add(list);
                    showAlertDialog(
                        'Thông báo', 'Cập nhật học bạ thành công', 'ok', () {
                      dissmissAlertDialog();
                      Navigator.pop(context);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
