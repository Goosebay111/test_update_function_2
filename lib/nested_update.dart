import 'package:test_update_function_2/helper_functions.dart';
import 'package:test_update_function_2/model_nested_class.dart';
import 'package:test_update_function_2/modifier.dart';

NestedClass nestedUpdate({
  required Modifier modifier,
  required NestedClass object,
  required NestedClass hierarchy,
}) {
  // 1) copy the hierarchy to a map.
  Map<String, dynamic> mappedHierarchy = hierarchy.toJson();
  //hierarchy
 // hierarchy.toJson();
  // test that the types are equal i.e. String, int, etc... if no - error loudly.
  if (modifier.key.type != modifier.value().runtimeType) {
    throw Exception('Type mismatch');
  }
  // 2) modify. check if the recursive hierarchy node is the object, if yes - change the value of the copy.
  if (hierarchy == object) {
    mappedHierarchy[modifier.key.name] = modifier.value();
  }
  // transform the modified map back to a class.
  NestedClass updatedNode = copyFromJson(mappedHierarchy);
  // 3) return.
  return updatedNode.copyWith(
    children: [
      for (var child in hierarchy.children)
        // recursive call.
        nestedUpdate(modifier: modifier, object: object, hierarchy: child),
    ],
  );
}

