import { LightningElement, track } from 'lwc';
import getAccounts from '@salesforce/apex/RecentlyCreatedAccounts.getAccounts';

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Type', fieldName: 'Type' },
    { label: 'Industry', fieldName: 'Industry' }
];

export default class RecentlyCreatedAccounts extends LightningElement {
    @track data;
    @track error;
    @track columns = columns;

    connectedCallback() {
        getAccounts()
        .then(result => {
            this.data = result;
            this.error = undefined;
        })
        .catch(error => {
            console.log('this.error :'+error);
            this.error = error;
            this.data = undefined;
        });
    }
}