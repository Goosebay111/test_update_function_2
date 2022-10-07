import 'package:test_update_function_2/model_nested_class.dart';

var familyTree = const NestedClass(
    name: 'Family Tree', surname: 'Lineage', age: 500, children: []);
var greatGrandParents = const NestedClass(
    name: 'Great Grand Parents 1', surname: 'Surname', age: 100, children: []);
var grandParents1 = const NestedClass(
    name: 'Grand Parents 1', surname: 'Surname', age: 50, children: []);
var grandParents2 = const NestedClass(
    name: 'Grand Parents 2', surname: 'Surname', age: 50, children: []);
var parents1 = const NestedClass(
    name: 'Parents 1', surname: 'Surname', age: 25, children: []);
var parents2 = const NestedClass(
    name: 'Parents 2', surname: 'Surname', age: 25, children: []);
var parents3 = const NestedClass(
    name: 'Parents 3', surname: 'Surname', age: 25, children: []);
var children1 = const NestedClass(
    name: 'Children 1', surname: 'Surname', age: 10, children: []);
var children2 = const NestedClass(
    name: 'Children 2', surname: 'Surname', age: 10, children: []);
var children3 = const NestedClass(
    name: 'Children 3', surname: 'Surname', age: 10, children: []);
var children4 = const NestedClass(
    name: 'Children 4', surname: 'Surname', age: 10, children: []);
var children5 = const NestedClass(
    name: 'Children 5', surname: 'Surname', age: 10, children: []);
var children6 = const NestedClass(
    name: 'Children 6', surname: 'Surname', age: 10, children: []);

NestedClass initializeFamilyTree() {
  var newParents1 = parents1.copyWith(children: [
    children1,
    children2,
  ]);
  var newParents2 = parents2.copyWith(children: [
    children3,
    children4,
  ]);
  var newParents3 = parents3.copyWith(children: [
    children5,
    children6,
  ]);
  var newGrandParents1 = grandParents1.copyWith(children: [
    newParents1,
    newParents2,
    newParents3,
  ]);

  var newGrandParents2 = grandParents2.copyWith(children: []);
  var newGreatGrandParents = greatGrandParents.copyWith(children: [
    newGrandParents1,
    newGrandParents2,
  ]);
  var newFamilyTree = familyTree.copyWith(children: [
    newGreatGrandParents,
  ]);
  return newFamilyTree;
}
