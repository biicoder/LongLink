#redis 编译脚本

set(REDIS_SOURCE_DIR ${CMAKE_SOURCE_DIR}/third_party/redis)
set(REDIS_INSTALL_DIR ${CMAKE_BINARY_DIR}/third_party/redis)
add_custom_target(REDIS COMMAND make V=1  MALLOC=libc PREFIX=${REDIS_INSTALL_DIR} -C ${REDIS_SOURCE_DIR} && make V=1 PREFIX=${REDIS_INSTALL_DIR} -C ${REDIS_SOURCE_DIR} install)

set(HI_REDIS_INSTALL_DIR ${REDIS_INSTALL_DIR}/hiredis)

add_custom_target(HI_REDIS COMMAND make V=1 PREFIX=${HI_REDIS_INSTALL_DIR} -C ${REDIS_SOURCE_DIR}/deps/hiredis && make  V=1 PREFIX=${HI_REDIS_INSTALL_DIR} -C ${REDIS_SOURCE_DIR}/deps/hiredis install)

