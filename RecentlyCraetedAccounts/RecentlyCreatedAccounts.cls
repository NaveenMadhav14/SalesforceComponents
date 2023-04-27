public with sharing class RecentlyCreatedAccounts {
    public RecentlyCreatedAccounts() {    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        List<Account> listOfAccounts=new List<Account>();
        listOfAccounts=[SELECT Name,Type,Industry FROM Account WHERE CreatedDate=Last_N_Days:10];
        return listOfAccounts;
    }
}