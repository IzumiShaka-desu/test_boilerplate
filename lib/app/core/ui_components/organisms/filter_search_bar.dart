import 'package:flutter/material.dart';

import '../../entities/sort_by.dart';
import '../atoms/icons/iconsax.dart';
import '../atoms/icons/svg_icons.dart';
import '../themes/color_pallete.dart';
import '../themes/spacing.dart';

class FilterSearchBar extends StatelessWidget {
  const FilterSearchBar({
    super.key,
    this.onChanged,
    this.onSortByChanged,
  });

  final void Function(String?)? onChanged;
  final void Function(SortBy)? onSortByChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: ColorPallete.ash.color,
                    width: 1,
                  ),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Cari toko..",
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 14.0,
                    ),
                    prefixIcon: Icon(
                      Iconsax.searchNormal1,
                      color: ColorPallete.ash.color,
                      size: 16,
                    ),
                    hintStyle: TextStyle(
                      color: ColorPallete.ash.color,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: onChanged,
                ),
              ),
            ),
          ),
          Spacing.l,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: PopupMenuButton<SortBy>(
              surfaceTintColor: ColorPallete.whiteSwan.color,
              position: PopupMenuPosition.under,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: ColorPallete.ash.color,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: SvgIcons.filterSlider(),
              ),
              onSelected: (value) {},
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: SortBy.newest,
                    child: Text("Terbaru"),
                  ),
                  const PopupMenuItem(
                    value: SortBy.oldest,
                    child: Text("Terlama"),
                  ),
                ];
              },
            ),
          ),
        ],
      ),
    );
  }
}
