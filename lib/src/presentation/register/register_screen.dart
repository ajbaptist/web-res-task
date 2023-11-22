import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:task/src/bloc/register_bloc/register_bloc.dart';
import 'package:task/src/presentation/login/login_screen.dart';
import 'package:task/src/presentation/widgets/side_container.dart';
import 'package:task/src/presentation/widgets/text_field_widget.dart';
import 'package:task/src/utils/responsive.dart';
import 'package:task/src/utils/styles.dart';
import 'package:task/src/utils/web_responsive.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var mailController = TextEditingController(text: 'eve.holt@reqres.in');
  var passwordController = TextEditingController(text: 'pistol');
  var nameController = TextEditingController(text: 'dummy name');
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const LoginScreen(),
              ),
            );
          }
        },
        child: Scaffold(
          body: Responsive(
              desktop: WebResponsive(
                  sideChild: SideContainer(width: width),
                  child: SizedBox(
                    width: width * 0.35,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: Form(
                        key: formkey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sign Up',
                              style: Styles.styleBlack
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const Gap(15),
                            const Text('Sign Up to Get Started'),
                            const Gap(15),
                            TextFieldWidget(
                              hint: 'Full Name',
                              icon: Icons.person,
                              controller: nameController,
                            ),
                            TextFieldWidget(
                              hint: 'Email Address',
                              icon: Icons.email_sharp,
                              controller: mailController,
                            ),
                            TextFieldWidget(
                              hint: 'Password',
                              icon: Icons.remove_red_eye,
                              controller: passwordController,
                            ),
                            const Gap(10),
                            SizedBox(
                              width: double.infinity,
                              height: 50.spMin,
                              child: BlocBuilder<RegisterBloc, RegisterState>(
                                builder: (context, state) {
                                  if (state is RegisterLoading) {
                                    return Transform.scale(
                                        scale: 0.5,
                                        child: const Center(
                                            child:
                                                CircularProgressIndicator()));
                                  } else {
                                    return ElevatedButton(
                                      onPressed: () {
                                        if (formkey.currentState!.validate()) {
                                          // If the form is valid, display a snackbar. In the real world,
                                          // you'd often call a server or save the information in a database.
                                          context.read<RegisterBloc>().add(
                                              TriggerSignupEvent(
                                                  mailController.text,
                                                  passwordController.text));
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Styles.bgColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                      ),
                                      child: const Text("Register"),
                                    );
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ))),
        ),
      ),
    );
  }
}
