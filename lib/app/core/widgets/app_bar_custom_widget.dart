import 'package:app_random_numbers/app/core/mixins/screen_utility_mixin.dart';
import 'package:app_random_numbers/app/ui/login/pages/app_dialog.dart';
import 'package:flutter/material.dart';

class AppBarCustomWidget extends StatefulWidget implements PreferredSizeWidget {
  final void Function()? onTap;
  final int countNotificationNew;
  final bool hasNotification;

  const AppBarCustomWidget({
    super.key,
    required this.onTap,
    this.countNotificationNew = 0,
    this.hasNotification = false,
  });

  @override
  State<AppBarCustomWidget> createState() => _AppBarCustomWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _AppBarCustomWidgetState extends State<AppBarCustomWidget>
    with ScreenUtilityMixin {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: setHeight(80),
      title: Center(
        child: Padding(
          padding: EdgeInsets.only(left: setWidth(110)),
          child: Text(
            'Home',
            style: TextStyle(
              fontSize: setFontSize(24),
            ),
          ),
        ),
      ),
      actions: [
        if (!widget.hasNotification) SizedBox(width: setWidth(60)),
        Offstage(
          offstage: !widget.hasNotification,
          child: Stack(
            children: [
              IconButton(
                key: const Key('button_appbar_notification'),
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              if (widget.countNotificationNew > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(setRadius(10)),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      widget.countNotificationNew.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ),
        IconButton(
          key: const Key('button_appbar_logout'),
          icon: const Icon(
            Icons.logout,
            color: Colors.black,
          ),
          onPressed: () {
            AppMessageCustom().confirmation(context, 'Você deseja sair mesmo?',
                () {
              widget.onTap!();
            });
          },
        ),
      ],
    );
  }
}
