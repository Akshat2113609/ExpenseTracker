//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/models/expense.dart' ;


final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key,required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
  @override

  // TODO: implement createElement
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  // TODO: implement disposeegory
  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
        // this keyword just tells flutter to wait for this value as it will only be available in the future
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }
void _submitExpenseData(){
  final enteredAmount=double.tryParse(_amountController.text);
  final amountInvalid=enteredAmount==null || enteredAmount<=0;
if(_titleController.text.trim().isEmpty || amountInvalid || _selectedDate==null){
  //show error 
  showDialog(context: context, builder: (ctx)=>AlertDialog(
    title: const Text('Invalid input'),
    content: const Text('Please make sure a valid title,amount, date and category is entered'),
    actions: [
      TextButton(
        onPressed: (){
          Navigator.pop(ctx);
        },child:const Text('okay'),
      ),

    ],
  ) ,
  );
  return ;
  }
  widget.onAddExpense(
   Expense (title:_titleController.text,
    amount: enteredAmount,
    date: _selectedDate!,
    category: _selectedCategory,)
    //amamou
    );
    Navigator.pop(context);
}
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,48,16,16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixText: '\Rs ', label: Text('Amount')),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? 'No date chosen'
                        : formatter.format(_selectedDate!)),
// Suggested code may be subject to a license. Learn more: ~LicenseLog:348235830.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2031740591.
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
           const SizedBox(height: 16),
          Row(
          
            children: [
              DropdownButton(value:_selectedCategory,items: Category.values.map(
                (category)=>DropdownMenuItem(
                  value:category,
                  child: Text(category.name.toUpperCase(),
                ),
                ),
                ).toList(),
              onChanged: (value){
                 if(value==null)return;
               setState((){
               
                 _selectedCategory=value;
               });
              }
              ),
              const Spacer(),
              ElevatedButton(
                  onPressed: _submitExpenseData,
                  child: const Text('Save Expense')),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
