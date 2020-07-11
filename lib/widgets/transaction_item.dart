import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.userTransaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction userTransaction;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    const bgColors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.purple,
    ];
    _bgColor = bgColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 5.0,
      ),
      elevation: 6,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                '\₦${widget.userTransaction.amount.toStringAsFixed(0)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          widget.userTransaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMMd().format(widget.userTransaction.date),
        ),
        trailing: mediaQuery.size.width > 460
            ? FlatButton.icon(
                onPressed: () => widget.deleteTx(
                  widget.userTransaction.id,
                ),
                textColor: Theme.of(context).errorColor,
                icon: Icon(Icons.delete),
                label: Text('Delete'),
              )
            : IconButton(
                icon: Icon(Icons.delete, color: Theme.of(context).errorColor),
                onPressed: () => widget.deleteTx(widget.userTransaction.id),
              ),
      ),
    );
  }
}
