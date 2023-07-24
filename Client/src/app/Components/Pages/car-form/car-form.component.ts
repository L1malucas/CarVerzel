import { Component } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { AuthService } from '../../../Services/auth.service';

@Component({
  selector: 'app-car-form',
  templateUrl: './car-form.component.html',
  styleUrls: ['./car-form.component.css'],
})
export class CarFormComponent {
  modelo: string = '';
  marca: string = '';
  preco: number = 0;
  foto: File | null = null;

  constructor(private http: HttpClient) {}

  onSubmit(): void {
    const formData = new FormData();
    formData.append('modelo', this.modelo);
    formData.append('marca', this.marca);
    formData.append('preco', this.preco.toString());
    if (this.foto) {
      formData.append('foto', this.foto, this.foto.name);
    }

    const apiUrl = 'https://carverzelapi.azurewebsites.net/api/carros';

    const token = new AuthService().getToken();

    console.log(token);
    const headers = new HttpHeaders({
      Authorization: `Bearer ${token}`,
    });

    this.http.post<any>(apiUrl, formData, { headers }).subscribe(
      (response) => {
        console.log('Carro enviado:', response);

        this.modelo = '';
        this.marca = '';
        this.preco = 0;
        this.foto = null;
      },
      (error) => {
        console.error('Erro ao enviar os dados request', error);
      }
    );
  }

  onFileSelected(event: any) {
    const token = new AuthService().getToken();
    if (!token) {
      console.log('Necessário login para editar');
      return;
    }

    const file = event.target.files[0];
    this.foto = file;
  }
}
