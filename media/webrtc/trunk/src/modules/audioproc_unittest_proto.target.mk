# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := audioproc_unittest_proto
### Generated for rule audioproc_unittest_proto_genproto:
$(builddir)/pyproto/webrtc/audio_processing/unittest_pb2.py: obj := $(abs_obj)
$(builddir)/pyproto/webrtc/audio_processing/unittest_pb2.py: builddir := $(abs_builddir)
$(builddir)/pyproto/webrtc/audio_processing/unittest_pb2.py: TOOLSET := $(TOOLSET)
$(builddir)/pyproto/webrtc/audio_processing/unittest_pb2.py: src/modules/audio_processing/test/unittest.proto $(builddir)/protoc FORCE_DO_CMD
	$(call do_cmd,audioproc_unittest_proto_genproto_0)
$(obj)/gen/protoc_out/webrtc/audio_processing/unittest.pb.cc $(obj)/gen/protoc_out/webrtc/audio_processing/unittest.pb.h: $(builddir)/pyproto/webrtc/audio_processing/unittest_pb2.py
$(obj)/gen/protoc_out/webrtc/audio_processing/unittest.pb.cc $(obj)/gen/protoc_out/webrtc/audio_processing/unittest.pb.h: ;

all_deps += $(builddir)/pyproto/webrtc/audio_processing/unittest_pb2.py $(obj)/gen/protoc_out/webrtc/audio_processing/unittest.pb.cc $(obj)/gen/protoc_out/webrtc/audio_processing/unittest.pb.h
cmd_audioproc_unittest_proto_genproto_0 = LD_LIBRARY_PATH=$(builddir)/lib.host:$(builddir)/lib.target:$$LD_LIBRARY_PATH; export LD_LIBRARY_PATH; cd src/modules; mkdir -p $(obj)/gen/protoc_out/webrtc/audio_processing $(builddir)/pyproto/webrtc/audio_processing; "$(builddir)/protoc" "--proto_path=audio_processing/test" "audio_processing/test/unittest$(suffix $<)" "--cpp_out=$(obj)/gen/protoc_out/webrtc/audio_processing" "--python_out=$(builddir)/pyproto/webrtc/audio_processing"
quiet_cmd_audioproc_unittest_proto_genproto_0 = RULE audioproc_unittest_proto_genproto_0 $@

rule_audioproc_unittest_proto_genproto_outputs := $(builddir)/pyproto/webrtc/audio_processing/unittest_pb2.py \
	$(obj)/gen/protoc_out/webrtc/audio_processing/unittest.pb.cc \
	$(obj)/gen/protoc_out/webrtc/audio_processing/unittest.pb.h

### Finished generating for rule: audioproc_unittest_proto_genproto

### Finished generating for all rules

DEFS_Debug := '-D_FILE_OFFSET_BITS=64' \
	'-DCHROMIUM_BUILD' \
	'-DUSE_NSS=1' \
	'-DTOOLKIT_USES_GTK=1' \
	'-DGTK_DISABLE_SINGLE_INCLUDES=1' \
	'-DENABLE_REMOTING=1' \
	'-DENABLE_P2P_APIS=1' \
	'-DENABLE_CONFIGURATION_POLICY' \
	'-DENABLE_INPUT_SPEECH' \
	'-DENABLE_NOTIFICATIONS' \
	'-DENABLE_GPU=1' \
	'-DENABLE_EGLIMAGE=1' \
	'-DUSE_SKIA=1' \
	'-DENABLE_REGISTER_PROTOCOL_HANDLER=1' \
	'-DENABLE_WEB_INTENTS=1' \
	'-DENABLE_PLUGIN_INSTALLATION=1' \
	'-DWEBRTC_TARGET_PC' \
	'-DWEBRTC_LINUX' \
	'-DWEBRTC_THREAD_RR' \
	'-DGOOGLE_PROTOBUF_NO_RTTI' \
	'-D__STDC_FORMAT_MACROS' \
	'-DDYNAMIC_ANNOTATIONS_ENABLED=1' \
	'-DWTF_USE_DYNAMIC_ANNOTATIONS=1' \
	'-D_DEBUG'

# Flags passed to all source files.
CFLAGS_Debug := -Werror \
	-pthread \
	-fno-exceptions \
	-fno-strict-aliasing \
	-Wall \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers \
	-fvisibility=hidden \
	-pipe \
	-fPIC \
	-Wextra \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers \
	-O0 \
	-g

