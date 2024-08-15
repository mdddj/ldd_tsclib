import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart' as ffi;
import 'package:ffi/ffi.dart';

import 'ldd_tsclib_bindings_generated.dart';

final DynamicLibrary _tsclib = DynamicLibrary.open("TSCLIB.dll");

typedef ABOUT_NA = Void Function();
typedef ABOUT = void Function();

///关于dll
void about() {
  final fun = _tsclib.lookupFunction<ABOUT_NA, ABOUT>("about");
  fun();
}

typedef OPEN_PORT_NA = Void Function(Pointer<ffi.Utf8> str);
typedef OPEN_PORT = void Function(Pointer<ffi.Utf8> str);

///打开打印机
void openport(String printer) {
  final fun = _tsclib.lookupFunction<OPEN_PORT_NA, OPEN_PORT>("openport");
  fun.call(printer.toNativeUtf8());
}

///closeport
typedef CLOSE_PORT_NA = Void Function();
typedef CLOSE_PORT = void Function();

///关闭
void closeport() {
  final fun = _tsclib.lookupFunction<CLOSE_PORT_NA, CLOSE_PORT>("closeport");
  fun();
}

///setup
typedef SETUP_NA = Void Function(
    Pointer<ffi.Utf8> a,
    Pointer<ffi.Utf8> b,
    Pointer<ffi.Utf8> c,
    Pointer<ffi.Utf8> d,
    Pointer<ffi.Utf8> e,
    Pointer<ffi.Utf8> f,
    Pointer<ffi.Utf8> g);
typedef SETUP = void Function(
    Pointer<ffi.Utf8> a,
    Pointer<ffi.Utf8> b,
    Pointer<ffi.Utf8> c,
    Pointer<ffi.Utf8> d,
    Pointer<ffi.Utf8> e,
    Pointer<ffi.Utf8> f,
    Pointer<ffi.Utf8> g);
void setup(
    {required String a,
    required String b,
    required String c,
    required String d,
    required String e,
    required String f,
    required String g}) {
  final fun = _tsclib.lookupFunction<SETUP_NA, SETUP>("setup");
  fun.call(a.toNativeUtf8(), b.toNativeUtf8(), c.toNativeUtf8(),
      d.toNativeUtf8(), e.toNativeUtf8(), f.toNativeUtf8(), g.toNativeUtf8());
}

///clearbuffer
typedef CLEAR_BUFFER_NA = Void Function();
typedef CLEAR_BUFFER = void Function();

void clearBuffer() {
  final fun =
      _tsclib.lookupFunction<CLEAR_BUFFER_NA, CLEAR_BUFFER>('clearbuffer');
  fun();
}

///barcode
typedef BARCODE_NA = Void Function(
    Pointer<ffi.Utf8> a,
    Pointer<ffi.Utf8> b,
    Pointer<ffi.Utf8> c,
    Pointer<ffi.Utf8> d,
    Pointer<ffi.Utf8> e,
    Pointer<ffi.Utf8> f,
    Pointer<ffi.Utf8> g,
    Pointer<ffi.Utf8> h,
    Pointer<ffi.Utf8> l);
typedef BARCODE = void Function(
    Pointer<ffi.Utf8> a,
    Pointer<ffi.Utf8> b,
    Pointer<ffi.Utf8> c,
    Pointer<ffi.Utf8> d,
    Pointer<ffi.Utf8> e,
    Pointer<ffi.Utf8> f,
    Pointer<ffi.Utf8> g,
    Pointer<ffi.Utf8> h,
    Pointer<ffi.Utf8> l);

void barcode(
    {required String a,
    required String b,
    required String c,
    required String d,
    required String e,
    required String f,
    required String g,
    required String h,
    required String l}) {
  final fun = _tsclib.lookupFunction<BARCODE_NA, BARCODE>("barcode");
  fun.call(
      a.toNativeUtf8(),
      b.toNativeUtf8(),
      c.toNativeUtf8(),
      d.toNativeUtf8(),
      e.toNativeUtf8(),
      f.toNativeUtf8(),
      g.toNativeUtf8(),
      h.toNativeUtf8(),
      l.toNativeUtf8());
}
///printlabel

typedef PRINT_LABEL_NA = Void Function(
  Pointer<ffi.Utf8> a,
  Pointer<ffi.Utf8> b,
);
typedef PRINT_LABEL = void Function(
  Pointer<ffi.Utf8> a,
  Pointer<ffi.Utf8> b,
);

void printLabel(String a, String b) {
  final fun = _tsclib.lookupFunction<PRINT_LABEL_NA, PRINT_LABEL>("printlabel");
  fun(a.toNativeUtf8(), b.toNativeUtf8());
}

