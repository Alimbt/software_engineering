import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isLoginMode = false;

  Future<void> _registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    final name = _nameController.text;
    final phone = _phoneController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      // ثبت‌نام کاربر
      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        data: {'name': name, 'phone': phone},
      );

      // مطمئن میشویم
      final user = response.user;
      if (user == null) {
        throw Exception('Failed to sign up user');
      }

      // ذخیره اطلاعات
      await Supabase.instance.client.from('customer_information').insert({
        'user_id': user.id, // استفاده از user.id بعد از احراز هویت
        'name': name,
        'phone': phone,
        'email': email,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ثبت‌نام با موفقیت انجام شد')),
      );


      Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطایی رخ داد: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _loginUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      // ورود کاربر
      await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ورود موفق')),
      );

      // انتقال به HomeScreen
      Navigator.pushReplacementNamed(context, '/');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطا در ورود: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar( backgroundColor: Colors.green.shade500,title: Text(_isLoginMode ? 'ورود' : 'ثبت‌نام')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green.shade600,
            shape: BoxShape.rectangle,
            boxShadow: const [
              BoxShadow(
                color: Colors.white24,
                spreadRadius: 4,
                blurRadius: 8,
                offset: Offset(0, 0),
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
               textFields(),
                const SizedBox(height: 20),
                _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: _isLoginMode ? _loginUser : _registerUser,
                  child: Text(_isLoginMode ? 'ورود' : 'ثبت‌نام',style: const TextStyle(color: Colors.black54),),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isLoginMode = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !_isLoginMode ? Colors.black54 : Colors.white,
                      ),
                      child: Text('ثبت‌نام',style: TextStyle(color: !_isLoginMode ? Colors.white : Colors.black54),),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isLoginMode = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isLoginMode ? Colors.black54 : Colors.white,
                      ),
                      child: Text('ورود',style: TextStyle(color: _isLoginMode ? Colors.white : Colors.black54),),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget textFields() {
    return Column(
      children: [
        const SizedBox(height: 20,),
        if (!_isLoginMode)
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white54,
              shape: BoxShape.rectangle,
              boxShadow: const [
                BoxShadow(
                  color: Colors.white24,
                  spreadRadius: 4,
                  blurRadius: 8,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.06,
            child: TextFormField(

              controller: _nameController,
              decoration:InputDecoration(labelText: 'نام',labelStyle: TextStyle(color: Colors.black54),),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'لطفاً نام را وارد کنید';
                }
                return null;
              },
            ),
          ),
        const SizedBox(height: 20,),
        if (!_isLoginMode)

        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white54,
              shape: BoxShape.rectangle,
              boxShadow: const [
                BoxShadow(
                  color: Colors.white24,
                  spreadRadius: 4,
                  blurRadius: 8,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.06,
            child: TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'شماره تلفن',labelStyle: TextStyle(color: Colors.black54),),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'لطفاً شماره تلفن را وارد کنید';
                }
                if (!RegExp(r'^09[0-9]{9}$').hasMatch(value)) {
                  return 'شماره تلفن معتبر نیست';
                }
                return null;
              },
            ),
          ),
        const SizedBox(height: 20,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white54,
            shape: BoxShape.rectangle,
            boxShadow: const [
              BoxShadow(
                color: Colors.white24,
                spreadRadius: 4,
                blurRadius: 8,
                offset: Offset(0, 0),
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.06,
          child: TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'ایمیل',labelStyle: TextStyle(color: Colors.black54),),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'لطفاً ایمیل را وارد کنید';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'ایمیل معتبر نیست';
              }
              return null;
            },
          ),
        ),
        const SizedBox(height: 20,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white54,
            shape: BoxShape.rectangle,
            boxShadow: const [
              BoxShadow(
                color: Colors.white24,
                spreadRadius: 4,
                blurRadius: 8,
                offset: Offset(0, 0),
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.06,
          child: TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'رمز عبور',labelStyle: TextStyle(color: Colors.black54),),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'لطفاً رمز عبور را وارد کنید';
              }
              if (value.length < 6) {
                return 'رمز عبور باید حداقل 6 کاراکتر باشد';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }

}