import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-car-list',
  templateUrl: './car-list.component.html',
  styleUrls: ['./car-list.component.css'],
})
export class CarListComponent implements OnInit {
  cars: any[] = [];

  constructor(private http: HttpClient) {}

  ngOnInit() {
    this.fetchCars();
  }

  fetchCars() {
    const apiUrl = 'https://localhost:7094/api/carros';
    this.http.get<any[]>(apiUrl).subscribe(
      (data) => {
        this.cars = data;
      },
      (error) => {
        console.error('Error fetching cars:', error);
      }
    );
  }
}
