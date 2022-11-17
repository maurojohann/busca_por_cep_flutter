import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klab_post_code_search/features/home/home.dart';
import 'package:klab_post_code_search/shared/components/kc_app_bar.dart';
import 'package:klab_post_code_search/shared/components/kc_header_base_page.dart';
import 'package:klab_post_code_search/shared/router/routes.dart';
import 'package:klab_post_code_search/shared/utils/cep_formatter.dart';

import 'presenter/components/error_alert_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KCAppBar(
        title: 'Busca CEP',
      ),
      body: Column(
        children: [
          _buildInfoTitle(),
          _buildSearchContent(),
        ],
      ),
    );
  }

  Widget _buildSearchContent() {
    return Expanded(
      child: KCHeaderBasePage(
        child: BlocListener<HomePageBloc, HomePageState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              error: (error) async => await showErrorDialog(
                context: context,
                messageError: error,
              ),
              loaded: (postCodeEntity) => Navigator.pushNamed(
                  context, RouteNames.RESULT,
                  arguments: postCodeEntity),
            );
          },
          child: const _BuildLoadedScreen(),
        ),
      ),
    );
  }

  Widget _buildInfoTitle() {
    return const Padding(
      padding: EdgeInsets.only(left: 56, right: 56, bottom: 64),
      child: Center(
          child: Text(
        'Encontre informaçoes detalhadas sobre seu CEP',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      )),
    );
  }
}

class _BuildLoadedScreen extends StatefulWidget {
  const _BuildLoadedScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<_BuildLoadedScreen> createState() => _BuildLoadedScreenState();
}

class _BuildLoadedScreenState extends State<_BuildLoadedScreen> {
  final TextEditingController _textEditingController =
      TextEditingController(text: '');

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  bool isValueCompleted = false;
  final _cepFormatter = CepFormatter();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildInputCep(),
        _buildSearchButton(context),
      ],
    );
  }

  Widget _buildInputCep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
        controller: _textEditingController,
        keyboardType: TextInputType.number,
        maxLength: 9,
        decoration: const InputDecoration(hintText: 'Insira o CEP'),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          _cepFormatter
        ],
        onChanged: (value) {
          if (value.length == 9) {
            setState(() {
              isValueCompleted = true;
            });
          } else {
            setState(() {
              isValueCompleted = false;
            });
          }
        },
      ),
    );
  }

  Widget _buildSearchButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: isValueCompleted
            ? () {
                BlocProvider.of<HomePageBloc>(context).add(
                  HomePageEvent.serach(
                    _cepFormatter.unmaskText(_textEditingController.text),
                  ),
                );
              }
            : null,
        child: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const SizedBox(
                  width: 65,
                  child: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ));
            } else {
              return const SizedBox(
                width: 65,
                child: Center(child: Text('Buscar')),
              );
            }
          },
        ),
      ),
    );
  }
}
