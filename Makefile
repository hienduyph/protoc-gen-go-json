.PHONY: proto
proto:
	mkdir -p build
	go build -o build/protoc-gen-go-json .
	export PATH=$(CURDIR)/build/:$$PATH && \
	    cd e2e && protoc --go_out=. --go_opt=paths=source_relative\
		--go-json_out=logtostderr=true,v=10:.\
		--go-json_opt=paths=source_relative\
		*.proto
