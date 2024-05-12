import 'package:dart_movies_app/model/enums.dart';

class MediaModel {
  String title;
  String description;
  String urlSmallBanner;
  String urlLongBanner;
  bool isRecommended; //FILME e Serie 'Recomendado'
  bool isTrending; //FILME e Serie 'Em alta'
  bool isBanner; //FILME e Serie 'Banner'
  bool isWatched; //FILME e Serie 'Assistido'
  Genre genre;
  MediaType mediaType;
  String length;
  String lancamento;
  String classif;
  String diretor;
  String roteiro;
  String produtoras;

  MediaModel({
    required this.title,
    required this.description,
    required this.urlSmallBanner,
    required this.urlLongBanner,
    this.isRecommended = false,
    this.isTrending = false,
    this.isBanner = false,
    this.isWatched = false,
    required this.genre,
    required this.mediaType,
    required this.length,
    required this.lancamento,
    required this.classif,
    required this.diretor,
    required this.produtoras,
    required this.roteiro,
  });
}

List<MediaModel> listRecommendeds =
    listMedia.where((media) => media.isRecommended == true).toList();

List<MediaModel> listTrendings =
    listMedia.where((media) => media.isTrending == true).toList();

List<MediaModel> listWatched =
    listMedia.where((media) => media.isWatched == true).toList();

MediaModel bannerMedia =
    listMedia.firstWhere((media) => media.isBanner == true);

List<MediaModel> listMovies =
    listMedia.where((media) => media.mediaType == MediaType.movie).toList();

List<MediaModel> listSeries =
    listMedia.where((media) => media.mediaType == MediaType.series).toList();

List<MediaModel> listAcao =
    listMedia.where((media) => media.genre == Genre.action).toList();

List<MediaModel> listComedia =
    listMedia.where((media) => media.genre == Genre.comedy).toList();

List<MediaModel> listDrama =
    listMedia.where((media) => media.genre == Genre.drama).toList();

