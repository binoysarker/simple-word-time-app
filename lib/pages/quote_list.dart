import 'package:flutter/material.dart';
import 'package:flutter_app/data/quote_data.dart';
import 'package:flutter_app/templates/quote_card.dart';

class QuoteListPage extends StatefulWidget {
  @override
  _QuoteListPageState createState() => _QuoteListPageState();
}

class _QuoteListPageState extends State<QuoteListPage> {
  List<Quote> _quoteList = [
    Quote(text: 'quote text 1', author: 'author 1'),
    Quote(text: 'quote text 2', author: 'author 2'),
    Quote(text: 'quote text 3', author: 'author 3'),
    Quote(text: 'quote text 4', author: 'author 4'),
    Quote(text: 'quote text 5', author: 'author 5')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quote List Page'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _quoteList.map((quote) {
            return QuoteCard(quote: quote,delete: () {
              setState(() {
                _quoteList.remove(quote);
              });
            });
          }).toList(),
        ),
      ),
    );
  }
}
