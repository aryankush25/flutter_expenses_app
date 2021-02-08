import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItemWidget extends StatelessWidget {
  const TransactionItemWidget({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(
              6,
            ),
            child: FittedBox(
              child: Text(
                '\₹ ${transaction.amount.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          DateFormat().add_yMMMMd().format(transaction.date),
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            // ignore: deprecated_member_use
            ? FlatButton.icon(
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                textColor: Theme.of(context).errorColor,
                onPressed: () {
                  deleteTransaction(transaction.id);
                })
            : IconButton(
                icon: Icon(
                  Icons.delete,
                ),
                color: Colors.red,
                onPressed: () {
                  deleteTransaction(transaction.id);
                },
              ),
      ),
    );
  }
}
