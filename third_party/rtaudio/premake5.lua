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

	filter "system:macosx"
		defines "__MACOSX_CORE__"
		systemversion "latest"

	filter "system:linux"
		defines "__LINUX_PULSE__"
		pic "On"
		systemversion "latest"

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
