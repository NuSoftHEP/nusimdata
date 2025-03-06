#include "MCGeneratorInfo.h"
#include <iostream>

namespace simb {

std::ostream& operator<< (std::ostream& o, simb::MCGeneratorInfo const & a) {
  o << "generator " << int(a.generator) 
    << "  " << simb::MCGeneratorInfo::AsString(a.generator) << std::endl;
  o << "version   " << a.generatorVersion << std::endl;
  auto it = a.generatorConfig.begin();
  for ( ; it != a.generatorConfig.end(); ++it) {
    o << "   " << it->first << " " << it->second << std::endl;
  }
  return o;
}

}
