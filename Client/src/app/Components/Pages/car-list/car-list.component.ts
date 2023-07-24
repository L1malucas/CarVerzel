import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CarModel } from 'src/app/Models/car-model';
@Component({
  selector: 'app-car-list',
  templateUrl: './car-list.component.html',
  styleUrls: ['./car-list.component.css'],
})
export class CarListComponent implements OnInit {
  cars: CarModel[] = [];

  constructor(private http: HttpClient) {}

  ngOnInit() {
    this.fetchCars();
  }

  fetchCars() {
    const apiUrl = 'https://carverzelapi.azurewebsites.net/api/carros/preco';
    this.http.get<CarModel[]>(apiUrl).subscribe(
      (data) => {
        this.cars = data;
        console.log('carId[1]' + this.cars[0].carId);
      },
      (error) => {
        console.error('Erro na requisição:', error);
      }
    );
  }
}
