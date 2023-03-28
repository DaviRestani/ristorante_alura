import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/highlight_item.dart';

class HighLights extends StatelessWidget {
  const HighLights({super.key});
  final List itens = destaques;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Destaques",
                style: TextStyle(fontFamily: "Caveat", fontSize: 32),
                textAlign: TextAlign.center,
              ),
            )),
            MediaQuery.of(context).orientation == Orientation.landscape
                ? _landscapeList()
                : _portraitList()
          ],
        ));
  }
}

class _portraitList extends StatelessWidget {
  const _portraitList({super.key});
  final List itens = destaques;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return HighlightItem(
              imageURI: itens[index]['image'],
              itemTitle: itens[index]['name'],
              itemPrice: itens[index]['price'],
              itemDescription: itens[index]['description']);
        },
        childCount: itens.length,
      ),
    );
  }
}

class _landscapeList extends StatelessWidget {
  const _landscapeList({super.key});
  final List itens = destaques;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return HighlightItem(
            imageURI: itens[index]['image'],
            itemTitle: itens[index]['name'],
            itemPrice: itens[index]['price'],
            itemDescription: itens[index]['description'],
          );
        }, childCount: itens.length),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.6,
        ));
  }
}
