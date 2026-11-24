import 'package:flutter/material.dart';

import '../data/receitas_mock.dart';
import '../models/receita.dart';
import '../widgets/receita_card.dart';
import 'detalhe_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _termo = '';
  bool _emGrade = false;

  @override
  Widget build(BuildContext context) {
    final receitas = filtrarPorNome(receitasMock, _termo);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SaborApp'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(
              _emGrade ? Icons.view_list : Icons.grid_view,
            ),
            onPressed: () {
              setState(() {
                _emGrade = !_emGrade;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (valor) {
                setState(() {
                  _termo = valor;
                });
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Buscar receita...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: receitas.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 55,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 10),
                        Text('Nenhuma receita encontrada'),
                      ],
                    ),
                  )
                : _emGrade
                    ? GridView.builder(
                        padding: const EdgeInsets.all(8),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.85,
                        ),
                        itemCount: receitas.length,
                        itemBuilder: (context, index) {
                          return criarCard(receitas[index], true);
                        },
                      )
                    : ListView.builder(
                        itemCount: receitas.length,
                        itemBuilder: (context, index) {
                          return criarCard(receitas[index], false);
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Widget criarCard(Receita receita, bool grade) {
    return ReceitaCard(
      receita: receita,
      emGrade: grade,
      onTap: () async {
        final favorito = await Navigator.push<bool>(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetalheScreen(receita: receita);
            },
          ),
        );

        if (!mounted) return;

        if (favorito == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${receita.nome} adicionada aos favoritos',
              ),
            ),
          );
        }
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Resumo rápido'),
              content: Text(
                '${receita.nome}\n'
                'Tempo: ${receita.tempoFormatado}\n'
                'Porções: ${receita.porcoes}\n'
                'Ingredientes: ${receita.ingredientes.length}',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Fechar'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
