import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'firebase/firebase_options.dart';
import 'src/ui/Setting/main_loading.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // 옵션 설정도 중요
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690), //핸드폰 디폴트 사이즈 지정
      builder: (content, child) => ChangeNotifierProvider(
        create: (context) => Email(),
        child: GetMaterialApp(
          //get방식의 상태 변화를 주고싶을때 사용
          debugShowCheckedModeBanner: false,
          home: OrientationBuilder(
            //회전가능하게 하는 기능
            builder: (context, orientation) {
              return LoadingPage();
            },
          ),

        ),
      ),
    );
  }
}

class EmailUser {
  final String name;

  EmailUser({
    required this.name,
  });
}

class Email with ChangeNotifier {
  String _email = "";

  String getEmail() => _email;

  void add(String email) {
    _email = email;
    notifyListeners();
  }

  void remove() {
    _email = "";
    notifyListeners();
  }
}
