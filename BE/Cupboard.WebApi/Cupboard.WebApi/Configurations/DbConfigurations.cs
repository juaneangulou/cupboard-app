using Microsoft.EntityFrameworkCore;
using Cupboard.WebApi.Literals;
using Cupboard.WebApi.Models;

namespace Cupboard.WebApi.Configurations;

public static class DbConfigurations
{
    public static IServiceCollection SetDatabaseConfiguration(this IServiceCollection services)
    {
        //var connectionString = Environment.GetEnvironmentVariable(MyVaccineLiterals.CONNECTION_STRING);
        var connectionString = "Server=localhost,1433;Database=CupboardDb;User Id=sa;Password=Abc.123456;TrustServerCertificate=True;";
        services.AddDbContext<CupboardDbContext>(options =>
                    options.UseSqlServer(
                                connectionString
                                )
                    );
        return services;
    }
}
