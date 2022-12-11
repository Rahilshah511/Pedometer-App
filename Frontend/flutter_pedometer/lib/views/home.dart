import 'package:flutter/material.dart';
import 'package:flutter_pedometer/constants/txt_decoration.dart';
import 'package:flutter_pedometer/widgets/bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _status;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _status = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 200),
    );
    _status.repeat(reverse: true);
    _opacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _status,
      curve: Curves.fastOutSlowIn,
    ));
  }

  @override
  void dispose() {
    _status.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const SizedBox(
          height: 80,
          child: Center(child: BottomNav(index: 0)),
        ),
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
              AnimatedBuilder(
                  animation: _status.view,
                  builder: (context, _) {
                    return Opacity(
                      opacity: _opacity.value,
                      child: Text(
                        "(walking)",
                        style: TxtDecoration.textTheme.bodyText2,
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
