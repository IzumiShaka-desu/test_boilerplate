import 'package:flutter/material.dart';
import 'package:test_boilerplate/app/common/extension/extension.dart';

import '../../themes/color_pallete.dart';
import '../../themes/spacing.dart';
import '../../themes/typography.dart';

class DefaultTextField extends StatefulWidget {
  const DefaultTextField({
    super.key,
    required this.controller,
    this.validator,
    this.isRequired = false,
    this.fieldname = "Field",
    this.errorMessage,
    this.inputType = TextInputType.text,
    this.defaultErrorMessage,
    this.onValidationStatusChanged,
    this.showInitialError = false,
    this.isReadOnly = false,
    this.hintText,
  });

  final TextEditingController controller;
  final bool isRequired;
  final String? fieldname;
  final String? hintText;
  final bool Function(String val)? validator;
  final TextInputType inputType;
  final String? defaultErrorMessage;
  final String? errorMessage;
  final Function(bool)? onValidationStatusChanged;
  final bool showInitialError;
  final bool isReadOnly;

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  late final TextEditingController controller;
  bool isVisible = true;
  String? errorMessage;
  @override
  void initState() {
    controller = widget.controller;
    controller.addListener(controllerListener);
    if (widget.inputType == TextInputType.visiblePassword) {
      isVisible = false;
    }
    if (widget.showInitialError) {
      Future.delayed(5.ms, () {
        controllerListener();
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    //remove listener
    controller.removeListener(controllerListener);
    super.dispose();
  }

  void controllerListener() {
    if (controller.text.isEmpty && widget.isRequired) {
      widget.onValidationStatusChanged?.call(false);
      setState(() {
        errorMessage = "${widget.fieldname} tidak boleh kosong";
      });
    } else {
      final isValid = widget.validator?.call(controller.text) ?? true;
      widget.onValidationStatusChanged?.call(isValid);
      if (!isValid) {
        setState(() {
          errorMessage = widget.defaultErrorMessage ?? "${widget.fieldname} tidak valid";
        });
      } else {
        widget.onValidationStatusChanged?.call(true);
        setState(() {
          errorMessage = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: !isVisible,
      keyboardType: widget.inputType,
      readOnly: widget.isReadOnly,
      decoration: InputDecoration(
        filled: true,
        hintText: widget.hintText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        error: errorMessage == null && widget.errorMessage == null
            ? null
            : Transform.translate(
                offset: const Offset(-16, 0),
                child: Row(
                  children: [
                    Icon(
                      Icons.error,
                      color: TextPallete.danger.color,
                      size: 14,
                    ),
                    Spacing.xxs,
                    Text(
                      widget.errorMessage ?? errorMessage!,
                      style: DefaultTypography.formError,
                    ),
                  ],
                ),
              ),
        suffixIcon: widget.inputType == TextInputType.visiblePassword
            ? InkWell(
                child: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  color: ColorPallete.disabled.color,
                ),
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
              )
            : null,
        fillColor: const Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
