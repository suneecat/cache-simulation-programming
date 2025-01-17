CC = g++
SRC_DIR = src
BUILD_DIR = build
TARGET_DIR = bin
TARGET = bin/Simulator

SRC_EXT = cpp
SOURCES = $(shell find $(SRC_DIR) -type f -name *.$(SRC_EXT))
OBJECTS = $(patsubst $(SRC_DIR)/%,$(BUILD_DIR)/%,$(SOURCES:.$(SRC_EXT)=.o))
CFLAGS = -std=c++11
INC = -I include

$(TARGET): $(OBJECTS)
	@echo " Linking..."
	@mkdir -p $(TARGET_DIR)
	@echo " $(CC) $^ -o $(TARGET)"; $(CC) $^ -o $(TARGET)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.$(SRC_EXT)
	@mkdir -p $(BUILD_DIR)
	@echo " $(CC) $(CFLAGS) $(INC) -c -o $@ $<"; $(CC) $(CFLAGS) $(INC) -c -o $@ $<

clean:
	@echo " Cleaning...";
	@echo " $(RM) -r $(BUILD_DIR) $(TARGET_DIR)"; $(RM) -r $(BUILD_DIR) $(TARGET_DIR)

.PHONY: clean
