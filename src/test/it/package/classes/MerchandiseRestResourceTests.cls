@isTest
public class MerchandiseRestResourceTests {

    static testmethod void testDoGetWithPathParameter() {
        Merchandise__c merchandise = new Merchandise__c();
        merchandise.Price__c = 1;
        merchandise.Total_Inventory__c = 2;

        insert merchandise;

        RestRequest request = new RestRequest();
        request.requestURI = 'Merchandise/' + merchandise.Id;

        RestContext.request = request;

        MerchandiseRestResource.doGet();
    }

    static testmethod void testDoGetWithRequestParameter() {
        Merchandise__c merchandise = new Merchandise__c();
        merchandise.Price__c = 1;
        merchandise.Total_Inventory__c = 2;

        insert merchandise;

        RestRequest request = new RestRequest();
        request.requestURI = 'Merchandise/';
        request.params.put('id', merchandise.Id);        

        RestContext.request = request;

        MerchandiseRestResource.doGet();
    }

    static testmethod void testDoGetWithoutParameter() {
        RestRequest request = new RestRequest();
        request.requestURI = 'Merchandise/';

        RestContext.request = request;

        try {
            MerchandiseRestResource.doGet();
        } catch (Exception e) {
            // expected
        }
    }

    static testmethod void testDoPatch() {
        Merchandise__c merchandise = new Merchandise__c();
        merchandise.Price__c = 1;
        merchandise.Total_Inventory__c = 2;

        insert merchandise;

        MerchandiseRestResource.doPatch(merchandise);
    }
}