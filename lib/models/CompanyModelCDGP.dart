/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the CompanyModelCDGP type in your schema. */
@immutable
class CompanyModelCDGP extends Model {
  static const classType = const _CompanyModelCDGPModelType();
  final String id;
  final String? _name;
  final double? _value;
  final List<StockModelCDGP>? _StockModelCDGPS;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get name {
    return _name;
  }
  
  double? get value {
    return _value;
  }
  
  List<StockModelCDGP>? get StockModelCDGPS {
    return _StockModelCDGPS;
  }
  
  const CompanyModelCDGP._internal({required this.id, name, value, StockModelCDGPS}): _name = name, _value = value, _StockModelCDGPS = StockModelCDGPS;
  
  factory CompanyModelCDGP({String? id, String? name, double? value, List<StockModelCDGP>? StockModelCDGPS}) {
    return CompanyModelCDGP._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      value: value,
      StockModelCDGPS: StockModelCDGPS != null ? List<StockModelCDGP>.unmodifiable(StockModelCDGPS) : StockModelCDGPS);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompanyModelCDGP &&
      id == other.id &&
      _name == other._name &&
      _value == other._value &&
      DeepCollectionEquality().equals(_StockModelCDGPS, other._StockModelCDGPS);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CompanyModelCDGP {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("value=" + (_value != null ? _value!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CompanyModelCDGP copyWith({String? id, String? name, double? value, List<StockModelCDGP>? StockModelCDGPS}) {
    return CompanyModelCDGP(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
      StockModelCDGPS: StockModelCDGPS ?? this.StockModelCDGPS);
  }
  
  CompanyModelCDGP.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _value = (json['value'] as num?)?.toDouble(),
      _StockModelCDGPS = json['StockModelCDGPS'] is List
        ? (json['StockModelCDGPS'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => StockModelCDGP.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'value': _value, 'StockModelCDGPS': _StockModelCDGPS?.map((StockModelCDGP? e) => e?.toJson()).toList()
  };

  static final QueryField ID = QueryField(fieldName: "companyModelCDGP.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField VALUE = QueryField(fieldName: "value");
  static final QueryField STOCKMODELCDGPS = QueryField(
    fieldName: "StockModelCDGPS",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (StockModelCDGP).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CompanyModelCDGP";
    modelSchemaDefinition.pluralName = "CompanyModelCDGPS";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CompanyModelCDGP.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CompanyModelCDGP.VALUE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: CompanyModelCDGP.STOCKMODELCDGPS,
      isRequired: false,
      ofModelName: (StockModelCDGP).toString(),
      associatedKey: StockModelCDGP.COMPANYMODELCDGPID
    ));
  });
}

class _CompanyModelCDGPModelType extends ModelType<CompanyModelCDGP> {
  const _CompanyModelCDGPModelType();
  
  @override
  CompanyModelCDGP fromJson(Map<String, dynamic> jsonData) {
    return CompanyModelCDGP.fromJson(jsonData);
  }
}