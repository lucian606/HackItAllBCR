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


/** This is an auto generated class representing the CompanyModel type in your schema. */
@immutable
class CompanyModel extends Model {
  static const classType = const _CompanyModelModelType();
  final String id;
  final String? _name;
  final String? _currency;
  final String? _ceEchipaSunteti;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get name {
    return _name;
  }
  
  String? get currency {
    return _currency;
  }
  
  String? get ceEchipaSunteti {
    return _ceEchipaSunteti;
  }
  
  const CompanyModel._internal({required this.id, name, currency, ceEchipaSunteti}): _name = name, _currency = currency, _ceEchipaSunteti = ceEchipaSunteti;
  
  factory CompanyModel({String? id, String? name, String? currency, String? ceEchipaSunteti}) {
    return CompanyModel._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      currency: currency,
      ceEchipaSunteti: ceEchipaSunteti);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompanyModel &&
      id == other.id &&
      _name == other._name &&
      _currency == other._currency &&
      _ceEchipaSunteti == other._ceEchipaSunteti;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("CompanyModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("currency=" + "$_currency" + ", ");
    buffer.write("ceEchipaSunteti=" + "$_ceEchipaSunteti");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  CompanyModel copyWith({String? id, String? name, String? currency, String? ceEchipaSunteti}) {
    return CompanyModel(
      id: id ?? this.id,
      name: name ?? this.name,
      currency: currency ?? this.currency,
      ceEchipaSunteti: ceEchipaSunteti ?? this.ceEchipaSunteti);
  }
  
  CompanyModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _currency = json['currency'],
      _ceEchipaSunteti = json['ceEchipaSunteti'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'currency': _currency, 'ceEchipaSunteti': _ceEchipaSunteti
  };

  static final QueryField ID = QueryField(fieldName: "companyModel.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField CURRENCY = QueryField(fieldName: "currency");
  static final QueryField CEECHIPASUNTETI = QueryField(fieldName: "ceEchipaSunteti");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CompanyModel";
    modelSchemaDefinition.pluralName = "CompanyModels";
    
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
      key: CompanyModel.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CompanyModel.CURRENCY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: CompanyModel.CEECHIPASUNTETI,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _CompanyModelModelType extends ModelType<CompanyModel> {
  const _CompanyModelModelType();
  
  @override
  CompanyModel fromJson(Map<String, dynamic> jsonData) {
    return CompanyModel.fromJson(jsonData);
  }
}