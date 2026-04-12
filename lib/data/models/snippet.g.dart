// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snippet.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSnippetCollection on Isar {
  IsarCollection<Snippet> get snippets => this.collection();
}

const SnippetSchema = CollectionSchema(
  name: r'Snippet',
  id: 3413684404339629778,
  properties: {
    r'code': PropertySchema(
      id: 0,
      name: r'code',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'difficulty': PropertySchema(
      id: 2,
      name: r'difficulty',
      type: IsarType.string,
    ),
    r'isSaved': PropertySchema(
      id: 3,
      name: r'isSaved',
      type: IsarType.bool,
    ),
    r'language': PropertySchema(
      id: 4,
      name: r'language',
      type: IsarType.string,
    ),
    r'lastViewedAt': PropertySchema(
      id: 5,
      name: r'lastViewedAt',
      type: IsarType.dateTime,
    ),
    r'snippetId': PropertySchema(
      id: 6,
      name: r'snippetId',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 7,
      name: r'title',
      type: IsarType.string,
    ),
    r'topicId': PropertySchema(
      id: 8,
      name: r'topicId',
      type: IsarType.string,
    )
  },
  estimateSize: _snippetEstimateSize,
  serialize: _snippetSerialize,
  deserialize: _snippetDeserialize,
  deserializeProp: _snippetDeserializeProp,
  idName: r'id',
  indexes: {
    r'snippetId': IndexSchema(
      id: 4177253105006282647,
      name: r'snippetId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'snippetId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'topicId': IndexSchema(
      id: 3718206658163357569,
      name: r'topicId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'topicId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'difficulty': IndexSchema(
      id: 3042583923453520767,
      name: r'difficulty',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'difficulty',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _snippetGetId,
  getLinks: _snippetGetLinks,
  attach: _snippetAttach,
  version: '3.1.0+1',
);

int _snippetEstimateSize(
  Snippet object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.code.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.difficulty.length * 3;
  bytesCount += 3 + object.language.length * 3;
  bytesCount += 3 + object.snippetId.length * 3;
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.topicId.length * 3;
  return bytesCount;
}

void _snippetSerialize(
  Snippet object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.code);
  writer.writeString(offsets[1], object.description);
  writer.writeString(offsets[2], object.difficulty);
  writer.writeBool(offsets[3], object.isSaved);
  writer.writeString(offsets[4], object.language);
  writer.writeDateTime(offsets[5], object.lastViewedAt);
  writer.writeString(offsets[6], object.snippetId);
  writer.writeString(offsets[7], object.title);
  writer.writeString(offsets[8], object.topicId);
}

Snippet _snippetDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Snippet();
  object.code = reader.readString(offsets[0]);
  object.description = reader.readString(offsets[1]);
  object.difficulty = reader.readString(offsets[2]);
  object.id = id;
  object.isSaved = reader.readBool(offsets[3]);
  object.language = reader.readString(offsets[4]);
  object.lastViewedAt = reader.readDateTimeOrNull(offsets[5]);
  object.snippetId = reader.readString(offsets[6]);
  object.title = reader.readString(offsets[7]);
  object.topicId = reader.readString(offsets[8]);
  return object;
}

P _snippetDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _snippetGetId(Snippet object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _snippetGetLinks(Snippet object) {
  return [];
}

void _snippetAttach(IsarCollection<dynamic> col, Id id, Snippet object) {
  object.id = id;
}

extension SnippetByIndex on IsarCollection<Snippet> {
  Future<Snippet?> getBySnippetId(String snippetId) {
    return getByIndex(r'snippetId', [snippetId]);
  }

  Snippet? getBySnippetIdSync(String snippetId) {
    return getByIndexSync(r'snippetId', [snippetId]);
  }

  Future<bool> deleteBySnippetId(String snippetId) {
    return deleteByIndex(r'snippetId', [snippetId]);
  }

  bool deleteBySnippetIdSync(String snippetId) {
    return deleteByIndexSync(r'snippetId', [snippetId]);
  }

  Future<List<Snippet?>> getAllBySnippetId(List<String> snippetIdValues) {
    final values = snippetIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'snippetId', values);
  }

  List<Snippet?> getAllBySnippetIdSync(List<String> snippetIdValues) {
    final values = snippetIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'snippetId', values);
  }

  Future<int> deleteAllBySnippetId(List<String> snippetIdValues) {
    final values = snippetIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'snippetId', values);
  }

  int deleteAllBySnippetIdSync(List<String> snippetIdValues) {
    final values = snippetIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'snippetId', values);
  }

  Future<Id> putBySnippetId(Snippet object) {
    return putByIndex(r'snippetId', object);
  }

  Id putBySnippetIdSync(Snippet object, {bool saveLinks = true}) {
    return putByIndexSync(r'snippetId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySnippetId(List<Snippet> objects) {
    return putAllByIndex(r'snippetId', objects);
  }

  List<Id> putAllBySnippetIdSync(List<Snippet> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'snippetId', objects, saveLinks: saveLinks);
  }
}

