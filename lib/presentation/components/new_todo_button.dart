import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowunity/l10n/localization.dart';

class NewTodoButton extends StatelessWidget {
  final void Function()? onTap;
  final ScrollController scrollController;

  const NewTodoButton({
    super.key,
    this.onTap,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: ColoredBox(
          color: Colors.white.withOpacity(.7),
          child: Column(
            children: [
              AnimatedBuilder(
                animation: scrollController,
                child: Container(
                  height: 0.5,
                  color: CupertinoColors.systemGrey,
                ),
                builder: (context, child) {
                  double opacity = 0;
                  try {
                    final extentAfter = scrollController.position.extentAfter;
                    opacity = extentAfter == 0 ? 0 : 1;
                  } catch (_) {}
                  return Opacity(
                    opacity: opacity,
                    child: child,
                  );
                },
              ),
              SafeArea(
                top: false,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CupertinoButton(
                    onPressed: onTap,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          CupertinoIcons.add_circled_solid,
                          color: CupertinoColors.activeOrange,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          context.localizations.newTodo,
                          style: const TextStyle(
                            color: CupertinoColors.activeOrange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
