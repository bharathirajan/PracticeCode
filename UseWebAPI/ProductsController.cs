using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace UseWebAPI
{
    public class ProductsController : ApiController
    {
        product[] products = new product[]
        {
            new product {Id=1, Category="Speaker", Name="Sony", Price=10 },
            new product {Id=2, Category="TV", Name="LG", Price=200 },
            new product {Id=3, Category="Laptop", Name="Mac", Price=30 }
        };

        public IEnumerable<product> GetAllProducts()
        {
            return products;
        }

        public product GetProductById(int id)
        {
            var product = products.FirstOrDefault((p) => p.Id == id);
            if (product == null)
            {
                throw new HttpRequestException(HttpStatusCode.NotFound.ToString());
            }
            return product;
        }

        public IEnumerable<product> GetProductsByCategory(string cat)
        {
            return products.Where(
                (p) => string.Equals(p.Category,cat,StringComparison.OrdinalIgnoreCase));
        }

    }
}