// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_isar_db_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTodoIsarDbModelCollection on Isar {
  IsarCollection<TodoIsarDbModel> get todoIsarDbModels => this.collection();
}

const TodoIsarDbModelSchema = CollectionSchema(
  name: r'TodoIsarDbModel',
  id: -3219348281862007283,
  properties: {
    r'todoFieldValue': PropertySchema(
      id: 0,
      name: r'todoFieldValue',
      type: IsarType.string,
    )
  },
  estimateSize: _todoIsarDbModelEstimateSize,
  serialize: _todoIsarDbModelSerialize,
  deserialize: _todoIsarDbModelDeserialize,
  deserializeProp: _todoIsarDbModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _todoIsarDbModelGetId,
  getLinks: _todoIsarDbModelGetLinks,
  attach: _todoIsarDbModelAttach,
  version: '3.1.0+1',
);

int _todoIsarDbModelEstimateSize(
  TodoIsarDbModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.todoFieldValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _todoIsarDbModelSerialize(
  TodoIsarDbModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.todoFieldValue);
}

TodoIsarDbModel _todoIsarDbModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TodoIsarDbModel();
  object.id = id;
  object.todoFieldValue = reader.readStringOrNull(offsets[0]);
  return object;
}

P _todoIsarDbModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _todoIsarDbModelGetId(TodoIsarDbModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _todoIsarDbModelGetLinks(TodoIsarDbModel object) {
  return [];
}

void _todoIsarDbModelAttach(
    IsarCollection<dynamic> col, Id id, TodoIsarDbModel object) {
  object.id = id;
}

extension TodoIsarDbModelQueryWhereSort
    on QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QWhere> {
  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TodoIsarDbModelQueryWhere
    on QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QWhereClause> {
  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TodoIsarDbModelQueryFilter
    on QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QFilterCondition> {
  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterFilterCondition>
      todoFieldValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'todoFieldValue',
      ));
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterFilterCondition>
      todoFieldValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'todoFieldValue',
      ));
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterFilterCondition>
      todoFieldValueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'todoFieldValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterFilterCondition>
      todoFieldValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'todoFieldValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterFilterCondition>
      todoFieldValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'todoFieldValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterFilterCondition>
      todoFieldValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'todoFieldValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterFilterCondition>
      todoFieldValueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'todoFieldValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterFilterCondition>
      todoFieldValueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'todoFieldValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterFilterCondition>
      todoFieldValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'todoFieldValue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterFilterCondition>
      todoFieldValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'todoFieldValue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterFilterCondition>
      todoFieldValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'todoFieldValue',
        value: '',
      ));
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterFilterCondition>
      todoFieldValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'todoFieldValue',
        value: '',
      ));
    });
  }
}

extension TodoIsarDbModelQueryObject
    on QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QFilterCondition> {}

extension TodoIsarDbModelQueryLinks
    on QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QFilterCondition> {}

extension TodoIsarDbModelQuerySortBy
    on QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QSortBy> {
  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterSortBy>
      sortByTodoFieldValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoFieldValue', Sort.asc);
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterSortBy>
      sortByTodoFieldValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoFieldValue', Sort.desc);
    });
  }
}

extension TodoIsarDbModelQuerySortThenBy
    on QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QSortThenBy> {
  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterSortBy>
      thenByTodoFieldValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoFieldValue', Sort.asc);
    });
  }

  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QAfterSortBy>
      thenByTodoFieldValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'todoFieldValue', Sort.desc);
    });
  }
}

extension TodoIsarDbModelQueryWhereDistinct
    on QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QDistinct> {
  QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QDistinct>
      distinctByTodoFieldValue({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'todoFieldValue',
          caseSensitive: caseSensitive);
    });
  }
}

extension TodoIsarDbModelQueryProperty
    on QueryBuilder<TodoIsarDbModel, TodoIsarDbModel, QQueryProperty> {
  QueryBuilder<TodoIsarDbModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TodoIsarDbModel, String?, QQueryOperations>
      todoFieldValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'todoFieldValue');
    });
  }
}