# Flags passed to only C files.
CFLAGS_C_Debug := 

# Flags passed to only C++ files.
CFLAGS_CC_Debug := -fno-rtti \
	-fno-threadsafe-statics \
	-fvisibility-inlines-hidden \
	-Wsign-compare

INCS_Debug := -Isrc \
	-I. \
	-I$(obj)/gen/protoc_out \
	-Ithird_party/protobuf \
	-Ithird_party/protobuf/src

DEFS_Release := '-D_FILE_OFFSET_BITS=64' \
	'-DCHROMIUM_BUILD' \
	'-DUSE_NSS=1' \
	'-DTOOLKIT_USES_GTK=1' \
	'-DGTK_DISABLE_SINGLE_INCLUDES=1' \
	'-DENABLE_REMOTING=1' \
	'-DENABLE_P2P_APIS=1' \
	'-DENABLE_CONFIGURATION_POLICY' \
	'-DENABLE_INPUT_SPEECH' \
	'-DENABLE_NOTIFICATIONS' \
	'-DENABLE_GPU=1' \
	'-DENABLE_EGLIMAGE=1' \
	'-DUSE_SKIA=1' \
	'-DENABLE_REGISTER_PROTOCOL_HANDLER=1' \
	'-DENABLE_WEB_INTENTS=1' \
	'-DENABLE_PLUGIN_INSTALLATION=1' \
	'-DWEBRTC_TARGET_PC' \
	'-DWEBRTC_LINUX' \
	'-DWEBRTC_THREAD_RR' \
	'-DGOOGLE_PROTOBUF_NO_RTTI' \
	'-D__STDC_FORMAT_MACROS' \
	'-DNDEBUG' \
	'-DNVALGRIND' \
	'-DDYNAMIC_ANNOTATIONS_ENABLED=0'

# Flags passed to all source files.
CFLAGS_Release := -Werror \
	-pthread \
	-fno-exceptions \
	-fno-strict-aliasing \
	-Wall \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers \
	-fvisibility=hidden \
	-pipe \
	-fPIC \
	-Wextra \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers \
	-O2 \
	-fno-ident \
	-fdata-sections \
	-ffunction-sections

# Flags passed to only C files.
CFLAGS_C_Release := 

# Flags passed to only C++ files.
CFLAGS_CC_Release := -fno-rtti \
	-fno-threadsafe-statics \
	-fvisibility-inlines-hidden \
	-Wsign-compare

INCS_Release := -Isrc \
	-I. \
	-I$(obj)/gen/protoc_out \
	-Ithird_party/protobuf \
	-Ithird_party/protobuf/src

OBJS := $(obj).target/$(TARGET)/gen/protoc_out/webrtc/audio_processing/unittest.pb.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# Make sure our dependencies are built before any of us.
$(OBJS): | $(builddir)/protoc

# Make sure our actions/rules run before any of us.
$(OBJS): | $(rule_audioproc_unittest_proto_genproto_outputs)

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
# Build our special outputs first.
$(obj).target/src/modules/libaudioproc_unittest_proto.a: | $(rule_audioproc_unittest_proto_genproto_outputs)

# Preserve order dependency of special output on deps.
$(rule_audioproc_unittest_proto_genproto_outputs): | $(builddir)/protoc

LDFLAGS_Debug := -pthread \
	-Wl,-z,noexecstack \
	-fPIC \
	-B$(builddir)/../../third_party/gold

LDFLAGS_Release := -pthread \
	-Wl,-z,noexecstack \
	-fPIC \
	-B$(builddir)/../../third_party/gold \
	-Wl,-O1 \
	-Wl,--as-needed \
	-Wl,--gc-sections

LIBS := 

$(obj).target/src/modules/libaudioproc_unittest_proto.a: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/src/modules/libaudioproc_unittest_proto.a: LIBS := $(LIBS)
$(obj).target/src/modules/libaudioproc_unittest_proto.a: TOOLSET := $(TOOLSET)
$(obj).target/src/modules/libaudioproc_unittest_proto.a: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,alink)

all_deps += $(obj).target/src/modules/libaudioproc_unittest_proto.a
# Add target alias
.PHONY: audioproc_unittest_proto
audioproc_unittest_proto: $(obj).target/src/modules/libaudioproc_unittest_proto.a

