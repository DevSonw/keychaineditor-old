ARCH_FLAGS=-arch arm64 -arch armv7s

keychaineditor: main.m
	clang \
		-Os -Wall -bind_at_load -fobjc-arc \
		$(ARCH_FLAGS) \
		-mios-version-min=8.0 \
		-isysroot `xcrun --sdk iphoneos --show-sdk-path` \
		-framework Foundation -framework Security \
		-o keychaineditor main.m
	ldid -Sentitlements.xml keychaineditor

clean:
	rm -f keychaineditor
