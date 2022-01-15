import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_profile_management/add_new_school_profile.dart';
import 'package:school_profile_management/c_container.dart';
import 'package:school_profile_management/c_text.dart';
import 'package:school_profile_management/dialog_mixin.dart';
import 'package:school_profile_management/edit_school_profile.dart';
import 'package:school_profile_management/int_extension.dart';
import 'package:school_profile_management/material_utils.dart';
import 'package:school_profile_management/school_profile_model.dart';
import 'package:school_profile_management/side_menu.dart';
import 'package:rxdart/rxdart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with DialogsMixin {
  final searchedProfiles = BehaviorSubject<List<SchoolProfileModel>>();
  List<SchoolProfileModel> allProfiles = [];

  @override
  void initState() {
    // TODO: implement initState

    final profile01 = SchoolProfileModel(
      studentId: 1,
      studentName: "Nguyễn Thành Nam",
      firstYearProfile: SchoolProfilePerYear(
        averageFirstSemester: 7.2,
        averageSecondSemester: 8.0,
      ),
      secondYearProfile: SchoolProfilePerYear(
        averageFirstSemester: 7.0,
        averageSecondSemester: 8.8,
      ),
      thirdYearProfile: SchoolProfilePerYear(
        averageFirstSemester: 7.8,
        averageSecondSemester: 8.9,
      ),
    );
    final profile02 = SchoolProfileModel(
      studentId: 2,
      studentName: "Nguyễn Thành Trung",
      firstYearProfile: SchoolProfilePerYear(
        averageFirstSemester: 7.2,
        averageSecondSemester: 8.0,
      ),
      secondYearProfile: SchoolProfilePerYear(
        averageFirstSemester: 7.2,
        averageSecondSemester: 8.0,
      ),
      thirdYearProfile: SchoolProfilePerYear(
        averageFirstSemester: 7.9,
        averageSecondSemester: 8.5,
      ),
    );
    final profile03 = SchoolProfileModel(
      studentId: 3,
      studentName: "Nguyễn Hương Ly",
      firstYearProfile: SchoolProfilePerYear(
        averageFirstSemester: 7.2,
        averageSecondSemester: 8.0,
      ),
      secondYearProfile: SchoolProfilePerYear(
        averageFirstSemester: 7.2,
        averageSecondSemester: 8.0,
      ),
      thirdYearProfile: SchoolProfilePerYear(
        averageFirstSemester: 7.9,
        averageSecondSemester: 8.5,
      ),
    );
    final profile04 = SchoolProfileModel(
      studentId: 4,
      studentName: "Trần Hải Linh",
      firstYearProfile: SchoolProfilePerYear(
        averageFirstSemester: 7.2,
        averageSecondSemester: 8.0,
      ),
      secondYearProfile: SchoolProfilePerYear(
        averageFirstSemester: 7.2,
        averageSecondSemester: 8.0,
      ),
      thirdYearProfile: SchoolProfilePerYear(
        averageFirstSemester: 7.9,
        averageSecondSemester: 8.5,
      ),
    );
    allProfiles.add(profile01);
    allProfiles.add(profile02);
    allProfiles.add(profile03);
    allProfiles.add(profile04);
    searchedProfiles.add(allProfiles);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
        width: 300.w,
        child: const SideMenu(),
      ),
      appBar: AppBar(
        title: const Text('Danh sách học bạ'),
        backgroundColor: const Color(0xFF098a8f),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddNewSchoolProfile(
                      profile: searchedProfiles,
                    )),
          );
        },
        backgroundColor: const Color(0xFF098a8f),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
            child: TextField(
              onChanged: (content) {
                List<SchoolProfileModel> profiles = [];
                for (var element in allProfiles) {
                  if (element.studentName!
                      .toLowerCase()
                      .contains(content.trim())) {
                    profiles.add(element);
                  }
                }
                if (content != '') {
                  searchedProfiles.add(profiles);
                } else {
                  searchedProfiles.add(allProfiles);
                }
              },
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: const Color(0xFF098a8f), width: 1.0),
                  ),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: 'Tìm kiếm học bạ'),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<SchoolProfileModel>>(
                stream: searchedProfiles,
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Container();
                  }
                  return ListView.builder(
                      padding: EdgeInsets.all(8.r),
                      itemCount: searchedProfiles.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditSchoolProfile(
                                        profile: searchedProfiles,
                                        id: snapshot.data?[index].studentId,
                                      )),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: 12.h,
                              ),
                              CContainer(
                                borderColor: Colors.grey,
                                radius: 10.r,
                                child: Padding(
                                  padding: EdgeInsets.all(12.r),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4.h),
                                        child: Row(
                                          children: [
                                            CText(
                                              width: 72.w,
                                              text: 'Tên:',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CText(
                                              fontSize: 12.sp,
                                              text: snapshot
                                                  .data?[index].studentName,
                                            ),
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                showAlertOptionsDialog(
                                                    'Thông báo',
                                                    'Bạn có muốn xóa học bạ này không?',
                                                    () {
                                                  dissmissAlertDialog();
                                                  List<SchoolProfileModel>
                                                      profilesList =
                                                      allProfiles;
                                                  profilesList.removeAt(index);
                                                  searchedProfiles
                                                      .add(profilesList);
                                                }, () {
                                                  dissmissAlertDialog();
                                                });
                                              },
                                              child: Image.asset(
                                                'assets/icon_remove.png',
                                                width: 24,
                                                height: 24,
                                                color: Colors.red,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4.h),
                                        child: Row(
                                          children: [
                                            CText(
                                              width: 72.w,
                                              text: 'Lớp 10:',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CText(
                                              width: 56.w,
                                              fontSize: 12.sp,
                                              text:
                                                  'Kì 1: ${snapshot.data?[index].firstYearProfile?.averageFirstSemester.toString()}',
                                            ),
                                            const Text('  |  '),
                                            CText(
                                              width: 56.w,
                                              fontSize: 12.sp,
                                              text:
                                                  'Kì 2: ${snapshot.data?[index].firstYearProfile?.averageSecondSemester.toString()}',
                                            ),
                                            const Text('  |  '),
                                            CText(
                                              fontSize: 12.sp,
                                              text:
                                                  'Trung bình: ${snapshot.data?[index].firstYearProfile?.averageScore().toString()}',
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4.h),
                                        child: Row(
                                          children: [
                                            CText(
                                              width: 72.w,
                                              text: 'Lớp 11:',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CText(
                                              width: 56.w,
                                              fontSize: 12.sp,
                                              text:
                                                  'Kì 1: ${snapshot.data?[index].secondYearProfile?.averageFirstSemester.toString()}',
                                            ),
                                            const Text('  |  '),
                                            CText(
                                              width: 56.w,
                                              fontSize: 12.sp,
                                              text:
                                                  'Kì 2: ${snapshot.data?[index].secondYearProfile?.averageSecondSemester.toString()}',
                                            ),
                                            const Text('  |  '),
                                            CText(
                                              fontSize: 12.sp,
                                              text:
                                                  'Trung bình: ${snapshot.data?[index].secondYearProfile?.averageScore().toString()}',
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4.h),
                                        child: Row(
                                          children: [
                                            CText(
                                              width: 72.w,
                                              text: 'Lớp 12:',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            CText(
                                              width: 56.w,
                                              fontSize: 12.sp,
                                              text:
                                                  'Kì 1: ${snapshot.data?[index].thirdYearProfile?.averageFirstSemester.toString()}',
                                            ),
                                            const Text('  |  '),
                                            CText(
                                              width: 56.w,
                                              fontSize: 12.sp,
                                              text:
                                                  'Kì 2: ${snapshot.data?[index].thirdYearProfile?.averageSecondSemester.toString()}',
                                            ),
                                            const Text('  |  '),
                                            CText(
                                              fontSize: 12.sp,
                                              text:
                                                  'Trung bình: ${snapshot.data?[index].thirdYearProfile?.averageScore().toString()}',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                            ],
                          ),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
