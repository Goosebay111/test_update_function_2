import 'package:test_update_function_2/delete.dart';
import 'package:test_update_function_2/helper_functions.dart';
import 'package:test_update_function_2/model_nested_class.dart';
import 'package:test_update_function_2/setup_data.dart';

void main() {
  NestedClass newFamilyTree = initializeFamilyTree();

  final deleted1 = delete(object: children1, hierarchy: newFamilyTree);

  final deleted2 = delete(object: children2, hierarchy: deleted1);

  final deleted3 = delete(object: children3, hierarchy: deleted2);

  final deleted4 = delete(object: children4, hierarchy: deleted3);

  final deleted5 = delete(object: children5, hierarchy: deleted4);

  final deleted6 = delete(object: children6, hierarchy: deleted5);

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

  printHierarchy(newFamilyTree, 'New Family Tree');
}
