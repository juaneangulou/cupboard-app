using FluentValidation;
using Cupboard.WebApi.Dtos.Dependent;
using Cupboard.WebApi.Dtos;

namespace Cupboard.WebApi.Configurations.Validators;

public class RegisterRequetDtoValidator : AbstractValidator<RegisterRequetDto>
{
    public RegisterRequetDtoValidator()
    {
        RuleFor(dto => dto.FirstName).NotEmpty().MaximumLength(255);
        RuleFor(dto => dto.SecondName).NotEmpty().MaximumLength(255);
        RuleFor(dto => dto.FirstLastName).NotEmpty().MaximumLength(255);
        RuleFor(dto => dto.SecondLastName).NotEmpty().MaximumLength(255);
        RuleFor(dto => dto.Username).NotEmpty();
    }
}
