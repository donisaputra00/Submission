import 'package:flutter/material.dart';
import 'package:submission/preferences/preferences.dart';
import 'package:submission/sections/sections.dart';
import 'package:submission/views/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController(text: '');
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetPath.illLogin,
                width: Dimens.height(context) / 2,
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome Back!',
                style: AppTexStyle.title,
              ),
              const SizedBox(height: 20),
              const Text(
                'Hi, Please input your name to continue battle',
                style: AppTexStyle.desc,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 263,
                child: TextFormField(
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                  ),
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Your Name',
                    hintStyle: AppTexStyle.textInput,
                  ),
                ),
              ),
              (isError) ? Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Cannot be empty, Please input text!!!',
                  style: AppTexStyle.desc.copyWith(
                    color: Colors.red,
                    fontSize: 10,
                  ),
                ),
              ) : const SizedBox(),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Let’s Combat!',
                style: AppTexStyle.button.copyWith(color: AppColors.lightColor),
                bgColor: AppColors.primaryColor,
                onTap: () {
                  if (_controller.text != '') {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(name: _controller.text),
                      ),
                      (route) => false,
                    );
                  } else {
                    setState(() {
                      isError = true;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
