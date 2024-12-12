import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_boilerplate/app/common/extension/context_utils.dart';
import 'package:test_boilerplate/app/common/extension/extension.dart';
import 'package:test_boilerplate/app/core/ui_components/atoms/buttons/buttons.dart';
import 'package:test_boilerplate/app/core/ui_components/atoms/icons/svg_icons.dart';
import 'package:test_boilerplate/features/authentication/router/router.dart';
import 'package:provider/provider.dart';

import '../viewmodel/auth_viewmodel.dart';
import '../../../../app/core/ui_components/themes/spacing.dart';
import '../../../../app/core/ui_components/themes/typography.dart';
import '../../../../app/core/ui_components/atoms/forms/default_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  String? emailError;
  String? passwordError;
  bool isLoading = false;
  bool get isFormEmpty => emailController.text.isEmpty || passwordController.text.isEmpty;
  bool get isLoginButtonDisabled => isFormEmpty || isLoading;

  @override
  void initState() {
    emailController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    passwordController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFCFCFC),
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login-bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFCFCFC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 113,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgIcons.warehouseLogo(
                                size: 48,
                              ),
                              Spacing.m,
                              const Text(
                                'Login Gudang',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF0A0A0A),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacing.huge,
                        Form(
                          key: formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Email",
                                    style: DefaultTypography.formLabel,
                                  ),
                                ],
                              ),
                              Spacing.xs,
                              DefaultTextField(
                                controller: emailController,
                                fieldname: "Email",
                                hintText: "Email",
                                errorMessage: emailError,
                              ),
                              Spacing.m,
                              Row(
                                children: [
                                  Text(
                                    "Password",
                                    style: DefaultTypography.formLabel,
                                  ),
                                ],
                              ),
                              Spacing.s,
                              DefaultTextField(
                                controller: passwordController,
                                fieldname: "Password",
                                hintText: "Password",
                                inputType: TextInputType.visiblePassword,
                                errorMessage: passwordError,
                              ),
                            ],
                          ),
                        ),
                        Spacing.m,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              child: Text(
                                "Lupa Password?",
                                style: DefaultTypography.link,
                              ),
                              onTap: () {
                                context.push(RouteConfig.forgotPassword);
                              },
                            ),
                          ],
                        ),
                        Spacing.huge,
                        Row(
                          children: [
                            Expanded(
                              child: AnimatedContainer(
                                duration: 300.ms,
                                child: Buttons.primary(
                                  text: isLoading ? "Memproses..." : "Login",
                                  isDisabled: isLoginButtonDisabled,
                                  onPressed: () async {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    await context.read<AuthViewmodel>().login(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          onError: (failure) {
                                            final messages = failure.message.split(",");
                                            debugPrint("messages $messages");
                                            for (final message in messages) {
                                              if (message.toLowerCase().contains("email")) {
                                                emailError = message;
                                              } else {
                                                emailError = null;
                                              }
                                              if (message.toLowerCase().contains("password")) {
                                                passwordError = message;
                                              } else {
                                                passwordError = null;
                                              }
                                              if (message.isNotEmpty) {
                                                context.ofScaffoldMessenger().showSnackBar(
                                                      SnackBar(
                                                        content: Text(message),
                                                      ),
                                                    );
                                              }
                                            }
                                            debugPrint(
                                              "emailError $emailError, passwordError $passwordError",
                                            );
                                            setState(() {});
                                          },
                                          onSuccess: (p0) {
                                            context.ofScaffoldMessenger().showSnackBar(
                                                  SnackBar(
                                                    content: Text(p0),
                                                  ),
                                                );
                                          },
                                        );
                                    setState(() {
                                      isLoading = false;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
