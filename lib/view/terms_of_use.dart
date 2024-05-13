import 'package:dart_movies_app/components/appbar_custom.dart';
import 'package:flutter/material.dart';

class TermsOfUsePage extends StatelessWidget {
  const TermsOfUsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarCustom(pageTitle: 'Termos de Uso'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                'Termos de Uso do DartMovies O uso do aplicativo DartMovies está sujeito aos seguintes termos e condições. Ao acessar ou utilizar o aplicativo, você concorda em ficar vinculado a estes termos. Se você não concorda com algum destes termos, por favor, não use o DartMovies. 1. Uso do Serviço 1.1. O DartMovies é um aplicativo que permite aos usuários explorar e assistir a uma variedade de filmes disponíveis em nossa plataforma. 1.2. Ao utilizar o DartMovies, você concorda em respeitar todas as leis e regulamentos aplicáveis. 1.3. Você é responsável por manter a confidencialidade de sua conta e senha, e concorda em aceitar a responsabilidade por todas as atividades que ocorrerem sob sua conta. 2. Conteúdo do Aplicativo 2.1. Todo o conteúdo disponível no DartMovies é protegido por direitos autorais e é propriedade do DartMovies ou de seus licenciadores. 2.2. Você concorda em usar o conteúdo disponível no DartMovies apenas para uso pessoal e não comercial. 3. Restrições de Uso 3.1. Você concorda em não utilizar o DartMovies de qualquer forma que possa danificar, desabilitar, sobrecarregar ou prejudicar o serviço. 3.2. Você concorda em não tentar obter acesso não autorizado a qualquer parte do DartMovies, sistemas de computadores ou redes relacionadas. 4. Modificações dos Termos de Uso 4.1. O DartMovies reserva-se o direito de modificar estes Termos de Uso a qualquer momento. Tais modificações entrarão em vigor imediatamente após a publicação dos termos revisados no aplicativo. 5. Rescisão 5.1. O DartMovies reserva-se o direito de rescindir ou suspender sua conta e acesso ao aplicativo a qualquer momento, por qualquer motivo, sem aviso prévio ou responsabilidade. 6. Disposições Gerais 6.1. Estes Termos de Uso constituem o acordo completo entre você e o DartMovies em relação ao uso do aplicativo, substituindo quaisquer acordos anteriores. 6.2. Se qualquer disposição destes Termos de Uso for considerada inválida ou inexequível, tal disposição será limitada ou eliminada na medida mínima necessária, e as disposições restantes destes Termos de Uso permanecerão em pleno vigor e efeito.',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFFFFFFF),
                    fontFamily: 'Poppins-Regular'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
