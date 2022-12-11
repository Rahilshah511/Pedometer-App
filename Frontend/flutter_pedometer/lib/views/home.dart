import 'package:flutter/material.dart';
import 'package:flutter_pedometer/constants/txt_decoration.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Steps",
                style: TxtDecoration.textTheme.headline3,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "99",
                style: TxtDecoration.textTheme.headline2,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                "Pedestrian status:",
                style: TxtDecoration.textTheme.bodyText1,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "(walking)",
                style: TxtDecoration.textTheme.bodyText2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
