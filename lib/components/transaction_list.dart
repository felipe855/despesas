import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
          builder: (ctx, contraints) {
            return Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Nenhuma Transação cadastrada',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: contraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          },
        )
        : ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (ctx, index) {
            final tr = transactions[index];
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: FittedBox(child: Text('R\$${tr.value}')),
                  ),
                ),
                title: Text(
                  tr.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                trailing:
                    MediaQuery.of(context).size.height > 400
                        ? TextButton.icon(
                          onPressed: () => onRemove(tr.id),
                          icon: Icon(Icons.delete),
                          label: Text('Excluir'),
                          style: TextButton.styleFrom(
                            foregroundColor:
                                Theme.of(context).colorScheme.error,
                          ),
                        )
                        : IconButton(
                          onPressed: () => onRemove(tr.id),
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).colorScheme.error,
                        ),
              ),
            );
          },
        );
  }
}
