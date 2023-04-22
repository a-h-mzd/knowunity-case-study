import 'package:flutter/material.dart';
import 'package:knowunity/l10n/localization.dart';

class GestureSliverFillRemaining extends StatelessWidget {
  final void Function()? onTap;
  final bool isLoading;
  final bool hasTodos;

  const GestureSliverFillRemaining({
    super.key,
    this.onTap,
    required this.isLoading,
    required this.hasTodos,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      fillOverscroll: true,
      child: IgnorePointer(
        ignoring: onTap == null,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: hasTodos
              ? null
              : Align(
                  alignment: const Alignment(0, -.3),
                  child: Text(
                    isLoading
                        ? context.localizations.loadingTodos
                        : context.localizations.noTodos,
                  ),
                ),
        ),
      ),
    );
  }
}
