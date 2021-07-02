import 'package:ecommerce/screens/screens.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(
        color: Colors.black,
        child: FittedBox(
          child: Text(
            title ?? 'Unknown AppBar',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
      actions: [
        IconButton(
          color: Colors.black,
          icon: Icon(Icons.favorite),
          onPressed: () {
            Navigator.pushNamed(context, WishlistScreen.routeName);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