extension SnippetQueryWhereSort on QueryBuilder<Snippet, Snippet, QWhere> {
  QueryBuilder<Snippet, Snippet, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SnippetQueryWhere on QueryBuilder<Snippet, Snippet, QWhereClause> {
  QueryBuilder<Snippet, Snippet, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Snippet, Snippet, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterWhereClause> idBetween(
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

  QueryBuilder<Snippet, Snippet, QAfterWhereClause> snippetIdEqualTo(
      String snippetId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'snippetId',
        value: [snippetId],
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterWhereClause> snippetIdNotEqualTo(
      String snippetId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'snippetId',
              lower: [],
              upper: [snippetId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'snippetId',
              lower: [snippetId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'snippetId',
              lower: [snippetId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'snippetId',
              lower: [],
              upper: [snippetId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterWhereClause> topicIdEqualTo(
      String topicId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'topicId',
        value: [topicId],
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterWhereClause> topicIdNotEqualTo(
      String topicId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'topicId',
              lower: [],
              upper: [topicId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'topicId',
              lower: [topicId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'topicId',
              lower: [topicId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'topicId',
              lower: [],
              upper: [topicId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterWhereClause> difficultyEqualTo(
      String difficulty) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'difficulty',
        value: [difficulty],
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterWhereClause> difficultyNotEqualTo(
      String difficulty) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'difficulty',
              lower: [],
              upper: [difficulty],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'difficulty',
              lower: [difficulty],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'difficulty',
              lower: [difficulty],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'difficulty',
              lower: [],
              upper: [difficulty],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SnippetQueryFilter
    on QueryBuilder<Snippet, Snippet, QFilterCondition> {
  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> codeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> codeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> codeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> codeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> codeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> codeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> difficultyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'difficulty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> difficultyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'difficulty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> difficultyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'difficulty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> difficultyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'difficulty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> difficultyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'difficulty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> difficultyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'difficulty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> difficultyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'difficulty',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> difficultyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'difficulty',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> difficultyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'difficulty',
        value: '',
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> difficultyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'difficulty',
        value: '',
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> isSavedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSaved',
        value: value,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> languageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> languageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> languageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> languageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'language',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> languageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> languageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> languageContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> languageMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'language',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> languageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> languageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> lastViewedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastViewedAt',
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition>
      lastViewedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastViewedAt',
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> lastViewedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastViewedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> lastViewedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastViewedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> lastViewedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastViewedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> lastViewedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastViewedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> snippetIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'snippetId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> snippetIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'snippetId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> snippetIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'snippetId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> snippetIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'snippetId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> snippetIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'snippetId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> snippetIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'snippetId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> snippetIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'snippetId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> snippetIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'snippetId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> snippetIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'snippetId',
        value: '',
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> snippetIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'snippetId',
        value: '',
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> topicIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'topicId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> topicIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'topicId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> topicIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'topicId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> topicIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'topicId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> topicIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'topicId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> topicIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'topicId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> topicIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'topicId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> topicIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'topicId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> topicIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'topicId',
        value: '',
      ));
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterFilterCondition> topicIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'topicId',
        value: '',
      ));
    });
  }
}

extension SnippetQueryObject
    on QueryBuilder<Snippet, Snippet, QFilterCondition> {}

extension SnippetQueryLinks
    on QueryBuilder<Snippet, Snippet, QFilterCondition> {}

extension SnippetQuerySortBy on QueryBuilder<Snippet, Snippet, QSortBy> {
  QueryBuilder<Snippet, Snippet, QAfterSortBy> sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> sortByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.asc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> sortByDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.desc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> sortByIsSaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSaved', Sort.asc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> sortByIsSavedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSaved', Sort.desc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> sortByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> sortByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> sortByLastViewedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastViewedAt', Sort.asc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> sortByLastViewedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastViewedAt', Sort.desc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> sortBySnippetId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snippetId', Sort.asc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> sortBySnippetIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snippetId', Sort.desc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> sortByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.asc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> sortByTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.desc);
    });
  }
}

extension SnippetQuerySortThenBy
    on QueryBuilder<Snippet, Snippet, QSortThenBy> {
  QueryBuilder<Snippet, Snippet, QAfterSortBy> thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> thenByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.asc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> thenByDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.desc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> thenByIsSaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSaved', Sort.asc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> thenByIsSavedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSaved', Sort.desc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> thenByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> thenByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> thenByLastViewedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastViewedAt', Sort.asc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> thenByLastViewedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastViewedAt', Sort.desc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> thenBySnippetId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snippetId', Sort.asc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> thenBySnippetIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'snippetId', Sort.desc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> thenByTopicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.asc);
    });
  }

  QueryBuilder<Snippet, Snippet, QAfterSortBy> thenByTopicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'topicId', Sort.desc);
    });
  }
}

extension SnippetQueryWhereDistinct
    on QueryBuilder<Snippet, Snippet, QDistinct> {
  QueryBuilder<Snippet, Snippet, QDistinct> distinctByCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Snippet, Snippet, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Snippet, Snippet, QDistinct> distinctByDifficulty(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'difficulty', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Snippet, Snippet, QDistinct> distinctByIsSaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSaved');
    });
  }

  QueryBuilder<Snippet, Snippet, QDistinct> distinctByLanguage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'language', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Snippet, Snippet, QDistinct> distinctByLastViewedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastViewedAt');
    });
  }

  QueryBuilder<Snippet, Snippet, QDistinct> distinctBySnippetId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'snippetId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Snippet, Snippet, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Snippet, Snippet, QDistinct> distinctByTopicId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'topicId', caseSensitive: caseSensitive);
    });
  }
}

extension SnippetQueryProperty
    on QueryBuilder<Snippet, Snippet, QQueryProperty> {
  QueryBuilder<Snippet, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Snippet, String, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<Snippet, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Snippet, String, QQueryOperations> difficultyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'difficulty');
    });
  }

  QueryBuilder<Snippet, bool, QQueryOperations> isSavedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSaved');
    });
  }

  QueryBuilder<Snippet, String, QQueryOperations> languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'language');
    });
  }

  QueryBuilder<Snippet, DateTime?, QQueryOperations> lastViewedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastViewedAt');
    });
  }

  QueryBuilder<Snippet, String, QQueryOperations> snippetIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'snippetId');
    });
  }

  QueryBuilder<Snippet, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<Snippet, String, QQueryOperations> topicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'topicId');
    });
  }
}
