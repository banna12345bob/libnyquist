project "rtAudio"
	kind "StaticLib"
	language "C++"
    staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"rtaudio/*.h",
		"rtaudio/*.cpp"
	}

	filter "system:windows"
		defines "__WINDOWS_WASAPI__"
		systemversion "latest"
		cppdialect "C++11"

	filter "system:macosx"
		defines "__MACOSX_CORE__"
		systemversion "latest"
		cppdialect "C++11"

	filter "system:linux"
		defines "__LINUX_PULSE__"
		pic "On"
		systemversion "latest"
		cppdialect "C++11"

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
