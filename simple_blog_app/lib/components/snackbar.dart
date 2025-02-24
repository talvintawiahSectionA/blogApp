import 'package:flutter/material.dart';

// To preview an error message as a snackbar
void previewError({required String message, required BuildContext context}) {
  if (!context.mounted) return;
  final snackBar = SnackBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    content: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red[300],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          message,
        ),
      ),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
// To preview a success message as a snack bar

void previewSuccess({required String message, required BuildContext context}) {
  if (!context.mounted) return;
  final snackBar = SnackBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    content: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.teal[300],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          message,
        ),
      ),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// Shadow for components
List<BoxShadow> shadow(BuildContext context) {
  return [
    BoxShadow(
      color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
      spreadRadius: 2,
      blurRadius: 7,
      offset: const Offset(0, 3),
    ),
  ];
}
