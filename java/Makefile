SRC_DIR := ./
BUILD_DIR := ./build
SRC_FILES := $(wildcard $(SRC_DIR)/*.java)
CLASS_FILES := $(patsubst $(SRC_DIR)/%.java,$(BUILD_DIR)/%.class,$(SRC_FILES))
EXE := $(patsubst $(SRC_DIR)/%.java,%,$(SRC_FILES))

.PHONY: all

all: $(CLASS_FILES)
	$(foreach var,$(EXE),java -ea -cp $(BUILD_DIR) $(var);)

clean:
	rm -f $(CLASS_FILES)

$(BUILD_DIR)/%.class: $(SRC_DIR)/%.java
	javac -Xlint:unchecked $< -d $(BUILD_DIR)
