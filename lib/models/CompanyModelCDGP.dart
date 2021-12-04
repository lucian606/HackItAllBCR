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

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the CompanyModelCDGP type in your schema. */
@immutable
class CompanyModelCDGP extends Model {
  static const classType = const _CompanyModelCDGPModelType();
  final String id;
  final double? _value;
  final String? _name;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  double? get value {
    return _value;
  }
  
  String? get name {
    return _name;
  }
  
  const CompanyModelCDGP._internal({required this.id, value, name}): _value = value, _name = name;
  
  factory CompanyModelCDGP({String? id, double? value, String? name}) {
    return CompanyModelCDGP._internal(
      id: id == null ? UUID.getUUID() : id,
      value: value,
      name: name);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompanyModelCDGP &&
      id == other.id &&
      _value == other._value &&
      _name == other._name;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CompanyModelCDGP {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("value=" + (_value != null ? _value!.toString() : "null") + ", ");
    buffer.write("name=" + "$_name");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CompanyModelCDGP copyWith({String? id, double? value, String? name}) {
    return CompanyModelCDGP(
      id: id ?? this.id,
      value: value ?? this.value,
      name: name ?? this.name);
  }
  
  CompanyModelCDGP.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _value = (json['value'] as num?)?.toDouble(),
      _name = json['name'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'value': _value, 'name': _name
  };

  static final QueryField ID = QueryField(fieldName: "companyModelCDGP.id");
  static final QueryField VALUE = QueryField(fieldName: "value");
  static final QueryField NAME = QueryField(fieldName: "name");
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
      key: CompanyModelCDGP.VALUE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CompanyModelCDGP.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
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