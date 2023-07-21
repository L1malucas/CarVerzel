// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:mobile/Views/Components/car_preview.dart';
import 'package:mobile/Views/Pages/login_page.dart';

class CarListPage extends StatefulWidget {
  CarListPage({required this.isTokenValidado, required this.lenght, super.key});
  int lenght;
  bool isTokenValidado;

  CarListPage.withoutLength({required this.isTokenValidado, Key? key})
      : lenght = 0, 
        super(key: key);

  @override
  State<CarListPage> createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.manage_accounts,
            color: widget.isTokenValidado ? Colors.green : Colors.red,
          ),
          onPressed: () async {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('\t Vitrine'),
        actions: [
          IconButton(
              onPressed: () {
                debugPrint("FILTER BUTTON");
              },
              icon: const Icon(Icons.filter_alt))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(16.0),
                  width: double.infinity,
                  child: const Text(
                    'Recomendações',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
              Container(
                margin: const EdgeInsets.only(left: 12.0),
                height: 200,
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.lenght,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    return CarPreview(
                      carIndex: index,
                      height: 100,
                    );
                  },
                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
                  width: double.infinity,
                  child: const Text(
                    'Todos Carros Disponíveis',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: widget.lenght,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 20,
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    return CarPreview(carIndex: index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
