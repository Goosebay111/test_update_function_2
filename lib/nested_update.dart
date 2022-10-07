import 'package:test_update_function_2/helper_functions.dart';
import 'package:test_update_function_2/model_nested_class.dart';
import 'package:test_update_function_2/modifier.dart';

NestedClass nestedUpdate({
  required Modifier modifier,
  required NestedClass object,
  required NestedClass hierarchy,
}) {
  Map<String, dynamic> mappedHierarchy = hierarchy.toJson();

  if (modifier.key.type != modifier.value().runtimeType) {
    throw Exception('Type mismatch');
  }
  if (hierarchy == object) {
    mappedHierarchy[modifier.key.name] = modifier.value();
  }
  NestedClass updatedNode = copyFromJson(mappedHierarchy);
  return updatedNode.copyWith(
    children: [
      for (var child in hierarchy.children)
        // recursive call.
        nestedUpdate(modifier: modifier, object: object, hierarchy: child),
    ],
  );
}
