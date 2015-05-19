#!/bin/sh

#javac=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/bin/javac

#Android_sdk=/Users/mobile/android-sdks/platforms/android-20

#JAVA_FILE_DIR="${PROJECT_DIR}/java"

CLASS_DIR=com/ane/android

RELEASE_DIR=bin/"${CLASS_DIR}"

SRC_DIR=src/"${CLASS_DIR}"

JAR_STATIC_LIB_NAME=lib"$PRODUCT_NAME".jar

OUTPUT_DIR="${JAVA_FILE_DIR}"/bin

LIB_DIR="${JAVA_FILE_DIR}"/libs

SOURCE_FILES="${JAVA_FILE_DIR}"/"${SRC_DIR}"

JPATH="${JAVA_FILE_DIR}"/src/

FLASH_RUNTIME_EXTENSIONS=FlashRuntimeExtensions.jar

echo "OUTPUT_DIR:"$OUTPUT_DIR
echo "lib:""${LIB_DIR}"/"${FLASH_RUNTIME_EXTENSIONS}"

#檢查Bin資料夾
if [ -e $OUTPUT_DIR ]; then
    echo "${OUTPUT_DIR} exists";
else
    echo "${OUTPUT_DIR} does not exists";
    mkdir -p -v "${PROJECT_DIR}/java/bin"
fi

#classPath:檔案路徑 -d 輸出資料夾 編譯檔案

javac -version

javac -classpath .:"${LIB_DIR}"/"${FLASH_RUNTIME_EXTENSIONS}":"${Android_sdk}":"${JPATH}" -d "${OUTPUT_DIR}" "${SOURCE_FILES}/"*.java

pushd "${JAVA_FILE_DIR}/bin"

jar cvf "${JAR_STATIC_LIB_NAME}" *

cp -f "${JAVA_FILE_DIR}"/bin/"${JAR_STATIC_LIB_NAME}" "$CONFIGURATION_BUILD_DIR"

popd

#rm -rf "${OUTPUT_DIR}"

mkdir -p -v "${PROJECT_DIR}/java/bin"

echo "Build jar library for android : Succeeded."

