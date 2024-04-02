import 'package:flutter/material.dart';
import 'package:white_fullscreen/widgets/color_picker_item.dart';
import 'package:white_fullscreen/widgets/colors.dart';

class ColorPicker extends StatefulWidget {
  final Color selectedColor;
  final ValueChanged<Color> onColorChanged;

  const ColorPicker(
      {super.key,
      this.selectedColor = Colors.white,
      required this.onColorChanged});

  @override
  State<StatefulWidget> createState() => ColorPickerState();
}

class ColorPickerState extends State<ColorPicker> {
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();

    _initSelectedValue();
  }

  @override
  void didUpdateWidget(covariant ColorPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    _initSelectedValue();
  }

  void _initSelectedValue() {
    setState(() {
      _selectedColor = widget.selectedColor;
    });
  }

  void _onColorSelected(Color color) {
    setState(() => _selectedColor = color);
    widget.onColorChanged.call(color);
  }

  List<Widget> _buildListMainColor() {
    return [
      for (final color in pickerColors)
        ColorPickerItem(
            color: color,
            size: 50.0,
            selected: color == _selectedColor,
            onColorChanged: _onColorSelected)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Wrap(
      spacing: 10.0,
      alignment: WrapAlignment.center,
      runSpacing: 10.0,
      children: _buildListMainColor(),
    ));
  }
}
