import 'package:flutter/material.dart';
import 'package:weeddao/colors/colours_list.dart';
import 'package:weeddao/utils/arrow_clipper.dart';

class SimpleAccountMenu extends StatefulWidget {
  final List<Icon> icons;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color iconColor;
  final ValueChanged<int> onChange;

  const SimpleAccountMenu({
    Key? key,
    required this.icons,
    this.borderRadius,
    this.backgroundColor = const Color(0xfff67c0b9),
    this.iconColor = Colors.black,
    required this.onChange,
  }) : super(key: key);
  @override
  SimpleAccountMenuState createState() => SimpleAccountMenuState();
}

class SimpleAccountMenuState extends State<SimpleAccountMenu>
    with SingleTickerProviderStateMixin {
  GlobalKey? _key;
  bool isMenuOpen = false;
  late Offset buttonPosition;
  late Size buttonSize;
  late OverlayEntry _overlayEntry;
  late BorderRadius _borderRadius;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _borderRadius = widget.borderRadius ?? BorderRadius.circular(4);
    _key = LabeledGlobalKey("button_icon");
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  findButton() {
    RenderBox? renderBox =
        _key?.currentContext?.findRenderObject() as RenderBox?;
    buttonSize = renderBox!.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  void closeMenu() {
    _overlayEntry.remove();
    _animationController.reverse();
    isMenuOpen = !isMenuOpen;
  }

  void openMenu() {
    findButton();
    _animationController.forward();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context)!.insert(_overlayEntry);
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      decoration: BoxDecoration(
        color: const Color(0xfff5c6373),
        borderRadius: _borderRadius,
      ),
      child: IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animationController,
        ),
        color: Colors.white,
        onPressed: () {
          if (isMenuOpen) {
            closeMenu();
          } else {
            openMenu();
          }
        },
      ),
    );
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: buttonPosition.dy + buttonSize.height,
          left: buttonPosition.dx,
          width: buttonSize.width,
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipPath(
                    clipper: ArrowClipper(),
                    child: Container(
                      width: 17,
                      height: 17,
                      color: widget.backgroundColor ?? Color(0x00000fff),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    height: widget.icons.length * buttonSize.height,
                    decoration: BoxDecoration(
                      color: widget.backgroundColor,
                      borderRadius: _borderRadius,
                    ),
                    child: Theme(
                      data: ThemeData(
                        iconTheme: IconThemeData(
                          color: widget.iconColor,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(widget.icons.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              widget.onChange(index);
                              closeMenu();
                            },
                            child: Container(
                              width: buttonSize.width,
                              height: buttonSize.height,
                              child: widget.icons[index],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
