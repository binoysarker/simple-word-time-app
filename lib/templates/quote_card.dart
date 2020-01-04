import 'package:flutter/material.dart';
import 'package:flutter_app/data/quote_data.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function delete;
  QuoteCard({this.quote, this.delete});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      child: Column(
        children: <Widget>[
          Text(
            '${quote.text}',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'By ${quote.author}',
            textAlign: TextAlign.start,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.pageview),
                tooltip: 'View',
                iconSize: 20.0,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete),
                tooltip: 'Delete',
                onPressed: delete,
                iconSize: 20.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
