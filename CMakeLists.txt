### Maintainer: mpohling[@techfak.uni-bielefeld.de] ###

cmake_minimum_required(VERSION 2.8)
PROJECT(csra-db)
SET(CMAKE_BUILD_TYPE distribution)
SET(CSRA-DB_HOME "var/db")

IF (NOT CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    SET(INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX})
    MESSAGE("-- Use given install PREFIX: ${INSTALL_PREFIX}")
ELSEIF (DEFINED ENV{prefix})
    SET(INSTALL_PREFIX $ENV{prefix})
    MESSAGE("-- Found global install PREFIX: ${INSTALL_PREFIX}")
    MESSAGE("---- Set -DCMAKE_INSTALL_PREFIX for using a custom prefix.")
ELSE ()
    SET(INSTALL_PREFIX "$ENV{HOME}/.local/share")
    MESSAGE("-- Use default prefix: ${INSTALL_PREFIX}")
    MESSAGE("---- Set -DCMAKE_INSTALL_PREFIX for using a custom prefix.")
ENDIF()

IF (EXISTS ${INSTALL_PREFIX}/${CSRA-DB_HOME})
    IF(${FORCE})
        FILE(REMOVE_RECURSE ${INSTALL_PREFIX}/${CSRA-DB_HOME})
    ELSE()
        MESSAGE(SEND_ERROR "Abort installation! Database cannot be overwritten. Set -DFORCE=true to overwrite the database.")
    ENDIF()
ENDIF()

### Init and update submodules ###
MESSAGE("Init & update submodules...")
EXECUTE_PROCESS(COMMAND "../init_update.sh")

### Create db folder ###
FILE(MAKE_DIRECTORY ${INSTALL_PREFIX}/${CSRA-DB_HOME})

### Install data into volume ###
INSTALL(DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/" DESTINATION ${INSTALL_PREFIX}/${CSRA-DB_HOME})
INSTALL(PROGRAMS "${CMAKE_CURRENT_SOURCE_DIR}/install.sh" DESTINATION ${INSTALL_PREFIX}/${CSRA-DB_HOME})
INSTALL(PROGRAMS "${CMAKE_CURRENT_SOURCE_DIR}/init_update.sh" DESTINATION ${INSTALL_PREFIX}/${CSRA-DB_HOME})

