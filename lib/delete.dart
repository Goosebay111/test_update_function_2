import 'package:test_update_function_2/model_nested_class.dart';

NestedClass delete({
  required NestedClass object,
  required NestedClass hierarchy,
}) {
  // 1. copy the hierarchy.
  NestedClass? copiedHierarchy = hierarchy.children.contains(object) ? hierarchy : null;
  // 2. modifies.
  if (copiedHierarchy != null) {
    return hierarchy.copyWith(children: [
      for (var child in hierarchy.children)
        if (child != object) child,
    ]);
  }
  // 3. returns copied and modified hierarchy.
  return hierarchy.copyWith(
    children: [
      for (var child in hierarchy.children)
        delete(object: object, hierarchy: child),
    ],
  );
}

/* 2. simplified version of modify logic.
/* for better understanding of the logic */
if (copiedHierarchy != null) {
    var modified = [
      for (var child in hierarchy.children)
        if (child != object) child
    ];
    return hierarchy.copyWith(children: modified);
  }
*/
