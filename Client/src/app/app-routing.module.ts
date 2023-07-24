import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './Components/login/login.component';
import { CarFormComponent } from './Components/car-form/car-form.component';
import { CarEditComponent } from './Components/car-edit/car-edit.component';

const routes: Routes = [
  { path: '', redirectTo: 'car-list', pathMatch: 'full' },
  { path: 'login', component: LoginComponent },
  { path: 'add-car', component: CarFormComponent },
  { path: 'carros/:id', component: CarEditComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
