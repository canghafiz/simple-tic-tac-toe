import 'package:flutter/material.dart';
import 'package:simple_tic_tac_toe/utils/export_utils.dart';

class CardContentWidget extends StatelessWidget {
  const CardContentWidget({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.text,
    required this.color,
    required this.fontColor,
    required this.fontSize,
  }) : super(key: key);
  final Function onTap;
  final Widget icon;
  final String text;
  final Color color, fontColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap(),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 12,
            ),
            child: Row(
              children: [
                icon,
                const SizedBox(width: 24),
                Flexible(
                  child: Text(
                    text,
                    style: FontConfig.style(
                      size: fontSize,
                      color: fontColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
