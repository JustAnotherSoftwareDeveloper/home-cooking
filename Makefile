.PHONY: all src test runbooks clean

# Default target
all: src test runbooks

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

# Clean output directory
clean:
	@echo "Cleaning output directory..."
	@rm -rf output/
	@echo "Done."