///sendcommand
typedef SEND_COMMAND_NA = Void Function(Pointer<ffi.Utf8> command);
typedef SEND_COMMAND = void Function(Pointer<ffi.Utf8> command);
//发送自定义命令
void sendCommand(String command) {
  final fun =
      _tsclib.lookupFunction<SEND_COMMAND_NA, SEND_COMMAND>("sendcommand");
  fun(command.toNativeUtf8());
}

///downloadpcx
typedef DOWNLOAD_PCX_NA = Void Function(
  Pointer<ffi.Utf8> a,
  Pointer<ffi.Utf8> b,
);
typedef DOWNLOAD_PCX = void Function(
  Pointer<ffi.Utf8> a,
  Pointer<ffi.Utf8> b,
);

///打印图片
void downloadPcx({required String filepath, required String filename}) {
  final fun =
      _tsclib.lookupFunction<DOWNLOAD_PCX_NA, DOWNLOAD_PCX>("downloadpcx");
  fun(filepath.toNativeUtf8(), filename.toNativeUtf8());
}

/// nobackfeed
typedef NOBACK_FEED_NA = Void Function();
typedef NOBACK_FEED = void Function();

void nobackfeed() {
  final fun = _tsclib.lookupFunction<NOBACK_FEED_NA, NOBACK_FEED>("nobackfeed");
  fun();
}

/// formfeed
void formfeed() {
  final fun = _tsclib.lookupFunction<NOBACK_FEED_NA, NOBACK_FEED>("formfeed");
  fun();
}

///printerfont
void printerfont(
    {required String a,
    required String b,
    required String c,
    required String d,
    required String e,
    required String f,
    required String g}) {
  final fun = _tsclib.lookupFunction<SETUP_NA, SETUP>("printerfont");
  fun.call(a.toNativeUtf8(), b.toNativeUtf8(), c.toNativeUtf8(),
      d.toNativeUtf8(), e.toNativeUtf8(), f.toNativeUtf8(), g.toNativeUtf8());
}

///windowsfont
typedef WINFONT_NA = Void Function(
    Pointer<ffi.Utf8> a,
    Pointer<ffi.Utf8> b,
    Pointer<ffi.Utf8> c,
    Pointer<ffi.Utf8> d,
    Pointer<ffi.Utf8> e,
    Pointer<ffi.Utf8> f,
    Pointer<ffi.Utf8> g,
    Pointer<ffi.Utf8> h);
typedef WINFONT = void Function(
    Pointer<ffi.Utf8> a,
    Pointer<ffi.Utf8> b,
    Pointer<ffi.Utf8> c,
    Pointer<ffi.Utf8> d,
    Pointer<ffi.Utf8> e,
    Pointer<ffi.Utf8> f,
    Pointer<ffi.Utf8> g,
    Pointer<ffi.Utf8> h);

void windowsfont(
    {required String a,
    required String b,
    required String c,
    required String d,
    required String e,
    required String f,
    required String g,
    required String h}) {
  final fun = _tsclib.lookupFunction<WINFONT_NA, WINFONT>("windowsfont");
  fun.call(
      a.toNativeUtf8(),
      b.toNativeUtf8(),
      c.toNativeUtf8(),
      d.toNativeUtf8(),
      e.toNativeUtf8(),
      f.toNativeUtf8(),
      g.toNativeUtf8(),
      h.toNativeUtf8());
}



typedef SendBinaryDataC = Void Function(Pointer<Uint8>, Int32);
typedef SendBinaryDataDart = void Function(Pointer<Uint8>, int);
void sendBinaryData(List<int> data){
  final fun = _tsclib.lookupFunction<SendBinaryDataC,SendBinaryDataDart>("sendBinaryData");
  final Pointer<Uint8> dataPtr = malloc<Uint8>(data.length);
  for (int i = 0; i < data.length; i++) {
    dataPtr[i] = data[i];
  }
  fun.call(dataPtr,data.length);
  malloc.free(dataPtr);
}


const String _libName = 'ldd_tsclib';

/// The dynamic library in which the symbols for [LddTsclibBindings] can be found.
final DynamicLibrary _dylib = () {
  if (Platform.isMacOS || Platform.isIOS) {
    return DynamicLibrary.open('$_libName.framework/$_libName');
  }
  if (Platform.isAndroid || Platform.isLinux) {
    return DynamicLibrary.open('lib$_libName.so');
  }
  if (Platform.isWindows) {
    return DynamicLibrary.open('$_libName.dll');
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

/// The bindings to the native functions in [_dylib].
final LddTsclibBindings _bindings = LddTsclibBindings(_dylib);
