using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using API.Models;
using Microsoft.AspNetCore.Authorization;

namespace API.Controllers
{
    [Authorize]
    //[Route("api/[controller]")]
    [ApiController]
    public class eVoucherController : ControllerBase
    {
        [Route("API/eVoucher/GetVoucher")]
        //// GET: api/<ValuesController>
        [HttpGet]      
        public async Task<ActionResult<IEnumerable<TblEVoucher>>> GetVoucher()
        {
            var contexts = new ProgramTestContext();          
            var lst = await contexts.TblEVouchers.Include(x => x.PaymentMethod).Include(a=>a.BuyType).ToListAsync();
            return lst;
        }

        [Route("API/eVoucher/Get")]
        //// GET: api/<ValuesController>
        [HttpGet]
        public  ActionResult<IEnumerable<TblEVoucher>> Get()
        {
            var contexts = new ProgramTestContext();
            List<TblEVoucher> lst = new List<TblEVoucher>();
            var cc = contexts.TblEVouchers.Include(x => x.PaymentMethod).Include(a => a.BuyType).ToList();
            foreach (TblEVoucher e in cc)
            {
                TblEVoucher model = new TblEVoucher();
                model.Id = e.Id;
                model.Title = e.Title;
                model.Description = e.Description;
                model.Amount = e.Amount;
                model.ExpiryDate = e.ExpiryDate;
                model.Quantity = e.Quantity;
                model.BuyTypeId = e.BuyType.Id;                
                model.PaymentMethodId = e.PaymentMethod.Id;
                model.BuyType = e.BuyType;
                model.PaymentMethod = e.PaymentMethod;                
                model.CreatedDate = e.CreatedDate;
                model.InActive = e.InActive;
                model.Image = e.Image;
                lst.Add(model);
            }
            return lst;
        }


        [Route("API/eVoucher/GetPaymentMethod")]
        //// GET: api/<ValuesController>
        [HttpGet]      
        public async Task<ActionResult<IEnumerable<TblPaymentMethod>>> GetPaymentMethod()
        {
            var contexts = new ProgramTestContext();
            return await contexts.TblPaymentMethods.ToListAsync();
        }

        [Route("API/eVoucher/GetBuyType")]
        //// GET: api/<ValuesController>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TblBuyType>>> GetBuyType()
        {
            var contexts = new ProgramTestContext();
            return await contexts.TblBuyTypes.ToListAsync();
        }


        [Route("API/eVoucher/GetByID")]    
        [HttpGet]
        public TblEVoucher GetByID(int id)
        {
            var contexts = new ProgramTestContext();                
            var e = contexts.TblEVouchers.Where(a => a.Id == id).Include(x => x.BuyType).Include(a=>a.PaymentMethod).FirstOrDefault();
                       
            TblEVoucher model = new TblEVoucher();
            model.Id = e.Id;
            model.Title = e.Title;
            model.Description = e.Description;
            model.Amount = e.Amount;
            model.ExpiryDate = e.ExpiryDate;
            model.Quantity = e.Quantity;
            model.BuyTypeId = e.BuyType.Id;
            model.BuyType = e.BuyType;
            model.PaymentMethodId = e.PaymentMethod.Id;
            model.PaymentMethod = e.PaymentMethod;
            model.CreatedDate = e.CreatedDate;
            model.InActive = e.InActive;
            model.Image = e.Image;               
           

            return model;
        }


        [Route("API/eVoucher/Delete")]
        [HttpDelete]
        public HttpResponseMessage Delete(int id)
        {
            HttpRequestMessage request = new HttpRequestMessage();

            try
            {
                var context = new ProgramTestContext();
                context.TblEVouchers.Remove(context.TblEVouchers.Find(id));
                context.SaveChanges();              
                return new HttpResponseMessage(HttpStatusCode.OK);
            }
            catch (Exception ex)
            {

                return new HttpResponseMessage(HttpStatusCode.BadRequest);
            }
        }


        [Route("API/eVoucher/Post")]
        [HttpPost]
        public HttpResponseMessage Post([FromBody] TblEVoucher evoucher)
        {            
            try
            {
                var context = new ProgramTestContext();              
                var id = Guid.NewGuid();
                // insert
                using (var db = new ProgramTestContext())
                {
                    var customers = db.Set<TblEVoucher>();
                    customers.Add(new TblEVoucher { Title = evoucher.Title,Description=evoucher.Description,Amount=evoucher.Amount,ExpiryDate=evoucher.ExpiryDate,PaymentMethodId=evoucher.PaymentMethodId,BuyTypeId=evoucher.BuyTypeId ,Quantity=evoucher.Quantity,Image=evoucher.Image});
                    db.SaveChanges();
                }
                return new HttpResponseMessage(HttpStatusCode.OK);
            }
            catch(Exception ex)
            {
                return new HttpResponseMessage(HttpStatusCode.BadRequest);
            }
        }


        [Route("API/eVoucher/Put")]
        [HttpPut]
        public HttpResponseMessage Update([FromBody] TblEVoucher evoucher)
        {
            try
            {
                CultureInfo culture = new CultureInfo("en-US");
               // DateTime todaydate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-mm-dd HH:mm:ss.fff"), culture);

               // DateTime todaydate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-mm-dd HH:mm:ss.fff"));
               // DateTime todaydate = DateTime.ParseExact("12/02/21 10:56:09", "yy/MM/dd HH:mm:ss",CultureInfo.InvariantCulture).ToString("MMM. dd, yyyy HH:mm:ss");
                var evouchermodel=new  TblEVoucher {Id=evoucher.Id,Title = evoucher.Title, Description = evoucher.Description, Amount = evoucher.Amount, ExpiryDate = evoucher.ExpiryDate, PaymentMethodId = evoucher.PaymentMethodId, BuyTypeId = evoucher.BuyTypeId, Quantity = evoucher.Quantity, Image = evoucher.Image,InActive=evoucher.InActive};

                using (var contexts = new ProgramTestContext())
                {
                    contexts.Entry(evouchermodel).State = EntityState.Modified;
                    // Do some more work...  
                    contexts.SaveChanges();
                }
                return new HttpResponseMessage(HttpStatusCode.OK);            }
            catch (Exception ex)
            {
                return new HttpResponseMessage(HttpStatusCode.BadRequest);
            }
        }
    }
}
