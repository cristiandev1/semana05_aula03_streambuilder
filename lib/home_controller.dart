// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math';

class HomeController {
  StreamController<double> currencyValue = StreamController();

  void getValueCurrency() async {
    //simulando um tempo de busca em algum banco de dados
    await Future.delayed(Duration(seconds: 2));

    final response = Random();

    currencyValue.sink.add(response.nextDouble());

    //currencyValue.sink.addError(Exception('error on get value'));

  }
}
