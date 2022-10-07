import 'package:test_update_function_2/model_nested_class.dart';
import 'package:test_update_function_2/modifier.dart';

NestedClass deleteUpdate({
  required Modifier modifier,
  required NestedClass object,
  required NestedClass hierarchy,
}) {
  NestedClass? parent = hierarchy.children.contains(object) ? hierarchy : null;

  if (parent != null) {
    return hierarchy.copyWith(
      children: [
        for (var child in hierarchy.children)
          if (child != object) child,
      ],
    );
  }

  return hierarchy.copyWith(
    children: [
      for (var child in hierarchy.children)
        deleteUpdate(modifier: modifier, object: object, hierarchy: child),
    ],
  );
}

