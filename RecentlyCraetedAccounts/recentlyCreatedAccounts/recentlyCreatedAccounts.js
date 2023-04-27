import { LightningElement, track } from 'lwc';
import getAccounts from '@salesforce/apex/RecentlyCreatedAccounts.getAccounts';

const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Type', fieldName: 'Type' },
    { label: 'Industry', fieldName: 'Industry' }
];

export default class RecentlyCreatedAccounts extends LightningElement {
    @track data;
    @track columns = columns;

    connectedCallback() {
        getAccounts()
        .then(result => {
            this.data = result;
        })
        //console.log('this.result :'+result);
        //this.data = data;
        //this.columns = this.data;
        console.log('this.data :'+this.data);
    }
}