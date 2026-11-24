import 'package:flutter/material.dart';
import '../models/receita.dart';

class DetalheScreen extends StatelessWidget {
  final Receita receita;

  const DetalheScreen({
    super.key,
    required this.receita,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receita.nome),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagem da receita
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  receita.imagemUrl,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 220,
                      width: double.infinity,
                      color: Colors.orange.shade100,
                      child: const Icon(
                        Icons.restaurant,
                        size: 80,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Nome
              Text(
                receita.nome,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // Informações
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  Chip(label: Text(receita.categoria)),
                  Chip(label: Text(receita.origem)),
                  Chip(label: Text(receita.tempoFormatado)),
                  Chip(label: Text(receita.dificuldade.rotulo)),
                  Chip(label: Text('${receita.porcoes} porções')),
                  if (receita.vegetariana)
                    const Chip(label: Text('Vegetariana')),
                ],
              ),

              const SizedBox(height: 24),

              // Ingredientes
              const Text(
                'Ingredientes',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              ...receita.ingredientes.map(
                (ingrediente) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                      ),
                      const SizedBox(width: 8),
                      Expanded(child: Text(ingrediente)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Modo de preparo
              const Text(
                'Modo de preparo',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                receita.modoPreparo,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 24),

              // Favoritar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  icon: const Icon(Icons.favorite),
                  label: const Text('Favoritar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
