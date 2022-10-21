import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this.transactions,this.deleteTx);

  final List<Transaction> transactions;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              Text(
                'No transactions added yet!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 300,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading:  Container(
                    margin:
                    EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 5
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColorDark,
                          width: 2
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(transactions[index].amount.toStringAsFixed(2)+' Rs',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                         // fontSize: 20,
                          color: Theme.of(context).primaryColor
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  trailing: IconButton(
                      onPressed: ()=>deleteTx(transactions[index].id),
                      icon: Icon(
                    Icons.delete
                      ),
                    color: Theme.of(context).primaryColor.withRed(1000),
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
