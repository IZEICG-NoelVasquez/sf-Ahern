// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);

public class RequestWrapper {
        public String   CompanyDB;
        public String UserName;
        public String Password;
}

RequestWrapper req =  new RequestWrapper();
req.CompanyDB = 'SALESFORCE';
req.UserName = 'sist01';
req.Password = '123456';

String r = JSON.serialize(req);
System.debug(r);
 AhernClient client = new AhernClient(
            'POST'
        );

 HttpResponse res = client.postDataToSAP(r);

 System.debug('res' + res);
 System.debug('res' + res.getBody());