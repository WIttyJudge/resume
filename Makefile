.PHONY: all

CC = xelatex

RESUME_DIR = resume
RESUME_COMPONENTS = resume/components
RESUME_SRCS = $(shell find $(RESUME_COMPONENTS) -name '*.tex')

CV_DIR = cv
CV_COMPONENTS = cv/components
CV_SRCS = $(shell find $(CV_COMPONENTS) -name '*.tex')

COVER_LETTER_DIR = coverletter

all: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(RESUME_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(RESUME_DIR) $<
	mv $(RESUME_DIR)/resume.pdf ./

cv.pdf: $(CV_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(CV_DIR) $<
	mv $(CV_DIR)/cv.pdf ./

coverletter.pdf: $(COVER_LETTER_DIR)/coverletter.tex
	$(CC) -output-directory=$(COVER_LETTER_DIR) $<
	mv $(COVER_LETTER_DIR)/coverletter.pdf ./

clean:
	rm -fv *.pdf
