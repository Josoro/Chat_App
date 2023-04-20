import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Super bien y tú',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        const _ImageBuble()
      ],
    );
  }
}


class _ImageBuble extends StatelessWidget {
  const _ImageBuble();

  @override
  Widget build(BuildContext context) {
    return Image.network('https://yesno.wtf/assets/yes/10-271c872c91cd72c1e38e72d2f8eda676.gif');
  }
}