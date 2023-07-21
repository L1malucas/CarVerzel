import 'package:flutter/material.dart';
import '../../Models/car_model.dart';
import '../../Services/car_request.dart';
import '../Widgets/fixed_spacer_widget.dart';
import 'car_component.dart';

enum CarListType {
  allCars,
  carsByPrice,
}

//ignore: must_be_immutable
class CarPreview extends StatefulWidget {
  CarPreview({
    this.height,
    required this.carIndex,
    required this.carListType,
    Key? key,
  }) : super(key: key);

  double? height;
  int carIndex;
  CarListType carListType;
  @override
  State<CarPreview> createState() => _CarPreviewState();
}

class _CarPreviewState extends State<CarPreview> {
  List<CarModel> _carrosAll = [];
  List<CarModel> _carrosPrice = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      if (widget.carListType == CarListType.allCars && _carrosAll.isEmpty) {
        _carrosAll = await CarRequest.getAllCars();
      } else if (widget.carListType == CarListType.carsByPrice &&
          _carrosPrice.isEmpty) {
        _carrosPrice = await CarRequest.getCarPrice();
      }
      setState(() {});
    } catch (e) {
      debugPrint('Error fetching car details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<CarModel> carList;
    if (widget.carListType == CarListType.allCars) {
      carList = _carrosAll;
    } else if (widget.carListType == CarListType.carsByPrice) {
      carList = _carrosPrice;
    } else {
      carList = [];
    }

    CarModel car;
    if (carList.isNotEmpty && widget.carIndex < carList.length) {
      car = carList[widget.carIndex];
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

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
                      child: carList.isNotEmpty
                          ? Image.asset(
                              'assets/images/mock_car.png',
                              fit: BoxFit.cover,
                              height: widget.height,
                            )
                          : const LinearProgressIndicator(),
                    ),
                  ),
                ],
              ),
              FixedSpacer.vNormal(),
              SizedBox(
                width: double.infinity,
                height: 30,
                child: carList.isNotEmpty
                    ? Text('${car.marca}  ${car.modelo}')
                    : const LinearProgressIndicator(),
              ),
              SizedBox(
                height: 20,
                child: carList.isNotEmpty
                    ? Text(
                        'PREÇO R\$${car.preco}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : const LinearProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CarComponent(carId: car.id)));
      },
    );
  }
}
