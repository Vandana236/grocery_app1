import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  @required
  final bool loadingState;
  final bool disabledState;

  BottomButton(
      {Key key,
        this.child,
        this.loadingState,
        this.disabledState,
        this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        child: !loadingState
            ? child
            : SizedBox(
          height: 20.0,
          width: 20.0,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor),
          ),
        ),
        onPressed: loadingState || disabledState ? null : onPressed,
      ),
    );
  }
}
