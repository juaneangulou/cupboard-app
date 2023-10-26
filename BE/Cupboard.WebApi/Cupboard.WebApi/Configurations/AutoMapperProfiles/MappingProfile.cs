using AutoMapper;
using Cupboard.WebApi.Configurations.Validators;
using Cupboard.WebApi.Dtos.Dependent;
using Cupboard.WebApi.Models;

namespace Cupboard.WebApi.Configurations.AutoMapperProfiles;

public class MappingProfile : Profile
{
    public MappingProfile()
    {
        //CreateMap<Dependent, DependentRequestDto>().ReverseMap();
        //CreateMap<Dependent, DependentResponseDto>()
        //    .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.DependentId)).ReverseMap();
    }
}
