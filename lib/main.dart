import 'package:test_update_function_2/delete.dart';
import 'package:test_update_function_2/helper_functions.dart';
import 'package:test_update_function_2/model_nested_class.dart';
import 'package:test_update_function_2/setup_data.dart';

//todo: implement undo/redo because these items are storable in a list.
void main() {
  NestedClass newFamilyTree = initializeFamilyTree();

  final deleted1 = deleteUpdate(object: children1, hierarchy: newFamilyTree);

  final deleted2 = deleteUpdate(object: children2, hierarchy: deleted1);

  final deleted3 = deleteUpdate(object: children3, hierarchy: deleted2);

  final deleted4 = deleteUpdate(object: children4, hierarchy: deleted3);

  final deleted5 = deleteUpdate(object: children5, hierarchy: deleted4);

  final deleted6 = deleteUpdate(object: children6, hierarchy: deleted5);

  List<NestedClass> deletedList = [
    deleted1,
    deleted2,
    deleted3,
    deleted4,
    deleted5,
    deleted6
  ];

  for (var i = 0; i < deletedList.length; i++) {
    printHierarchy(deletedList[i], 'Deleted:$i');
  }

  
}
