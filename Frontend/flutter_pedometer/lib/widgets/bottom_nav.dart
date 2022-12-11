import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final int index;
  const BottomNav({Key? key, required this.index}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _opacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.forward());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<String> _white = [
    "assets/icons/home(1).png",
    "assets/icons/activity(1).png",
    "assets/icons/calendar(1).png",
  ];
  final List<String> _black = [
    "assets/icons/home.png",
    "assets/icons/activity.png",
    "assets/icons/calendar.png",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: 3,
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 24,
          );
        },
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return index != widget.index
              ? Container(
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  child: Image.asset(
                    _black[index],
                    width: 25,
                  ),
                )
              : AnimatedBuilder(
                  animation: _controller.view,
                  builder: (context, _) {
                    return Opacity(
                      opacity: _opacity.value,
                      child: Container(
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          _white[index],
                          width: 25,
                        ),
                      ),
                    );
                  });
        });
  }
}
