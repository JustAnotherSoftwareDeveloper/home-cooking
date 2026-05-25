.PHONY: all src test runbooks events clean

EVENTS_DIR := events
EVENTS_OUTPUT_DIR := output/events

# Default target
all: src test runbooks events

# Convert source recipes to PDF
src:
	@echo "Converting src/ recipes to PDF..."
	@bash scripts/markdown_to_pdf.sh --input-dir src --output-dir output

# Convert test recipes to PDF
test:
	@echo "Converting test/ recipes to PDF..."
	@bash scripts/markdown_to_pdf.sh --input-dir test --output-dir output

# Convert runbooks to PDF
runbooks:
	@echo "Converting runbooks/ to PDF..."
	@bash scripts/markdown_to_pdf.sh --input-dir runbooks --output-dir output

# Convert event recipes to PDF. Use SUBDIR=<folder> to render one event.
events:
	@if [ -n "$(SUBDIR)" ]; then \
		echo "Converting $(EVENTS_DIR)/$(SUBDIR)/ to PDF..."; \
		bash scripts/markdown_to_pdf.sh --input-dir "$(EVENTS_DIR)/$(SUBDIR)" --output-dir "$(EVENTS_OUTPUT_DIR)/$(SUBDIR)"; \
	else \
		echo "Converting $(EVENTS_DIR)/ to PDF..."; \
		bash scripts/markdown_to_pdf.sh --input-dir "$(EVENTS_DIR)" --output-dir "$(EVENTS_OUTPUT_DIR)"; \
	fi

# Clean output directory
clean:
	@echo "Cleaning output directory..."
	@rm -rf output/
	@echo "Done."
