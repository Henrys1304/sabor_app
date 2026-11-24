import '../models/receita.dart';

const List<Receita> receitasMock = [
  Receita(
    id: '1',
    nome: 'Empadão de Frango',
    categoria: 'Almoço',
    origem: 'Brasileira',
    imagemUrl: '',
    tempoMinutos: 90,
    dificuldade: Dificuldade.media,
    ingredientes: [
      '500g de farinha de trigo',
      '250g de manteiga',
      '500g de frango desfiado',
      '1 tomate',
      '1 cebola',
      '1 lata de milho',
      'Sal a gosto',
    ],
    modoPreparo: 'Misture a farinha com a manteiga até formar uma massa. '
        'Prepare o recheio com o frango, tomate, cebola e milho. '
        'Coloque parte da massa em uma forma, adicione o recheio '
        'e cubra com o restante da massa. Leve ao forno até dourar.',
    porcoes: 6,
    vegetariana: false,
  ),
  Receita(
    id: '2',
    nome: 'Brigadeiro',
    categoria: 'Sobremesa',
    origem: 'Brasileira',
    imagemUrl: '',
    tempoMinutos: 30,
    dificuldade: Dificuldade.facil,
    ingredientes: [
      '1 lata de leite condensado',
      '3 colheres de chocolate em pó',
      '1 colher de manteiga',
      'Chocolate granulado',
    ],
    modoPreparo: 'Coloque o leite condensado, o chocolate e a manteiga '
        'em uma panela. Mexa em fogo baixo até desgrudar do fundo. '
        'Espere esfriar e faça pequenas bolinhas. Passe no granulado.',
    porcoes: 20,
    vegetariana: true,
  ),
  Receita(
    id: '3',
    nome: 'Bolo de Cenoura',
    categoria: 'Lanche',
    origem: 'Brasileira',
    imagemUrl: '',
    tempoMinutos: 45,
    dificuldade: Dificuldade.facil,
    ingredientes: [
      '3 cenouras',
      '3 ovos',
      '2 xícaras de açúcar',
      '2 xícaras de farinha de trigo',
      '1 xícara de óleo',
      '1 colher de fermento',
    ],
    modoPreparo: 'Bata as cenouras, os ovos e o óleo no liquidificador. '
        'Misture com o açúcar e a farinha em uma tigela. '
        'Acrescente o fermento e leve ao forno até assar.',
    porcoes: 10,
    vegetariana: true,
  ),
  Receita(
    id: '4',
    nome: 'Strogonoff de Frango',
    categoria: 'Almoço',
    origem: 'Brasileira',
    imagemUrl: '',
    tempoMinutos: 50,
    dificuldade: Dificuldade.facil,
    ingredientes: [
      '500g de peito de frango',
      '1 caixa de creme de leite',
      '3 colheres de molho de tomate',
      '1 cebola',
      'Alho',
      'Sal a gosto',
    ],
    modoPreparo:
        'Corte o frango em pedaços pequenos. Refogue a cebola e o alho. '
        'Adicione o frango e deixe cozinhar. Acrescente o molho de tomate '
        'e o creme de leite. Misture bem e sirva.',
    porcoes: 4,
    vegetariana: false,
  ),
  Receita(
    id: '5',
    nome: 'Pão de Queijo',
    categoria: 'Lanche',
    origem: 'Mineira',
    imagemUrl: '',
    tempoMinutos: 45,
    dificuldade: Dificuldade.media,
    ingredientes: [
      '500g de polvilho doce',
      '250ml de leite',
      '100ml de óleo',
      '2 ovos',
      '200g de queijo',
      'Sal a gosto',
    ],
    modoPreparo: 'Aqueça o leite com o óleo e misture ao polvilho. '
        'Depois que esfriar, acrescente os ovos, o queijo e o sal. '
        'Faça pequenas bolinhas e leve ao forno até dourar.',
    porcoes: 20,
    vegetariana: true,
  ),
  Receita(
    id: '6',
    nome: 'Pudim de Leite Condensado',
    categoria: 'Sobremesa',
    origem: 'Brasileira',
    imagemUrl: '',
    tempoMinutos: 90,
    dificuldade: Dificuldade.media,
    ingredientes: [
      '1 lata de leite condensado',
      '2 medidas de leite',
      '3 ovos',
      '1 xícara de açúcar',
    ],
    modoPreparo: 'Derreta o açúcar em uma panela até formar uma calda. '
        'Bata o leite condensado, o leite e os ovos no liquidificador. '
        'Coloque na forma caramelizada e asse em banho-maria. '
        'Depois de esfriar, leve à geladeira.',
    porcoes: 8,
    vegetariana: true,
  ),
];

List<Receita> filtrarPorNome(List<Receita> receitas, String termo) {
  final busca = termo.trim().toLowerCase();

  if (busca.isEmpty) return receitas;

  return receitas.where((r) => r.nome.toLowerCase().contains(busca)).toList();
}