List<MediaModel> listMedia = [
  MediaModel(
      title: 'invasão Secreta',
      description:
          'Na nova série da Marvel Studios, "Invasão Secreta", passada no presente do UCM, Nick Fury fica a saber de uma invasão clandestina da Terra por uma facção de Skrulls transmorfos. Fury junta-se aos seus aliados, incluindo Everett Ross, Maria Hill e o Skrull Talos, que prosperou na Terra. Juntos terão de correr contra o tempo para impedir uma iminente invasão dos Skrulls e salvar a humanidade.',
      urlSmallBanner:
          'https://a-static.mlcdn.com.br/470x352/poster-cartaz-procurando-nemo-a-pop-arte-poster/poparteskins2/15938519106/0b6f2e7a405e73bf91aca0f91ef37dba.jpeg',
      urlLongBanner:
          'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/4BB18D50B95F15505000DA09CDD36967487E199FE38C37282C8249228C5AA29B/scale?width=600&aspectRatio=1.78&format=webp',
      isRecommended: false,
      isTrending: false,
      isBanner: true,
      genre: Genre.action,
      mediaType: MediaType.series,
      lancamento: '2023',
      length: '8h 30m',
      classif: '13 anos',
      diretor: 'R. Russo',
      produtoras: 'Disney, MarvelStudios',
      roteiro: 'B. Russo'),
  MediaModel(
      title: 'Tetris',
      description:
          'Baseado na história real do vendedor americano de vídeo games, Henk Rogers (Taron Egerton) e sua descoberta do Tetris, em 1988. Quando ele se propõe a levar o jogo para o mundo e se depara com uma perigosa teia de mentiras e corrupção por trás da Cortina de Ferro.',
      urlSmallBanner: '',
      urlLongBanner:
          'https://is1-ssl.mzstatic.com/image/thumb/yj6AjgIcNlSHzmA0A6GOEA/738x416.webp',
      isRecommended: true,
      isTrending: false,
      isWatched: false,
      genre: Genre.drama,
      mediaType: MediaType.movie,
      lancamento: '2022',
      length: '2h 08m',
      classif: 'Livre',
      diretor: 'T. Tris',
      produtoras: 'Netflix',
      roteiro: 'F. Johnson'),
  MediaModel(
      title: 'Green Book',
      description:
          'Baseada em fatos reais, Tony Lip, um segurança ítalo-americano, é contratado como motorista do Dr. Don Shirley, um pianista negro de classe alta, durante uma turnê pelo sul dos Estados Unidos, eles devem seguir o "O Guia" para leva-los aos poucos estabelecimentos que eram seguros para os afro-americanos. Confrontados com o racismo, o perigo – assim como pela humanidade e o humor inesperados - eles são forçados a deixar de lado as diferenças para sobreviver e prosperar nessa jornada.',
      urlSmallBanner: '',
      urlLongBanner:
          'https://is1-ssl.mzstatic.com/image/thumb/Video114/v4/30/a7/a7/30a7a780-fed1-f409-2b26-7bb04527d118/green_book_4000x2250_coverart_bpo.jpg/738x416.webp',
      isRecommended: true,
      isTrending: false,
      isWatched: false,
      genre: Genre.drama,
      mediaType: MediaType.movie,
      lancamento: '2019',
      length: '2h 20m',
      classif: '16 anos',
      diretor: 'J. Ramos',
      produtoras: '21th Fox',
      roteiro: 'C. Clark'),
  MediaModel(
    title: 'Fome de Poder',
    description:
        'A história da ascenção do McDonalds. Após receber uma demanda sem precedentes e notar uma movimentação de consumidores fora do normal, o vendedor de Illinois Ray Kroc (Michael Keaton) adquire uma participação nos negócios da lanchonete dos irmãos Richard e Maurice "Mac" McDonald no sul da Califórnia e, pouco a pouco eliminando os dois da rede, transforma a marca em um gigantesco império alimentício.',
    urlSmallBanner: '',
    urlLongBanner:
        'https://is1-ssl.mzstatic.com/image/thumb/Video124/v4/a4/05/7f/a4057fcf-0b30-5b08-3079-939c032e1e59/1210235069-BR-AMP_SF.lsr/738x416.webp',
    isRecommended: true,
    isTrending: false,
    isWatched: false,
    genre: Genre.drama,
    mediaType: MediaType.movie,
    lancamento: '2022',
    length: '2h 10m',
    classif: '10 anos',
    diretor: 'M. Cload',
    produtoras: 'HBO',
    roteiro: 'P. Body',
  ),
  MediaModel(
      title: 'O Rei Leão',
      description:
          'O Rei Leão (The Lion King), da Disney, realizado por Jon Favreau, viaja até à savana africana, onde um futuro rei ultrapassa a traição e a tragédia, para assumir o lugar a que tem direito na Pedra do Reino. Através de técnicas cinematográficas pioneiras, O Rei Leão consegue que personagens muito queridas ganhem vida de uma forma totalmente nova.',
      urlSmallBanner:
          'https://br.web.img3.acsta.net/c_310_420/pictures/19/05/07/20/54/2901026.jpg',
      urlLongBanner:
          'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/9AAED309BF9197B5A212AC1FBCF377D707FCE3F99886AB5001EE6BA9FFD7A84C/scale?width=600&aspectRatio=1.78&format=webp',
      isRecommended: true,
      isTrending: false,
      genre: Genre.action,
      mediaType: MediaType.movie,
      lancamento: '2021',
      length: '1h 55m',
      classif: 'Livre',
      diretor: 'T. Palma',
      produtoras: 'Disney',
      roteiro: 'B. Spielberg'),
  MediaModel(
      title: 'Capitão Marvel',
      description:
          'Capitão Marvel, da Marvel Studios, é uma aventura num período inédito na história do Universo Cinemático da Marvel que segue o percurso de Carol Danvers à medida que se torna numa das heroínas mais poderosas do Universo.',
      urlSmallBanner:
          'https://br.web.img3.acsta.net/c_310_420/pictures/19/02/04/18/35/1468867.jpg',
      urlLongBanner:
          'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/AFB3B75F0966E65CF1ADB805CF0C2AB9703B3E286CBE513E98C66210EF95D4FE/scale?width=600&aspectRatio=1.78&format=png',
      isRecommended: true,
      isTrending: false,
      genre: Genre.action,
      mediaType: MediaType.movie,
      lancamento: '2018',
      length: '2h 05m',
      classif: '13 anos',
      diretor: 'R. Santana',
      produtoras: 'Disney, MarvelStudios',
      roteiro: 'B. Klopp'),
  MediaModel(
      title: 'Godzilla x Kong: The New Empire',
      description:
          'Em Godzilla x Kong: The New Empire, o poderoso Kong e o temível Godzilla se unem contra uma colossal ameaça mortal escondida no mundo dos humanos.',
      urlSmallBanner:
          'https://br.web.img3.acsta.net/c_310_420/pictures/24/02/28/15/47/0426941.png',
      urlLongBanner:
          'https://br.web.img3.acsta.net/c_310_420/pictures/24/02/28/15/47/0426941.png',
      isRecommended: false,
      isTrending: true,
      genre: Genre.action,
      mediaType: MediaType.movie,
      lancamento: '2024',
      length: '2h 30m',
      classif: '13 anos',
      diretor: 'T. Kondo',
      produtoras: 'Universal',
      roteiro: 'S. Takada'),
  MediaModel(
      title: 'Napoleão',
      description:
          'Um olhar pessoal sobre as origens do líder militar francês e sua rápida e implacável ascensão a imperador. A história é vista através do prisma do relacionamento dependente e volátil de Napoleão com sua esposa e amor verdadeiro, Josefina.',
      urlSmallBanner:
          'https://br.web.img2.acsta.net/c_310_420/pictures/23/12/13/18/13/4592801.jpg',
      urlLongBanner:
          'https://is1-ssl.mzstatic.com/image/thumb/Yeo4sQEGmU9ExLT9U2kLTw/738x416.webp',
      isRecommended: false,
      isTrending: false,
      isWatched: true,
      genre: Genre.drama,
      mediaType: MediaType.movie,
      lancamento: '2023',
      length: '2h 38m',
      classif: '16 anos',
      diretor: 'R. Scott',
      produtoras: 'Columbia',
      roteiro: 'D. Scarpa'),
  MediaModel(
      title: 'The Banker',
      description:
          'Nos anos 60, dois afro-americanos (Anthony Mackie e Samuel L. Jackson) traçam um plano de negócios engenhoso para lutar pela igualdade de acesso ao sonho americano. Nicholas Hoult e Nia Long co-estrelam o drama inspirado em fatos reais.',
      urlSmallBanner:
          'https://br.web.img3.acsta.net/c_310_420/pictures/19/11/04/16/36/2916263.jpg',
      urlLongBanner:
          'https://is1-ssl.mzstatic.com/image/thumb/gd09rRl37B3sBsnfxmhfFg/738x416.webp',
      isRecommended: false,
      isTrending: true,
      genre: Genre.drama,
      mediaType: MediaType.movie,
      lancamento: '2021',
      length: '2h 15m',
      classif: '14 anos',
      diretor: 'R. Portman',
      produtoras: 'A24',
      roteiro: 'B. Trent'),
  MediaModel(
      title: 'Carros',
      description:
          'Uma estreia do Disney+ Day A nova série "Carros em Viagem", da Pixar Animation Studios, segue Faísca McQueen e o seu melhor amigo Mate enquanto seguem para este de Radiador Springs, numa viagem ao longo do país, para se encontrarem com a irmã de Mate',
      urlSmallBanner:
          'https://br.web.img3.acsta.net/c_310_420/medias/nmedia/18/87/77/81/19961449.jpg',
      urlLongBanner:
          'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/CF7717723DFF51C0471EEA584195656F78ED5DF3B6523E4D3323ABACEE105B9F/scale?width=600&aspectRatio=1.78&format=webp',
      isRecommended: false,
      isTrending: true,
      genre: Genre.comedy,
      mediaType: MediaType.movie,
      lancamento: '2005',
      length: '1h 30m',
      classif: 'Livre',
      diretor: 'S. Langley',
      produtoras: 'Disney, Pixar',
      roteiro: 'P. J. Conway'),
  MediaModel(
      title: 'Lightyear',
      description:
          'A origem do patrulheiro espacial de Toy Story, Buzz Lightyear. Buzz faz um teste de voo e acaba ficando abandonado em um planeta a milhões de anos-luz da terra. Agora ele precisa achar um jeito para voltar para casa enquanto luta contra a ameaça de Zurg.',
      urlSmallBanner:
          'https://br.web.img3.acsta.net/c_310_420/pictures/22/02/08/20/22/3222857.jpg',
      urlLongBanner:
          'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/847DC867FDFD8A176E78948B22D83336FCD2076A09E8554C7E6928FB8900E3C4/scale?width=600&aspectRatio=1.78&format=webp',
      isRecommended: false,
      isTrending: true,
      genre: Genre.comedy,
      mediaType: MediaType.movie,
      lancamento: '2022',
      length: '1h 21m',
      classif: 'Livre',
      diretor: 'V. Rust',
      produtoras: 'Disney, Pixar',
      roteiro: 'W. Sanchez'),
  MediaModel(
      title: 'Jungle Cruise – A Maldição nos Confins da Selva',
      description:
          '"Jungle Cruise – A Maldição nos Confins da Selva" da Disney é uma viagem pelo Amazonas muito divertida e recheada de emoções, na companhia do perspicaz capitão Frank Wolff e da intrépida investigadora Dra. Lily Houghton. Lily parte de Londres para a selva da Amazónia e contrata os serviços de qualidade duvidosa de Frank para a guiar rio abaixo no La Quila – o barco degradado, mas encantador, de Frank – com o objetivo de encontrar uma árvore antiga com capacidades curativas incomparáveis.',
      urlSmallBanner:
          'https://br.web.img3.acsta.net/c_310_420/pictures/21/07/29/21/41/4810979.jpg',
      urlLongBanner:
          'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/EABAFEFC17673ADD8AC2053629217114E1DA24EBB1FBF8A08EA702BEF97453B9/scale?width=600&aspectRatio=1.78&format=webp',
      isRecommended: false,
      isTrending: true,
      genre: Genre.comedy,
      mediaType: MediaType.movie,
      lancamento: '2023',
      length: '1h 30m',
      classif: '10 anos',
      diretor: 'S. Kyle',
      produtoras: 'Disney',
      roteiro: 'B. Smith'),
  MediaModel(
      title: 'Vingadores',
      description:
          'Loki, o irmão de Thor, ganha acesso ao poder ilimitado do cubo cósmico ao roubá-lo de dentro das instalações da S.H.I.E.L.D. Nick Fury, o diretor desta agência internacional que mantém a paz, logo reúne os únicos super-heróis que serão capazes de defender a Terra de ameaças sem precedentes. Homem de Ferro, Capitão América, Hulk, Thor, Viúva Negra e Gavião Arqueiro formam o time dos sonhos de Fury, mas eles precisam aprender a colocar os egos de lado e agir como um grupo em prol da humanidade.',
      urlSmallBanner:
          'https://br.web.img2.acsta.net/c_310_420/pictures/19/04/26/17/30/2428965.jpg',
      urlLongBanner:
          'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/66D8BB10CAF60D83CF4C046E8275561A7FD66BC220A06DF413AF54C942B323DD/scale?width=800&aspectRatio=1.78&format=png',
      isRecommended: false,
      isTrending: true,
      isWatched: true,
      genre: Genre.action,
      mediaType: MediaType.movie,
      lancamento: '2016',
      length: '2h 35m',
      classif: '13 anos',
      diretor: 'R. Russo',
      produtoras: 'Disney, MarvelStudios',
      roteiro: 'B. Russo'),
];

List<Map> listActors = [
  {
    'url': 'https://avatars.githubusercontent.com/u/137003398?v=4',
    'name': 'Wellington'
  },
  {
    'url': 'https://avatars.githubusercontent.com/u/82989763?v=4',
    'name': 'Matheus'
  },
  {
    'url': 'https://avatars.githubusercontent.com/u/132092648?v=4',
    'name': 'Dayane'
  },
  {
    'url': 'https://avatars.githubusercontent.com/u/17660137?v=4',
    'name': 'Wilmar'
  },
  {
    'url': 'https://avatars.githubusercontent.com/u/127806006?v=4',
    'name': 'Marcos'
  },
  {
    'url': 'https://avatars.githubusercontent.com/u/109772332?v=4',
    'name': 'Jair'
  },
  {
    'url': 'https://avatars.githubusercontent.com/u/102062191?v=4',
    'name': 'Everton'
  },
  {
    'url': 'https://avatars.githubusercontent.com/u/103072341?v=4',
    'name': 'Fabio'
  },
];
