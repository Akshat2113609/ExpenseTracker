
import 'package:flutter/material.dart';
import 'package:myapp/Widgets/chart/chart.dart';
import 'package:myapp/Widgets/expenses-list/expenses_list.dart';
import 'package:myapp/Widgets/new_expense.dart';
import 'package:myapp/models/expense.dart';
class Expenses extends StatefulWidget{
  const Expenses({super.key});
@override
  State<Expenses> createState() {
   
   return _ExpensesState();
  }
}
class _ExpensesState extends State<Expenses>{
  final  List<Expense>_registeredExpenses=[
  Expense(title:'flutter course',
  amount: 399, 
  date:DateTime.now(),
  category: Category.work,
  ),
  Expense(title:'Cinema',
  amount: 500, 
  date:DateTime.now(),
  category: Category.leisure,
  )
 ];
 void _openAddExpenseOverlay(){
showModalBottomSheet(
  isScrollControlled: true,
  context: context, 
  builder: (ctx)=>NewExpense(onAddExpense:  _addExpense),
);
  }
  void _addExpense(Expense expense){
    setState((){
    _registeredExpenses.add(expense);
    });
    
  }
  void _removeExpense(Expense expense){
    final  expenseIndex=_registeredExpenses.indexOf(expense);
    setState((){
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
     
      SnackBar(
        duration: const Duration(seconds : 3),
        content:
       const Text('Expense deleted'),
      action:SnackBarAction(label: 'Undo',
      onPressed: (){
        setState((){
          _registeredExpenses.insert(expenseIndex,expense);
        });
      }
      ),
      ),
      );
  }
    @override
      Widget build(context){
        Widget mainContent=const Center(child:Text('No expense found. Start adding some!'));
        if(_registeredExpenses.isNotEmpty){
          mainContent=ExpensesList(expenses: _registeredExpenses,
          onRemoveExpense: _removeExpense,);
        }
return  Scaffold(
  appBar: AppBar(
    title: const Text('Flutter expense tracker'),
  actions: [
    IconButton(
      onPressed: _openAddExpenseOverlay,
      icon: const Icon(Icons.add),
      ),
  ],
),
body: Column(
  children: [
   Chart(expenses: _registeredExpenses),
  Expanded ( child: mainContent)
  ],
),
);
    }
  

}
