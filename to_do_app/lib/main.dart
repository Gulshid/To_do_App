import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/to_do_program/to_do.dart';

void main() async {
  //Hive database initialization
  await Hive.initFlutter();
  var box = await Hive.openBox('TO_DO');
  Hive.init(box.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TO do App',
          theme: ThemeData(
            appBarTheme: AppBarTheme(color: const Color.fromARGB(255, 115, 78, 179)),
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: to_do(),
        );
      },
    );
  }
}
