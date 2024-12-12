import 'package:flutter/material.dart';

import '../../themes/color_pallete.dart';
import '../../themes/typography.dart';

class CustomDropdownButton extends StatefulWidget {
  final String? value;
  final ValueChanged<String?>? onChanged;
  final List<String?> items;
  final String labelOnNull;

  const CustomDropdownButton({
    super.key,
    required this.value,
    required this.onChanged,
    required this.items,
    required this.labelOnNull,
  });

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String?>(
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        fillColor: const Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
      ),
      value: widget.value,
      onChanged: widget.onChanged == null
          ? null
          : (String? newValue) {
              widget.onChanged?.call(newValue);
            },
      items: widget.items.map<DropdownMenuItem<String?>>((String? value) {
        return DropdownMenuItem<String?>(
          value: value,
          child: Text(
            value ?? widget.labelOnNull,
            style: DefaultTypography.bodyContent.copyWith(
              color: value == null ? ColorPallete.ash.color : null,
            ),
          ),
        );
      }).toList(),
    );
  }
}
