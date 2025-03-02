import {Component, inject, OnInit} from '@angular/core';
import { RouterOutlet } from '@angular/router';
import {EntryChoiceListComponent} from './entry-choice-list/entry-choice-list.component';
import {KeycloakService} from 'keycloak-angular';
import {NgIf} from '@angular/common';
import {environment} from '../environments/environment.development';
import {MenuComponent} from './menu/menu.component';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, EntryChoiceListComponent, MenuComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent{
  title = 'MicroserviceFrontend';

  constructor() {
  }


}
