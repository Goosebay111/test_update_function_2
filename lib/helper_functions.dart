import 'dart:developer';

import 'package:test_update_function_2/model_nested_class.dart';
import 'package:test_update_function_2/modifier.dart';

void printHierarchy(NestedClass updatedHierarchy) {
  log('=====================');
  log('Updated: ');
  updatedHierarchy.printNames();
  log('=====================');
}

// make a toJson function for the class that is independent of the freezed package.
extension NestedClassToJson on NestedClass {
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'age': age,
      'children': [
        for (var child in children) child.toJson(),
      ],
    };
  }
}

// make a fromJson function for the class that is independent of the freezed package.
copyFromJson(Map<String, dynamic> json) {
  return NestedClass(
      name: json['name'],
      surname: json['surname'],
      age: json['age'],
      children: [
        for (var child in json['children'])
          copyFromJson(child as Map<String, dynamic>),
      ]);
}

NestedClass updateHierarchy(
    NestedClass hierarchy, Modifier modifier, NestedClass object, Function fx) {
  return hierarchy.copyWith(
    children: [
      for (var child in hierarchy.children)
        fx(modifier: modifier, object: object, hierarchy: child),
    ],
  );
}
