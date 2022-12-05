import 'package:doacao_front/controllers/doacao_controller.dart';
import 'package:doacao_front/controllers/home_page_controller.dart';
import 'package:doacao_front/service_reg.dart';
import 'package:doacao_front/services/conf_service.dart';
import 'package:doacao_front/widget/vazio_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  bool minhasDoacoes = false;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    getIt<ConfService>().isLogado().then(
          (value) => {
            if (!value)
              {
                Navigator.pushNamed(context, '/login'),
              }
          },
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
        actions: [
          ElevatedButton(
            onPressed: () async {
              await logout(context);
              setState(() {});
            },
            child: Text('Sair'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pushNamed(context, '/atualizar');
              setState(() {});
            },
            child: Text('Perfil'),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: FutureBuilder<dynamic>(
                future: widget.minhasDoacoes ? getMinhasDoacoes() : getDoacoes(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.minhasDoacoes ? 'Minhas Doações' : 'Doações',
                                style: TextStyle(fontSize: 22),
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      Navigator.pushNamed(context, '/cadastrarDoacao');
                                      setState(() {});
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.add),
                                        Text('Cadastrar Doação'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      widget.minhasDoacoes = !widget.minhasDoacoes;
                                      setState(() {});
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.list),
                                        Text(widget.minhasDoacoes ? 'Todas doacoes' : 'Minhas Doações'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: snapshot.data.length == 0
                              ? ConteudoVazio()
                              : ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: ListTile(
                                        title: Text('Titulo: ${snapshot.data[index]['descricao']}'),
                                        subtitle: Text('Unidade: ${snapshot.data[index]['unidade']}'),
                                        trailing: PopupMenuButton(
                                            tooltip: "Opções",
                                            itemBuilder: (context) => [
                                                  PopupMenuItem(
                                                    child: Text('Receber'),
                                                    value: 1,
                                                    enabled: !widget.minhasDoacoes,
                                                  ),
                                                  PopupMenuItem(
                                                    child: Text('Editar'),
                                                    value: 2,
                                                    enabled: widget.minhasDoacoes,
                                                  ),
                                                  PopupMenuItem(
                                                    child: Text('Excluir'),
                                                    value: 3,
                                                    enabled: widget.minhasDoacoes,
                                                  ),
                                                ],
                                            onSelected: (value) async {
                                              switch (value) {
                                                case 1:
                                                  await receberDoacoes(context, snapshot.data[index]['codigo']);
                                                  setState(() {});
                                                  break;
                                                case 2:
                                                  //await editarDoacao(snapshot.data[index]['id']);
                                                  //setState(() {});
                                                  break;
                                                case 3:
                                                  await deletarDoacoes(context, snapshot.data[index]['codigo']);
                                                  setState(() {});
                                                  break;
                                              }
                                            }),
                                        leading: snapshot.data[index]['doado']
                                            ? Icon(Icons.cancel, color: Colors.red)
                                            : Icon(Icons.done, color: Colors.green),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ],
                    );
                  }
                  return Text('Loading...');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
