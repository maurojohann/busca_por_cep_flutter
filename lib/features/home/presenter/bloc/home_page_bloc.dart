import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:klab_post_code_search/features/home/data/datasources/post_code_datasource.dart';
import 'package:klab_post_code_search/features/home/data/entities/post_code_entity.dart';
import 'package:klab_post_code_search/features/home/data/repositories/post_code_repository.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';
part 'home_page_bloc.freezed.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final PostCodeRepository repository;
  HomePageBloc(this.repository) : super(_Initial()) {
    on<_SearchEvent>(_searchCep);
  }

  void _searchCep(_SearchEvent event, Emitter<HomePageState> emit) async {
    emit(const LoadingState());
    try {
      PostCodeEntity? postCodeResult = await repository.getPostCode(event.cep);
      emit(LoadedState(postCodeEntity: postCodeResult!));
    } catch (e) {
      if (e == DatasourceError.notFound) {
        emit(const ErrorState(
            'Não foi possivel processar sua busca, CEP não encontrado'));
      } else if (e == DatasourceError.badRequest) {
        emit(const ErrorState(
            'Não foi possivel processar sua busca, CEP inválido'));
      } else {
        emit(const ErrorState('Um erro inesperado ocorreu'));
      }
    }
  }
}
