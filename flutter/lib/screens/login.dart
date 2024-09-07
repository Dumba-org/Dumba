import 'package:flutter/material.dart';

import '../widgets/textfield_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool _isloading = false;

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(),
                  flex: 2,
                  fit: FlexFit.loose,
                ),
                //svg image
                // SvgPicture.asset(
                //   'assets/ic_instagram.svg',
                //   colorFilter:
                //       const ColorFilter.mode(primaryColor, BlendMode.srcIn),
                //   height: 100,
                // ),
                const SizedBox(height: 60),
                //textfield for email
                TextfieldInput(
                    label: 'Email',
                    textEditingController: _emailcontroller,
                    hintText: 'Enter your email',
                    inputType: TextInputType.emailAddress),
                const SizedBox(height: 20),
                //textfield for password
                TextfieldInput(
                    label: 'Password',
                    textEditingController: _passwordcontroller,
                    hintText: 'Enter your password',
                    inputType: TextInputType.visiblePassword,
                    isPass: true),
                //login button
                const SizedBox(height: 20),
                InkWell(
                  // onTap: loginUser,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      // color: blueColor,
                    ),
                    child: (_isloading)
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : const Text('log in'),
                  ),
                ),
                const SizedBox(height: 12),

                Flexible(
                  child: Container(),
                  flex: 2,
                  fit: FlexFit.loose,
                ),
                //transition for sign up
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      GestureDetector(
                        onTap: () {
                          //   Navigator.pushNamed(context, RoutesName.signup);
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                              //    color: blueColor, fontWeight: FontWeight.bold,
                              ),
                        ),
                      )
                    ],
                  ),
                ),

                //forgot password
              ],
            ),
          ),
        ),
      ),
    );
  }
}
