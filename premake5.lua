project "libnyquist"
	kind "StaticLib"
	language "C++"
    staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/*.c",
		"src/*.cpp",
		"include/libnyquist/*.h",
	}

	includedirs
	{
		"include/libnyquist",
		"third_party",
		"third_party/FLAC/src/include",
		"third_party/libogg/include",
		"third_party/libvorbis",
        "third_party/libvorbis/src",
		"third_party/musepack/include",
		"third_party/opus",
		"third_party/opus/libopus/include",
		"third_party/opus/celt",
		"third_party/libvorbis/include",
		"third_party/opus/silk/float",
		"third_party/opus/silk",
		"third_party/opus/opusfile/src/include",
		"third_party/opus/opusfile/include",
		"third_party/wavpack/include",
		"third_party/rtaudio/rtaudio"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++11"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++11"

    filter "system:macosx"
        pic "On"
        systemversion "latest"
        cppdialect "C++11"
        xcodebuildsettings { ["ALWAYS_SEARCH_USER_PATHS"] = "YES" }


	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
