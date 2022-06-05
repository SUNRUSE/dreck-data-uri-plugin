./plugins/data-uri/generated/%.ts: ./%
	mkdir -p $(dir $@)
	node ./plugins/data-uri/convert.js $^ $@
