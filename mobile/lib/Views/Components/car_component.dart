import 'package:flutter/material.dart';
import 'package:mobile/Models/car_model.dart';
import '../../Services/car_request.dart';
import '../Widgets/fixed_spacer_widget.dart';

class CarComponent extends StatefulWidget {
  const CarComponent({required this.carId, super.key});
  final int carId;
  @override
  State<CarComponent> createState() => _CarComponentState();
}

class _CarComponentState extends State<CarComponent> {
  final String texto = "blablablablabla";
  CarModel? _carModel;

  @override
  void initState() {
    super.initState();
    _loadCar();
  }

  Future<void> _loadCar() async {
    try {
      final carroModel = await CarrosApi.fetchCarro(widget.carId);
      setState(() {
        _carModel = carroModel;
      });
    } catch (e) {
      print('Error fetching carro details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Detalhes'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // MARCA
                FixedSpacer.vNormal(),
                _carModel?.marca != null
                    ? Text(
                        _carModel?.marca.toUpperCase() ??
                            'Marca não encontrada.',
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      )
                    : const CircularProgressIndicator(),
                // MODELO
                FixedSpacer.vSmallest(),
                _carModel?.modelo != null
                    ? Text(
                        _carModel?.modelo.toUpperCase() ??
                            'Marca não encontrada.',
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      )
                    : const CircularProgressIndicator(),
                // IMAGEM
                FixedSpacer.vNormal(),
                FixedSpacer.vBiggest(),
                Image.network(
                  'https://img.freepik.com/vetores-gratis/um-personagem-de-carro-de-desenho-animado_1308-133087.jpg?w=996&t=st=1689883518~exp=1689884118~hmac=55e86a0c6d990e038750d76cc67c6429f64fc3bb6de449c7a164140f94b95fec', // Verificação de nulo usando o operador de coalescência nula (??)
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                ),
                // PREÇO
                FixedSpacer.vBiggest(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: Colors.grey.shade900,
          ),
          width: double.infinity,
          child: _carModel?.marca != null
              ? Text(
                  'Preço R\$ ${_carModel?.preco}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
