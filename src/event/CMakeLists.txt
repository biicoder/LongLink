set(TargetExe eventApp)

aux_source_directory(. DIR_SRCS)

add_executable(${TargetExe} ${DIR_SRCS})

target_include_directories(${TargetExe} PRIVATE ${LIBEVENT_INCLUDE_DIR})

target_link_libraries(${TargetExe} ${LIBEVENT_LIB})

