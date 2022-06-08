import 'package:mobile_ui/controller/base_api.dart';
import 'package:mobile_ui/models/invoice.dart';


class InvoiceController {
  InvoiceController._();
  static Future< List<Invoice> > getInvoices(int user_id) async {   
    String invoice = "/invoice";
    BaseAPI _baseAPI = BaseAPI();
        List<Invoice> invoices = [];

    await _baseAPI.getData(invoice, params: {'user_id' : user_id}).then((value) {
      if (value.apiStatus == API_STATUS.SUSSCESSED) {
        value.object.forEach((element) {        
          invoices.add(Invoice.fromJson(element));
        }); 
        print("length =  "+ invoices.length.toString());
      }
     
    });
    return invoices;
  }
}