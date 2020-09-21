import 'package:flutter/material.dart';
import 'package:dgg/datamodels/message.dart';

class ItemStatusMessage extends StatelessWidget {
  final StatusMessage message;

  const ItemStatusMessage({
    Key key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          children: <InlineSpan>[
            WidgetSpan(
              child: Icon(
                Icons.info_outline,
                size: 20,
              ),
            ),
            TextSpan(
              text: " ${message.data}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
