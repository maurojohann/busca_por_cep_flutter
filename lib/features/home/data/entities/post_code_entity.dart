
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_code_entity.freezed.dart';
part 'post_code_entity.g.dart';

@freezed
class PostCodeEntity with _$PostCodeEntity {
  factory PostCodeEntity(
        final String? cep,
    final String? logradouro,
    final String? complemento,
    final String? bairro,
    final String? localidade,
    final String? uf,
    final String? ibge,
    final String? gia,
    final String? ddd,
    final String? siafi,
  ) = _PostCodeEntity;
	
  factory PostCodeEntity.fromJson(Map<String, dynamic> json) =>
			_$PostCodeEntityFromJson(json);
}

