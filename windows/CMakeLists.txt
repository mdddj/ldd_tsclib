# Flutter 工具要求开发人员拥有 Visual Studio 版本
# 安装包含 CMake 3.14 或更高版本。你不应该增加这个
# 版本，因为这样做会导致插件无法编译某些版本
# 该插件的客户。
cmake_minimum_required(VERSION 3.14)

# 项目级配置。
set(PROJECT_NAME "ldd_tsclib")
project(${PROJECT_NAME} LANGUAGES CXX)

# 调用与其他目标平台共享的本机代码的构建。
# 可以更改它以适应不同的构建。
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/../src" "${CMAKE_CURRENT_BINARY_DIR}/shared")

# 应与插件捆绑的库的绝对路径列表。
# 该列表可以包含预构建的库，或由某个库创建的库
#从此构建文件触发外部构建。
set(ldd_tsclib_bundled_libraries
# 在 ../src/CMakeLists.txt 中定义。
  # 可以更改它以适应不同的构建。
  $<TARGET_FILE:ldd_tsclib>
  PARENT_SCOPE
)
set(ldd_tsclib_bundled_libraries
# 在 ../src/CMakeLists.txt 中定义。
  # 可以更改它以适应不同的构建。
  "${CMAKE_CURRENT_SOURCE_DIR}/TSCLIB.dll"
  PARENT_SCOPE
)