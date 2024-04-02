import 'package:flutter/material.dart';

class ColorPickerItem extends StatelessWidget {
  final Color color;
  final double size;
  final bool selected;
  final ValueChanged<Color> onColorChanged;

  const ColorPickerItem(
      {super.key,
      required this.color,
      required this.size,
      this.selected = false,
      required this.onColorChanged});

  @override
  Widget build(BuildContext context) {
    var tickColor = color == Colors.white ? Colors.black : Colors.white;

    return GestureDetector(
      onTap: () {
        onColorChanged(color);
      },
      child: Material(
        shape: const CircleBorder(),
        child: CircleAvatar(
            radius: (size + 0.3) / 2,
            backgroundColor: Colors.black,
            child: CircleAvatar(
                radius: size / 2,
                backgroundColor: color,
                child: selected
                    ? Icon(
                        Icons.check,
                        color: tickColor,
                      )
                    : null)),
      ),
    );
  }
}
