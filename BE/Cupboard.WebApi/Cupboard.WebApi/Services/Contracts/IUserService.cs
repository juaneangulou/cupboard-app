using Cupboard.WebApi.Dtos;
using Cupboard.WebApi.Models;
using Microsoft.AspNetCore.Identity;

namespace Cupboard.WebApi.Services.Contracts;

public interface IUserService
{
    Task<AuthResponseDto> AddUserAsync(RegisterRequetDto request);
    Task<AuthResponseDto> Login(LoginRequestDto request);
    Task<AuthResponseDto> RefreshToken(string email);
    Task<IdentityUser> GetUserInfo(string email);
}
