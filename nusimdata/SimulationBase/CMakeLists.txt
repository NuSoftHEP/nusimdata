find_package(canvas_root_io REQUIRED) # Needed for art_dictionary().

# macros
include(CetMake)
include(ArtDictionary)
include(BasicPlugin)

find_package(dk2nudata REQUIRED PUBLIC)

cet_make_library(SOURCE GTruth.cxx  MCFlux.cxx  MCNeutrino.cxx
                        MCParticle.cxx  MCTrajectory.cxx  MCTruth.cxx
               LIBRARIES PRIVATE
               canvas::canvas
               cetlib_except::cetlib_except
               ROOT::EG # EG needed for TParticlePDG.h
               PUBLIC
               ROOT::Physics # For TLorentzVector.h
               )

art_dictionary(DICTIONARY_LIBRARIES PRIVATE nusimdata::SimulationBase dk2nu::Tree)

install_headers()
install_source()
