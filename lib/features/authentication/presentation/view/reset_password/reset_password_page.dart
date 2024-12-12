import 'package:flutter/material.dart';
import 'package:test_boilerplate/app/common/extension/extension.dart';
import 'package:test_boilerplate/features/authentication/presentation/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

import 'form_view.dart';
import 'success_view.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({
    super.key,
    required this.accessToken,
    this.refreshToken,
  });
  final String? accessToken;
  final String? refreshToken;

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController newPasswordController;
  late final TextEditingController retypeNewpasswordController;
  String? passwordError;
  bool isSuccessResettingPassword = false;
  bool isLoading = false;

  @override
  void initState() {
    newPasswordController = TextEditingController();
    retypeNewpasswordController = TextEditingController();
    newPasswordController.addListener(controllerListener);
    retypeNewpasswordController.addListener(controllerListener);
    super.initState();
  }

  controllerListener() {
    if (newPasswordController.text.length < 8) {
      setState(() {
        passwordError = "Password minimal 8 karakter";
      });
    } else {
      final isValid = newPasswordController.text == retypeNewpasswordController.text;
      if (!isValid) {
        setState(() {
          passwordError = "Password tidak sama";
        });
      } else {
        setState(() {
          passwordError = null;
        });
      }
    }
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    retypeNewpasswordController.dispose();
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
                  child: isSuccessResettingPassword
                      ? const SuccessView()
                      : ResetFormView(
                          formKey: formKey,
                          newPasswordController: newPasswordController,
                          passwordError: passwordError,
                          retypeNewpasswordController: retypeNewpasswordController,
                          isLoading: isLoading,
                          onSubmit: () {
                            setState(() {
                              isLoading = true;
                            });
                            if (passwordError == null) {
                              context.read<AuthViewmodel>().resetPassword(widget.accessToken!.replaceAll("%5C", ""),
                                  widget.refreshToken!.replaceAll("%5C", ""), newPasswordController.text, (message) {
                                setState(() {
                                  isSuccessResettingPassword = true;
                                });
                                setState(() {
                                  isLoading = false;
                                });
                              }, (failure) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(failure.message),
                                  ),
                                );
                                setState(() {
                                  isLoading = false;
                                });
                              });
                            }
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
