set CompileMode=%~1

cmake -S ./vendor/tinyxml2 -B ./dependencies/tinyxml2 -DCMAKE_INSTALL_PREFIX="./install"
cmake --build ./dependencies/tinyxml2 --config %CompileMode% --target install
cmake -S ./vendor/msdf_atlas_gen/msdfgen -B ./dependencies/msdfgen -DCMAKE_INSTALL_PREFIX="./install" -DMSDF_ATLAS_USE_VCPKG=OFF -DMSDF_ATLAS_USE_SKIA=OFF -DMSDFGEN_INSTALL=ON -DMSDFGEN_CORE_ONLY=ON
cmake --build ./dependencies/msdfgen --config %CompileMode% --target install
cmake -S ./vendor/msdf_atlas_gen -B ./dependencies/msdf_atlas_gen -DCMAKE_INSTALL_PREFIX="./install" -DMSDF_ATLAS_USE_VCPKG=OFF -DMSDF_ATLAS_USE_SKIA=OFF -DMSDF_ATLAS_INSTALL=ON -DMSDF_ATLAS_BUILD_STANDALONE=OFF
cmake --build ./dependencies/msdf_atlas_gen --config %CompileMode% --target install
