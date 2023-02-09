import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../fooderlich_theme.dart';
import '../models/grocery_item.dart';
import '../models/grocery_manager.dart';
import '../screens/grocery_items_screen.dart';
import 'components.dart';

class GroceryListScreen extends StatelessWidget {
  const GroceryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groceryManager = Provider.of<GroceryManager>(context);

    return ListView.separated(
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return Dismissible(
            onDismissed: (direction) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                  '${groceryManager.groceryitems[index].name} is removed!')));
              groceryManager.deleteItem(index);
            },
            direction: DismissDirection.endToStart,
            key: Key(groceryManager.groceryitems[index].id),
            background: Container(
                color: Colors.red,
                child: Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                  size: 36,
                ),
                alignment: Alignment.centerRight),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Theme(
                              data: FooderlichTheme.dark(),
                              child: GroceryItemScreen(
                                onCreate: (GroceryItem groceryitem) {},
                                onUpdate: (GroceryItem groceryItem) {
                                  groceryManager.updateItem(groceryItem, index);
                                  Navigator.pop(context);
                                },
                                originalItem:
                                groceryManager.groceryitems[index],
                              ),
                            )));
              },
              child: GroceryTile(
                groceryItem: groceryManager.groceryitems[index],
                onComplete: (checked) {
                  groceryManager.toggleItemStatus(index, checked ?? false);
                },
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 8);
        },
        itemCount: groceryManager.groceryitems.length);
  }
}
