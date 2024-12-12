import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcons extends StatelessWidget {
  final String path;
  final double? size;
  final Color? color;

  const SvgIcons._({
    required this.path,
    required this.size,
    this.color,
  });

  factory SvgIcons.onDelivery({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/on_delivery.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.warningcircle({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/WarningCircle.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.processedTask({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/processed_task.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.filterSlider({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/filter_slider.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.yellowBox({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/yellow_box.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.approve({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/Approve.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.greenBox({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/green_box.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.closeCircle({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/close_circle.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.availableTask({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/available_task.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.ionSuccess({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/ion_success.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.warehouseLogo({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/warehouse_logo.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.noItem({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/no_item.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.blueBox({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/blue_box.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.box({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/box.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.finishedTask({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/finished_task.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.ionQuestMark({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/ion_quest_mark.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.returnAvailable({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/return_available.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.warehouse({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/Warehouse.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.ionWarning({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/ion_warning.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.returnComplete({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/return_complete.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.retur({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/retur.svg',
      size: size,
      color: color,
    );
  }

  factory SvgIcons.basket({double? size, Color? color}) {
    return SvgIcons._(
      path: './assets/svg/basket.svg',
      size: size,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: size,
      colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
