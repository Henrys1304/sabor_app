import 'package:flutter/material.dart';
import '../models/receita.dart';

class ReceitaCard extends StatelessWidget {
  final Receita receita;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final bool emGrade;

  const ReceitaCard({
    super.key,
    required this.receita,
    required this.onTap,
    required this.onLongPress,
    this.emGrade = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: emGrade
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      receita.imagemUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Text(receita.nome[0]),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    receita.nome,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(receita.categoria),
                  Text(receita.tempoFormatado),
                ],
              )
            : Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      receita.imagemUrl,
                      width: 72,
                      height: 72,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return CircleAvatar(
                          radius: 36,
                          child: Text(receita.nome[0]),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          receita.nome,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${receita.categoria} • ${receita.origem}',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Row(
                          children: [
                            Icon(Icons.timer, size: 16),
                            Text(' ${receita.tempoFormatado}'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.signal_cellular_alt,
                              size: 16,
                            ),
                            Text(' ${receita.dificuldade.rotulo}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right),
                ],
              ),
      ),
    );
  }
}
