import 'package:test_update_function_2/setup_data.dart';
import 'package:test_update_function_2/helper_functions.dart';
import 'package:test_update_function_2/modifier.dart';
import 'package:test_update_function_2/nested_update.dart';

//todo: implement undo/redo because these items are storable in a list.
void main() {
  // make a new variable called newParents1 that has 2 children
  var newParents1 = parents1.copyWith(children: [
    children1,
    children2,
  ]);
  // make a new variable called newParents2 that has 2 children
  var newParents2 = parents2.copyWith(children: [
    children3,
    children4,
  ]);
  // make a new variable called newParents3 that has 2 children
  var newParents3 = parents3.copyWith(children: [
    children5,
    children6,
  ]);
  // make a new variable called newGrandParents1 that has all of the parents as children
  var newGrandParents1 = grandParents1.copyWith(children: [
    newParents1,
    newParents2,
    newParents3,
  ]);

  var newGrandParents2 = grandParents2.copyWith(children: [
  ]);
  // make a new variable called newGreatGrandParents that has all of the grand parents as children
  var newGreatGrandParents = greatGrandParents.copyWith(children: [
    newGrandParents1,
    newGrandParents2,
  ]);
  // make a new variable called newFamilyTree which has familyTree and all the others as a children and children of children
  var newFamilyTree = familyTree.copyWith(children: [
    newGreatGrandParents,
  ]);

  final updatedHierarchy = nestedUpdate(
    modifier: ModifySurname(),
    object: newGreatGrandParents,
    hierarchy: newFamilyTree,
  );

  // final deletedHierarchy2 = deleteUpdate(
  //   modifier: ModifyBlank(),
  //   object: newParents2,
  //   hierarchy: newFamilyTree,
  // );

 //printHierarchy(deletedHierarchy2);
 printHierarchy(updatedHierarchy);
  printHierarchy(newFamilyTree);
}
