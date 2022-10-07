import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_nested_class.freezed.dart';

@freezed
class NestedClass with _$NestedClass {
  const NestedClass._();
  const factory NestedClass({
    required String name,
    required String surname,
    required int age,
    required List<NestedClass> children,
  }) = _NestedClass;

  printNames() {
    log('name: $name, surname: $surname, age: $age');
    for (var child in children) {
      child.printNames();
    }
  }

  factory NestedClass.initial() => const NestedClass(
      name: 'Family Tree', surname: 'Lineage', age: 500, children: []);
}

