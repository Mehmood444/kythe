def generated_llvm_build_targets(ctx):
    ctx.group(ctx, name = "Miscellaneous", parent = "$ROOT")
    ctx.group(ctx, name = "Bindings", parent = "$ROOT")
    ctx.group(ctx, name = "Docs", parent = "$ROOT")
    ctx.group(ctx, name = "Examples", parent = "$ROOT")
    ctx.group(ctx, name = "Libraries", parent = "$ROOT")
    ctx.library(ctx, name = "Analysis", parent = "Libraries", required_libraries = ["BinaryFormat", "Core", "Object", "ProfileData", "Support"])
    ctx.library(ctx, name = "AsmParser", parent = "Libraries", required_libraries = ["BinaryFormat", "Core", "Support"])
    ctx.group(ctx, name = "Bitcode", parent = "Libraries")
    ctx.library(ctx, name = "BitReader", parent = "Bitcode", required_libraries = ["BitstreamReader", "Core", "Support"])
    ctx.library(ctx, name = "BitWriter", parent = "Bitcode", required_libraries = ["Analysis", "Core", "MC", "Object", "Support"])
    ctx.group(ctx, name = "Bitstream", parent = "Libraries")
    ctx.library(ctx, required_libraries = ["Support"], name = "BitstreamReader", parent = "Bitstream")
    ctx.library(ctx, required_libraries = ["Analysis", "BitReader", "BitWriter", "Core", "MC", "ProfileData", "Scalar", "Support", "Target", "TransformUtils"], name = "CodeGen", parent = "Libraries")
    ctx.library(ctx, name = "AsmPrinter", parent = "Libraries", required_libraries = ["Analysis", "BinaryFormat", "CodeGen", "Core", "DebugInfoCodeView", "DebugInfoDWARF", "DebugInfoMSF", "MC", "MCParser", "Remarks", "Support", "Target"])
    ctx.library(ctx, name = "SelectionDAG", parent = "CodeGen", required_libraries = ["Analysis", "CodeGen", "Core", "MC", "Support", "Target", "TransformUtils"])
    ctx.library(ctx, name = "MIRParser", parent = "CodeGen", required_libraries = ["AsmParser", "BinaryFormat", "CodeGen", "Core", "MC", "Support", "Target"])
    ctx.library(ctx, name = "GlobalISel", parent = "CodeGen", required_libraries = ["Analysis", "CodeGen", "Core", "MC", "SelectionDAG", "Support", "Target", "TransformUtils"])
    ctx.group(ctx, parent = "$ROOT", name = "DebugInfo")
    ctx.library(ctx, name = "DebugInfoDWARF", parent = "DebugInfo", required_libraries = ["BinaryFormat", "Object", "MC", "Support"])
    ctx.library(ctx, required_libraries = ["MC", "Support"], name = "DebugInfoGSYM", parent = "DebugInfo")
    ctx.library(ctx, name = "DebugInfoMSF", parent = "DebugInfo", required_libraries = ["Support"])
    ctx.library(ctx, name = "DebugInfoCodeView", parent = "DebugInfo", required_libraries = ["Support", "DebugInfoMSF"])
    ctx.library(ctx, name = "DebugInfoPDB", parent = "DebugInfo", required_libraries = ["Object", "Support", "DebugInfoCodeView", "DebugInfoMSF"])
    ctx.library(ctx, required_libraries = ["DebugInfoDWARF", "DebugInfoPDB", "Object", "Support", "Demangle"], name = "Symbolize", parent = "DebugInfo")
    ctx.library(ctx, name = "Demangle", parent = "Libraries")
    ctx.library(ctx, parent = "Libraries", required_libraries = ["Core", "MC", "Object", "RuntimeDyld", "Support", "Target"], name = "ExecutionEngine")
    ctx.library(ctx, parent = "ExecutionEngine", required_libraries = ["CodeGen", "Core", "ExecutionEngine", "Support"], name = "Interpreter")
    ctx.library(ctx, name = "MCJIT", parent = "ExecutionEngine", required_libraries = ["Core", "ExecutionEngine", "Object", "RuntimeDyld", "Support", "Target"])
    ctx.library(ctx, required_libraries = ["BinaryFormat", "Object", "Support"], name = "JITLink", parent = "ExecutionEngine")
    ctx.library(ctx, name = "RuntimeDyld", parent = "ExecutionEngine", required_libraries = ["MC", "Object", "Support"])
    ctx.optional_library(ctx, name = "IntelJITEvents", parent = "ExecutionEngine", required_libraries = ["CodeGen", "Core", "DebugInfoDWARF", "Support", "Object", "ExecutionEngine"])
    ctx.optional_library(ctx, name = "OProfileJIT", parent = "ExecutionEngine", required_libraries = ["DebugInfoDWARF", "Support", "Object", "ExecutionEngine"])
    ctx.library(ctx, name = "OrcJIT", parent = "ExecutionEngine", required_libraries = ["Core", "ExecutionEngine", "JITLink", "Object", "OrcError", "MC", "Passes", "RuntimeDyld", "Support", "Target", "TransformUtils"])
    ctx.library(ctx, name = "OrcError", parent = "ExecutionEngine", required_libraries = ["Support"])
    ctx.optional_library(ctx, name = "PerfJITEvents", parent = "ExecutionEngine", required_libraries = ["CodeGen", "Core", "DebugInfoDWARF", "ExecutionEngine", "Object", "Support"])
    ctx.library(ctx, name = "FuzzMutate", parent = "Libraries", required_libraries = ["Analysis", "BitReader", "BitWriter", "Core", "Scalar", "Support", "Target"])
    ctx.library(ctx, name = "LineEditor", parent = "Libraries", required_libraries = ["Support"])
    ctx.library(ctx, name = "Linker", parent = "Libraries", required_libraries = ["Core", "Support", "TransformUtils"])
    ctx.library(ctx, required_libraries = ["BinaryFormat", "Remarks", "Support"], name = "Core", parent = "Libraries")
    ctx.library(ctx, name = "IRReader", parent = "Libraries", required_libraries = ["AsmParser", "BitReader", "Core", "Support"])
    ctx.library(ctx, required_libraries = ["AggressiveInstCombine", "Analysis", "BitReader", "BitWriter", "CodeGen", "Core", "IPO", "InstCombine", "Linker", "MC", "ObjCARC", "Object", "Passes", "Remarks", "Scalar", "Support", "Target", "TransformUtils"], name = "LTO", parent = "Libraries")
    ctx.library(ctx, name = "MC", parent = "Libraries", required_libraries = ["Support", "BinaryFormat", "DebugInfoCodeView"])
    ctx.library(ctx, name = "MCDisassembler", parent = "MC", required_libraries = ["MC", "Support"])
    ctx.library(ctx, name = "MCParser", parent = "MC", required_libraries = ["MC", "Support"])
    ctx.library(ctx, name = "MCA", parent = "Libraries", required_libraries = ["MC", "Support"])
    ctx.library(ctx, required_libraries = ["BitReader", "Core", "MC", "BinaryFormat", "MCParser", "Support", "TextAPI"], name = "Object", parent = "Libraries")
    ctx.library(ctx, required_libraries = ["Support"], name = "BinaryFormat", parent = "Libraries")
    ctx.library(ctx, name = "ObjectYAML", parent = "Libraries", required_libraries = ["Object", "Support", "DebugInfoCodeView", "MC"])
    ctx.library(ctx, required_libraries = ["Support"], name = "Option", parent = "Libraries")
    ctx.library(ctx, parent = "Libraries", required_libraries = ["BitstreamReader", "Support"], name = "Remarks")
    ctx.library(ctx, required_libraries = ["AggressiveInstCombine", "Analysis", "CodeGen", "Core", "IPO", "InstCombine", "Scalar", "Support", "Target", "TransformUtils", "Vectorize", "Instrumentation"], name = "Passes", parent = "Libraries")
    ctx.library(ctx, parent = "Libraries", required_libraries = ["Core", "Support"], name = "ProfileData")
    ctx.library(ctx, name = "Coverage", parent = "ProfileData", required_libraries = ["Core", "Object", "ProfileData", "Support"])
    ctx.library(ctx, name = "Support", parent = "Libraries", required_libraries = ["Demangle"])
    ctx.library(ctx, parent = "Libraries", required_libraries = ["Support"], name = "TableGen")
    ctx.library(ctx, name = "TextAPI", parent = "Libraries", required_libraries = ["Support", "BinaryFormat"])
    ctx.library_group(ctx, name = "all-targets", parent = "Libraries")
    ctx.library_group(ctx, name = "Engine", parent = "Libraries")
    ctx.library_group(ctx, name = "Native", parent = "Libraries")
    ctx.library_group(ctx, name = "NativeCodeGen", parent = "Libraries")
    ctx.library(ctx, parent = "Libraries", required_libraries = ["Analysis", "Core", "MC", "Support"], name = "Target")
    ctx.target_group(ctx, parent = "Target", name = "AMDGPU")
    ctx.library(ctx, required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "IPO", "MC", "AMDGPUDesc", "AMDGPUInfo", "AMDGPUUtils", "Scalar", "SelectionDAG", "Support", "Target", "TransformUtils", "Vectorize", "GlobalISel", "BinaryFormat", "MIRParser"], add_to_library_groups = ["AMDGPU"], name = "AMDGPUCodeGen", parent = "AMDGPU")
    ctx.library(ctx, name = "AMDGPUAsmParser", parent = "AMDGPU", required_libraries = ["MC", "MCParser", "AMDGPUDesc", "AMDGPUInfo", "AMDGPUUtils", "Support"], add_to_library_groups = ["AMDGPU"])
    ctx.library(ctx, name = "AMDGPUDisassembler", parent = "AMDGPU", required_libraries = ["AMDGPUDesc", "AMDGPUInfo", "AMDGPUUtils", "MC", "MCDisassembler", "Support"], add_to_library_groups = ["AMDGPU"])
    ctx.library(ctx, add_to_library_groups = ["AMDGPU"], name = "AMDGPUDesc", parent = "AMDGPU", required_libraries = ["Core", "MC", "AMDGPUInfo", "AMDGPUUtils", "Support", "BinaryFormat"])
    ctx.library(ctx, add_to_library_groups = ["AMDGPU"], name = "AMDGPUInfo", parent = "AMDGPU", required_libraries = ["Support"])
    ctx.library(ctx, add_to_library_groups = ["AMDGPU"], name = "AMDGPUUtils", parent = "AMDGPU", required_libraries = ["Core", "MC", "BinaryFormat", "Support"])
    ctx.target_group(ctx, name = "ARC", parent = "Target")
    ctx.library(ctx, add_to_library_groups = ["ARC"], name = "ARCCodeGen", parent = "ARC", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "SelectionDAG", "Support", "Target", "TransformUtils", "ARCDesc", "ARCInfo"])
    ctx.library(ctx, name = "ARCDisassembler", parent = "ARC", required_libraries = ["MCDisassembler", "Support", "ARCInfo"], add_to_library_groups = ["ARC"])
    ctx.library(ctx, required_libraries = ["MC", "Support", "ARCInfo"], add_to_library_groups = ["ARC"], name = "ARCDesc", parent = "ARC")
    ctx.library(ctx, name = "ARCInfo", parent = "ARC", required_libraries = ["Support"], add_to_library_groups = ["ARC"])
    ctx.target_group(ctx, parent = "Target", name = "ARM")
    ctx.library(ctx, add_to_library_groups = ["ARM"], name = "ARMCodeGen", parent = "ARM", required_libraries = ["ARMDesc", "ARMInfo", "Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "Scalar", "SelectionDAG", "Support", "Target", "GlobalISel", "ARMUtils", "TransformUtils", "CFGuard"])
    ctx.library(ctx, required_libraries = ["ARMDesc", "ARMInfo", "MC", "MCParser", "Support", "ARMUtils"], add_to_library_groups = ["ARM"], name = "ARMAsmParser", parent = "ARM")
    ctx.library(ctx, parent = "ARM", required_libraries = ["ARMDesc", "ARMInfo", "MCDisassembler", "Support", "ARMUtils"], add_to_library_groups = ["ARM"], name = "ARMDisassembler")
    ctx.library(ctx, required_libraries = ["ARMInfo", "ARMUtils", "MC", "MCDisassembler", "Support"], add_to_library_groups = ["ARM"], name = "ARMDesc", parent = "ARM")
    ctx.library(ctx, name = "ARMInfo", parent = "ARM", required_libraries = ["Support"], add_to_library_groups = ["ARM"])
    ctx.library(ctx, add_to_library_groups = ["ARM"], name = "ARMUtils", parent = "ARM", required_libraries = ["Support"])
    ctx.target_group(ctx, name = "AArch64", parent = "Target")
    ctx.library(ctx, add_to_library_groups = ["AArch64"], name = "AArch64CodeGen", parent = "AArch64", required_libraries = ["AArch64Desc", "AArch64Info", "AArch64Utils", "Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "Scalar", "SelectionDAG", "Support", "Target", "TransformUtils", "GlobalISel", "CFGuard"])
    ctx.library(ctx, required_libraries = ["AArch64Desc", "AArch64Info", "AArch64Utils", "MC", "MCParser", "Support"], add_to_library_groups = ["AArch64"], name = "AArch64AsmParser", parent = "AArch64")
    ctx.library(ctx, name = "AArch64Disassembler", parent = "AArch64", required_libraries = ["AArch64Desc", "AArch64Info", "AArch64Utils", "MC", "MCDisassembler", "Support"], add_to_library_groups = ["AArch64"])
    ctx.library(ctx, required_libraries = ["AArch64Info", "AArch64Utils", "MC", "Support"], add_to_library_groups = ["AArch64"], name = "AArch64Desc", parent = "AArch64")
    ctx.library(ctx, name = "AArch64Info", parent = "AArch64", required_libraries = ["Support"], add_to_library_groups = ["AArch64"])
    ctx.library(ctx, name = "AArch64Utils", parent = "AArch64", required_libraries = ["Support"], add_to_library_groups = ["AArch64"])
    ctx.target_group(ctx, parent = "Target", name = "AVR")
    ctx.library(ctx, parent = "AVR", required_libraries = ["AsmPrinter", "CodeGen", "Core", "MC", "AVRDesc", "AVRInfo", "SelectionDAG", "Support", "Target"], add_to_library_groups = ["AVR"], name = "AVRCodeGen")
    ctx.library(ctx, name = "AVRAsmParser", parent = "AVR", required_libraries = ["MC", "MCParser", "AVRDesc", "AVRInfo", "Support"], add_to_library_groups = ["AVR"])
    ctx.library(ctx, name = "AVRDisassembler", parent = "AVR", required_libraries = ["MCDisassembler", "AVRInfo", "Support"], add_to_library_groups = ["AVR"])
    ctx.library(ctx, name = "AVRDesc", parent = "AVR", required_libraries = ["MC", "AVRInfo", "Support"], add_to_library_groups = ["AVR"])
    ctx.library(ctx, name = "AVRInfo", parent = "AVR", required_libraries = ["Support"], add_to_library_groups = ["AVR"])
    ctx.target_group(ctx, name = "BPF", parent = "Target")
    ctx.library(ctx, parent = "BPF", required_libraries = ["AsmPrinter", "CodeGen", "Core", "MC", "BPFDesc", "BPFInfo", "SelectionDAG", "Support", "Target"], add_to_library_groups = ["BPF"], name = "BPFCodeGen")
    ctx.library(ctx, name = "BPFAsmParser", parent = "BPF", required_libraries = ["MC", "MCParser", "BPFDesc", "BPFInfo", "Support"], add_to_library_groups = ["BPF"])
    ctx.library(ctx, name = "BPFDisassembler", parent = "BPF", required_libraries = ["MCDisassembler", "BPFInfo", "Support"], add_to_library_groups = ["BPF"])
    ctx.library(ctx, name = "BPFDesc", parent = "BPF", required_libraries = ["MC", "BPFInfo", "Support"], add_to_library_groups = ["BPF"])
    ctx.library(ctx, add_to_library_groups = ["BPF"], name = "BPFInfo", parent = "BPF", required_libraries = ["Support"])
    ctx.target_group(ctx, name = "Lanai", parent = "Target")
    ctx.library(ctx, parent = "Lanai", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "LanaiAsmParser", "LanaiDesc", "LanaiInfo", "MC", "SelectionDAG", "Support", "Target", "TransformUtils"], add_to_library_groups = ["Lanai"], name = "LanaiCodeGen")
    ctx.library(ctx, required_libraries = ["MC", "MCParser", "Support", "LanaiDesc", "LanaiInfo"], add_to_library_groups = ["Lanai"], name = "LanaiAsmParser", parent = "Lanai")
    ctx.library(ctx, parent = "Lanai", required_libraries = ["LanaiDesc", "LanaiInfo", "MC", "MCDisassembler", "Support"], add_to_library_groups = ["Lanai"], name = "LanaiDisassembler")
    ctx.library(ctx, name = "LanaiDesc", parent = "Lanai", required_libraries = ["LanaiInfo", "MC", "MCDisassembler", "Support"], add_to_library_groups = ["Lanai"])
    ctx.library(ctx, add_to_library_groups = ["Lanai"], name = "LanaiInfo", parent = "Lanai", required_libraries = ["Support"])
    ctx.library(ctx, name = "HexagonCodeGen", parent = "Hexagon", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "HexagonAsmParser", "HexagonDesc", "HexagonInfo", "IPO", "MC", "Scalar", "SelectionDAG", "Support", "Target", "TransformUtils"], add_to_library_groups = ["Hexagon"])
    ctx.target_group(ctx, name = "Hexagon", parent = "Target")
    ctx.library(ctx, name = "HexagonAsmParser", parent = "Hexagon", required_libraries = ["MC", "MCParser", "Support", "HexagonDesc", "HexagonInfo"], add_to_library_groups = ["Hexagon"])
    ctx.library(ctx, required_libraries = ["HexagonDesc", "HexagonInfo", "MC", "MCDisassembler", "Support"], add_to_library_groups = ["Hexagon"], name = "HexagonDisassembler", parent = "Hexagon")
    ctx.library(ctx, name = "HexagonDesc", parent = "Hexagon", required_libraries = ["HexagonInfo", "MC", "Support"], add_to_library_groups = ["Hexagon"])
    ctx.library(ctx, add_to_library_groups = ["Hexagon"], name = "HexagonInfo", parent = "Hexagon", required_libraries = ["Support"])
    ctx.target_group(ctx, parent = "Target", name = "MSP430")
    ctx.library(ctx, name = "MSP430CodeGen", parent = "MSP430", required_libraries = ["AsmPrinter", "CodeGen", "Core", "MC", "MSP430Desc", "MSP430Info", "SelectionDAG", "Support", "Target"], add_to_library_groups = ["MSP430"])
    ctx.library(ctx, parent = "MSP430", required_libraries = ["MC", "MCParser", "MSP430Desc", "MSP430Info", "Support"], add_to_library_groups = ["MSP430"], name = "MSP430AsmParser")
    ctx.library(ctx, required_libraries = ["MCDisassembler", "MSP430Info", "Support"], add_to_library_groups = ["MSP430"], name = "MSP430Disassembler", parent = "MSP430")
    ctx.library(ctx, add_to_library_groups = ["MSP430"], name = "MSP430Desc", parent = "MSP430", required_libraries = ["MC", "MSP430Info", "Support"])
    ctx.library(ctx, add_to_library_groups = ["MSP430"], name = "MSP430Info", parent = "MSP430", required_libraries = ["Support"])
    ctx.target_group(ctx, name = "NVPTX", parent = "Target")
    ctx.library(ctx, parent = "NVPTX", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "IPO", "MC", "NVPTXDesc", "NVPTXInfo", "Scalar", "SelectionDAG", "Support", "Target", "TransformUtils", "Vectorize"], add_to_library_groups = ["NVPTX"], name = "NVPTXCodeGen")
    ctx.library(ctx, name = "NVPTXDesc", parent = "NVPTX", required_libraries = ["MC", "NVPTXInfo", "Support"], add_to_library_groups = ["NVPTX"])
    ctx.library(ctx, add_to_library_groups = ["NVPTX"], name = "NVPTXInfo", parent = "NVPTX", required_libraries = ["Support"])
    ctx.target_group(ctx, name = "Mips", parent = "Target")
    ctx.library(ctx, add_to_library_groups = ["Mips"], name = "MipsCodeGen", parent = "Mips", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "MipsDesc", "MipsInfo", "SelectionDAG", "Support", "Target", "GlobalISel"])
    ctx.library(ctx, parent = "Mips", required_libraries = ["MC", "MCParser", "MipsDesc", "MipsInfo", "Support"], add_to_library_groups = ["Mips"], name = "MipsAsmParser")
    ctx.library(ctx, required_libraries = ["MCDisassembler", "MipsInfo", "Support"], add_to_library_groups = ["Mips"], name = "MipsDisassembler", parent = "Mips")
    ctx.library(ctx, required_libraries = ["MC", "MipsInfo", "Support"], add_to_library_groups = ["Mips"], name = "MipsDesc", parent = "Mips")
    ctx.library(ctx, name = "MipsInfo", parent = "Mips", required_libraries = ["Support"], add_to_library_groups = ["Mips"])
    ctx.target_group(ctx, name = "PowerPC", parent = "Target")
    ctx.library(ctx, parent = "PowerPC", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "PowerPCDesc", "PowerPCInfo", "Scalar", "SelectionDAG", "Support", "Target", "TransformUtils"], add_to_library_groups = ["PowerPC"], name = "PowerPCCodeGen")
    ctx.library(ctx, name = "PowerPCAsmParser", parent = "PowerPC", required_libraries = ["MC", "MCParser", "PowerPCDesc", "PowerPCInfo", "Support"], add_to_library_groups = ["PowerPC"])
    ctx.library(ctx, parent = "PowerPC", required_libraries = ["MCDisassembler", "PowerPCInfo", "Support"], add_to_library_groups = ["PowerPC"], name = "PowerPCDisassembler")
    ctx.library(ctx, name = "PowerPCDesc", parent = "PowerPC", required_libraries = ["MC", "PowerPCInfo", "Support"], add_to_library_groups = ["PowerPC"])
    ctx.library(ctx, parent = "PowerPC", required_libraries = ["Support"], add_to_library_groups = ["PowerPC"], name = "PowerPCInfo")
    ctx.target_group(ctx, name = "RISCV", parent = "Target")
    ctx.library(ctx, required_libraries = ["Analysis", "AsmPrinter", "Core", "CodeGen", "MC", "RISCVDesc", "RISCVInfo", "RISCVUtils", "SelectionDAG", "Support", "Target", "GlobalISel"], add_to_library_groups = ["RISCV"], name = "RISCVCodeGen", parent = "RISCV")
    ctx.library(ctx, add_to_library_groups = ["RISCV"], name = "RISCVAsmParser", parent = "RISCV", required_libraries = ["MC", "MCParser", "RISCVDesc", "RISCVInfo", "RISCVUtils", "Support"])
    ctx.library(ctx, required_libraries = ["MCDisassembler", "RISCVInfo", "Support"], add_to_library_groups = ["RISCV"], name = "RISCVDisassembler", parent = "RISCV")
    ctx.library(ctx, add_to_library_groups = ["RISCV"], name = "RISCVInfo", parent = "RISCV", required_libraries = ["Support"])
    ctx.library(ctx, parent = "RISCV", required_libraries = ["MC", "RISCVInfo", "RISCVUtils", "Support"], add_to_library_groups = ["RISCV"], name = "RISCVDesc")
    ctx.library(ctx, required_libraries = ["Support"], add_to_library_groups = ["RISCV"], name = "RISCVUtils", parent = "RISCV")
    ctx.library(ctx, required_libraries = ["AsmPrinter", "CodeGen", "Core", "MC", "SelectionDAG", "SparcDesc", "SparcInfo", "Support", "Target"], add_to_library_groups = ["Sparc"], name = "SparcCodeGen", parent = "Sparc")
    ctx.target_group(ctx, name = "Sparc", parent = "Target")
    ctx.library(ctx, name = "SparcAsmParser", parent = "Sparc", required_libraries = ["MC", "MCParser", "SparcDesc", "SparcInfo", "Support"], add_to_library_groups = ["Sparc"])
    ctx.library(ctx, name = "SparcDisassembler", parent = "Sparc", required_libraries = ["MCDisassembler", "SparcInfo", "Support"], add_to_library_groups = ["Sparc"])
    ctx.library(ctx, name = "SparcDesc", parent = "Sparc", required_libraries = ["MC", "SparcInfo", "Support"], add_to_library_groups = ["Sparc"])
    ctx.library(ctx, name = "SparcInfo", parent = "Sparc", required_libraries = ["Support"], add_to_library_groups = ["Sparc"])
    ctx.target_group(ctx, name = "SystemZ", parent = "Target")
    ctx.library(ctx, add_to_library_groups = ["SystemZ"], name = "SystemZCodeGen", parent = "SystemZ", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "Scalar", "SelectionDAG", "Support", "SystemZDesc", "SystemZInfo", "Target"])
    ctx.library(ctx, name = "SystemZAsmParser", parent = "SystemZ", required_libraries = ["MC", "MCParser", "Support", "SystemZDesc", "SystemZInfo"], add_to_library_groups = ["SystemZ"])
    ctx.library(ctx, name = "SystemZDisassembler", parent = "SystemZ", required_libraries = ["MC", "MCDisassembler", "Support", "SystemZDesc", "SystemZInfo"], add_to_library_groups = ["SystemZ"])
    ctx.library(ctx, required_libraries = ["MC", "Support", "SystemZInfo"], add_to_library_groups = ["SystemZ"], name = "SystemZDesc", parent = "SystemZ")
    ctx.library(ctx, add_to_library_groups = ["SystemZ"], name = "SystemZInfo", parent = "SystemZ", required_libraries = ["Support"])
    ctx.target_group(ctx, name = "WebAssembly", parent = "Target")
    ctx.library(ctx, name = "WebAssemblyCodeGen", parent = "WebAssembly", required_libraries = ["Analysis", "AsmPrinter", "BinaryFormat", "CodeGen", "Core", "MC", "Scalar", "SelectionDAG", "Support", "Target", "TransformUtils", "WebAssemblyDesc", "WebAssemblyInfo"], add_to_library_groups = ["WebAssembly"])
    ctx.library(ctx, name = "WebAssemblyAsmParser", parent = "WebAssembly", required_libraries = ["MC", "MCParser", "WebAssemblyInfo", "Support"], add_to_library_groups = ["WebAssembly"])
    ctx.library(ctx, required_libraries = ["WebAssemblyDesc", "MCDisassembler", "WebAssemblyInfo", "Support", "MC"], add_to_library_groups = ["WebAssembly"], name = "WebAssemblyDisassembler", parent = "WebAssembly")
    ctx.library(ctx, name = "WebAssemblyDesc", parent = "WebAssembly", required_libraries = ["MC", "Support", "WebAssemblyInfo"], add_to_library_groups = ["WebAssembly"])
    ctx.library(ctx, required_libraries = ["Support"], add_to_library_groups = ["WebAssembly"], name = "WebAssemblyInfo", parent = "WebAssembly")
    ctx.target_group(ctx, parent = "Target", name = "X86")
    ctx.library(ctx, name = "X86CodeGen", parent = "X86", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "SelectionDAG", "Support", "Target", "X86Desc", "X86Info", "X86Utils", "GlobalISel", "ProfileData", "CFGuard"], add_to_library_groups = ["X86"])
    ctx.library(ctx, parent = "X86", required_libraries = ["MC", "MCParser", "Support", "X86Desc", "X86Info"], add_to_library_groups = ["X86"], name = "X86AsmParser")
    ctx.library(ctx, name = "X86Disassembler", parent = "X86", required_libraries = ["MCDisassembler", "Support", "X86Info"], add_to_library_groups = ["X86"])
    ctx.library(ctx, name = "X86Desc", parent = "X86", required_libraries = ["MC", "MCDisassembler", "Object", "Support", "X86Info", "X86Utils"], add_to_library_groups = ["X86"])
    ctx.library(ctx, name = "X86Info", parent = "X86", required_libraries = ["Support"], add_to_library_groups = ["X86"])
    ctx.library(ctx, add_to_library_groups = ["X86"], name = "X86Utils", parent = "X86", required_libraries = ["Support"])
    ctx.target_group(ctx, name = "XCore", parent = "Target")
    ctx.library(ctx, parent = "XCore", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "SelectionDAG", "Support", "Target", "TransformUtils", "XCoreDesc", "XCoreInfo"], add_to_library_groups = ["XCore"], name = "XCoreCodeGen")
    ctx.library(ctx, name = "XCoreDisassembler", parent = "XCore", required_libraries = ["MCDisassembler", "Support", "XCoreInfo"], add_to_library_groups = ["XCore"])
    ctx.library(ctx, name = "XCoreDesc", parent = "XCore", required_libraries = ["MC", "Support", "XCoreInfo"], add_to_library_groups = ["XCore"])
    ctx.library(ctx, name = "XCoreInfo", parent = "XCore", required_libraries = ["Support"], add_to_library_groups = ["XCore"])
    ctx.library(ctx, parent = "Libraries", required_libraries = ["Support"], name = "TestingSupport")
    ctx.group(ctx, parent = "Libraries", name = "ToolDrivers")
    ctx.library(ctx, parent = "Libraries", required_libraries = ["Object", "Option", "Support"], name = "DlltoolDriver")
    ctx.library(ctx, name = "LibDriver", parent = "Libraries", required_libraries = ["BinaryFormat", "BitReader", "Object", "Option", "Support"])
    ctx.group(ctx, name = "Transforms", parent = "Libraries")
    ctx.library(ctx, name = "AggressiveInstCombine", parent = "Transforms", required_libraries = ["Analysis", "Core", "Support", "TransformUtils"])
    ctx.library(ctx, name = "Coroutines", parent = "Transforms", required_libraries = ["Analysis", "Core", "IPO", "Scalar", "Support", "TransformUtils"])
    ctx.library(ctx, name = "IPO", parent = "Transforms", library_name = "ipo", required_libraries = ["AggressiveInstCombine", "Analysis", "BitReader", "BitWriter", "Core", "InstCombine", "IRReader", "Linker", "Object", "ProfileData", "Scalar", "Support", "TransformUtils", "Vectorize", "Instrumentation"])
    ctx.library(ctx, required_libraries = ["Analysis", "Core", "Support", "TransformUtils"], name = "InstCombine", parent = "Transforms")
    ctx.library(ctx, name = "Instrumentation", parent = "Transforms", required_libraries = ["Analysis", "Core", "MC", "Support", "TransformUtils", "ProfileData"])
    ctx.library(ctx, name = "Scalar", parent = "Transforms", library_name = "ScalarOpts", required_libraries = ["AggressiveInstCombine", "Analysis", "Core", "InstCombine", "Support", "TransformUtils"])
    ctx.library(ctx, name = "TransformUtils", parent = "Transforms", required_libraries = ["Analysis", "Core", "Support"])
    ctx.library(ctx, required_libraries = ["Analysis", "Core", "Support", "TransformUtils"], name = "Vectorize", parent = "Transforms", library_name = "Vectorize")
    ctx.library(ctx, name = "ObjCARC", parent = "Transforms", library_name = "ObjCARCOpts", required_libraries = ["Analysis", "Core", "Support", "TransformUtils"])
    ctx.library(ctx, name = "CFGuard", parent = "Transforms", required_libraries = ["Core", "Support"])
    ctx.library(ctx, required_libraries = ["Support"], name = "WindowsManifest", parent = "Libraries")
    ctx.library(ctx, name = "XRay", parent = "Libraries", required_libraries = ["Support", "Object"])
    ctx.group(ctx, name = "Projects", parent = "$ROOT")
    ctx.group(ctx, name = "Tools", parent = "$ROOT")
    ctx.tool(ctx, parent = "Tools", required_libraries = ["AsmParser", "BitReader", "BitWriter", "CodeGen", "IRReader", "IPO", "Instrumentation", "Linker", "ObjCARC", "Scalar", "all-targets"], name = "bugpoint")
    ctx.tool(ctx, name = "dsymutil", parent = "Tools", required_libraries = ["AsmPrinter", "DebugInfoDWARF", "MC", "Object", "Support", "all-targets"])
    ctx.tool(ctx, name = "llc", parent = "Tools", required_libraries = ["AsmParser", "BitReader", "IRReader", "MIRParser", "TransformUtils", "Scalar", "Vectorize", "all-targets"])
    ctx.tool(ctx, name = "lli", parent = "Tools", required_libraries = ["AsmParser", "BitReader", "IRReader", "Instrumentation", "Interpreter", "MCJIT", "Native", "NativeCodeGen", "SelectionDAG", "TransformUtils"])
    ctx.tool(ctx, name = "lli-child-target", parent = "lli")
    ctx.tool(ctx, name = "llvm-ar", parent = "Tools")
    ctx.tool(ctx, name = "llvm-as", parent = "Tools", required_libraries = ["AsmParser", "BitWriter"])
    ctx.tool(ctx, name = "llvm-bcanalyzer", parent = "Tools", required_libraries = ["BitReader", "BitstreamReader", "Support"])
    ctx.tool(ctx, name = "llvm-cat", parent = "Tools", required_libraries = ["AsmParser", "BitReader", "BitWriter"])
    ctx.tool(ctx, parent = "Tools", required_libraries = ["all-targets", "MC", "MCDisassembler", "MCParser", "Support", "Symbolize"], name = "llvm-cfi-verify")
    ctx.tool(ctx, name = "llvm-cov", parent = "Tools", required_libraries = ["Coverage", "Support", "Instrumentation"])
    ctx.tool(ctx, parent = "Tools", required_libraries = ["Object", "Option", "Support"], name = "llvm-cvtres")
    ctx.tool(ctx, name = "llvm-diff", parent = "Tools", required_libraries = ["AsmParser", "BitReader", "IRReader"])
    ctx.tool(ctx, required_libraries = ["Analysis", "BitReader"], name = "llvm-dis", parent = "Tools")
    ctx.tool(ctx, name = "llvm-dwarfdump", parent = "Tools", required_libraries = ["DebugInfoDWARF", "Object"])
    ctx.tool(ctx, name = "llvm-dwp", parent = "Tools", required_libraries = ["AsmPrinter", "DebugInfoDWARF", "MC", "Object", "Support", "all-targets"])
    ctx.tool(ctx, name = "llvm-elfabi", parent = "Tools", required_libraries = ["Object", "Support", "TextAPI"])
    ctx.tool(ctx, name = "llvm-ifs", parent = "Tools", required_libraries = ["Object", "Support", "TextAPI"])
    ctx.tool(ctx, name = "llvm-exegesis", parent = "Tools", required_libraries = ["CodeGen", "ExecutionEngine", "MC", "MCJIT", "Native", "NativeCodeGen", "Object", "Support"])
    ctx.tool(ctx, name = "llvm-extract", parent = "Tools", required_libraries = ["AsmParser", "BitReader", "BitWriter", "IRReader", "IPO"])
    ctx.tool(ctx, name = "llvm-jitlistener", parent = "Tools", required_libraries = ["AsmParser", "BitReader", "IRReader", "Interpreter", "MCJIT", "NativeCodeGen", "Object", "SelectionDAG", "Native"])
    ctx.tool(ctx, name = "llvm-jitlink", parent = "Tools", required_libraries = ["JITLink", "BinaryFormat", "MC", "Object", "RuntimeDyld", "Support", "all-targets"])
    ctx.tool(ctx, required_libraries = ["AsmParser", "BitReader", "BitWriter", "IRReader", "Linker", "Object", "TransformUtils", "IPO"], name = "llvm-link", parent = "Tools")
    ctx.tool(ctx, required_libraries = ["BitWriter", "Core", "IRReader", "LTO", "Object", "Support", "all-targets"], name = "llvm-lto", parent = "Tools")
    ctx.tool(ctx, name = "llvm-mc", parent = "Tools", required_libraries = ["MC", "MCDisassembler", "MCParser", "Support", "all-targets"])
    ctx.tool(ctx, required_libraries = ["MC", "MCA", "MCParser", "Support", "all-targets"], name = "llvm-mca", parent = "Tools")
    ctx.tool(ctx, name = "llvm-modextract", parent = "Tools", required_libraries = ["BitReader", "BitWriter"])
    ctx.tool(ctx, name = "llvm-mt", parent = "Tools", required_libraries = ["Option", "Support", "WindowsManifest"])
    ctx.tool(ctx, name = "llvm-nm", parent = "Tools", required_libraries = ["BitReader", "Object"])
    ctx.tool(ctx, name = "llvm-objcopy", parent = "Tools", required_libraries = ["Object", "Option", "Support", "MC"])
    ctx.tool(ctx, name = "llvm-objdump", parent = "Tools", required_libraries = ["DebugInfoDWARF", "MC", "MCDisassembler", "MCParser", "Object", "all-targets", "Demangle"])
    ctx.tool(ctx, parent = "Tools", required_libraries = ["DebugInfoMSF", "DebugInfoPDB"], name = "llvm-pdbutil")
    ctx.tool(ctx, required_libraries = ["ProfileData", "Support"], name = "llvm-profdata", parent = "Tools")
    ctx.tool(ctx, parent = "Tools", required_libraries = ["Option"], name = "llvm-rc")
    ctx.tool(ctx, name = "llvm-reduce", parent = "Tools", required_libraries = ["BitReader", "IRReader", "all-targets"])
    ctx.tool(ctx, name = "llvm-rtdyld", parent = "Tools", required_libraries = ["MC", "Object", "RuntimeDyld", "Support", "all-targets"])
    ctx.tool(ctx, required_libraries = ["Object"], name = "llvm-size", parent = "Tools")
    ctx.tool(ctx, parent = "Tools", required_libraries = ["TransformUtils", "BitWriter", "Core", "IRReader", "Support"], name = "llvm-split")
    ctx.tool(ctx, name = "llvm-undname", parent = "Tools", required_libraries = ["Demangle", "Support"])
    ctx.tool(ctx, name = "opt", parent = "Tools", required_libraries = ["AsmParser", "BitReader", "BitWriter", "CodeGen", "IRReader", "IPO", "Instrumentation", "Scalar", "ObjCARC", "Passes", "all-targets"])
    ctx.tool(ctx, name = "verify-uselistorder", parent = "Tools", required_libraries = ["IRReader", "BitWriter", "Support"])
    ctx.group(ctx, parent = "$ROOT", name = "BuildTools")
    ctx.group(ctx, name = "UtilityTools", parent = "$ROOT")
    ctx.build_tool(ctx, name = "tblgen", parent = "BuildTools", required_libraries = ["Support", "TableGen", "MC"])
    ctx.library(ctx, required_libraries = ["Support"], name = "gtest", parent = "Libraries")
    ctx.library(ctx, required_libraries = ["gtest"], name = "gtest_main", parent = "Libraries")
    return ctx