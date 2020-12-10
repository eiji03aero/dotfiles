MAIN_NAME = template

.PHONY: build
build:
	@cd build \
		&& $(MAKE)

.PHONY: build-cmake
build-cmake:
	@cd build \
		&& cmake ..

.PHONY: test
test:
	@cd build \
		&& ctest

.PHONY: test-unit
test-unit:
	@cd build \
		&& $(MAKE) $(TESTNAME) \
		&& ./$(TESTNAME)

.PHONY: dev
dev:
	@cd build \
		&& make \
		&& ./$(MAIN_NAME)

.PHONY: watch
watch:
	@reflex \
		-r '(\.cpp|\.h)' \
		-s $(MAKE) $(COMMAND)

.PHONY: clean
clean:
	@rm -rf ./build/*
