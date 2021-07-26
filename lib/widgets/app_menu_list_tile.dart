import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppMenuListTile extends StatelessWidget {
  const AppMenuListTile({
    Key key,
    this.label,
    this.leadingIconUrl,
    this.onPressed,
  }) : super(key: key);

  @required final Function onPressed;
  @required final String label;
  @required final String leadingIconUrl;

  @override
  Widget build(BuildContext context) {
    // text theme
    TextTheme textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(elevation: 0),
      onPressed: () => onPressed(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              leadingIconUrl,
              height: 24,
              color: Colors.white,
            ),
            SizedBox(width: 16),
            Text(
              label,
              style: textTheme.subtitle1.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
