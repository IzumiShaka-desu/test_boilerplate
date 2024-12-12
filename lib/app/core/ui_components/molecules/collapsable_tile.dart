import 'package:flutter/material.dart';
import 'package:test_boilerplate/app/core/ui_components/themes/color_pallete.dart';
import 'package:test_boilerplate/app/core/ui_components/themes/typography.dart';

class CollapsableTile extends StatefulWidget {
  const CollapsableTile({
    super.key,
    required this.title,
    this.collapsedTitle = "",
    required this.children,
  });
  final Widget title;
  final String collapsedTitle;
  final List<Widget> children;

  @override
  State<CollapsableTile> createState() => _CollapsableTileState();
}

class _CollapsableTileState extends State<CollapsableTile> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: widget.title,
      shape: const RoundedRectangleBorder(),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Lihat Detail",
            style: DefaultTypography.formLabel.copyWith(
              color: ColorPallete.primaryBlue.color,
              fontSize: 12,
            ),
          ),
          Transform.rotate(
            angle: isExpanded ? 3.14 / 2 : -3.14 / 2,
            child: Icon(
              Icons.chevron_left_outlined,
              color: ColorPallete.primaryBlue.color,
            ),
          ),
        ],
      ),
      onExpansionChanged: (value) {
        setState(() {
          isExpanded = value;
        });
      },
      children: widget.children,
    );
  }
}
