public with sharing class AhernClient {
   
        public String BASE_URL = [SELECT IsSandbox FROM Organization LIMIT 1]
            .IsSandbox
            ? 'https://162.217.196.170:50000//b1s/v2/Login'
            : 'https://34.211.108.45/b1s/v2/Login';
        public String endpoint;
        public String method;
        public String body;
        public String requestBody;
        public String urlToConsume;
        public String params;
    
        public AhernClient(String method) {
            this.urlToConsume = this.BASE_URL + endpoint;
            this.method = method;
        }
    

  
        public HttpResponse postDataToSAP(String body) {
            HttpRequest request = makeRequestWithPayload(body);
            HttpResponse response = send(request);
    
            return response;
        }
       
    
        public HttpRequest makeRequestWithPayload(String body) {
            HttpRequest request = new HttpRequest();
            request.setEndpoint(this.BASE_URL);
            request.setMethod(method);
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');
            request.setBody(body);
            request.setTimeout(120000);
    
            return request;
        }
    
        
    
        public HttpResponse send(HttpRequest request) {
            Http http = new Http();
            HttpResponse response = http.send(request);
            return response;
        }
    
}