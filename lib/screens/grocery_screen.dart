import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/components.dart';
import '../fooderlich_theme.dart';
import '../models/models.dart';
import 'grocery_items_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGroceryScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final manager = Provider.of<GroceryManager>(context, listen: false);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Theme(
                data: FooderlichTheme.dark(),
                child: GroceryItemScreen(
                  onCreate: (GroceryItem groceryItem) {
                    manager.addItem(groceryItem);
                    Navigator.of(context).pop();
                  },
                  onUpdate: (GroceryItem groceryItem) {},
                ),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildGroceryScreen() {
    return Consumer<GroceryManager>(builder: (context, groceryManager, child) {
      if (groceryManager.groceryitems.isNotEmpty) {
        return GroceryListScreen();
      } else {
        return EmptyGroceryScreen();
      }
    });
  }
}
