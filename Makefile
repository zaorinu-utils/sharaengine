# Makefile with common tasks
.PHONY: fmt lint docs test release

fmt:
	cargo fmt --all
lint:
	npm run format && npm run lint:md || true
	cargo clippy --all-targets --all-features -- -D warnings || true

docs:
	npm run format && cargo doc --no-deps

test:
	cargo test

release:
	# Create annotated tag then push (example)
	@echo "Run 'git tag -a vX.Y.Z -m \"release\"' then 'git push origin --tags' to trigger release workflow." 
