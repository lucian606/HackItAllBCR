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


/** This is an auto generated class representing the UntitledModel type in your schema. */
@immutable
class UntitledModel extends Model {
  static const classType = const _UntitledModelModelType();
  final String id;
  final bool? _isComplete;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  bool get isComplete {
    try {
      return _isComplete!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const UntitledModel._internal({required this.id, required isComplete}): _isComplete = isComplete;
  
  factory UntitledModel({String? id, required bool isComplete}) {
    return UntitledModel._internal(
      id: id == null ? UUID.getUUID() : id,
      isComplete: isComplete);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UntitledModel &&
      id == other.id &&
      _isComplete == other._isComplete;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("UntitledModel {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("isComplete=" + (_isComplete != null ? _isComplete!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  UntitledModel copyWith({String? id, bool? isComplete}) {
    return UntitledModel(
      id: id ?? this.id,
      isComplete: isComplete ?? this.isComplete);
  }
  
  UntitledModel.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _isComplete = json['isComplete'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'isComplete': _isComplete
  };

  static final QueryField ID = QueryField(fieldName: "untitledModel.id");
  static final QueryField ISCOMPLETE = QueryField(fieldName: "isComplete");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UntitledModel";
    modelSchemaDefinition.pluralName = "UntitledModels";
    
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
      key: UntitledModel.ISCOMPLETE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
  });
}

class _UntitledModelModelType extends ModelType<UntitledModel> {
  const _UntitledModelModelType();
  
  @override
  UntitledModel fromJson(Map<String, dynamic> jsonData) {
    return UntitledModel.fromJson(jsonData);
  }
}