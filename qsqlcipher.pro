TARGET = qsqlcipher

QT_FOR_CONFIG += sqldrivers-private

HEADERS += $$PWD/qsql_sqlite_p.h
SOURCES += $$PWD/qsql_sqlite.cpp $$PWD/smain.cpp

android {
    message(building for $$ANDROID_TARGET_ARCH)
    INCLUDEPATH += $$PWD/android-libs/$$ANDROID_TARGET_ARCH
    LIBS += $$PWD/android-libs/$$ANDROID_TARGET_ARCH/libsqlcipher.a
    LIBS += $$PWD/android-libs/$$ANDROID_TARGET_ARCH/libcrypto.a
} else:ios|macx {
    DEFINES += "SQLITE_HAS_CODEC=1"
    DEFINES += "SQLITE_TEMP_STORE=3"
    DEFINES += "NDEBUG"

    DEFINES += "SQLITE_ENABLE_COLUMN_METADATA"

    HEADERS += macx-libs/sqlite3.h
    SOURCES += macx-libs/sqlite3.c

    ios {
        INCLUDEPATH += $$PWD/macx-libs/ios/openssl-1.1.1b/include
        LIBS += $$PWD/macx-libs/ios/openssl-1.1.1b/libcrypto.a
        LIBS += $$PWD/macx-libs/ios/openssl-1.1.1b/libssl.a
    } else:mac {
        INCLUDEPATH += $$PWD/macx-libs/macos/openssl-1.1.1b/include
        LIBS += $$PWD/macx-libs/macos/openssl-1.1.1b/libcrypto.a
        LIBS += $$PWD/macx-libs/macos/openssl-1.1.1b/libssl.a
    }
} else:unix {
    CONFIG += link_pkgconfig
    PKGCONFIG += sqlcipher
# or if pkg-config is not available
# set manually the INCLUDEPATH and LIBS
}

OTHER_FILES += sqlcipher.json .qmake.conf

PLUGIN_CLASS_NAME = QSQLCipherDriverPlugin

# follows contents of include(../qsqldriverbase.pri)
QT  = core core-private sql-private

PLUGIN_TYPE = sqldrivers
load(qt_plugin)

DEFINES += QT_NO_CAST_TO_ASCII QT_NO_CAST_FROM_ASCII
