import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/models.dart';

class GroceryItemScreen extends StatefulWidget {
  // 1
  final Function(GroceryItem) onCreate;
  // 2
  final Function(GroceryItem) onUpdate;
  // 3
  final GroceryItem? originalItem;
  // 4
  final bool isUpdating;

  const GroceryItemScreen({
    super.key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  })  : isUpdating = (originalItem != null);

  @override
  GroceryItemScreenState createState() => GroceryItemScreenState();
}

class GroceryItemScreenState extends State<GroceryItemScreen> {
  // TODO: Add grocery item screen state properties

  @override
  Widget build(BuildContext context) {
    // TODO: Add GroceryItemScreen Scaffold
    return Container(color: Colors.orange);
  }

// TODO: Add buildNameField()

// TODO: Add buildImportanceField()

// TODO: ADD buildDateField()

// TODO: Add buildTimeField()

// TODO: Add buildColorPicker()

// TODO: Add buildQuantityField()

}
