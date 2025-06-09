import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'page_router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // مقداردهی اولیه Supabase
  await Supabase.initialize(
    url: 'https://bighumjwtpyltlwjmves.supabase.co', // از داشبورد Supabase کپی کن
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpZ2h1bWp3dHB5bHRsd2ptdmVzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU4MjkzNDIsImV4cCI6MjA2MTQwNTM0Mn0.-GhHGyTsmGijpjHWmi4AWe7BHi1kaLRGSkoMRuYzkec', // از داشبورد Supabase کپی کن
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'وبسایت شخصی',
      theme: ThemeData(
        primarySwatch: Colors.green
        // fontFamily: 'Vazir', // اگر فونت فارسی دارید
      ),
      initialRoute: '/',
      onGenerateRoute: PageRouter.generateRoute,
    );
  }


}