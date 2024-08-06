#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#if _WIN32
#include <windows.h>
#else
#include <pthread.h>
#include <unistd.h>
#endif

#if _WIN32
#define FFI_PLUGIN_EXPORT __declspec(dllexport)
#else
#define FFI_PLUGIN_EXPORT
#endif

// 一个非常短暂的本机函数。
//
// 对于非常短暂的函数，可以在主隔离上调用它们。
// 它们会在运行本机函数时阻止 Dart 执行，因此
// 仅对保证短暂的本机函数执行此操作。
FFI_PLUGIN_EXPORT int sum(int a, int b);

// 寿命较长的本机函数，占用调用它的线程。
//
// 不要在主隔离中调用这些类型的本机函数。他们会
// 阻止 Dart 执行。这会导致 Flutter 应用程序丢帧。
// 相反，在单独的隔离上调用这些本机函数。
FFI_PLUGIN_EXPORT int sum_long_running(int a, int b);


FFI_PLUGIN_EXPORT void openport(String port);