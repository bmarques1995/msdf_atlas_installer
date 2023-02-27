set CompileMode=%~1

cmake -S ./vendor/zlib -B ./dependencies/zlib -DCMAKE_INSTALL_PREFIX="./install"
cmake --build ./dependencies/zlib --config %CompileMode% --target install
cmake -S ./vendor/brotli -B ./dependencies/brotli -DCMAKE_INSTALL_PREFIX="./install" -DBUILD_SHARED_LIBS=OFF
cmake --build ./dependencies/brotli --config %CompileMode% --target install
cmake -S ./vendor/bzip2 -B ./dependencies/bzip2 -DCMAKE_INSTALL_PREFIX="./install" -DENABLE_STATIC_LIB=ON
cmake --build ./dependencies/bzip2 --config %CompileMode% --target install
cmake -S ./vendor/harfbuzz -B ./dependencies/harfbuzz -DCMAKE_INSTALL_PREFIX="./install" -DBUILD_SHARED_LIBS=OFF
cmake --build ./dependencies/harfbuzz --config %CompileMode% --target install
cmake -S ./vendor/libpng -B ./dependencies/libpng -DCMAKE_INSTALL_PREFIX="./install" -DPNG_STATIC=ON
cmake --build ./dependencies/libpng --config %CompileMode% --target install
cmake -S ./vendor/freetype -B ./dependencies/freetype -DCMAKE_INSTALL_PREFIX="./install" -DBUILD_SHARED_LIBS=false -DFT_REQUIRE_ZLIB=ON -DFT_REQUIRE_BZIP2=ON -DFT_REQUIRE_PNG=ON -DFT_REQUIRE_HARFBUZZ=ON -DFT_REQUIRE_BROTLI=ON
cmake --build ./dependencies/freetype --config %CompileMode% --target install