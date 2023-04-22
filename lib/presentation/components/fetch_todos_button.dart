
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowunity/l10n/localization.dart';

class FetchTodosButton extends StatelessWidget {
  final bool isLoading;
  final bool hasError;
  final void Function()? onTap;

  const FetchTodosButton({
    super.key,
    required this.isLoading,
    required this.hasError,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CupertinoActivityIndicator();
    } else if (hasError) {
      return IconButton(
        onPressed: onTap,
        tooltip: context.localizations.fetchTodos,
        icon: const Icon(CupertinoIcons.cloud_download),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
