import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset('assets/fooderlich_assets/empty_list.png')),
        ),
        Text(
          'No Grocery',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Shopping for Ingredients? Write the down!',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        MaterialButton(
          onPressed: () {
            Provider.of<TabManager>(context, listen: false).goToRecipes();
          },
          color: Colors.green,
          height: 36,
          textColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: Text('Browse Recipes'),
        )
      ],
    );
  }
}
