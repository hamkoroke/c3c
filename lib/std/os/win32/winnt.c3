module std::os::win32 @if(env::WIN32);

enum Win32_MEM_EXTENDED_PARAMETER_TYPE : CInt
{
	INVALID_TYPE,
	ADDRESS_REQUIREMENTS,
	NUMA_NODE,
	PARTITION_HANDLE,
	USER_PHYSICAL_HANDLE,
	ATTRIBUTE_FLAGS,
	IMAGE_MACHINE,
	MAX
}
alias Win32_PMEM_EXTENDED_PARAMETER_TYPE = Win32_MEM_EXTENDED_PARAMETER_TYPE;

enum Win32_MEM_EXTENDED_PARAMETER_ATTRIBUTE : const Win32_DWORD64
{
	NONPAGED       = 0x02,  // The allocation is non-pageable.
	NONPAGED_LARGE = 0x08,  // The allocation is mapped using large pages.
	NONPAGED_HUGE  = 0x10,  // The allocation is mapped using huge pages.
	EC_CODE	       = 0x40,  // The allocation will contain emulation-compatible (EC) code.
}

struct Win32_MEM_EXTENDED_PARAMETER
{
	Win32_MEM_EXTENDED_PARAMETER_TYPE type;
    union
    {
        Win32_MEM_EXTENDED_PARAMETER_ATTRIBUTE attribute;  // If type is ATTRIBUTE_FLAGS
        Win32_DWORD64                          nodeNumber; // If type is NUMA_NODE
        Win32_PVOID                            pointer;    // If type is ADDRESS_REQUIREMENTS
        Win32_SIZE_T                           size;
        Win32_HANDLE                           handle;
        Win32_DWORD                            uLong;
    }
}
alias Win32_PMEM_EXTENDED_PARAMETER = Win32_MEM_EXTENDED_PARAMETER*;