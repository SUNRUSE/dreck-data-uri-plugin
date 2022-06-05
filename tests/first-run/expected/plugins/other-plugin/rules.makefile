./plugins/other-plugin/generated/%: ./plugins/other-plugin/%
	mkdir -p $(dir $@)
	cp $< $@

./plugins/other-plugin/generated/dreck_data_uri_output_type_script_paths.txt:
	mkdir -p $(dir $@)
	echo $(DRECK_DATA_URI_OUTPUT_TYPE_SCRIPT_PATHS) > $@
