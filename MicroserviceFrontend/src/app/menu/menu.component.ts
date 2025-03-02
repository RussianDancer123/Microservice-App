import {Component, inject} from '@angular/core';
import Keycloak from 'keycloak-js';
import {RouterLink} from '@angular/router';

@Component({
  selector: 'app-menu',
  imports: [
    RouterLink
  ],
  templateUrl: './menu.component.html',
  styleUrl: './menu.component.css'
})
export class MenuComponent {

  private readonly keycloak = inject(Keycloak);

  logout() {
    this.keycloak.logout();
  }
}
