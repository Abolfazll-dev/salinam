import 'package:flutter/material.dart';

class FadeEndListView extends StatelessWidget {
  const FadeEndListView(
    {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      height: 150,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: const [0.0, 1.0],
            colors: [
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
              Theme.of(context).scaffoldBackgroundColor,
            ],
          ),
        ),
      ),
    );
  }
}
class FadeStartListView extends StatelessWidget {
  const FadeStartListView(
    {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: 150,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 1.0],
            colors: [
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
              Theme.of(context).scaffoldBackgroundColor,
            ],
          ),
        ),
      ),
    );
  }
}