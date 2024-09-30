import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionsForm(this.onSubmit);

  @override
  State<TransactionsForm> createState() => _TransactionsFormState();
}

class _TransactionsFormState extends State<TransactionsForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              onSubmitted: (_) => _submitForm,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: _valueController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm,
              decoration: const InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text(DateFormat('dd/MM/y').format(_selectedDate)),
                  TextButton(
                    onPressed: _showDatePicker,
                    child: Text(
                      'Selecionar data!',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _submitForm,
                  child: Text(
                    'Nova Transação',
                    style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
