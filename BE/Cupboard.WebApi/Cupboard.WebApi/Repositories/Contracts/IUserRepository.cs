using Microsoft.AspNetCore.Identity;
using Cupboard.WebApi.Dtos;
using Cupboard.WebApi.Models;

namespace Cupboard.WebApi.Repositories.Contracts;

public interface IUserRepository :IBaseRepository<ApplicationUser>
{
    Task<IdentityResult> AddUser(RegisterRequetDto request);
}
