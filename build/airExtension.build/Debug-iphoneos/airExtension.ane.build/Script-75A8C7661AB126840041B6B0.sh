#!/bin/sh
"${AIR_SDK_PATH}"/bin/acompc -source-path "${PROJECT_DIR}/${NATIVEEXTENSION_PATH}" -include-classes "${SWC_Include_Classes}" -swf-version="${SWF_Version}" -output "${PROJECT_DIR}/${NATIVEEXTENSION_SWC}"
