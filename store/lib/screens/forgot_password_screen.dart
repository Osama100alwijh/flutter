import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      // منطق إرسال رابط إعادة تعيين كلمة المرور هنا
      String email = _emailController.text;
      print('Reset password for email: $email'); // لغرض الاختبار
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(
            'تم إرسال تعليمات إعادة تعيين كلمة المرور إلى بريدك الإلكتروني.')),
      );
      // يمكنك إضافة تأخير ثم العودة إلى شاشة تسجيل الدخول
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) { // تحقق أن الـ widget ما زال في الشجرة
          Navigator.pop(context);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إعادة تعيين كلمة المرور'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'أدخل عنوان بريدك الإلكتروني المسجل لإعادة تعيين كلمة المرور.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'البريد الإلكتروني',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال بريدك الإلكتروني';
                  }
                  if (!value.contains('@') || !value.contains('.')) {
                    return 'الرجاء إدخال بريد إلكتروني صالح';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _resetPassword,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('إرسال رابط إعادة التعيين'),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.pop(
                      context); // العودة إلى الشاشة السابقة (يفترض أنها تسجيل الدخول)
                },
                child: const Text('العودة إلى تسجيل الدخول'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}