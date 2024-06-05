import 'package:myapp/models/expense.dart';
import 'package:flutter/material.dart';
class ExpenseItem extends StatelessWidget{
const  ExpenseItem(this.expense,{super.key});
  final Expense expense;
  @override
  Widget build( context){
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 16,
      ),
      child: Card(
        
        child: Column
        (crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(expense.title, style: Theme.of(context).textTheme.titleLarge,),
         const SizedBox(height: 10),
         Row(
          children: [
            Text('Rs.${expense.amount.toStringAsFixed(2)}'),
            const Spacer(),
            Row(
              children: [
                Icon(categoryIcons[expense.category]),
                const SizedBox(width:12),
                Text(expense.formattedDate),
              ],
            ),

          ],
         ),
        ],),
        ),
    ) ;
  }
}


