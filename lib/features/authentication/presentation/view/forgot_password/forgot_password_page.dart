import 'package:flutter/material.dart';
import 'package:test_boilerplate/app/common/extension/context_utils.dart';
import 'package:test_boilerplate/app/common/extension/extension.dart';
import 'package:test_boilerplate/features/authentication/presentation/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

import 'forgot_form_view.dart';
import 'success_request_view.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final TextEditingController emailController;
  String? emailError;
  String? successMessage;
  bool isLoading = false;
  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
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
                child: AnimatedContainer(
                  duration: 300.ms,
                  curve: Curves.easeInOut,
                  child: successMessage != null
                      ? SuccesRequest(
                          message: successMessage,
                          isLoading: isLoading,
                          onResend: () {
                            setState(() {
                              isLoading = true;
                            });
                            context.read<AuthViewmodel>().forgotPassword(
                                  email: emailController.text,
                                  onSuccess: (message) {
                                    setState(() {
                                      successMessage = message;
                                    });
                                  },
                                  onError: (p0) {
                                    context.ofScaffoldMessenger().showSnackBar(
                                          SnackBar(
                                            content: Text(p0.message),
                                          ),
                                        );
                                  },
                                );
                            setState(() {
                              isLoading = false;
                            });
                          },
                        )
                      : FormView(
                          emailController: emailController,
                          emailError: emailError,
                          isLoading: isLoading,
                          onSubmit: () {
                            setState(() {
                              isLoading = true;
                            });
                            context.read<AuthViewmodel>().forgotPassword(
                                  email: emailController.text.trim(),
                                  onSuccess: (message) {
                                    setState(() {
                                      successMessage = message;
                                    });
                                    setState(() {
                                      isLoading = false;
                                    });
                                  },
                                  onError: (p0) {
                                    context.ofScaffoldMessenger().showSnackBar(
                                          SnackBar(
                                            content: Text(p0.message),
                                          ),
                                        );
                                    setState(() {
                                      isLoading = false;
                                    });
                                  },
                                );
                          },
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
