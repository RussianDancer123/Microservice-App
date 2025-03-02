import { Routes } from '@angular/router';
import {EntryChoiceListComponent} from './entry-choice-list/entry-choice-list.component'
import {HomeComponent} from './home/home.component';

export const routes: Routes = [
  { path: '', component: HomeComponent },
  {
    path: 'compendium',
    component: EntryChoiceListComponent,
    // canActivate: [canActivateAuthRole],
    data: { role: 'view-entries' }
  },
];
