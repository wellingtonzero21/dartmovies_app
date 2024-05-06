class MediaModel {
  String title;
  String description;
  String urlSmallBanner;
  String urlLongBanner;
  bool isRecommended; //FILME e Serie 'Recomendado'
  bool isTrending; //FILME e Serie 'Em alta'
  bool isBanner; //FILME e Serie 'Banner'
  bool isWatched; //FILME e Serie 'Assistido'

  MediaModel({
    required this.title,
    required this.description,
    required this.urlSmallBanner,
    required this.urlLongBanner,
    this.isRecommended = false,
    this.isTrending = false,
    this.isBanner = false,
    this.isWatched = false,
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

List<MediaModel> listMedia = [
  MediaModel(
    title: 'Vingadores',
    description:
        'Loki, o irmão de Thor, ganha acesso ao poder ilimitado do cubo cósmico ao roubá-lo de dentro das instalações da S.H.I.E.L.D. Nick Fury, o diretor desta agência internacional que mantém a paz, logo reúne os únicos super-heróis que serão capazes de defender a Terra de ameaças sem precedentes. Homem de Ferro, Capitão América, Hulk, Thor, Viúva Negra e Gavião Arqueiro formam o time dos sonhos de Fury, mas eles precisam aprender a colocar os egos de lado e agir como um grupo em prol da humanidade.',
    urlSmallBanner:
        'https://a-static.mlcdn.com.br/470x352/poster-cartaz-procurando-nemo-a-pop-arte-poster/poparteskins2/15938519106/0b6f2e7a405e73bf91aca0f91ef37dba.jpeg',
    urlLongBanner:
        'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/8888E4F30719D6A82CD519D1AA6377105DDD9119FF24DB0D20769A6A153C0ED1/scale?width=600&aspectRatio=1.78&format=png',
    isRecommended: false,
    isTrending: false,
    isBanner: true,
  ),
  MediaModel(
    title: 'Vingadores',
    description:
        'Loki, o irmão de Thor, ganha acesso ao poder ilimitado do cubo cósmico ao roubá-lo de dentro das instalações da S.H.I.E.L.D. Nick Fury, o diretor desta agência internacional que mantém a paz, logo reúne os únicos super-heróis que serão capazes de defender a Terra de ameaças sem precedentes. Homem de Ferro, Capitão América, Hulk, Thor, Viúva Negra e Gavião Arqueiro formam o time dos sonhos de Fury, mas eles precisam aprender a colocar os egos de lado e agir como um grupo em prol da humanidade.',
    urlSmallBanner:
        'https://br.web.img2.acsta.net/c_310_420/pictures/19/04/26/17/30/2428965.jpg',
    urlLongBanner:
        'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/66D8BB10CAF60D83CF4C046E8275561A7FD66BC220A06DF413AF54C942B323DD/scale?width=800&aspectRatio=1.78&format=png',
    isRecommended: true,
    isTrending: false,
  ),
  MediaModel(
    title: 'Vingadores',
    description:
        'Loki, o irmão de Thor, ganha acesso ao poder ilimitado do cubo cósmico ao roubá-lo de dentro das instalações da S.H.I.E.L.D. Nick Fury, o diretor desta agência internacional que mantém a paz, logo reúne os únicos super-heróis que serão capazes de defender a Terra de ameaças sem precedentes. Homem de Ferro, Capitão América, Hulk, Thor, Viúva Negra e Gavião Arqueiro formam o time dos sonhos de Fury, mas eles precisam aprender a colocar os egos de lado e agir como um grupo em prol da humanidade.',
    urlSmallBanner:
        'https://br.web.img2.acsta.net/c_310_420/pictures/19/04/26/17/30/2428965.jpg',
    urlLongBanner:
        'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/66D8BB10CAF60D83CF4C046E8275561A7FD66BC220A06DF413AF54C942B323DD/scale?width=800&aspectRatio=1.78&format=png',
    isRecommended: true,
    isTrending: false,
  ),
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
  ),
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
  ),
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
  ),
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
  ),
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
  ),
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
  ),
  MediaModel(
    title: 'Mercenarios',
    description:
        'Loki, o irmão de Thor, ganha acesso ao poder ilimitado do cubo cósmico ao roubá-lo de dentro das instalações da S.H.I.E.L.D. Nick Fury, o diretor desta agência internacional que mantém a paz, logo reúne os únicos super-heróis que serão capazes de defender a Terra de ameaças sem precedentes. Homem de Ferro, Capitão América, Hulk, Thor, Viúva Negra e Gavião Arqueiro formam o time dos sonhos de Fury, mas eles precisam aprender a colocar os egos de lado e agir como um grupo em prol da humanidade.',
    urlSmallBanner:
        'https://br.web.img2.acsta.net/c_310_420/pictures/19/04/26/17/30/2428965.jpg',
    urlLongBanner:
        'https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/66D8BB10CAF60D83CF4C046E8275561A7FD66BC220A06DF413AF54C942B323DD/scale?width=800&aspectRatio=1.78&format=png',
    isRecommended: false,
    isTrending: true,
    isWatched: true,
  ),
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
  ),
];

List<Map> listActors = [
  {
    'url':
        'https://rollingstone.uol.com.br/media/uploads/luca-divulgacao-disney_1.jpg',
    'name': 'Wellington'
  },
  {
    'url':
        'https://rollingstone.uol.com.br/media/uploads/luca-divulgacao-disney_1.jpg',
    'name': 'Matheus'
  },
  {
    'url':
        'https://rollingstone.uol.com.br/media/uploads/luca-divulgacao-disney_1.jpg',
    'name': 'Dayane'
  },
  {
    'url':
        'https://rollingstone.uol.com.br/media/uploads/luca-divulgacao-disney_1.jpg',
    'name': 'Wilmar'
  },
  {
    'url':
        'https://rollingstone.uol.com.br/media/uploads/luca-divulgacao-disney_1.jpg',
    'name': 'Marcos'
  },
  {
    'url':
        'https://rollingstone.uol.com.br/media/uploads/luca-divulgacao-disney_1.jpg',
    'name': 'Jair'
  },
  {
    'url':
        'https://rollingstone.uol.com.br/media/uploads/luca-divulgacao-disney_1.jpg',
    'name': 'Everton'
  },
  {
    'url':
        'https://rollingstone.uol.com.br/media/uploads/luca-divulgacao-disney_1.jpg',
    'name': 'Fabio'
  },
];
