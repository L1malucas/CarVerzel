import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { CarFormComponent } from './car-form/car-form.component';

const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'add-car', component: CarFormComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
