#redis 编译脚本

set(REDIS_SOURCE_DIR ${CMAKE_SOURCE_DIR}/third_party/redis)
add_custom_target(REDIS COMMAND make -C ${REDIS_SOURCE_DIR})
