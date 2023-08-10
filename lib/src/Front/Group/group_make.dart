import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobalworld/src/Front/Color_UI/padding.dart';
import 'package:mobalworld/src/Front/Group/group_select.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import 'dart:io';
import '../../../main.dart';
import '../Setting/theme_provider.dart';
import '../Setting/toung.dart';
import 'group_code_confirm.dart';
import 'package:path/path.dart' as Path;

class GroupMake extends StatefulWidget {
  const GroupMake({Key? key}) : super(key: key);

  @override
  State<GroupMake> createState() => _GroupMakeState();
}

class _GroupMakeState extends State<GroupMake> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();
  bool IsName = false;
  String invitationCode = '';
  bool isImageLoaded = false;
  PickedFile? _image;
  bool isMake = false;
  Future getImage() async {
    var image  = await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image!;
    });

    if (_image != null) {
      setState(() {
        isImageLoaded = true;
      });
    }
  }

  void generateInvitationCode() {
    setState(() {
      invitationCode = randomAlphaNumeric(4); // 4글자의 숫자와 문자가 혼합된 초대 코드 생성
    });
  }

  void _createGroup(String groupLeader, File img, String groupName, String groupIntro) async{
    String fileName = Path.basename(img.path);
    TaskSnapshot task = await FirebaseStorage.instance
        .ref() // 시작점
        .child(invitationCode + '/' + fileName) // collection 이름
        .putFile(img);

    if(task != null)
    {
      var downloadUrl = await task.ref.getDownloadURL();
      FirebaseFirestore.instance.collection('groups').doc(invitationCode).set({
        'group_leader': groupLeader,
        'group_name': groupName,
        'group_Intro': groupIntro,
        'code' : invitationCode,
        'img' : downloadUrl,
        // 추가적인 필드들을 필요에 따라 여기에 추가하세요
      })
          .then((value) {
        // 데이터 저장이 성공한 경우의 처리를 여기에 작성하세요
        print('Group created successfully!');

        FirebaseFirestore.instance
            .collection('user')
            .doc(groupLeader)
            .collection('groups')
            .doc(invitationCode)
            .set({
          'Email': groupLeader,
          // 추가적인 필드들을 필요에 따라 여기에 추가하세요
        });
        // group_users 컬렉션에 groupLeader 추가
        FirebaseFirestore.instance
            .collection('groups')
            .doc(invitationCode)
            .collection('group_users')
            .doc(groupLeader)
            .set({
          'Email': groupLeader,
          // 추가적인 필드들을 필요에 따라 여기에 추가하세요
        })
            .then((value) {
          // group_users 컬렉션에 groupLeader 추가가 성공한 경우의 처리를 여기에 작성하세요
          Get.to(GroupSelect());
          print('Group leader added successfully!');
        })
            .catchError((error) {
          // group_users 컬렉션에 groupLeader 추가가 실패한 경우의 처리를 여기에 작성하세요
          print('Failed to add group leader: $error');
        });
      })
          .catchError((error) {
        // 데이터 저장이 실패한 경우의 처리를 여기에 작성하세요
        print('Failed to create group: $error');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    final _email = Provider.of<Email>(context, listen: false).getEmail();
    return SafeArea(
        child: Scaffold(
          backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),
          appBar: AppBar(
            backgroundColor: isDarkMode ? Color(0xFF161817) : Color(0xFFFBF9F4),
        toolbarHeight: 80,
            leading: IconButton(
              icon: Icon(
            Icons.arrow_back_ios_new,
            color: isDarkMode? Colors.white : Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          '편지함 만들기',
          style: GoogleFonts.notoSans(
              textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20)),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: GetPadding(),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                      child: Text('편지함 이름',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                      child: Text(
                        '편지함 이름은 개설 이후에도 변경할 수 있습니다.',
                        style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 1,
                        controller: _title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600),
                        onChanged: (String text) {
                          setState(() {
                            IsName = text.length > 0;
                          });
                        },
                        onTapOutside: (event) => //다른 화면 누를 때 키보드 down
                            FocusManager.instance.primaryFocus?.unfocus(),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: "제목을 입력해 주세요",
                          filled: true,
                          fillColor: Colors.transparent,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.9)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                      child: Text('편지함 소개',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                      child: Text(
                        '편지함 소개는 개설 이후에도 변경할 수 있습니다.',
                        style:
                             TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 1,
                        controller: _content,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600),
                        onChanged: (String text) {
                          setState(() {
                            IsName = text.length > 0;
                          });
                        },
                        onTapOutside: (event) => //다른 화면 누를 때 키보드 down
                            FocusManager.instance.primaryFocus?.unfocus(),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: "편지함 소개를 적어주세요.",
                          filled: true,
                          fillColor: Colors.transparent,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.9)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                      child: Text('대표 사진',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                      child: Text(
                        '대표 사진은 편지함 페이지 커버에 표시 됩니다.',
                        style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                      child: DottedBorder(
                        dashPattern: [6, 3],
                        strokeWidth: 1,
                        color: Colors.grey,
                        borderType: BorderType.Rect,
                        child: Container(
                          height: 200,
                          width: 400,
                          child: Center(
                            child: isImageLoaded?Image.file(
                              File(_image!.path),
                              width: 340,
                              height: 190,
                              fit: BoxFit.fill,
                            ):Container(
                              width:
                                  120, // Set the desired width for the button
                              height:
                                  30, // Set the desired height for the button
                              child: OutlinedButton.icon(
                                // <-- OutlinedButton
                                onPressed: () {
                                  getImage();
                                },
                                icon: Icon(
                                  Icons.photo_camera_outlined,
                                  size: 15.0,
                                  color: Colors.grey,
                                ),
                                label: Text(
                                  'upload',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                      child: Text('초대 코드',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          )),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.02.sh),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:  BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            invitationCode,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      generateInvitationCode();
                      isMake = true;
                      // 편지함 생성 및 초대 코드 저장 작업 수행
                    },
                    child: Text('초대 코드 만들기',
                        style:TextStyle(
                          color: Colors.white,
                        ) ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        backgroundColor: Color(0xFFFF6105)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 0.02.sh, vertical: 0.01.sh),
                    child: isMake?ElevatedButton(
                      onPressed: () {
                        _createGroup(_email, File(_image!.path), _title.text, _content.text);
                        Get.to(GroupSelect());
                      },
                      child: Text('만들기',
                        style:TextStyle(
                          color: Colors.white,
                        ) ,),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                          backgroundColor: isMake?Color(0xFFFF6105): Colors.grey),
                    ):Container(
                      width: 95,
                      height: 40,
                      child: Center(
                        child: Text('만들기',
                          style:TextStyle(
                            color: Colors.white,
                          ) ,),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius:  BorderRadius.circular(15),
                        color: Colors.grey
                      ),
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
