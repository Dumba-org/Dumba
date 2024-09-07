import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/image_pick.dart';
import '../widgets/textfield_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _biocontroller = TextEditingController();
  Uint8List? _profileImage;
  bool _isloading = false;

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _usernamecontroller.dispose();
    _biocontroller.dispose();
    super.dispose();
  }

  //function to pick image
  void SeclecImage() async {
    Uint8List? image = await pickImage(ImageSource.gallery);
    setState(() {
      _profileImage = image;
    });
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
                //circle avatar image for profile
                Stack(
                  children: [
                    (_profileImage != null)
                        ? CircleAvatar(
                            radius: 50,
                            backgroundImage: MemoryImage(_profileImage!),
                          )
                        : const CircleAvatar(
                            radius: 50,
                            // backgroundImage: AssetImage(
                            //   'assets/profilepic.png',
                            // ),
                          ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          //  color: blueColor,
                        ),
                        child: IconButton(
                          onPressed: SeclecImage,
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                //textfield for username
                TextfieldInput(
                    label: 'Username',
                    textEditingController: _usernamecontroller,
                    hintText: 'Enter your username',
                    inputType: TextInputType.text),
                const SizedBox(height: 20),
                //textfield for bio
                TextfieldInput(
                    label: 'Bio',
                    textEditingController: _biocontroller,
                    hintText: 'Enter your bio',
                    inputType: TextInputType.text),
                const SizedBox(height: 20),
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
                //SignUP button
                const SizedBox(height: 20),
                InkWell(
                  //onTap: signUpUser,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      //    color: blueColor,
                    ),
                    child: (_isloading)
                        ? const Center(child: CircularProgressIndicator())
                        : const Text('sign up'),
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
                      const Text('Already have an account?'),
                      GestureDetector(
                        onTap: () {
                          //          Navigator.pushNamed(context, RoutesName.login);
                        },
                        child: const Text('Log in',
                            style: TextStyle(
                                //         color: blueColor, fontWeight: FontWeight.bold),
                                )),
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
