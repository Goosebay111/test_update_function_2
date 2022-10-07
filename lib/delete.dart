import 'package:test_update_function_2/model_nested_class.dart';

NestedClass delete({
  required NestedClass object,
  required NestedClass hierarchy,
}) {
  NestedClass? parent = hierarchy.children.contains(object) ? hierarchy : null;

  if (parent != null) {
    return hierarchy.copyWith(children: [
      for (var child in hierarchy.children)
        if (child != object) child,
    ]);
  }

  return hierarchy.copyWith(
    children: [
      for (var child in hierarchy.children)
        delete(object: object, hierarchy: child),
    ],
  );
}
