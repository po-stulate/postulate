IDRIS = idris2dart
PKG = Client.ipkg
BIN = target/Minecraft

.PHONY: clean

build: clean
	$(IDRIS) --build ${PKG}

run: build foreign
	./$(BIN)

repl: typecheck
	$(IDRIS) --package $(PKG) --package contrib

typecheck: distclean
	$(IDRIS) --typecheck $(PKG)

foreign: build
#	cd foreign/z && cargo build --release
#	cp foreign/z/target/release/libz.dylib $(BIN)_app/libz.dylib

clean:
	rm -rf target

distclean: clean
	rm -rf build
#	cd foreign/z && cargo clean
