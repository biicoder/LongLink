#redis cpp 客户端
include(ExternalProject)
include(redis)

set(REDIS_PLUS_PLUS_ROOT ${CMAKE_BINARY_DIR}/third_party/redis_plus_plus)

set(REDIS_PLUS_PLUS_SOURCE_DIR ${CMAKE_SOURCE_DIR}/third_party/redis-plus-plus)

set(REDIS_PLUS_PLUS_CONFIGURE cd ${REDIS_PLUS_PLUS_ROOT} && cmake ${REDIS_PLUS_PLUS_SOURCE_DIR}
-DCMAKE_BUILD_TYPE=Debug
-DCMAKE_PREFIX_PATH=${HI_REDIS_INSTALL_DIR}
-DCMAKE_INSTALL_PREFIX=${REDIS_PLUS_PLUS_ROOT}/install)

set(REDIS_PLUS_PLUS_MAKE cd ${REDIS_PLUS_PLUS_ROOT} && make)
set(REDIS_PLUS_PLUS_INSTALL cd ${REDIS_PLUS_PLUS_ROOT} && make install)

ExternalProject_Add(REDIS-PLUS-PLUS
	PREFIX ${REDIS_PLUS_PLUS_ROOT}
	CONFIGURE_COMMAND ${REDIS_PLUS_PLUS_CONFIGURE}
	BUILD_COMMAND ${REDIS_PLUS_PLUS_MAKE}
	INSTALL_COMMAND ${REDIS_PLUS_PLUS_INSTALL}
	SOURCE_DIR ${REDIS_PLUS_PLUS_SOURCE_DIR})

