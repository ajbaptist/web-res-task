import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:task/src/bloc/login_bloc/login_bloc.dart';
import 'package:task/src/presentation/widgets/side_container.dart';
import 'package:task/src/presentation/widgets/text_field_widget.dart';
import 'package:task/src/utils/responsive.dart';
import 'package:task/src/utils/styles.dart';
import 'package:task/src/utils/web_responsive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var mailController = TextEditingController(text: 'eve.holt@reqres.in');
  var passwordControoler = TextEditingController(text: 'cityslicka');
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => LoginBloc(),
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
                            'Hello Again',
                            style: Styles.styleBlack
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Gap(15),
                          Text('Welcome Back !', style: Styles.styleBlack),
                          const Gap(15),
                          TextFieldWidget(
                            hint: 'Email Address',
                            icon: Icons.email_sharp,
                            controller: mailController,
                          ),
                          TextFieldWidget(
                            hint: 'Password',
                            icon: Icons.remove_red_eye,
                            controller: passwordControoler,
                          ),
                          const Gap(10),
                          SizedBox(
                            width: double.infinity,
                            height: 50.spMin,
                            child: BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                                if (state is LoginLoading) {
                                  return Transform.scale(
                                      scale: 0.5,
                                      child: const Center(
                                          child: CircularProgressIndicator()));
                                } else {
                                  return ElevatedButton(
                                    onPressed: () {
                                      if (formkey.currentState!.validate()) {
                                        // If the form is valid, display a snackbar. In the real world,
                                        // you'd often call a server or save the information in a database.
                                        context.read<LoginBloc>().add(
                                            TriggerLoginEvent(
                                                mailController.text,
                                                passwordControoler.text));
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
                          ),
                          const Gap(10),
                          Center(
                              child: Text('Forget Password',
                                  style: Styles.styleBlack.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500))),
                        ],
                      ),
                    ),
                  ),
                ))),
      ),
    );
  }
}
