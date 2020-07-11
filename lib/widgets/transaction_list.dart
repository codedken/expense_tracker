import 'package:flutter/material.dart';
import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTx;

  TransactionList(this.userTransactions, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: userTransactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(children: [
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ]);
              },
            )
          : ListView(
              children: userTransactions
                  .map((tx) => TransactionItem(
                        key: ValueKey(tx.id),
                        userTransaction: tx,
                        deleteTx: deleteTx,
                      ))
                  .toList()),
    );
  }
}
