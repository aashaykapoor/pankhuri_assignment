import 'package:flutter/material.dart';
import 'package:pankhuri/strings.dart';

class CompletedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.white,
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(AppStrings.showCompletedMessage)),
        ),
      ),
    );
  }
}
