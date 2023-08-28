import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final String title;
  final String icon;
  final bool selected;
  final void Function()? onTap;
  const ItemWidget({
    super.key,
    required this.title,
    required this.selected,
    this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      minLeadingWidth: 10,
      leading: Image.asset(
        icon,
        height: 20,
        width: 20,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 3),
      selected: selected,
      onTap: onTap,
    );
  }
}
