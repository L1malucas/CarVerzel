import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { CarListComponent } from './Components/Pages/car-list/car-list.component';
import { NavbarComponent } from './Components/navbar/navbar.component';
import { LoginComponent } from './Components/Pages/login/login.component';
import { FormsModule } from '@angular/forms';
import { CarFormComponent } from './Components/Pages/car-form/car-form.component';
import { CarEditComponent } from './Components/Pages/car-edit/car-edit.component';
@NgModule({
  declarations: [
    AppComponent,
    CarListComponent,
    NavbarComponent,
    LoginComponent,
    CarFormComponent,
    CarEditComponent,
  ],
  imports: [BrowserModule, AppRoutingModule, HttpClientModule, FormsModule],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
