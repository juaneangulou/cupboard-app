using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.IdentityModel.Tokens;
using Cupboard.WebApi.Literals;
using Cupboard.WebApi.Models;

namespace Cupboard.WebApi.Configurations;

public static class AuthConfigurations
{
    public static IServiceCollection SetMyVaccineAuthConfiguration(this IServiceCollection services)
    {
        services.AddIdentity<ApplicationUser, IdentityRole>(options =>
        {
            options.Password.RequireDigit = true;
            options.Password.RequireLowercase = true;
            options.Password.RequireUppercase = true;
            options.Password.RequiredLength = 8;
            options.User.RequireUniqueEmail = false;
            options.User.AllowedUserNameCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._@+";

            //options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(15);
            //options.Lockout.MaxFailedAccessAttempts = 5;
        }
        ).AddEntityFrameworkStores<CupboardDbContext>()
        .AddDefaultTokenProviders();

        services.AddAuthentication(options =>
        {
            options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
            options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
        }).AddJwtBearer(options =>
        {
            options.TokenValidationParameters = new TokenValidationParameters
            {
                ValidateIssuer = false,
                ValidateAudience = false,
                ValidateLifetime = true,
                ValidateIssuerSigningKey = true,
                //ValidIssuer = "tu_issuer",
                //ValidAudience = "tu_audience",
                IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Environment.GetEnvironmentVariable(CupboardLiterals.JWT_KEY))),
                //ClockSkew = TimeSpan.Zero // Evita un desfase de tiempo (opcional)
            };
        });
        return services;
    }
}
