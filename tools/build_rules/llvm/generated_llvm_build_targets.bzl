def generated_llvm_build_targets(ctx):
    ctx.group(ctx, name = "Miscellaneous", parent = "$ROOT")
    ctx.group(ctx, name = "Bindings", parent = "$ROOT")
    ctx.group(ctx, name = "Docs", parent = "$ROOT")
    ctx.group(ctx, name = "Examples", parent = "$ROOT")
    ctx.group(ctx, name = "Libraries", parent = "$ROOT")
    ctx.library(ctx, name = "Analysis", parent = "Libraries", required_libraries = ["BinaryFormat", "Core", "Object", "ProfileData", "Support"])
    ctx.library(ctx, parent = "Libraries", required_libraries = ["BinaryFormat", "Core", "Support"], name = "AsmParser")
    ctx.group(ctx, name = "Bitcode", parent = "Libraries")
    ctx.library(ctx, name = "BitReader", parent = "Bitcode", required_libraries = ["Core", "Support"])
    ctx.library(ctx, required_libraries = ["Analysis", "Core", "MC", "Object", "Support"], name = "BitWriter", parent = "Bitcode")
    ctx.library(ctx, name = "CodeGen", parent = "Libraries", required_libraries = ["Analysis", "BitReader", "BitWriter", "Core", "MC", "ProfileData", "Scalar", "Support", "Target", "TransformUtils"])
    ctx.library(ctx, name = "AsmPrinter", parent = "Libraries", required_libraries = ["Analysis", "BinaryFormat", "CodeGen", "Core", "DebugInfoCodeView", "DebugInfoDWARF", "DebugInfoMSF", "MC", "MCParser", "Remarks", "Support", "Target"])
    ctx.library(ctx, name = "SelectionDAG", parent = "CodeGen", required_libraries = ["Analysis", "CodeGen", "Core", "MC", "Support", "Target", "TransformUtils"])
    ctx.library(ctx, name = "MIRParser", parent = "CodeGen", required_libraries = ["AsmParser", "BinaryFormat", "CodeGen", "Core", "MC", "Support", "Target"])
    ctx.library(ctx, name = "GlobalISel", parent = "CodeGen", required_libraries = ["Analysis", "CodeGen", "Core", "MC", "Support", "Target", "TransformUtils"])
    ctx.group(ctx, name = "DebugInfo", parent = "$ROOT")
    ctx.library(ctx, name = "DebugInfoDWARF", parent = "DebugInfo", required_libraries = ["BinaryFormat", "Object", "MC", "Support"])
    ctx.library(ctx, required_libraries = ["Support"], name = "DebugInfoMSF", parent = "DebugInfo")
    ctx.library(ctx, name = "DebugInfoCodeView", parent = "DebugInfo", required_libraries = ["Support", "DebugInfoMSF"])
    ctx.library(ctx, name = "DebugInfoPDB", parent = "DebugInfo", required_libraries = ["Object", "Support", "DebugInfoCodeView", "DebugInfoMSF"])
    ctx.library(ctx, name = "Symbolize", parent = "DebugInfo", required_libraries = ["DebugInfoDWARF", "DebugInfoPDB", "Object", "Support", "Demangle"])
    ctx.library(ctx, parent = "Libraries", name = "Demangle")
    ctx.library(ctx, name = "ExecutionEngine", parent = "Libraries", required_libraries = ["Core", "MC", "Object", "RuntimeDyld", "Support", "Target"])
    ctx.library(ctx, name = "Interpreter", parent = "ExecutionEngine", required_libraries = ["CodeGen", "Core", "ExecutionEngine", "Support"])
    ctx.library(ctx, parent = "ExecutionEngine", required_libraries = ["Core", "ExecutionEngine", "Object", "RuntimeDyld", "Support", "Target"], name = "MCJIT")
    ctx.library(ctx, name = "JITLink", parent = "ExecutionEngine", required_libraries = ["BinaryFormat", "Object", "Support"])
    ctx.library(ctx, name = "RuntimeDyld", parent = "ExecutionEngine", required_libraries = ["MC", "Object", "Support"])
    ctx.optional_library(ctx, required_libraries = ["CodeGen", "Core", "DebugInfoDWARF", "Support", "Object", "ExecutionEngine"], name = "IntelJITEvents", parent = "ExecutionEngine")
    ctx.optional_library(ctx, parent = "ExecutionEngine", required_libraries = ["DebugInfoDWARF", "Support", "Object", "ExecutionEngine"], name = "OProfileJIT")
    ctx.library(ctx, name = "OrcJIT", parent = "ExecutionEngine", required_libraries = ["Core", "ExecutionEngine", "JITLink", "Object", "MC", "RuntimeDyld", "Support", "Target", "TransformUtils"])
    ctx.optional_library(ctx, parent = "ExecutionEngine", required_libraries = ["CodeGen", "Core", "DebugInfoDWARF", "ExecutionEngine", "Object", "Support"], name = "PerfJITEvents")
    ctx.library(ctx, required_libraries = ["Analysis", "BitReader", "BitWriter", "Core", "Scalar", "Support", "Target"], name = "FuzzMutate", parent = "Libraries")
    ctx.library(ctx, required_libraries = ["Support"], name = "LineEditor", parent = "Libraries")
    ctx.library(ctx, required_libraries = ["Core", "Support", "TransformUtils"], name = "Linker", parent = "Libraries")
    ctx.library(ctx, name = "Core", parent = "Libraries", required_libraries = ["BinaryFormat", "Remarks", "Support"])
    ctx.library(ctx, parent = "Libraries", required_libraries = ["AsmParser", "BitReader", "Core", "Support"], name = "IRReader")
    ctx.library(ctx, name = "LTO", parent = "Libraries", required_libraries = ["AggressiveInstCombine", "Analysis", "BitReader", "BitWriter", "CodeGen", "Core", "IPO", "InstCombine", "Linker", "MC", "ObjCARC", "Object", "Passes", "Remarks", "Scalar", "Support", "Target", "TransformUtils"])
    ctx.library(ctx, parent = "Libraries", required_libraries = ["Support", "BinaryFormat", "DebugInfoCodeView"], name = "MC")
    ctx.library(ctx, name = "MCDisassembler", parent = "MC", required_libraries = ["MC", "Support"])
    ctx.library(ctx, name = "MCParser", parent = "MC", required_libraries = ["MC", "Support"])
    ctx.library(ctx, required_libraries = ["MC", "Support"], name = "MCA", parent = "Libraries")
    ctx.library(ctx, name = "Object", parent = "Libraries", required_libraries = ["BitReader", "Core", "MC", "BinaryFormat", "MCParser", "Support"])
    ctx.library(ctx, name = "BinaryFormat", parent = "Libraries", required_libraries = ["Support"])
    ctx.library(ctx, required_libraries = ["Object", "Support", "DebugInfoCodeView"], name = "ObjectYAML", parent = "Libraries")
    ctx.library(ctx, name = "Option", parent = "Libraries", required_libraries = ["Support"])
    ctx.library(ctx, name = "Remarks", parent = "Libraries", required_libraries = ["Support"])
    ctx.library(ctx, name = "Passes", parent = "Libraries", required_libraries = ["AggressiveInstCombine", "Analysis", "CodeGen", "Core", "IPO", "InstCombine", "Scalar", "Support", "Target", "TransformUtils", "Vectorize", "Instrumentation"])
    ctx.library(ctx, required_libraries = ["Core", "Support"], name = "ProfileData", parent = "Libraries")
    ctx.library(ctx, name = "Coverage", parent = "ProfileData", required_libraries = ["Core", "Object", "ProfileData", "Support"])
    ctx.library(ctx, name = "Support", parent = "Libraries", required_libraries = ["Demangle"])
    ctx.library(ctx, name = "TableGen", parent = "Libraries", required_libraries = ["Support"])
    ctx.library(ctx, required_libraries = ["Support", "BinaryFormat"], name = "TextAPI", parent = "Libraries")
    ctx.library_group(ctx, parent = "Libraries", name = "Engine")
    ctx.library_group(ctx, name = "Native", parent = "Libraries")
    ctx.library_group(ctx, name = "NativeCodeGen", parent = "Libraries")
    ctx.library(ctx, parent = "Libraries", required_libraries = ["Analysis", "Core", "MC", "Support"], name = "Target")
    ctx.library_group(ctx, name = "all-targets", parent = "Libraries")
    ctx.target_group(ctx, name = "AMDGPU", parent = "Target")
    ctx.library(ctx, parent = "AMDGPU", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "IPO", "MC", "AMDGPUDesc", "AMDGPUInfo", "AMDGPUUtils", "Scalar", "SelectionDAG", "Support", "Target", "TransformUtils", "Vectorize", "GlobalISel", "BinaryFormat", "MIRParser"], add_to_library_groups = ["AMDGPU"], name = "AMDGPUCodeGen")
    ctx.library(ctx, name = "AMDGPUAsmParser", parent = "AMDGPU", required_libraries = ["MC", "MCParser", "AMDGPUDesc", "AMDGPUInfo", "AMDGPUUtils", "Support"], add_to_library_groups = ["AMDGPU"])
    ctx.library(ctx, required_libraries = ["AMDGPUDesc", "AMDGPUInfo", "AMDGPUUtils", "MC", "MCDisassembler", "Support"], add_to_library_groups = ["AMDGPU"], name = "AMDGPUDisassembler", parent = "AMDGPU")
    ctx.library(ctx, name = "AMDGPUDesc", parent = "AMDGPU", required_libraries = ["Core", "MC", "AMDGPUInfo", "AMDGPUUtils", "Support", "BinaryFormat"], add_to_library_groups = ["AMDGPU"])
    ctx.library(ctx, name = "AMDGPUInfo", parent = "AMDGPU", required_libraries = ["Support"], add_to_library_groups = ["AMDGPU"])
    ctx.library(ctx, name = "AMDGPUUtils", parent = "AMDGPU", required_libraries = ["Core", "MC", "BinaryFormat", "Support"], add_to_library_groups = ["AMDGPU"])
    ctx.library(ctx, name = "ARCCodeGen", parent = "ARC", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "SelectionDAG", "Support", "Target", "TransformUtils", "ARCDesc", "ARCInfo"], add_to_library_groups = ["ARC"])
    ctx.target_group(ctx, name = "ARC", parent = "Target")
    ctx.library(ctx, required_libraries = ["MCDisassembler", "Support", "ARCInfo"], add_to_library_groups = ["ARC"], name = "ARCDisassembler", parent = "ARC")
    ctx.library(ctx, name = "ARCDesc", parent = "ARC", required_libraries = ["MC", "Support", "ARCInfo"], add_to_library_groups = ["ARC"])
    ctx.library(ctx, name = "ARCInfo", parent = "ARC", required_libraries = ["Support"], add_to_library_groups = ["ARC"])
    ctx.target_group(ctx, name = "ARM", parent = "Target")
    ctx.library(ctx, parent = "ARM", required_libraries = ["ARMDesc", "ARMInfo", "Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "Scalar", "SelectionDAG", "Support", "Target", "GlobalISel", "ARMUtils", "TransformUtils"], add_to_library_groups = ["ARM"], name = "ARMCodeGen")
    ctx.library(ctx, add_to_library_groups = ["ARM"], name = "ARMAsmParser", parent = "ARM", required_libraries = ["ARMDesc", "ARMInfo", "MC", "MCParser", "Support", "ARMUtils"])
    ctx.library(ctx, name = "ARMDisassembler", parent = "ARM", required_libraries = ["ARMDesc", "ARMInfo", "MCDisassembler", "Support", "ARMUtils"], add_to_library_groups = ["ARM"])
    ctx.library(ctx, required_libraries = ["ARMInfo", "ARMUtils", "MC", "MCDisassembler", "Support"], add_to_library_groups = ["ARM"], name = "ARMDesc", parent = "ARM")
    ctx.library(ctx, name = "ARMInfo", parent = "ARM", required_libraries = ["Support"], add_to_library_groups = ["ARM"])
    ctx.library(ctx, parent = "ARM", required_libraries = ["Support"], add_to_library_groups = ["ARM"], name = "ARMUtils")
    ctx.target_group(ctx, parent = "Target", name = "AArch64")
    ctx.library(ctx, name = "AArch64CodeGen", parent = "AArch64", required_libraries = ["AArch64Desc", "AArch64Info", "AArch64Utils", "Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "Scalar", "SelectionDAG", "Support", "Target", "GlobalISel"], add_to_library_groups = ["AArch64"])
    ctx.library(ctx, name = "AArch64AsmParser", parent = "AArch64", required_libraries = ["AArch64Desc", "AArch64Info", "AArch64Utils", "MC", "MCParser", "Support"], add_to_library_groups = ["AArch64"])
    ctx.library(ctx, name = "AArch64Disassembler", parent = "AArch64", required_libraries = ["AArch64Desc", "AArch64Info", "AArch64Utils", "MC", "MCDisassembler", "Support"], add_to_library_groups = ["AArch64"])
    ctx.library(ctx, name = "AArch64Desc", parent = "AArch64", required_libraries = ["AArch64Info", "AArch64Utils", "MC", "Support"], add_to_library_groups = ["AArch64"])
    ctx.library(ctx, name = "AArch64Info", parent = "AArch64", required_libraries = ["Support"], add_to_library_groups = ["AArch64"])
    ctx.library(ctx, name = "AArch64Utils", parent = "AArch64", required_libraries = ["Support"], add_to_library_groups = ["AArch64"])
    ctx.target_group(ctx, name = "AVR", parent = "Target")
    ctx.library(ctx, parent = "AVR", required_libraries = ["AsmPrinter", "CodeGen", "Core", "MC", "AVRDesc", "AVRInfo", "SelectionDAG", "Support", "Target"], add_to_library_groups = ["AVR"], name = "AVRCodeGen")
    ctx.library(ctx, required_libraries = ["MC", "MCParser", "AVRDesc", "AVRInfo", "Support"], add_to_library_groups = ["AVR"], name = "AVRAsmParser", parent = "AVR")
    ctx.library(ctx, parent = "AVR", required_libraries = ["MCDisassembler", "AVRInfo", "Support"], add_to_library_groups = ["AVR"], name = "AVRDisassembler")
    ctx.library(ctx, required_libraries = ["MC", "AVRInfo", "Support"], add_to_library_groups = ["AVR"], name = "AVRDesc", parent = "AVR")
    ctx.library(ctx, name = "AVRInfo", parent = "AVR", required_libraries = ["MC", "Support"], add_to_library_groups = ["AVR"])
    ctx.target_group(ctx, parent = "Target", name = "BPF")
    ctx.library(ctx, required_libraries = ["AsmPrinter", "CodeGen", "Core", "MC", "BPFDesc", "BPFInfo", "SelectionDAG", "Support", "Target"], add_to_library_groups = ["BPF"], name = "BPFCodeGen", parent = "BPF")
    ctx.library(ctx, required_libraries = ["MC", "MCParser", "BPFDesc", "BPFInfo", "Support"], add_to_library_groups = ["BPF"], name = "BPFAsmParser", parent = "BPF")
    ctx.library(ctx, parent = "BPF", required_libraries = ["MCDisassembler", "BPFInfo", "Support"], add_to_library_groups = ["BPF"], name = "BPFDisassembler")
    ctx.library(ctx, parent = "BPF", required_libraries = ["MC", "BPFInfo", "Support"], add_to_library_groups = ["BPF"], name = "BPFDesc")
    ctx.library(ctx, parent = "BPF", required_libraries = ["Support"], add_to_library_groups = ["BPF"], name = "BPFInfo")
    ctx.target_group(ctx, name = "Lanai", parent = "Target")
    ctx.library(ctx, name = "LanaiCodeGen", parent = "Lanai", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "LanaiAsmParser", "LanaiDesc", "LanaiInfo", "MC", "SelectionDAG", "Support", "Target", "TransformUtils"], add_to_library_groups = ["Lanai"])
    ctx.library(ctx, required_libraries = ["MC", "MCParser", "Support", "LanaiDesc", "LanaiInfo"], add_to_library_groups = ["Lanai"], name = "LanaiAsmParser", parent = "Lanai")
    ctx.library(ctx, name = "LanaiDisassembler", parent = "Lanai", required_libraries = ["LanaiDesc", "LanaiInfo", "MC", "MCDisassembler", "Support"], add_to_library_groups = ["Lanai"])
    ctx.library(ctx, name = "LanaiDesc", parent = "Lanai", required_libraries = ["LanaiInfo", "MC", "MCDisassembler", "Support"], add_to_library_groups = ["Lanai"])
    ctx.library(ctx, required_libraries = ["Support"], add_to_library_groups = ["Lanai"], name = "LanaiInfo", parent = "Lanai")
    ctx.target_group(ctx, name = "Hexagon", parent = "Target")
    ctx.library(ctx, add_to_library_groups = ["Hexagon"], name = "HexagonCodeGen", parent = "Hexagon", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "HexagonAsmParser", "HexagonDesc", "HexagonInfo", "IPO", "MC", "Scalar", "SelectionDAG", "Support", "Target", "TransformUtils"])
    ctx.library(ctx, required_libraries = ["MC", "MCParser", "Support", "HexagonDesc", "HexagonInfo"], add_to_library_groups = ["Hexagon"], name = "HexagonAsmParser", parent = "Hexagon")
    ctx.library(ctx, required_libraries = ["HexagonDesc", "HexagonInfo", "MC", "MCDisassembler", "Support"], add_to_library_groups = ["Hexagon"], name = "HexagonDisassembler", parent = "Hexagon")
    ctx.library(ctx, parent = "Hexagon", required_libraries = ["HexagonInfo", "MC", "Support"], add_to_library_groups = ["Hexagon"], name = "HexagonDesc")
    ctx.library(ctx, add_to_library_groups = ["Hexagon"], name = "HexagonInfo", parent = "Hexagon", required_libraries = ["Support"])
    ctx.target_group(ctx, name = "MSP430", parent = "Target")
    ctx.library(ctx, name = "MSP430CodeGen", parent = "MSP430", required_libraries = ["AsmPrinter", "CodeGen", "Core", "MC", "MSP430Desc", "MSP430Info", "SelectionDAG", "Support", "Target"], add_to_library_groups = ["MSP430"])
    ctx.library(ctx, name = "MSP430AsmParser", parent = "MSP430", required_libraries = ["MC", "MCParser", "MSP430Desc", "MSP430Info", "Support"], add_to_library_groups = ["MSP430"])
    ctx.library(ctx, parent = "MSP430", required_libraries = ["MCDisassembler", "MSP430Info", "Support"], add_to_library_groups = ["MSP430"], name = "MSP430Disassembler")
    ctx.library(ctx, parent = "MSP430", required_libraries = ["MC", "MSP430Info", "Support"], add_to_library_groups = ["MSP430"], name = "MSP430Desc")
    ctx.library(ctx, name = "MSP430Info", parent = "MSP430", required_libraries = ["Support"], add_to_library_groups = ["MSP430"])
    ctx.target_group(ctx, parent = "Target", name = "NVPTX")
    ctx.library(ctx, add_to_library_groups = ["NVPTX"], name = "NVPTXCodeGen", parent = "NVPTX", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "IPO", "MC", "NVPTXDesc", "NVPTXInfo", "Scalar", "SelectionDAG", "Support", "Target", "TransformUtils", "Vectorize"])
    ctx.library(ctx, name = "NVPTXDesc", parent = "NVPTX", required_libraries = ["MC", "NVPTXInfo", "Support"], add_to_library_groups = ["NVPTX"])
    ctx.library(ctx, required_libraries = ["Support"], add_to_library_groups = ["NVPTX"], name = "NVPTXInfo", parent = "NVPTX")
    ctx.target_group(ctx, name = "Mips", parent = "Target")
    ctx.library(ctx, name = "MipsCodeGen", parent = "Mips", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "MipsDesc", "MipsInfo", "SelectionDAG", "Support", "Target", "GlobalISel"], add_to_library_groups = ["Mips"])
    ctx.library(ctx, required_libraries = ["MC", "MCParser", "MipsDesc", "MipsInfo", "Support"], add_to_library_groups = ["Mips"], name = "MipsAsmParser", parent = "Mips")
    ctx.library(ctx, name = "MipsDisassembler", parent = "Mips", required_libraries = ["MCDisassembler", "MipsInfo", "Support"], add_to_library_groups = ["Mips"])
    ctx.library(ctx, add_to_library_groups = ["Mips"], name = "MipsDesc", parent = "Mips", required_libraries = ["MC", "MipsInfo", "Support"])
    ctx.library(ctx, name = "MipsInfo", parent = "Mips", required_libraries = ["Support"], add_to_library_groups = ["Mips"])
    ctx.target_group(ctx, name = "PowerPC", parent = "Target")
    ctx.library(ctx, parent = "PowerPC", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "PowerPCDesc", "PowerPCInfo", "Scalar", "SelectionDAG", "Support", "Target", "TransformUtils"], add_to_library_groups = ["PowerPC"], name = "PowerPCCodeGen")
    ctx.library(ctx, parent = "PowerPC", required_libraries = ["MC", "MCParser", "PowerPCDesc", "PowerPCInfo", "Support"], add_to_library_groups = ["PowerPC"], name = "PowerPCAsmParser")
    ctx.library(ctx, add_to_library_groups = ["PowerPC"], name = "PowerPCDisassembler", parent = "PowerPC", required_libraries = ["MCDisassembler", "PowerPCInfo", "Support"])
    ctx.library(ctx, required_libraries = ["MC", "PowerPCInfo", "Support"], add_to_library_groups = ["PowerPC"], name = "PowerPCDesc", parent = "PowerPC")
    ctx.library(ctx, name = "PowerPCInfo", parent = "PowerPC", required_libraries = ["Support"], add_to_library_groups = ["PowerPC"])
    ctx.target_group(ctx, parent = "Target", name = "RISCV")
    ctx.library(ctx, required_libraries = ["AsmPrinter", "Core", "CodeGen", "MC", "RISCVDesc", "RISCVInfo", "RISCVUtils", "SelectionDAG", "Support", "Target"], add_to_library_groups = ["RISCV"], name = "RISCVCodeGen", parent = "RISCV")
    ctx.library(ctx, add_to_library_groups = ["RISCV"], name = "RISCVAsmParser", parent = "RISCV", required_libraries = ["MC", "MCParser", "RISCVDesc", "RISCVInfo", "RISCVUtils", "Support"])
    ctx.library(ctx, parent = "RISCV", required_libraries = ["MCDisassembler", "RISCVInfo", "Support"], add_to_library_groups = ["RISCV"], name = "RISCVDisassembler")
    ctx.library(ctx, name = "RISCVInfo", parent = "RISCV", required_libraries = ["Support"], add_to_library_groups = ["RISCV"])
    ctx.library(ctx, add_to_library_groups = ["RISCV"], name = "RISCVDesc", parent = "RISCV", required_libraries = ["MC", "RISCVInfo", "RISCVUtils", "Support"])
    ctx.library(ctx, parent = "RISCV", required_libraries = ["Support"], add_to_library_groups = ["RISCV"], name = "RISCVUtils")
    ctx.target_group(ctx, name = "Sparc", parent = "Target")
    ctx.library(ctx, add_to_library_groups = ["Sparc"], name = "SparcCodeGen", parent = "Sparc", required_libraries = ["AsmPrinter", "CodeGen", "Core", "MC", "SelectionDAG", "SparcDesc", "SparcInfo", "Support", "Target"])
    ctx.library(ctx, name = "SparcAsmParser", parent = "Sparc", required_libraries = ["MC", "MCParser", "SparcDesc", "SparcInfo", "Support"], add_to_library_groups = ["Sparc"])
    ctx.library(ctx, name = "SparcDisassembler", parent = "Sparc", required_libraries = ["MCDisassembler", "SparcInfo", "Support"], add_to_library_groups = ["Sparc"])
    ctx.library(ctx, name = "SparcDesc", parent = "Sparc", required_libraries = ["MC", "SparcInfo", "Support"], add_to_library_groups = ["Sparc"])
    ctx.library(ctx, name = "SparcInfo", parent = "Sparc", required_libraries = ["Support"], add_to_library_groups = ["Sparc"])
    ctx.target_group(ctx, parent = "Target", name = "SystemZ")
    ctx.library(ctx, parent = "SystemZ", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "Scalar", "SelectionDAG", "Support", "SystemZDesc", "SystemZInfo", "Target"], add_to_library_groups = ["SystemZ"], name = "SystemZCodeGen")
    ctx.library(ctx, name = "SystemZAsmParser", parent = "SystemZ", required_libraries = ["MC", "MCParser", "Support", "SystemZDesc", "SystemZInfo"], add_to_library_groups = ["SystemZ"])
    ctx.library(ctx, required_libraries = ["MC", "MCDisassembler", "Support", "SystemZDesc", "SystemZInfo"], add_to_library_groups = ["SystemZ"], name = "SystemZDisassembler", parent = "SystemZ")
    ctx.library(ctx, add_to_library_groups = ["SystemZ"], name = "SystemZDesc", parent = "SystemZ", required_libraries = ["MC", "Support", "SystemZInfo"])
    ctx.library(ctx, required_libraries = ["Support"], add_to_library_groups = ["SystemZ"], name = "SystemZInfo", parent = "SystemZ")
    ctx.target_group(ctx, parent = "Target", name = "WebAssembly")
    ctx.library(ctx, add_to_library_groups = ["WebAssembly"], name = "WebAssemblyCodeGen", parent = "WebAssembly", required_libraries = ["Analysis", "AsmPrinter", "BinaryFormat", "CodeGen", "Core", "MC", "Scalar", "SelectionDAG", "Support", "Target", "TransformUtils", "WebAssemblyDesc", "WebAssemblyInfo"])
    ctx.library(ctx, required_libraries = ["MC", "MCParser", "WebAssemblyInfo", "Support"], add_to_library_groups = ["WebAssembly"], name = "WebAssemblyAsmParser", parent = "WebAssembly")
    ctx.library(ctx, name = "WebAssemblyDisassembler", parent = "WebAssembly", required_libraries = ["WebAssemblyDesc", "MCDisassembler", "WebAssemblyInfo", "Support"], add_to_library_groups = ["WebAssembly"])
    ctx.library(ctx, name = "WebAssemblyDesc", parent = "WebAssembly", required_libraries = ["MC", "Support", "WebAssemblyInfo"], add_to_library_groups = ["WebAssembly"])
    ctx.library(ctx, name = "WebAssemblyInfo", parent = "WebAssembly", required_libraries = ["Support"], add_to_library_groups = ["WebAssembly"])
    ctx.target_group(ctx, parent = "Target", name = "X86")
    ctx.library(ctx, add_to_library_groups = ["X86"], name = "X86CodeGen", parent = "X86", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "SelectionDAG", "Support", "Target", "X86Desc", "X86Info", "X86Utils", "GlobalISel", "ProfileData"])
    ctx.library(ctx, name = "X86AsmParser", parent = "X86", required_libraries = ["MC", "MCParser", "Support", "X86Desc", "X86Info"], add_to_library_groups = ["X86"])
    ctx.library(ctx, required_libraries = ["MCDisassembler", "Support", "X86Info"], add_to_library_groups = ["X86"], name = "X86Disassembler", parent = "X86")
    ctx.library(ctx, name = "X86Desc", parent = "X86", required_libraries = ["MC", "MCDisassembler", "Object", "Support", "X86Info", "X86Utils"], add_to_library_groups = ["X86"])
    ctx.library(ctx, name = "X86Info", parent = "X86", required_libraries = ["Support"], add_to_library_groups = ["X86"])
    ctx.library(ctx, name = "X86Utils", parent = "X86", required_libraries = ["Support"], add_to_library_groups = ["X86"])
    ctx.library(ctx, parent = "XCore", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "SelectionDAG", "Support", "Target", "TransformUtils", "XCoreDesc", "XCoreInfo"], add_to_library_groups = ["XCore"], name = "XCoreCodeGen")
    ctx.target_group(ctx, name = "XCore", parent = "Target")
    ctx.library(ctx, required_libraries = ["MCDisassembler", "Support", "XCoreInfo"], add_to_library_groups = ["XCore"], name = "XCoreDisassembler", parent = "XCore")
    ctx.library(ctx, required_libraries = ["MC", "Support", "XCoreInfo"], add_to_library_groups = ["XCore"], name = "XCoreDesc", parent = "XCore")
    ctx.library(ctx, name = "XCoreInfo", parent = "XCore", required_libraries = ["Support"], add_to_library_groups = ["XCore"])
    ctx.library(ctx, name = "TestingSupport", parent = "Libraries", required_libraries = ["Support"])
    ctx.group(ctx, name = "ToolDrivers", parent = "Libraries")
    ctx.library(ctx, required_libraries = ["Object", "Option", "Support"], name = "DlltoolDriver", parent = "Libraries")
    ctx.library(ctx, parent = "Libraries", required_libraries = ["BinaryFormat", "BitReader", "Object", "Option", "Support"], name = "LibDriver")
    ctx.group(ctx, parent = "Libraries", name = "Transforms")
    ctx.library(ctx, required_libraries = ["Analysis", "Core", "Support", "TransformUtils"], name = "AggressiveInstCombine", parent = "Transforms")
    ctx.library(ctx, required_libraries = ["Analysis", "Core", "IPO", "Scalar", "Support", "TransformUtils"], name = "Coroutines", parent = "Transforms")
    ctx.library(ctx, parent = "Transforms", library_name = "ipo", required_libraries = ["AggressiveInstCombine", "Analysis", "BitReader", "BitWriter", "Core", "InstCombine", "IRReader", "Linker", "Object", "ProfileData", "Scalar", "Support", "TransformUtils", "Vectorize", "Instrumentation"], name = "IPO")
    ctx.library(ctx, name = "InstCombine", parent = "Transforms", required_libraries = ["Analysis", "Core", "Support", "TransformUtils"])
    ctx.library(ctx, name = "Instrumentation", parent = "Transforms", required_libraries = ["Analysis", "Core", "MC", "Support", "TransformUtils", "ProfileData"])
    ctx.library(ctx, name = "Scalar", parent = "Transforms", library_name = "ScalarOpts", required_libraries = ["AggressiveInstCombine", "Analysis", "Core", "InstCombine", "Support", "TransformUtils"])
    ctx.library(ctx, name = "TransformUtils", parent = "Transforms", required_libraries = ["Analysis", "Core", "Support"])
    ctx.library(ctx, name = "Vectorize", parent = "Transforms", library_name = "Vectorize", required_libraries = ["Analysis", "Core", "Support", "TransformUtils"])
    ctx.library(ctx, name = "ObjCARC", parent = "Transforms", library_name = "ObjCARCOpts", required_libraries = ["Analysis", "Core", "Support", "TransformUtils"])
    ctx.library(ctx, name = "WindowsManifest", parent = "Libraries", required_libraries = ["Support"])
    ctx.library(ctx, name = "XRay", parent = "Libraries", required_libraries = ["Support", "Object"])
    ctx.group(ctx, name = "Projects", parent = "$ROOT")
    ctx.group(ctx, parent = "$ROOT", name = "Tools")
    ctx.tool(ctx, name = "bugpoint", parent = "Tools", required_libraries = ["AsmParser", "BitReader", "BitWriter", "CodeGen", "IRReader", "IPO", "Instrumentation", "Linker", "ObjCARC", "Scalar", "all-targets"])
    ctx.tool(ctx, name = "dsymutil", parent = "Tools", required_libraries = ["AsmPrinter", "DebugInfoDWARF", "MC", "Object", "Support", "all-targets"])
    ctx.tool(ctx, parent = "Tools", required_libraries = ["AsmParser", "BitReader", "IRReader", "MIRParser", "TransformUtils", "Scalar", "Vectorize", "all-targets"], name = "llc")
    ctx.tool(ctx, name = "lli", parent = "Tools", required_libraries = ["AsmParser", "BitReader", "IRReader", "Instrumentation", "Interpreter", "MCJIT", "Native", "NativeCodeGen", "SelectionDAG", "TransformUtils"])
    ctx.tool(ctx, name = "lli-child-target", parent = "lli")
    ctx.tool(ctx, name = "llvm-ar", parent = "Tools")
    ctx.tool(ctx, name = "llvm-as", parent = "Tools", required_libraries = ["AsmParser", "BitWriter"])
    ctx.tool(ctx, name = "llvm-bcanalyzer", parent = "Tools", required_libraries = ["BitReader"])
    ctx.tool(ctx, name = "llvm-cat", parent = "Tools", required_libraries = ["AsmParser", "BitReader", "BitWriter"])
    ctx.tool(ctx, parent = "Tools", required_libraries = ["all-targets", "MC", "MCDisassembler", "MCParser", "Support", "Symbolize"], name = "llvm-cfi-verify")
    ctx.tool(ctx, name = "llvm-cov", parent = "Tools", required_libraries = ["Coverage", "Support", "Instrumentation"])
    ctx.tool(ctx, parent = "Tools", required_libraries = ["Object", "Option", "Support"], name = "llvm-cvtres")
    ctx.tool(ctx, required_libraries = ["AsmParser", "BitReader", "IRReader"], name = "llvm-diff", parent = "Tools")
    ctx.tool(ctx, parent = "Tools", required_libraries = ["Analysis", "BitReader"], name = "llvm-dis")
    ctx.tool(ctx, name = "llvm-dwarfdump", parent = "Tools", required_libraries = ["DebugInfoDWARF", "Object"])
    ctx.tool(ctx, name = "llvm-dwp", parent = "Tools", required_libraries = ["AsmPrinter", "DebugInfoDWARF", "MC", "Object", "Support", "all-targets"])
    ctx.tool(ctx, parent = "Tools", required_libraries = ["Object", "Support", "TextAPI"], name = "llvm-elfabi")
    ctx.tool(ctx, parent = "Tools", required_libraries = ["CodeGen", "ExecutionEngine", "MC", "MCJIT", "Native", "NativeCodeGen", "Object", "Support"], name = "llvm-exegesis")
    ctx.tool(ctx, required_libraries = ["AsmParser", "BitReader", "BitWriter", "IRReader", "IPO"], name = "llvm-extract", parent = "Tools")
    ctx.tool(ctx, required_libraries = ["AsmParser", "BitReader", "IRReader", "Interpreter", "MCJIT", "NativeCodeGen", "Object", "SelectionDAG", "Native"], name = "llvm-jitlistener", parent = "Tools")
    ctx.tool(ctx, parent = "Tools", required_libraries = ["JITLink", "BinaryFormat", "MC", "Object", "RuntimeDyld", "Support", "all-targets"], name = "llvm-jitlink")
    ctx.tool(ctx, parent = "Tools", required_libraries = ["AsmParser", "BitReader", "BitWriter", "IRReader", "Linker", "Object", "TransformUtils", "IPO"], name = "llvm-link")
    ctx.tool(ctx, required_libraries = ["BitWriter", "Core", "IRReader", "LTO", "Object", "Support", "all-targets"], name = "llvm-lto", parent = "Tools")
    ctx.tool(ctx, name = "llvm-mc", parent = "Tools", required_libraries = ["MC", "MCDisassembler", "MCParser", "Support", "all-targets"])
    ctx.tool(ctx, name = "llvm-mca", parent = "Tools", required_libraries = ["MC", "MCA", "MCParser", "Support", "all-targets"])
    ctx.tool(ctx, name = "llvm-modextract", parent = "Tools", required_libraries = ["BitReader", "BitWriter"])
    ctx.tool(ctx, name = "llvm-mt", parent = "Tools", required_libraries = ["Option", "Support", "WindowsManifest"])
    ctx.tool(ctx, parent = "Tools", required_libraries = ["BitReader", "Object"], name = "llvm-nm")
    ctx.tool(ctx, name = "llvm-objcopy", parent = "Tools", required_libraries = ["Object", "Option", "Support", "MC"])
    ctx.tool(ctx, required_libraries = ["DebugInfoDWARF", "MC", "MCDisassembler", "MCParser", "Object", "all-targets", "Demangle"], name = "llvm-objdump", parent = "Tools")
    ctx.tool(ctx, parent = "Tools", required_libraries = ["DebugInfoMSF", "DebugInfoPDB"], name = "llvm-pdbutil")
    ctx.tool(ctx, name = "llvm-profdata", parent = "Tools", required_libraries = ["ProfileData", "Support"])
    ctx.tool(ctx, parent = "Tools", required_libraries = ["Option"], name = "llvm-rc")
    ctx.tool(ctx, required_libraries = ["MC", "Object", "RuntimeDyld", "Support", "all-targets"], name = "llvm-rtdyld", parent = "Tools")
    ctx.tool(ctx, name = "llvm-size", parent = "Tools", required_libraries = ["Object"])
    ctx.tool(ctx, name = "llvm-split", parent = "Tools", required_libraries = ["TransformUtils", "BitWriter", "Core", "IRReader", "Support"])
    ctx.tool(ctx, parent = "Tools", required_libraries = ["Demangle", "Support"], name = "llvm-undname")
    ctx.tool(ctx, parent = "Tools", required_libraries = ["AsmParser", "BitReader", "BitWriter", "CodeGen", "IRReader", "IPO", "Instrumentation", "Scalar", "ObjCARC", "Passes", "all-targets"], name = "opt")
    ctx.tool(ctx, name = "verify-uselistorder", parent = "Tools", required_libraries = ["IRReader", "BitWriter", "Support"])
    ctx.group(ctx, name = "BuildTools", parent = "$ROOT")
    ctx.group(ctx, parent = "$ROOT", name = "UtilityTools")
    ctx.build_tool(ctx, name = "tblgen", parent = "BuildTools", required_libraries = ["Support", "TableGen", "MC"])
    ctx.library(ctx, parent = "Libraries", required_libraries = ["Support"], name = "gtest")
    ctx.library(ctx, name = "gtest_main", parent = "Libraries", required_libraries = ["gtest"])
    return ctx
