#redis 编译脚本

set(REDIS_SOURCE_DIR ${CMAKE_SOURCE_DIR}/third_party/redis)
set(REDIS_INSTALL_DIR ${CMAKE_BINARY_DIR}/third_party/redis)
add_custom_target(REDIS COMMAND make MALLOC=libc PREFIX=${REDIS_INSTALL_DIR} -C ${REDIS_SOURCE_DIR} && make PREFIX=${REDIS_INSTALL_DIR} -C ${REDIS_SOURCE_DIR} install)
