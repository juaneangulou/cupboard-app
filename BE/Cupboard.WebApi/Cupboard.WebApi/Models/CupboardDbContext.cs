using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Cupboard.WebApi.Models;


    public class ApplicationUser : IdentityUser
    {
        public string FirstName { get; set; }
        public string SecondName { get; set; }
        public string FirstLastName { get; set; }
        public string SecondLastName { get; set; }
        public ICollection<Product> Products { get; set; }
        public ICollection<ShoppingList> ShoppingLists { get; set; }
        public ICollection<SharedPantry> SharedPantries { get; set; }
    }

    public class Product
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public string Brand { get; set; }
        public string BarCode { get; set; }
        public int CategoryId { get; set; }
        public Category Category { get; set; }
    }

    public class Category
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public ICollection<Product> Products { get; set; }
    }

    public class ShoppingList
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string UserId { get; set; }
        public ApplicationUser User { get; set; }
        public ICollection<Product> Products { get; set; }
    }

    public class SharedPantry
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string UserId { get; set; }
        public ApplicationUser User { get; set; }
        public ICollection<Product> Products { get; set; }
    }

    public class Inventory
    {
        public string Id { get; set; }
        public string UserId { get; set; }
        public ApplicationUser User { get; set; }
        public ICollection<InventoryItem> Items { get; set; }
    }

    public class InventoryItem
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public string BarCode { get; set; }
        public int Quantity { get; set; } // Cantidad en el inventario
        public DateTime ExpirationDate { get; set; }
        public string StoreId { get; set; } // Tienda o ubicación del artículo
        public Store Store { get; set; }
        public int CategoryId { get; set; }
        public Category Category { get; set; }
    }

    public class Store
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Type { get; set; } // Tipo de tienda (supermercado, negocio, almacén, farmacia, etc.)
        public string Phone { get; set; }
        public ICollection<InventoryItem> InventoryItems { get; set; }
    }

    public class CupboardDbContext : IdentityDbContext<ApplicationUser>
    {
        public CupboardDbContext(DbContextOptions<CupboardDbContext> options) : base(options)
        {
        }

        public DbSet<Product> Products { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<ShoppingList> ShoppingLists { get; set; }
        public DbSet<SharedPantry> SharedPantries { get; set; }
        public DbSet<Inventory> Inventories { get; set; }
        public DbSet<InventoryItem> InventoryItems { get; set; }
        public DbSet<Store> Stores { get; set; }
    }
