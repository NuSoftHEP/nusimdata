#[================================================================[.rst:
FindGENIE
----------

Finds GENIE and all its components



#]================================================================]

# this is the order that GENIE "recommends"
# genie-config --libs
#   -lGFwMsg -lGFwReg -lGFwAlg -lGFwInt -lGFwGHEP -lGFwNum -lGFwUtl -lGFwParDat
#   -lGFwEG -lGFwNtp -lGPhXSIg -lGPhPDF -lGPhNuclSt -lGPhCmn -lGPhDcy -lGPhHadTransp
#   -lGPhHadnz -lGPhDeEx -lGPhAMNGXS -lGPhAMNGEG -lGPhChmXS -lGPhCohXS -lGPhCohEG
#   -lGPhDISXS -lGPhDISEG -lGPhDfrcXS -lGPhDfrcEG -lGPhGlwResXS -lGPhGlwResEG
#   -lGPhIBDXS -lGPhIBDEG -lGPhMNucXS -lGPhMNucEG -lGPhMEL -lGPhNuElXS -lGPhNuElEG
#   -lGPhQELXS -lGPhQELEG -lGPhResXS -lGPhResEG -lGPhStrXS
#   -lGPhStrEG -lGPhNDcy -lGTlGeo -lGTlFlx -lGTlRew

# headers
find_file(_cet_Messenger_h NAMES Messenger.h HINTS ENV GENIE_INC
  PATH_SUFFIXES GENIE/Framework/Messenger)
if (_cet_Messenger_h)
  get_filename_component(_cet_GENIE_include_dir "${_cet_Messenger_h}" PATH)
  get_filename_component(_cet_GENIE_include_dir "${_cet_GENIE_include_dir}" PATH)
  get_filename_component(_cet_GENIE_include_dir "${_cet_GENIE_include_dir}" PATH)
  get_filename_component(_cet_GENIE_include_dir "${_cet_GENIE_include_dir}" PATH)
  if (_cet_GENIE_include_dir STREQUAL "/")
    unset(_cet_GENIE_include_dir)
  endif()
endif()
if (EXISTS "${_cet_GENIE_include_dir}")
  set(GENIE_FOUND TRUE)
  get_filename_component(_cet_GENIE_dir "${_cet_GENIE_include_dir}" PATH)
  if (_cet_GENIE_dir STREQUAL "/")
    unset(_cet_GENIE_dir)
  endif()
  set(GENIE_INCLUDE_DIRS "${_cet_GENIE_include_dir}" "${_cet_GENIE_include_dir}/GENIE")
  set(GENIE_LIBRARY_DIR "${_cet_GENIE_dir}/lib")
endif()
if (GENIE_FOUND)
  set(GENIE_LIB_LIST)
  set(_cet_genie_libs GFwMsg GFwReg GFwAlg GFwInt GFwGHEP GFwNum GFwUtl GFwParDat
                  GFwEG GFwNtp GPhXSIg GPhPDF GPhNuclSt GPhCmn GPhDcy GPhHadTransp
                  GPhHadnz GPhDeEx GPhAMNGXS GPhAMNGEG GPhChmXS GPhCohXS GPhCohEG
                  GPhDISXS GPhDISEG GPhDfrcXS GPhDfrcEG GPhGlwResXS GPhGlwResEG
                  GPhIBDXS GPhIBDEG GPhMNucXS GPhMNucEG GPhMEL GPhNuElXS GPhNuElEG
                  GPhQELXS GPhQELEG GPhResXS GPhResEG GPhStrXS
                  GPhStrEG GPhNDcy GTlGeo GTlFlx GRwFwk GRwIO GRwClc)
  foreach (_glib IN LISTS _cet_genie_libs)
    find_library(${_glib}_LIBRARY NAMES ${_glib} PATHS ${GENIE_LIBRARY_DIR})
    if(${_glib}_LIBRARY)
      if (NOT TARGET GENIE::${_glib})
        add_library(GENIE::${_glib} SHARED IMPORTED)
        set_target_properties(GENIE::${_glib} PROPERTIES
          INTERFACE_INCLUDE_DIRECTORIES "${GENIE_INCLUDE_DIRS}"
          IMPORTED_LOCATION "${${_glib}_LIBRARY}"
          IMPORTED_NO_SONAME TRUE
          )
      endif()
      list(APPEND GENIE_LIB_LIST GENIE::${_glib})
    endif()
  endforeach()
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GENIE
  REQUIRED_VARS GENIE_FOUND
  GENIE_INCLUDE_DIRS
  GENIE_LIB_LIST)

unset(_cet_GENIE_FIND_REQUIRED)
unset(_cet_GENIE_dir)
unset(_cet_GENIE_include_dir)
unset(_glib)
unset(_cet_genie_libs)
unset(_cet_Messenger_h CACHE)

