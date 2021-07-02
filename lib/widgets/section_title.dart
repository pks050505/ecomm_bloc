import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String? title;
  const SectionTitle({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title ?? 'SECTION TITLE',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
