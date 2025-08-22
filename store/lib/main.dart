import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // استيراد شاشة تسجيل الدخول من مجلد screens

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق تسجيل الدخول', // يمكنك تغيير العنوان
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        // جرب لونًا مختلفًا
        useMaterial3: true,
        // يمكنك تخصيص سمات أخرى هنا، مثل:
        // appBarTheme: AppBarTheme(
        //   backgroundColor: Colors.teal,
        //   foregroundColor: Colors.white,
        // ),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: Colors.teal,
        //     foregroundColor: Colors.white,
        //   ),
        // ),
        // inputDecorationTheme: InputDecorationTheme(
        //   border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(8.0),
        //   ),
        // ),
      ),
      home: const LoginScreen(), // ابدأ بشاشة تسجيل الدخول
      debugShowCheckedModeBanner: false, // لإخفاء شارة Debug في وضع التطوير
      // يمكنك إضافة مسارات (routes) هنا إذا كنت تفضل ذلك على MaterialPageRoute المباشر
      // routes: {
      //   '/createAccount': (context) => const CreateAccountScreen(),
      //   '/forgotPassword': (context) => const ForgotPasswordScreen(),
      //   //  '/home': (context) => const HomeScreen(), // شاشتك الرئيسية بعد تسجيل الدخول
      // },
    );
  }
}
