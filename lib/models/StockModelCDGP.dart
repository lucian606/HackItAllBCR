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


/** This is an auto generated class representing the StockModelCDGP type in your schema. */
@immutable
class StockModelCDGP extends Model {
  static const classType = const _StockModelCDGPModelType();
  final String id;
  final String? _companyName;
  final double? _value;
  final TemporalDate? _date;
  final String? _companymodelcdgpID;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get companyName {
    return _companyName;
  }
  
  double? get value {
    return _value;
  }
  
  TemporalDate? get date {
    return _date;
  }
  
  String? get companymodelcdgpID {
    return _companymodelcdgpID;
  }
  
  const StockModelCDGP._internal({required this.id, companyName, value, date, companymodelcdgpID}): _companyName = companyName, _value = value, _date = date, _companymodelcdgpID = companymodelcdgpID;
  
  factory StockModelCDGP({String? id, String? companyName, double? value, TemporalDate? date, String? companymodelcdgpID}) {
    return StockModelCDGP._internal(
      id: id == null ? UUID.getUUID() : id,
      companyName: companyName,
      value: value,
      date: date,
      companymodelcdgpID: companymodelcdgpID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StockModelCDGP &&
      id == other.id &&
      _companyName == other._companyName &&
      _value == other._value &&
      _date == other._date &&
      _companymodelcdgpID == other._companymodelcdgpID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("StockModelCDGP {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("companyName=" + "$_companyName" + ", ");
    buffer.write("value=" + (_value != null ? _value!.toString() : "null") + ", ");
    buffer.write("date=" + (_date != null ? _date!.format() : "null") + ", ");
    buffer.write("companymodelcdgpID=" + "$_companymodelcdgpID");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  StockModelCDGP copyWith({String? id, String? companyName, double? value, TemporalDate? date, String? companymodelcdgpID}) {
    return StockModelCDGP(
      id: id ?? this.id,
      companyName: companyName ?? this.companyName,
      value: value ?? this.value,
      date: date ?? this.date,
      companymodelcdgpID: companymodelcdgpID ?? this.companymodelcdgpID);
  }
  
  StockModelCDGP.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _companyName = json['companyName'],
      _value = (json['value'] as num?)?.toDouble(),
      _date = json['date'] != null ? TemporalDate.fromString(json['date']) : null,
      _companymodelcdgpID = json['companymodelcdgpID'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'companyName': _companyName, 'value': _value, 'date': _date?.format(), 'companymodelcdgpID': _companymodelcdgpID
  };

  static final QueryField ID = QueryField(fieldName: "stockModelCDGP.id");
  static final QueryField COMPANYNAME = QueryField(fieldName: "companyName");
  static final QueryField VALUE = QueryField(fieldName: "value");
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField COMPANYMODELCDGPID = QueryField(fieldName: "companymodelcdgpID");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "StockModelCDGP";
    modelSchemaDefinition.pluralName = "StockModelCDGPS";
    
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
      key: StockModelCDGP.COMPANYNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: StockModelCDGP.VALUE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: StockModelCDGP.DATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: StockModelCDGP.COMPANYMODELCDGPID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _StockModelCDGPModelType extends ModelType<StockModelCDGP> {
  const _StockModelCDGPModelType();
  
  @override
  StockModelCDGP fromJson(Map<String, dynamic> jsonData) {
    return StockModelCDGP.fromJson(jsonData);
  }
}