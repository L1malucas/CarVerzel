import 'package:flutter/material.dart';
import 'package:mobile/Views/Components/car_component.dart';

import '../Widgets/fixed_spacer.dart';

//ignore: must_be_immutable
class CarPreview extends StatefulWidget {
  CarPreview({this.height, required this.carIndex, super.key});

  double? height;
  int carIndex;

  @override
  State<CarPreview> createState() => _CarPreviewState();
}

class _CarPreviewState extends State<CarPreview> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.only(left: 4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26, width: 0.5),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      //PATH DA IMAGEM
                      child: Image.network(
                        'https://img.freepik.com/vetores-gratis/um-personagem-de-carro-de-desenho-animado_1308-133087.jpg?w=996&t=st=1689883518~exp=1689884118~hmac=55e86a0c6d990e038750d76cc67c6429f64fc3bb6de449c7a164140f94b95fec',
                        fit: BoxFit.cover,
                        height: widget.height,
                      ),
                    ),
                  ),
                ],
              ),
              // Container(
              //),
              FixedSpacer.vNormal(),
              SizedBox(
                width: double.infinity,
                height: 30,
                child: Text('MARCA + MODELO ${widget.carIndex}'),
              ),
              SizedBox(
                height: 20,
                child: Text(
                  'PREÇO R\$${widget.carIndex}',
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CarComponent(index: widget.carIndex)));
      },
    );
  }
}
