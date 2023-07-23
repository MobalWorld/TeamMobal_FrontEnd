import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mobalworld/src/Front/Color_UI/colors.dart';
import 'package:provider/provider.dart';
import 'firebase/firebase_options.dart';
import 'src/Front/Setting/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // 옵션 설정도 중요
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Fix the screen orientation to portraitUp
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
          ),
          //get방식의 상태 변화를 주고싶을때 사용
          debugShowCheckedModeBanner: false,
          home: OrientationBuilder(
            //회전가능하게 하는 기능
            builder: (context, orientation) {
              return Splash();
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
