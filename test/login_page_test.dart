import 'package:dart_movies_app/components/appbar_custom.dart';
import 'package:dart_movies_app/components/fil_field.dart';
import 'package:dart_movies_app/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget makeSut() => const MaterialApp(home: LoginPage());
  testWidgets(
    ' Verifica se os componentes estão na tela',
    (tester) async {
      await tester.pumpWidget(makeSut());

      expect(find.byType(AppBarCustom), findsOneWidget);
      expect(find.byType(FillField), findsNWidgets(2));
      expect(find.text('Entrar'), findsNWidgets(2));
      expect(find.text('Esqueceu a senha?'), findsOneWidget);
    },
  );
}
