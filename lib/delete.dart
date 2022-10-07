import 'package:test_update_function_2/model_nested_class.dart';

NestedClass delete({
  required NestedClass object,
  required NestedClass hierarchy,
}) {
  NestedClass? copiedHierarchy = hierarchy.children.contains(object) ? hierarchy : null;

  if (copiedHierarchy != null) {
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

/* 
if (copiedHierarchy != null) {
    var modified = [
      for (var child in hierarchy.children)
        if (child != object) child
    ];
    return hierarchy.copyWith(children: modified);
  }
*/
