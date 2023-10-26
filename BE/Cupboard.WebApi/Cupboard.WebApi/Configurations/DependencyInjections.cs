using Cupboard.WebApi.Repositories.Contracts;
using Cupboard.WebApi.Repositories.Implementations;
using Cupboard.WebApi.Services.Contracts;
using Cupboard.WebApi.Services.Implementations;

namespace Cupboard.WebApi.Configurations;

public static class DependencyInjections
{
    public static IServiceCollection SetDependencyInjection(this IServiceCollection services)
    {
        #region Repositories Injection
        services.AddScoped<IUserRepository, UserRepository> ();
        //services.AddScoped<IBaseRepository<Dependent>, BaseRepository<Dependent>> ();
        #endregion

        #region Services Injection

        services.AddScoped<IUserService, UserService> ();
        //services.AddScoped<IDependentService, DependentService> ();
        #endregion
       
        return services;
    }
}
