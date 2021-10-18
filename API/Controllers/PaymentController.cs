using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using API.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebAPI.Controllers
{
   
    [ApiController]
    public class PaymentController : ControllerBase
    {
        [Route("API/Payment/Get")]
        //// GET: api/<ValuesController>
        [HttpGet]
        //public IEnumerable<string> Get()
        //{
        //    var contexts = new CodigoProgramTestContext();
        //    return new string[] { "value1", "value2" };
        //}
        public async Task<ActionResult<IEnumerable<TblPaymentMethod>>> Get()
        {
            var contexts = new ProgramTestContext();
            return await contexts.TblPaymentMethods.ToListAsync();
        }
        // GET api/<ValuesController>/5
        //[HttpGet("{id}")]
        //public string Get(int id)
        //{
        //    return "value";
        //}

        //// POST api/<ValuesController>
        //[HttpPost]
        //public void Post([FromBody] string value)
        //{
        //}

        //// PUT api/<ValuesController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        //// DELETE api/<ValuesController>/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}
    }
}
