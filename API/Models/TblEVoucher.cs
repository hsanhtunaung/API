using System;
using System.Collections.Generic;

#nullable disable

namespace API.Models
{
    public partial class TblEVoucher
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public DateTime ExpiryDate { get; set; }
        public string Image { get; set; }
        public decimal Amount { get; set; }
        public int PaymentMethodId { get; set; }
        public int Quantity { get; set; }
        public int BuyTypeId { get; set; }
        public bool? InActive { get; set; }
        public DateTime? CreatedDate { get; set; }
        public virtual TblBuyType BuyType { get; set; }
        public virtual TblPaymentMethod PaymentMethod { get; set; }

        public TblEVoucher()
        {
            //BuyType = new TblBuyType();
            //PaymentMethod = new TblPaymentMethod();
        }
    }
}
