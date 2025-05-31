import {inject, Injectable} from '@angular/core';
import { CanActivate, Router, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import Keycloak from 'keycloak-js';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {
  constructor(private router: Router) {}

  private readonly keycloak = inject(Keycloak);

  async canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Promise<boolean> {
    const loggedIn = this.keycloak.authenticated;
    if (loggedIn) {
      return true;
    }
    this.keycloak.login({ redirectUri: window.location.origin + state.url });
    return false;
  }
}
