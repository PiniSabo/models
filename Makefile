
MODELS_DIR := ../models/research
PROTOS := $(wildcard ${MODELS_DIR}/object_detection/protos/*.proto)
PY_PROTOS := $(patsubst %.proto,%_pb2.py,$(PROTOS))

.PHONY: protos
protos: $(PY_PROTOS)

%_pb2.py: %.proto
	cd ${MODELS_DIR} && \
	protoc $(subst ${MODELS_DIR}/,,$<) --python_out=.

tf_models:
	pip3 install \
    -e ${MODELS_DIR}/slim \
	-e ${MODELS_DIR}