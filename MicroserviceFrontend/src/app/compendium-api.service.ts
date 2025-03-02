import {inject, Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';
import {IEntry} from '../interfaces/IEntry';
import {environment} from '../environments/environment.development';
import {Entries} from './entries';

@Injectable({
  providedIn: 'root'
})
export class CompendiumApiService {

  private http: HttpClient = inject(HttpClient);

  constructor() {}

  getEntries(entry: Entries): Observable<IEntry[]> {
    const url: string = `${environment.apiUrl}/compendium/${entry}`;
    return this.http.get<IEntry[]>(url);
  }
}
