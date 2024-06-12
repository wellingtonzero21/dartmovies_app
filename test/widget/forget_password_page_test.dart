import 'package:dart_movies_app/components/appbar_custom.dart';
import 'package:dart_movies_app/components/buttom.dart';
import 'package:dart_movies_app/components/fil_field.dart';
import 'package:dart_movies_app/view/forget_password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget makeSut() => const MaterialApp(home: ForgetPasswordPage());

  testWidgets('Testando elementos da tela Recuperar Senha', (tester) async {
    await tester.pumpWidget(makeSut());
    await tester.pumpAndSettle();

    expect(find.byType(AppBarCustom), findsOneWidget);
    expect(find.byType(FillField), findsOneWidget);
    expect(find.byType(ButtomCard), findsOneWidget);
    expect(find.text('Recuperar Senha'), findsOneWidget);
    expect(find.text('Insira seu e-mail para obter um código de verificação'),
        findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Enviar'), findsOneWidget);
  });
}
