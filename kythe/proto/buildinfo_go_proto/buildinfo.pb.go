// Code generated by protoc-gen-go. DO NOT EDIT.
// source: kythe/proto/buildinfo.proto

package buildinfo_go_proto

import (
	fmt "fmt"
	proto "github.com/golang/protobuf/proto"
	math "math"
)

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.ProtoPackageIsVersion3 // please upgrade the proto package

type BuildDetails struct {
	BuildTarget          string   `protobuf:"bytes,1,opt,name=build_target,json=buildTarget,proto3" json:"build_target,omitempty"`
	RuleType             string   `protobuf:"bytes,2,opt,name=rule_type,json=ruleType,proto3" json:"rule_type,omitempty"`
	BuildConfig          string   `protobuf:"bytes,3,opt,name=build_config,json=buildConfig,proto3" json:"build_config,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *BuildDetails) Reset()         { *m = BuildDetails{} }
func (m *BuildDetails) String() string { return proto.CompactTextString(m) }
func (*BuildDetails) ProtoMessage()    {}
func (*BuildDetails) Descriptor() ([]byte, []int) {
	return fileDescriptor_eab47dfb43d1d01f, []int{0}
}

func (m *BuildDetails) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_BuildDetails.Unmarshal(m, b)
}
func (m *BuildDetails) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_BuildDetails.Marshal(b, m, deterministic)
}
func (m *BuildDetails) XXX_Merge(src proto.Message) {
	xxx_messageInfo_BuildDetails.Merge(m, src)
}
func (m *BuildDetails) XXX_Size() int {
	return xxx_messageInfo_BuildDetails.Size(m)
}
func (m *BuildDetails) XXX_DiscardUnknown() {
	xxx_messageInfo_BuildDetails.DiscardUnknown(m)
}

var xxx_messageInfo_BuildDetails proto.InternalMessageInfo

func (m *BuildDetails) GetBuildTarget() string {
	if m != nil {
		return m.BuildTarget
	}
	return ""
}

func (m *BuildDetails) GetRuleType() string {
	if m != nil {
		return m.RuleType
	}
	return ""
}

func (m *BuildDetails) GetBuildConfig() string {
	if m != nil {
		return m.BuildConfig
	}
	return ""
}

func init() {
	proto.RegisterType((*BuildDetails)(nil), "kythe.proto.BuildDetails")
}

func init() { proto.RegisterFile("kythe/proto/buildinfo.proto", fileDescriptor_eab47dfb43d1d01f) }

var fileDescriptor_eab47dfb43d1d01f = []byte{
	// 175 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0xe2, 0x92, 0xce, 0xae, 0x2c, 0xc9,
	0x48, 0xd5, 0x2f, 0x28, 0xca, 0x2f, 0xc9, 0xd7, 0x4f, 0x2a, 0xcd, 0xcc, 0x49, 0xc9, 0xcc, 0x4b,
	0xcb, 0xd7, 0x03, 0xf3, 0x85, 0xb8, 0xc1, 0x92, 0x10, 0x8e, 0x52, 0x21, 0x17, 0x8f, 0x13, 0x48,
	0xde, 0x25, 0xb5, 0x24, 0x31, 0x33, 0xa7, 0x58, 0x48, 0x91, 0x8b, 0x07, 0xac, 0x3e, 0xbe, 0x24,
	0xb1, 0x28, 0x3d, 0xb5, 0x44, 0x82, 0x51, 0x81, 0x51, 0x83, 0x33, 0x88, 0x1b, 0x2c, 0x16, 0x02,
	0x16, 0x12, 0x92, 0xe6, 0xe2, 0x2c, 0x2a, 0xcd, 0x49, 0x8d, 0x2f, 0xa9, 0x2c, 0x48, 0x95, 0x60,
	0x02, 0xcb, 0x73, 0x80, 0x04, 0x42, 0x2a, 0x0b, 0x52, 0x11, 0xfa, 0x93, 0xf3, 0xf3, 0xd2, 0x32,
	0xd3, 0x25, 0x98, 0x91, 0xf4, 0x3b, 0x83, 0x85, 0x9c, 0x4c, 0xb9, 0xe4, 0x93, 0xf3, 0x73, 0xf5,
	0xd2, 0xf3, 0xf3, 0xd3, 0x73, 0x52, 0xf5, 0x52, 0x52, 0xcb, 0x4a, 0xf2, 0xf3, 0x73, 0x8a, 0xf5,
	0x90, 0x5c, 0x15, 0x25, 0x04, 0x77, 0x73, 0x7c, 0x7a, 0x7e, 0x3c, 0x58, 0x2c, 0x89, 0x0d, 0x4c,
	0x19, 0x03, 0x02, 0x00, 0x00, 0xff, 0xff, 0x50, 0x99, 0xa9, 0x7f, 0xdc, 0x00, 0x00, 0x00,
}
