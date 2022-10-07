import 'package:test_update_function_2/model_nested_class.dart';

NestedClass deleteUpdate({
  required NestedClass object,
  required NestedClass hierarchy,
}) {

  NestedClass? parent = hierarchy.children.contains(object) ? hierarchy : null ;
  //print(parent?.name ?? 'no parent');

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
        deleteUpdate(object: object, hierarchy: child),
    ],
  );
}
