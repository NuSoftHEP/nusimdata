////////////////////////////////////////////////////////////////////////
/// \file  MCGeneratorInfo.cxx
/// \brief Info on the generator
///
/// \author  J. Wolcott <jwolcott@fnal.gov>
////////////////////////////////////////////////////////////////////////

#ifndef SIMB_MCGENERATORINFO_H
#define SIMB_MCGENERATORINFO_H

#include <string>
#include <unordered_map>
#include <iostream>

namespace simb
{

  /// generator used to produce event, if applicable
  typedef enum class _ev_generator
  {
    kUnknown,
    kGENIE,
    kCRY,
    kGIBUU,
    kNuWro,
    kMARLEY,
    kNEUT,
    kCORSIKA,
    kGEANT,
    kNumGenerators, //  this should always be the last entry
  } Generator_t;

  struct MCGeneratorInfo
  {
    simb::Generator_t                            generator;         ///< event generator that generated this event
    std::string                                  generatorVersion;  ///< event generator version
    std::unordered_map<std::string, std::string> generatorConfig;   ///< free-form field that can be used to keep track of generator configuration (e.g. GENIE tune)

    MCGeneratorInfo(Generator_t gen = Generator_t::kUnknown,
                    const std::string ver = "",
                    const std::unordered_map<std::string, std::string> config = {})
      : generator(gen), generatorVersion(ver), generatorConfig(config)
    {}

    static std::string AsString(Generator_t g)
    {
      switch ( g ) {
      case(simb::Generator_t::kUnknown) : return "Unknown" ; break;
      case(simb::Generator_t::kGENIE)   : return "GENIE"   ; break;
      case(simb::Generator_t::kCRY)     : return "CRY"     ; break;
      case(simb::Generator_t::kGIBUU)   : return "GIBUU"   ; break;
      case(simb::Generator_t::kNuWro)   : return "NuWro"   ; break;
      case(simb::Generator_t::kMARLEY)  : return "MARLEY"  ; break;
      case(simb::Generator_t::kNEUT)    : return "NEUT"    ; break;
      case(simb::Generator_t::kCORSIKA) : return "CORSIKA" ; break;
      case(simb::Generator_t::kGEANT)   : return "GEANT"   ; break;
      default : return "not-valid simb::Generator_t enum"  ; break;
      }
      return "not-valid simb::Generator_t enum";
    }
    friend std::ostream& operator<< (std::ostream& o, simb::MCGeneratorInfo const & a);

  };
}

#endif //SIMB_MCGENERATORINFO_H
