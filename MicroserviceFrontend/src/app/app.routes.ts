import { Routes } from '@angular/router';
import {EntryChoiceListComponent} from './entry-choice-list/entry-choice-list.component'
import {HomeComponent} from './home/home.component';
import {AuthGuard} from '../auth/authGuard';

export const routes: Routes = [
  { path: '', component: HomeComponent },
  {
    path: 'compendium',
    component: EntryChoiceListComponent,
    canActivate: [AuthGuard],
    data: { role: 'view-entries' }
  },
];
