.PHONY: out

CC = xelatex
EXAMPLES_DIR = .
OUTPUT_DIR = output
#RESUME_DIR = documents/resume
CV_DIR = documents/cv
#RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

examples: $(foreach x, resume resume_turkish coverletter, $x)

resume: $(EXAMPLES_DIR)/resume_yigit_ozgumus.tex 
	$(CC) -output-directory=$(OUTPUT_DIR) $<
	$(MAKE) clean_output_dir

coverletter: $(EXAMPLES_DIR)/coverletter_yigit_ozgumus.tex
	$(CC) -output-directory=$(OUTPUT_DIR) $<
	$(MAKE) clean_output_dir

clean:
	rm -rf $(OUTPUT_DIR)/*.pdf

clean_output_dir:
	rm -f $(OUTPUT_DIR)/*.aux
	rm -f $(OUTPUT_DIR)/*.out
	rm -f $(OUTPUT_DIR)/*.log
