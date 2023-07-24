import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { Car } from 'src/app/Models/car-model';

@Component({
  selector: 'app-car-edit',
  templateUrl: './car-edit.component.html',
  styleUrls: ['./car-edit.component.css'],
})
export class CarEditComponent implements OnInit {
  car!: Car;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private http: HttpClient
  ) {}

  ngOnInit() {
    this.route.paramMap.subscribe((params) => {
      const carId = Number(params.get('id'));
      console.log('carid is ' + carId);
      if (!isNaN(carId)) {
        this.fetchCarData(carId);
      } else {
      }
    });
  }

  fetchCarData(carId: number) {
    const apiUrl = `https://carverzelapi.azurewebsites.net/api/carros/${carId}`;
    this.http.get<Car>(apiUrl).subscribe(
      (data) => {
        this.car = data;
      },
      (error) => {
        console.error('Erro na request:', error);
      }
    );
  }
  saveCar() {
    const apiUrl = `https://carverzelapi.azurewebsites.net/api/carros/${this.car.carId}`;
    this.http.put(apiUrl, this.car).subscribe(
      (data) => {
        console.log('Carro atualizado:', data);
        this.navigateToCarList();
      },
      (error) => {
        console.error('Erro na request:', error);
      }
    );
  }
  navigateToCarList() {
    this.router.navigate(['/car-list']); 
  }
}
