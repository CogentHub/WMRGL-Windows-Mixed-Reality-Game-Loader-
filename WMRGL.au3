#cs ----------------------------------------------------------------------------

 AutoIt Version: 	3.3.14.5
 Author:         	Cogent [cogenthub@web.de]
 ProductName: 		WMRGL
 FileDescription: 	Windows Mixed Reality Game Loader
 ProductVersion: 	0.10
 LegalCopyright: 	GPLv3 - made by Cogent
 LegalTrademarks: 	'GNU GENERAL PUBLIC LICENSE, Version 3'

 Script Function:
	WMRGL [Windows Mixed Reality Game Loader].

 GitHub:
	https://github.com/CogentHub/WMRGL-Windows-Mixed-Reality-Game-Loader-

#ce ----------------------------------------------------------------------------

#Region Includes
#include <FontConstants.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <GuiMenu.au3>
#include <GuiStatusBar.au3>
#include <GUIConstants.au3>
#include <GDIPlus.au3>
#include <Inet.au3>
#include "System\_GDIPlus_WTOB.au3"
#include <IE.au3>
#include <Process.au3>
#include <Misc.au3>
#include <File.au3>
#include <MsgBoxConstants.au3>
#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <String.au3>
#EndRegion Includes


Opt("GUIOnEventMode", 1)

#Region Set Global
Global $HLL_GUI, $HLL_Settings_GUI, $InputBox, $TAB_NR_Temp, $Oculus_App_URL
Global $GUI_Loading, $AddGame2Library_GUI, $HomeLoaderLibrary_GUI, $Button_Exit_Settings_GUI, $HTML_GUI, $NR_Applications
Global $appid, $name, $installdir, $NR_temp1, $NR_temp2, $NR_temp3, $NR_Library, $NR_Library_temp
Global $listview, $listview_2, $listview_3, $listview_4, $listview_5, $listview_6, $iStylesEx, $CheckBox_Restart, $Icon_Preview, $ApplicationList_TEMP
Global $ListView_ImageList_Temp, $SS_Settings_GUI, $VRSettings_Group, $ApplicationList_INI_TEMP
Global $TAB_NR, $listview_7, $listview_8, $listview_9, $listview_10, $listview_11, $listview_TEMP
Global $contextmenu, $RM_Item0, $RM_Item1, $RM_Item2, $RM_Item3, $RM_Item4, $RM_Item5, $RM_Item5_1, $RM_Item5_2
Global $RM_Item6, $RM_Item7, $RM_Item8, $RM_Item9, $RM_Item10, $RM_Item11, $RM_Item12
Global $RM_Item_RS_0, $RM_Item_RS_1, $RM_Item_RS_2, $RM_Item_RS_3, $RM_Item_RS_4, $RM_Item_RS_5, $RM_Item_RS_6, $RM_Item_RS_7, $RM_Item_RS_8
Global $RM_Item_RS_9, $RM_Item_RS_10, $RM_Item_RS_11, $RM_Item_RS_12, $RM_Item_RS_13, $RM_Item_RS_14
Global $GUI, $UpdateOverlay_SettingValue, $ScanLibrary_OnStart_SettingValue, $LOOP_NR_TEMP, $SteamAppID_TEMP, $NR_LOOP_TO_TEMP
Global $Key_Name_TEMP, $ReadLine_SteamAppCheck, $ResolutionScale_Group, $ReadLine, $Steam_app_Name_TEMP, $ResolutionScale_TEMP
Global $Game_ID, $hImage1, $hImage2, $hBMPBuff, $hImage1_Path, $hImage2_Path, $hGraphic, $hPen, $Statusbar
Global $Steamvr_vrsettings_Array, $Steamvr_vrsettings_aArray, $Loop_End_1, $Application_NR, $Anzeige_Fortschrittbalken
Global $Steamapps_vrmanifest_Array, $Steamapps_vrmanifest_aArray, $Array_Sorted[1][4], $ApplicationList_TEMP_RS
Global $TAB_Label, $Revive_revive_vrmanifest_Array, $Revive_support_vrmanifest_Array
Global $Status_Combo_ApplicationList, $Parameter_Temp, $DataResponse, $Array_Library
Global $ButtonTAB_Steam_Library, $ButtonTAB_Custom_1, $ButtonTAB_Custom_2, $ButtonTAB_Custom_3, $ButtonTAB_Custom_4
Global $Added_to_Custom_Page, $Added_to_Custom_1, $Added_to_Custom_2, $Added_to_Custom_3, $Added_to_Custom_4
Global $Checkbox_ScanVIVEApps_Value, $Checkbox_ScanOculusApps_Value, $Checkbox_Sort_Alphabetical_order_Value, $Checkbox_Allow_Multiple_Tag_Assignments_Value
Global $Checkbox_Add_PlayersOnline_to_Icons_Value, $Checkbox_Add_SS_to_Icons_Value, $Checkbox_Add_SS_per_game_Value
Global $Checkbox_Add_SS_per_game_Value, $Checkbox_Create_HTML_GamePage_Value, $Checkbox_WMR_Shortcut_Files_Value, $Checkbox_DeleteHomeLoaderLibraryData_Value, $Checkbox_Create_SteamVR_Home_Panels_Value
Global $Checkbox_Add_Apps_Tags_to_categories_Value, $Checkbox_Settings_1, $Checkbox_Settings_2, $Checkbox_Settings_3
Global $Checkbox_Settings_4, $Checkbox_Settings_5, $Checkbox_Settings_6, $Checkbox_Settings_7, $Checkbox_Settings_8, $Checkbox_Settings_9
Global $Checkbox_Settings_10, $Checkbox_Settings_11, $Checkbox_Settings_12, $Checkbox_Settings_13, $Checkbox_Settings_1_Label, $Checkbox_Settings_2_Label
Global $Checkbox_Settings_3_Label, $Checkbox_Settings_4_Label, $Checkbox_Settings_5_Label, $Checkbox_Settings_6_Label, $Checkbox_Settings_7_Label, $Checkbox_Settings_8_Label
Global $Checkbox_Settings_9_Label, $Checkbox_Settings_10_Label, $Checkbox_Settings_11_Label, $Checkbox_Settings_12_Label, $Checkbox_Settings_13_Label
Global $Combo_Environment_Name, $Checkbox_Update_Check_OnStart_Value, $Array_Result, $AtError_Result, $appid_TEMP
Global $INetGetSource_Check, $ScriptLineNumber_Temp, $GUI_Preparing, $contextmenu_Prepare_Environment_Button, $RM_Prepare_Environment_Item_1
Global $RM_Prepare_Environment_Item_2, $RM_Prepare_Environment_Item_3, $RM_Prepare_Environment_Item_4, $RM_Prepare_Environment_Item_5, $RM_Prepare_Environment_Item_6
Global $HomeLoader_Map_Image, $Select_New_Workshop_Environment_File_GUI
Global $Map_Preview_Image, $Map_Name, $Map_Environment_by, $Map_Environment_source, $Map_Model_by, $Map_Model_source
Global $Button_Prepare_Environment, $Button_Environment_Apply_Map, $Button_Environment_Create_New_Map, $Button_Environment_Edit_Map, $Button_Environment_Save_Map
Global $Combo_Panel_Layout, $Button_Panel_Settings_Apply, $Button_Panel_Settings_Close
Global $Category_NR
Global $Array_Environments[1][3] = [["title", "source_folder", "Source_folder_Path"]]
Global $font = "arial"
Global $font_arial = "arial"
Global $font_Consolas = "Consolas"

Global $DesktopWidth = "855"
Global $DesktopHeight = @DesktopHeight - 75
Global $POS_X_GUI = 4

Global $oMyError = ObjEvent("AutoIt.Error", "MyErrFunc")

Global $AppName = "WMRGL"

Global $AppName_Window_Main_GUI = "WMRGL [Windows Mixed Reality Game Loader] - Library"
Global $AppName_Window_Settings_GUI = "WMRGL [Windows Mixed Reality Game Loader] - Settings"

Global $Version = 0.10
#EndRegion Set Global

#Region Declare Variables/Const 1
Global $HomeLoader_Config_Folder = _PathFull("WMRGL\", @AppDataDir)
Global $ApplicationList_Folder = _PathFull("WMRGL\ApplicationList\", @AppDataDir)
Global $ApplicationList_Tags_Folder = _PathFull("WMRGL\ApplicationList\Tags\", @AppDataDir)
Global $HomeLoader_Backup_Folder = _PathFull("WMRGL\Backups\", @AppDataDir)
Global $WMR_Startmenu_File_Folder = _PathFull("Microsoft\Windows\Start Menu\SteamVR\", @AppDataDir)
;MsgBox(0, "", $WMR_Startmenu_File_Folder)
;Exit
Global $Config_INI = _PathFull("WMRGL\config.ini", @AppDataDir)

IniWrite($Config_INI, "Settings", "Version", $Version)

Global $Install_DIR = @ScriptDir & "\"
Global $System_DIR = $Install_DIR & "System\"
Global $Version = IniRead($Config_INI, "Settings", "Version", "")
Global $Update_Check = IniRead($Config_INI, "Settings", "Update_Check", "")
Global $Debug_Mode = IniRead($Config_INI, "Settings", "Debug_Mode", "")
Global $SteamVR_Home_Panel_Settings_INI = $Install_DIR & "Apps\SteamVR_Home\SteamVR_Home_Panel_Settings.ini"
Global $SteamVR_Home_Environment_Settings_INI = $Install_DIR & "Apps\SteamVR_Home\SteamVR_Home_Environment_Settings.ini"
Global $SteamVR_VRSettings_INI = _PathFull("WMRGL\SteamVR_VRSettings.ini", @AppDataDir)
If Not FileExists($SteamVR_VRSettings_INI) Then FileCopy(@ScriptDir & "\SteamVR_VRSettings.ini", $Config_INI, $FC_CREATEPATH + $FC_OVERWRITE)
Global $Install_DIR = StringReplace(@ScriptDir, 'System', '')
If StringRight($Install_DIR, 1) <> "\" Then $Install_DIR = $Install_DIR & "\"
;Global $System_DIR = $Install_DIR & "System\"
;Global $System_DIR = $Install_DIR & "\System\"
Global $MainCategory_ApplicationList = IniRead($Config_INI, "Settings", "MainCategory", "")
Global $MainCategory_ApplicationList_Folder = $HomeLoader_Config_Folder & "ApplicationList\Tags\"
;Global $ApplicationList_Folder = $Install_DIR & "ApplicationList\"
Global $ApplicationList_INI = $ApplicationList_Folder & "ApplicationList.ini"
Global $GamePage_path = $Install_DIR & "WebPage\StartPage.html"
Global $Steam_Library = IniRead($Config_INI, "Settings", "Steam_Library", "")
Global $ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
Global $Autostart_VRUB = IniRead($Config_INI, "Settings", "Autostart_VRUB", "")
Global $First_Start = IniRead($Config_INI, "Settings", "First_Start", "true")
If $First_Start = "true" Then _Create_WMRGL_Files()
Global $Use_Local_Icons = IniRead($Config_INI, "Settings", "Use_Local_Icons", "")
Global $DeleteHomeLoaderLibraryData = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")
Global $Request_Steamdb_info = IniRead($Config_INI, "Settings", "Request_Steamdb_info", "")
Global $ScanOnlyVR = IniRead($Config_INI, "Settings", "ScanOnlyVR", "")
Global $ScanVIVEApps = IniRead($Config_INI, "Settings", "ScanVIVEApps", "")
Global $ScanOculusApps = IniRead($Config_INI, "Settings", "ScanOculusApps", "")
Global $Sort_Alphabetical_order = IniRead($Config_INI, "Settings", "Sort_Alphabetical_order", "")
Global $Use_Steam_Tags = IniRead($Config_INI, "Settings", "Use_Steam_Tags", "")
Global $Allow_Multiple_Tag_Assignments = IniRead($Config_INI, "Settings", "Allow_Multiple_Tag_Assignments", "")
Global $Add_Apps_Tags_to_categories = IniRead($Config_INI, "Settings", "Add_Apps_Tags_to_categories", "")
Global $Create_HTML_GamePage = IniRead($Config_INI, "Settings", "Create_HTML_GamePage", "")
Global $Create_WMR_Shortcut_Files = IniRead($Config_INI, "Settings", "Create_WMR_Shortcut_Files", "")
Global $Create_SteamVR_Home_Panels = IniRead($Config_INI, "Settings", "Create_SteamVR_Home_Panels", "")
Global $Add_Back_to_HTML_GamePage = IniRead($Config_INI, "Settings", "Add_Back_to_HTML_GamePage", "")
Global $Add_PlayersOnline_to_Icons = IniRead($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "false")
Global $Add_SS_to_Icons = IniRead($Config_INI, "Settings", "Add_SS_to_Icons", "false")
Global $Add_SS_per_game = IniRead($Config_INI, "Settings", "Add_SS_per_game", "false")
Global $Tags_TXT = $Install_DIR & "System\Tags.txt"
Global $Path_GamePage_Tags = $Install_DIR & "WebPage\GamePage_Tags.html"

Global $gfx = $Install_DIR & "System\gfx\"
Global $Icons = $Install_DIR & "Icons\"

Global $HomeLoader_Map_Folder = $Install_DIR & "Apps\SteamVR_Home\Maps\"
Global $HomeLoader_Map_Image_Template = $gfx & "Environment_Map.jpg"

Global $HomeApp = IniRead($Config_INI, "Settings_HomeAPP", "HomeApp", "")
Global $Home_Path = IniRead($Config_INI, "Settings_HomeAPP", "Home_Path", "")
Global $WinName = IniRead($Config_INI, "Settings_HomeAPP", "WindowName", "")

Global $Steam_Path_REG = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
Global $Steam_Path = StringReplace($Steam_Path_REG, '/', '\') & "\"
Global $SteamVR_Path = $Steam_Path & "SteamApps\common\SteamVR\"
Global $libraryfolders_vdf = $Steam_Path & "steamapps\libraryfolders.vdf"

Global $default_vrsettings_File = $SteamVR_Path & "resources\settings\default.vrsettings"
If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
Global $default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
Global $default_vrsettings_File_new = $default_vrsettings_File & ".new"

Global $Steam_AppConfig_Json = $Steam_Path & "config\appconfig.json"

Global $HTCVive_Path_REG = RegRead('HKEY_CURRENT_USER\Software\HTC\HTC Vive\', "ViveHelperPath")
Global $HTCVive_Path_StringReplace_1 = StringReplace($HTCVive_Path_REG, 'PCClient\ViveportDesktopHelper.exe', '')
Global $HTCVive_Path = StringReplace($HTCVive_Path_StringReplace_1, '/', '\')

Global $Viveport_Bat_File_Folder = $installdir & "WebPage\Viveport\"
If Not FileExists($Viveport_Bat_File_Folder) Then DirCreate($Viveport_Bat_File_Folder)

Global $Oculus_Default_Library_REG = RegRead('HKEY_CURRENT_USER\Software\Oculus VR, LLC\Oculus\Libraries\', "DefaultLibrary")
Global $Oculus_Path_REG = RegRead('HKEY_CURRENT_USER\Software\Oculus VR, LLC\Oculus\Libraries\' & $Oculus_Default_Library_REG, "Path")
Global $Oculus_Path_Position = StringInStr($Oculus_Path_REG, "}")
Global $Oculus_Path_StringReplace = StringTrimLeft($Oculus_Path_REG, $Oculus_Path_Position)
Global $Oculus_Path

For $Loop = Asc("A") To Asc("Z")
	Global $Check_Oculus_Path = Chr($Loop) & ':' & $Oculus_Path_StringReplace
	If FileExists($Check_Oculus_Path) Then $Oculus_Path = $Check_Oculus_Path
	If FileExists($Check_Oculus_Path) Then ExitLoop
Next

Global $Revive_Path_REG = RegRead('HKEY_CURRENT_USER\Software\Revive\', "")
Global $Revive_Path = StringReplace($Revive_Path_REG, '/', '\')
If StringRight($Revive_Path, 1) <> "\" Then $Revive_Path = $Revive_Path & "\"

Global $Revive_revive_vrmanifest_FilePath = $Revive_Path & "revive.vrmanifest"
Global $Revive_support_vrmanifest_FilePath = $Revive_Path & "support.vrmanifest"

Global $Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
Global $Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
Global $Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
Global $Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
Global $Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")


Global $Icon_Folder_1 = IniRead($Config_INI, "Folders", "Icon_Folder_1", "")
Global $Icon_Folder_2 = IniRead($Config_INI, "Folders", "Icon_Folder_2", "")
Global $Icon_Folder_3 = IniRead($Config_INI, "Folders", "Icon_Folder_3", "")
Global $Icon_Folder_4 = IniRead($Config_INI, "Folders", "Icon_Folder_4", "")
Global $Icon_Folder_5 = IniRead($Config_INI, "Folders", "Icon_Folder_5", "")


Global $Steamapps_vrmanifest_FilePath = $Steam_Path & "config\steamapps.vrmanifest"
If Not FileExists($Steamapps_vrmanifest_FilePath & ".bak") Then FileCopy($Steamapps_vrmanifest_FilePath, $Steamapps_vrmanifest_FilePath & ".bak", $FC_CREATEPATH + $FC_OVERWRITE)
If Not FileExists($Install_DIR & "Backups\steamapps.vrmanifest") Then FileCopy($Steamapps_vrmanifest_FilePath, $Install_DIR & "Backups\steamapps.vrmanifest")


Global $ApplicationList_SteamVRLibrary_ALL_INI = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
Global $ApplicationList_SteamLibrary_ALL_INI = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
Global $ApplicationList_Non_Steam_Appl_INI = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
Global $ApplicationList_Custom_1_INI = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
Global $ApplicationList_Custom_2_INI = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
Global $ApplicationList_Custom_3_INI = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
Global $ApplicationList_Custom_4_INI = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"

Global $ScanLibrary_OnStart_SettingValue = IniRead($Config_INI, "Settings", "ScanLibrary_OnStart", "")

Global $stats_log_FILE = $System_DIR & "Logs\stats_log.txt"
Global $scan_log_FILE = $System_DIR & "Logs\scan_log.txt"
Global $function_log_FILE = $System_DIR & "Logs\function_log.txt"
Global $error_log_FILE = $System_DIR & "Logs\error_log.txt"

Local $Check_Log_Size_1 = _FileCountLines($stats_log_FILE)
Local $Check_Log_Size_2 = _FileCountLines($scan_log_FILE)
Local $Check_Log_Size_3 = _FileCountLines($function_log_FILE)
Local $Check_Log_Size_4 = _FileCountLines($error_log_FILE)

If $Check_Log_Size_1 > 10000 Then FileDelete($stats_log_FILE)
If $Check_Log_Size_2 > 10000 Then FileDelete($scan_log_FILE)
If $Check_Log_Size_3 > 10000 Then FileDelete($function_log_FILE)
If $Check_Log_Size_4 > 10000 Then FileDelete($error_log_FILE)

Global $font_arial = "Arial"
Global $font_2 = "Arial"
#EndRegion Declare Variables/Const 1

#Region Declare Variables CSS Color
Local $NR_Colors = 147
Local $aArray_Colors, $Color_Name_Value
Local $aArray_Colors[1][2] = [["Name", "Value"]]

FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start '_ArrayAdd' Colors")

_ArrayAdd($aArray_Colors, "AliceBlue|#F0F8FF")
_ArrayAdd($aArray_Colors, "AntiqueWhite|#FAEBD7")
_ArrayAdd($aArray_Colors, "Aqua|#00FFFF")
_ArrayAdd($aArray_Colors, "Aquamarine|#7FFFD4")
_ArrayAdd($aArray_Colors, "Azure|#F0FFFF")
_ArrayAdd($aArray_Colors, "Beige|#F5F5DC")
_ArrayAdd($aArray_Colors, "Bisque|#FFE4C4")
_ArrayAdd($aArray_Colors, "Black|#000000")
_ArrayAdd($aArray_Colors, "BlanchedAlmond|#FFEBCD")
_ArrayAdd($aArray_Colors, "Blue|#0000FF")
_ArrayAdd($aArray_Colors, "BlueViolet|#8A2BE2")
_ArrayAdd($aArray_Colors, "Brown|#A52A2A")
_ArrayAdd($aArray_Colors, "BurlyWood|#DEB887")
_ArrayAdd($aArray_Colors, "CadetBlue|#5F9EA0")
_ArrayAdd($aArray_Colors, "Chartreuse|#7FFF00")
_ArrayAdd($aArray_Colors, "Chocolate|#D2691E")
_ArrayAdd($aArray_Colors, "Coral|#FF7F50")
_ArrayAdd($aArray_Colors, "CornflowerBlue|#6495ED")
_ArrayAdd($aArray_Colors, "Cornsilk|#FFF8DC")
_ArrayAdd($aArray_Colors, "Crimson|#DC143C")
_ArrayAdd($aArray_Colors, "Cyan|#00FFFF")
_ArrayAdd($aArray_Colors, "DarkBlue|#00008B")
_ArrayAdd($aArray_Colors, "DarkCyan|#008B8B")
_ArrayAdd($aArray_Colors, "DarkGoldenRod|#B8860B")
_ArrayAdd($aArray_Colors, "DarkGray|#A9A9A9")
_ArrayAdd($aArray_Colors, "DarkGrey|#A9A9A9")
_ArrayAdd($aArray_Colors, "DarkGreen|#006400")
_ArrayAdd($aArray_Colors, "DarkKhaki|#BDB76B")
_ArrayAdd($aArray_Colors, "DarkMagenta|#8B008B")
_ArrayAdd($aArray_Colors, "DarkOliveGreen|#556B2F")
_ArrayAdd($aArray_Colors, "DarkOrange|#FF8C00")
_ArrayAdd($aArray_Colors, "DarkOrchid|#9932CC")
_ArrayAdd($aArray_Colors, "DarkRed|#8B0000")
_ArrayAdd($aArray_Colors, "DarkSalmon|#E9967A")
_ArrayAdd($aArray_Colors, "DarkSeaGreen|#8FBC8F")
_ArrayAdd($aArray_Colors, "DarkSlateBlue|#483D8B")
_ArrayAdd($aArray_Colors, "DarkSlateGray|#2F4F4F")
_ArrayAdd($aArray_Colors, "DarkSlateGrey|#2F4F4F")
_ArrayAdd($aArray_Colors, "DarkTurquoise|#00CED1")
_ArrayAdd($aArray_Colors, "DarkViolet|#9400D3")
_ArrayAdd($aArray_Colors, "DeepPink|#FF1493")
_ArrayAdd($aArray_Colors, "DeepSkyBlue|#00BFFF")
_ArrayAdd($aArray_Colors, "DimGray|#696969")
_ArrayAdd($aArray_Colors, "DimGrey|#696969")
_ArrayAdd($aArray_Colors, "DodgerBlue|#1E90FF")
_ArrayAdd($aArray_Colors, "FireBrick|#B22222")
_ArrayAdd($aArray_Colors, "FloralWhite|#FFFAF0")
_ArrayAdd($aArray_Colors, "ForestGreen|#228B22")
_ArrayAdd($aArray_Colors, "Fuchsia|#FF00FF")
_ArrayAdd($aArray_Colors, "Gainsboro|#DCDCDC")
_ArrayAdd($aArray_Colors, "GhostWhite|#F8F8FF")
_ArrayAdd($aArray_Colors, "Gold|#FFD700")
_ArrayAdd($aArray_Colors, "GoldenRod|#DAA520")
_ArrayAdd($aArray_Colors, "Gray|#808080")
_ArrayAdd($aArray_Colors, "Grey|#808080")
_ArrayAdd($aArray_Colors, "Green|#008000")
_ArrayAdd($aArray_Colors, "GreenYellow|#ADFF2F")
_ArrayAdd($aArray_Colors, "HoneyDew|#F0FFF0")
_ArrayAdd($aArray_Colors, "HotPink|#FF69B4")
_ArrayAdd($aArray_Colors, "IndianRed|#CD5C5C")
_ArrayAdd($aArray_Colors, "Indigo|#4B0082")
_ArrayAdd($aArray_Colors, "Ivory|#FFFFF0")
_ArrayAdd($aArray_Colors, "Khaki|#F0E68C")
_ArrayAdd($aArray_Colors, "Lavender|#E6E6FA")
_ArrayAdd($aArray_Colors, "LavenderBlush|#FFF0F5")
_ArrayAdd($aArray_Colors, "LawnGreen|#7CFC00")
_ArrayAdd($aArray_Colors, "LemonChiffon|#FFFACD")
_ArrayAdd($aArray_Colors, "LightBlue|#ADD8E6")
_ArrayAdd($aArray_Colors, "LightCoral|#F08080")
_ArrayAdd($aArray_Colors, "LightCyan|#E0FFFF")
_ArrayAdd($aArray_Colors, "LightGoldenRodYellow|#FAFAD2")
_ArrayAdd($aArray_Colors, "LightGray|#D3D3D3")
_ArrayAdd($aArray_Colors, "LightGrey|#D3D3D3")
_ArrayAdd($aArray_Colors, "LightGreen|#90EE90")
_ArrayAdd($aArray_Colors, "LightPink|#FFB6C1")
_ArrayAdd($aArray_Colors, "LightSalmon|#FFA07A")
_ArrayAdd($aArray_Colors, "LightSeaGreen|#20B2AA")
_ArrayAdd($aArray_Colors, "LightSkyBlue|#87CEFA")
_ArrayAdd($aArray_Colors, "LightSlateGray|#778899")
_ArrayAdd($aArray_Colors, "LightSlateGrey|#778899")
_ArrayAdd($aArray_Colors, "LightSteelBlue|#B0C4DE")
_ArrayAdd($aArray_Colors, "LightYellow|#FFFFE0")
_ArrayAdd($aArray_Colors, "Lime|#00FF00")
_ArrayAdd($aArray_Colors, "LimeGreen|#32CD32")
_ArrayAdd($aArray_Colors, "Linen|#FAF0E6")
_ArrayAdd($aArray_Colors, "Magenta|#FF00FF")
_ArrayAdd($aArray_Colors, "Maroon|#800000")
_ArrayAdd($aArray_Colors, "MediumAquaMarine|#66CDAA")
_ArrayAdd($aArray_Colors, "MediumBlue|#0000CD")
_ArrayAdd($aArray_Colors, "MediumOrchid|#BA55D3")
_ArrayAdd($aArray_Colors, "MediumPurple|#9370DB")
_ArrayAdd($aArray_Colors, "MediumSeaGreen|#3CB371")
_ArrayAdd($aArray_Colors, "MediumSlateBlue|#7B68EE")
_ArrayAdd($aArray_Colors, "MediumSpringGreen|#00FA9A")
_ArrayAdd($aArray_Colors, "MediumTurquoise|#48D1CC")
_ArrayAdd($aArray_Colors, "MediumVioletRed|#C71585")
_ArrayAdd($aArray_Colors, "MidnightBlue|#191970")
_ArrayAdd($aArray_Colors, "MintCream|#F5FFFA")
_ArrayAdd($aArray_Colors, "MistyRose|#FFE4E1")
_ArrayAdd($aArray_Colors, "Moccasin|#FFE4B5")
_ArrayAdd($aArray_Colors, "NavajoWhite|#FFDEAD")
_ArrayAdd($aArray_Colors, "Navy|#000080")
_ArrayAdd($aArray_Colors, "OldLace|#FDF5E6")
_ArrayAdd($aArray_Colors, "Olive|#808000")
;_ArrayAdd($aArray_Colors, "OliveDrab|#6B8E23")
_ArrayAdd($aArray_Colors, "Orange|#FFA500")
_ArrayAdd($aArray_Colors, "OrangeRed|#FF4500")
_ArrayAdd($aArray_Colors, "Orchid|#DA70D6")
_ArrayAdd($aArray_Colors, "PaleGoldenRod|#EEE8AA")
_ArrayAdd($aArray_Colors, "PaleGreen|#98FB98")
_ArrayAdd($aArray_Colors, "PaleTurquoise|#AFEEEE")
_ArrayAdd($aArray_Colors, "PaleVioletRed|#DB7093")
_ArrayAdd($aArray_Colors, "PapayaWhip|#FFEFD5")
_ArrayAdd($aArray_Colors, "PeachPuff|#FFDAB9")
_ArrayAdd($aArray_Colors, "Peru|#CD853F")
_ArrayAdd($aArray_Colors, "Pink|#FFC0CB")
_ArrayAdd($aArray_Colors, "Plum|#DDA0DD")
_ArrayAdd($aArray_Colors, "PowderBlue|#B0E0E6")
_ArrayAdd($aArray_Colors, "Purple|#800080")
_ArrayAdd($aArray_Colors, "RebeccaPurple|#663399")
_ArrayAdd($aArray_Colors, "Red|#FF0000")
_ArrayAdd($aArray_Colors, "RosyBrown|#BC8F8F")
_ArrayAdd($aArray_Colors, "RoyalBlue|#4169E1")
_ArrayAdd($aArray_Colors, "SaddleBrown|#8B4513")
_ArrayAdd($aArray_Colors, "Salmon|#FA8072")
_ArrayAdd($aArray_Colors, "SandyBrown|#F4A460")
_ArrayAdd($aArray_Colors, "SeaGreen|#2E8B57")
_ArrayAdd($aArray_Colors, "SeaShell|#FFF5EE")
_ArrayAdd($aArray_Colors, "Sienna|#A0522D")
_ArrayAdd($aArray_Colors, "Silver|#C0C0C0")
_ArrayAdd($aArray_Colors, "SkyBlue|#87CEEB")
_ArrayAdd($aArray_Colors, "SlateBlue|#6A5ACD")
_ArrayAdd($aArray_Colors, "SlateGray|#708090")
_ArrayAdd($aArray_Colors, "SlateGrey|#708090")
_ArrayAdd($aArray_Colors, "Snow|#FFFAFA")
_ArrayAdd($aArray_Colors, "SpringGreen|#00FF7F")
_ArrayAdd($aArray_Colors, "SteelBlue|#4682B4")
_ArrayAdd($aArray_Colors, "Tan|#D2B48C")
_ArrayAdd($aArray_Colors, "Teal|#008080")
_ArrayAdd($aArray_Colors, "Thistle|#D8BFD8")
_ArrayAdd($aArray_Colors, "Tomato|#FF6347")
_ArrayAdd($aArray_Colors, "Turquoise|#40E0D0")
_ArrayAdd($aArray_Colors, "Violet|#EE82EE")
_ArrayAdd($aArray_Colors, "Wheat|#F5DEB3")
_ArrayAdd($aArray_Colors, "White|#FFFFFF")
_ArrayAdd($aArray_Colors, "WhiteSmoke|#F5F5F5")
_ArrayAdd($aArray_Colors, "Yellow|#FFFF00")
_ArrayAdd($aArray_Colors, "YellowGreen|#9ACD32")

FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End '_ArrayAdd' Colors")
;_ArrayDisplay($aArray_Colors, "2D - Item delimited")



;Global $Colors_ALL_Combo = "AliceBlue"&"|"&"AntiqueWhite"&"|"&"Aqua"&"|"&"Aquamarine"&"|"&"Azure"&"|"&"Beige"&"|"&"Bisque"&"|"&"Black"&"|"&"BlanchedAlmond"&"|"&"Blue"&"|"&"BlueViolet"&"|"&"Brown"&"|"&"BurlyWood"&"|"&"CadetBlue"&"|"&"Chartreuse"&"|"&"Chocolate"&"|"&"Coral"&"|"&"CornflowerBlue"&"|"&"Cornsilk"&"|"&"Crimson"&"|"&"Cyan"&"|"&"DarkBlue"&"|"&"DarkCyan"&"|"&"DarkGoldenRod"&"|"&"DarkGray"&"|"&"DarkGrey"&"|"&"DarkGreen"&"|"&"DarkKhaki"&"|"&"DarkMagenta"&"|"&"DarkOliveGreen"&"|"&"DarkOrange"&"|"&"DarkOrchid"&"|"&"DarkRed"&"|"&"DarkSalmon"&"|"&"DarkSeaGreen"&"|"&"DarkSlateBlue"&"|"&"DarkSlateGray"&"|"&"DarkSlateGrey"&"|"&"DarkTurquoise"&"|"&"DarkViolet"&"|"&"DeepPink"&"|"&"DeepSkyBlue"&"|"&"DimGray"&"|"&"DimGrey"&"|"&"DodgerBlue"&"|"&"FireBrick"&"|"&"FloralWhite"&"|"&"ForestGreen"&"|"&"Fuchsia"&"|"&"Gainsboro"&"|"&"GhostWhite"&"|"&"Gold"&"|"&"GoldenRod"&"|"&"Gray"&"|"&"Grey"&"|"&"Green"&"|"&"GreenYellow"&"|"&"HoneyDew"&"|"&"HotPink"&"|"&"IndianRed "&"|"&"Indigo "&"|"&"Ivory"&"|"&"Khaki"&"|"&"Lavender"&"|"&"LavenderBlush"&"|"&"LawnGreen"&"|"&"LemonChiffon"&"|"&"LightBlue"&"|"&"LightCoral"&"|"&"LightCyan"&"|"&"LightGoldenRodYellow"&"|"&"LightGray"&"|"&"LightGrey"&"|"&"LightGreen"&"|"&"LightPink"&"|"&"LightSalmon"&"|"&"LightSeaGreen"&"|"&"LightSkyBlue"&"|"&"LightSlateGray"&"|"&"LightSlateGrey"&"|"&"LightSteelBlue"&"|"&"LightYellow"&"|"&"Lime"&"|"&"LimeGreen"&"|"&"Linen"&"|"&"Magenta"&"|"&"Maroon"&"|"&"MediumAquaMarine"&"|"&"MediumBlue"&"|"&"MediumOrchid"&"|"&"MediumPurple"&"|"&"MediumSeaGreen"&"|"&"MediumSlateBlue"&"|"&"MediumSpringGreen"&"|"&"MediumTurquoise"&"|"&"MediumVioletRed"&"|"&"MidnightBlue"&"|"&"MintCream"&"|"&"MistyRose"&"|"&"Moccasin"&"|"&"NavajoWhite"&"|"&"Navy"&"|"&"OldLace"&"|"&"Olive"&"|"&"OliveDrab"&"|"&"Orange"&"|"&"OrangeRed"&"|"&"Orchid"&"|"&"PaleGoldenRod"&"|"&"PaleGreen"&"|"&"PaleTurquoise"&"|"&"PaleVioletRed"&"|"&"PapayaWhip"&"|"&"PeachPuff"&"|"&"Peru"&"|"&"Pink"&"|"&"Plum"&"|"&"PowderBlue"&"|"&"Purple"&"|"&"RebeccaPurple"&"|"&"Red"&"|"&"RosyBrown"&"|"&"RoyalBlue"&"|"&"SaddleBrown"&"|"&"Salmon"&"|"&"SandyBrown"&"|"&"SeaGreen"&"|"&"SeaShell"&"|"&"Sienna"&"|"&"Silver"&"|"&"SkyBlue"&"|"&"SlateBlue"&"|"&"SlateGray"&"|"&"SlateGrey"&"|"&"Snow"&"|"&"SpringGreen"&"|"&"SteelBlue"&"|"&"Tan"&"|"&"Teal"&"|"&"Thistle"&"|"&"Tomato"&"|"&"Turquoise"&"|"&"Violet"&"|"&"Wheat"&"|"&"White"&"|"&"WhiteSmoke"&"|"&"Yellow"&"|"&"YellowGreen"



Global $Colors_ALL_Combo = ""
For $Loop = 1 To $NR_Colors
	$Colors_ALL_Combo = $Colors_ALL_Combo & $aArray_Colors[$Loop][0] & "|"
Next

;MsgBox(0, "$Colors_ALL_Combo", $Colors_ALL_Combo)


#EndRegion

#Region First Start and Update performed Check
_First_Start_Empty_Check_1()
#EndRegion First Start and Update performed Check

#Region Declare Names
Global $TAB1_Label = IniRead($Config_INI, "Settings", "TAB1_Name", "")
Global $TAB2_Label = IniRead($Config_INI, "Settings", "TAB2_Name", "")
Global $TAB3_Label = IniRead($Config_INI, "Settings", "TAB3_Name", "")
Global $TAB4_Label = IniRead($Config_INI, "Settings", "TAB4_Name", "")
Global $TAB5_Label = IniRead($Config_INI, "Settings", "TAB5_Name", "")
Global $TAB6_Label = IniRead($Config_INI, "Settings", "TAB6_Name", "")
If $TAB1_Label = "" Then $TAB1_Label = "Library"
If $TAB2_Label = "" Then $TAB2_Label = "Favorites"
If $TAB3_Label = "" Then $TAB3_Label = "Custom 1"
If $TAB4_Label = "" Then $TAB4_Label = "Custom 2"
If $TAB5_Label = "" Then $TAB5_Label = "Custom 3"
If $TAB6_Label = "" Then $TAB6_Label = "Custom 4"
#EndRegion Declare Names


#Region Start Check
Local $Parameter_1 = ""
If $CmdLine[0] Then
	$Parameter_1 = $CmdLine[1]
EndIf

If $Parameter_1 = "GUI - Library ListViewMode" Then
	_Create_HLL_GUI()
EndIf




If $Parameter_1 = "UpdateLibrary" Then
	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start Scan/Updating:")
	$ScanLibrary_OnStart_SettingValue = IniRead($Config_INI, "Settings", "ScanLibrary_OnStart", "")
	;_Exit_Check()

	If $ScanLibrary_OnStart_SettingValue = "true" Then
		;_Button_ReScan_Steam_Library_AutoUpdate()
	EndIf
	Exit
EndIf

#EndRegion Start Check


#Region GUI
If $First_Start <> "true" Then
	_Create_HLL_GUI()
	;_Create_HTMLGamePage_GUI()
	;_HLL_Settings_GUI()
	;_Create_WMR_Startmenu_Files()
	;Exit
Else
	IniWrite($Config_INI, "Settings", "First_Start", "false")
	_Restart()
EndIf


#EndRegion GUI

#Region Load Data
;_Set_States()
;_RM_Buttons()
#EndRegion Load Data


#Region While 1
While 1
;	Sleep(100)
	Global $nMsg = GUIGetMsg()
;
	Switch $nMsg
;
		Case $GUI_EVENT_CLOSE
;			Exit
;
	EndSwitch
WEnd
#EndRegion While 1


#Region First Start And Update / Empty Check
Func _First_Start_Empty_Check_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (577) :(' & @MIN & ':' & @SEC & ') _First_Start_Empty_Check_1()' & @CR) ;### Function Trace
	Global $Install_Folder_Steam_Search_Folder, $Install_Folder_Steam_Search_Folder

	;MsgBox(0, "", $Install_Folder_Steam_Search_Folder & @CRLF & $Install_Folder_Steam_Search_Folder)

	$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
	If $Install_Folder_Steam_1 = "" Then
		$Install_Folder_Steam_Search_Folder = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
		$Install_Folder_Steam_Search_Folder = StringReplace($Install_Folder_Steam_Search_Folder, '/', '\')

		If $Install_Folder_Steam_Search_Folder <> "" Then
			IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", $Install_Folder_Steam_Search_Folder & "\")
		Else
			MsgBox($MB_ICONINFORMATION, "Steam folder", "Steam folder was not found." & @CRLF & _
					"Choose the folder before continue." & @CRLF)

			Local $FileSelectFolder = FileSelectFolder("Choose Steam folder", $Install_Folder_Steam_Search_Folder & "\")
			If $FileSelectFolder <> "" Then
				IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", $FileSelectFolder & "\")
			Else
				MsgBox($MB_ICONWARNING, "Attention!", "Wrong Steam Library folder selected." & @CRLF & @CRLF & "The right one you need to choose contains the File 'Steam.dll' and 'SteamApps' folder.")
				IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", "")
				_Restart()
			EndIf
		EndIf
		$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
	EndIf

	$Install_Folder_Steam_Search_Folder = RegRead('HKEY_CURRENT_USER\Software\Valve\Steam\', "SteamPath")
	$Install_Folder_Steam_Search_Folder = StringReplace($Install_Folder_Steam_Search_Folder, '/', '\')
	If $Install_Folder_Steam_Search_Folder <> "" Then
		For $Loop_FolderCheck = 2 To 5
			Local $LineNR = 3 + $Loop_FolderCheck
			Local $Install_Folder_Check = IniRead($Config_INI, "Folders", "Install_Folder_Steam_" & $Loop_FolderCheck, "")
			Local $Install_Folder_1 = FileReadLine($libraryfolders_vdf, $LineNR)
			Local $Install_Folder_2 = StringTrimLeft($Install_Folder_1, 6)
			Local $Install_Folder_3 = StringReplace($Install_Folder_2, '"', '')
			Local $Install_Folder_4 = StringReplace($Install_Folder_3, '}', '')
			Local $Install_Folder_5 = StringReplace($Install_Folder_4, '\\', '\') & "\"
			If $Install_Folder_4 <> "" Then IniWrite($Config_INI, "Folders", "Install_Folder_Steam_" & $Loop_FolderCheck, $Install_Folder_5)
		Next
	EndIf

	If FileExists($Install_Folder_Steam_1 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_1 & "SteamApps\common\SteamVR\"
	If FileExists($Install_Folder_Steam_2 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_2 & "SteamApps\common\SteamVR\"
	If FileExists($Install_Folder_Steam_3 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_3 & "SteamApps\common\SteamVR\"
	If FileExists($Install_Folder_Steam_4 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_4 & "SteamApps\common\SteamVR\"
	If FileExists($Install_Folder_Steam_5 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_5 & "SteamApps\common\SteamVR\"


	$Icon_Folder_1 = IniRead($Config_INI, "Folders", "Icon_Folder_1", "")
	If $Icon_Folder_1 = "" Then
		If FileExists($Install_DIR & "WebPage\images\") Then
			$Icon_Folder_1 = $Install_DIR & "WebPage\images\"
			IniWrite($Config_INI, "Folders", "Icon_Folder_1", $Icon_Folder_1)
		EndIf
	EndIf

	$Icon_Folder_2 = IniRead($Config_INI, "Folders", "Icon_Folder_2", "")
	If $Icon_Folder_2 = "" Then
		If FileExists($HTCVive_Path & "Updater\App\Dashboard\win32\header_image\") Then
			$Icon_Folder_2 = $HTCVive_Path & "Updater\App\Dashboard\win32\header_image\"
			IniWrite($Config_INI, "Folders", "Icon_Folder_2", $Icon_Folder_2)
		EndIf
	EndIf

	_HLL_Detect_SteamVR_Files()

EndFunc   ;==>_First_Start_Empty_Check_1

Func _Create_WMRGL_Files()
	IniWrite($Config_INI, "Settings", "Version", "")
	IniWrite($Config_INI, "Settings", "First_Start", "true")
	IniWrite($Config_INI, "Settings", "Debug_Mode", "false")
	IniWrite($Config_INI, "Settings", "Steam_Library", "All")
	IniWrite($Config_INI, "Settings", "ButtonTAB_State", "1")
	IniWrite($Config_INI, "Settings", "ScanOnlyVR", "true")
	IniWrite($Config_INI, "Settings", "MainCategory", "ALL Categories")
	IniWrite($Config_INI, "Settings", "ScanVIVEApps", "false")
	IniWrite($Config_INI, "Settings", "ScanOculusApps", "false")
	IniWrite($Config_INI, "Settings", "Sort_Alphabetical_order", "true")
	IniWrite($Config_INI, "Settings", "Request_Steamdb_info", "false")
	IniWrite($Config_INI, "Settings", "Create_HTML_GamePage", "true")
	IniWrite($Config_INI, "Settings", "Add_Back_to_HTML_GamePage", "true")
	IniWrite($Config_INI, "Settings", "Create_WMR_Shortcut_Files", "false")
	IniWrite($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "false")
	IniWrite($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "false")
	IniWrite($Config_INI, "Settings", "TAB1_Name", "Library")
	IniWrite($Config_INI, "Settings", "TAB2_Name", "Favorites")
	IniWrite($Config_INI, "Settings", "TAB3_Name", "Multiplayer Shooter")
	IniWrite($Config_INI, "Settings", "TAB4_Name", "Single Player Shooter")
	IniWrite($Config_INI, "Settings", "TAB5_Name", "Adventures")
	IniWrite($Config_INI, "Settings", "TAB6_Name", "Sport / Fun / Misc.")
	IniWrite($Config_INI, "Settings", "TAB7_Name", "Viveport Applications")
	IniWrite($Config_INI, "Settings", "TAB8_Name", "Oculus Applications")

	IniWrite($Config_INI, "Folders", "Install_Folder_Steam_1", "")
	IniWrite($Config_INI, "Folders", "Install_Folder_Steam_2", "")
	IniWrite($Config_INI, "Folders", "Install_Folder_Steam_3", "")
	IniWrite($Config_INI, "Folders", "Install_Folder_Steam_4", "")
	IniWrite($Config_INI, "Folders", "Install_Folder_Steam_5", "")
	IniWrite($Config_INI, "Folders", "Icon_Folder_1", "")
	IniWrite($Config_INI, "Folders", "Icon_Folder_2", "")
	IniWrite($Config_INI, "Folders", "Icon_Folder_3", "")
	IniWrite($Config_INI, "Folders", "Icon_Folder_4", "")
	IniWrite($Config_INI, "Folders", "Icon_Folder_5", "")

	If Not FileExists($ApplicationList_Folder) Then DirCreate($ApplicationList_Folder)
	If Not FileExists($HomeLoader_Backup_Folder) Then DirCreate($HomeLoader_Backup_Folder)
	If Not FileExists($WMR_Startmenu_File_Folder) Then DirCreate($WMR_Startmenu_File_Folder)
EndFunc


Func _HLL_Detect_SteamVR_Files()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (700) :(' & @MIN & ':' & @SEC & ') _HLL_Detect_SteamVR_Files()' & @CR) ;### Function Trace
	IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", "")
	IniWrite($Config_INI, "Folders", "Steam_tools_vrmanifest", "")

	$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
	$Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
	$Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
	$Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
	$Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")

	If Not FileExists($SteamVR_Path & "resources\settings\default.vrsettings") Then
		If FileExists($Install_Folder_Steam_1 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_1 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_2 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_2 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_3 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_3 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_4 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_4 & "SteamApps\common\SteamVR\"
		If FileExists($Install_Folder_Steam_5 & "SteamApps\appmanifest_250820.acf") Then $SteamVR_Path = $Install_Folder_Steam_5 & "SteamApps\common\SteamVR\"

		$default_vrsettings_File = $SteamVR_Path & "resources\settings\default.vrsettings"
		If FileExists($default_vrsettings_File) Then IniWrite($Config_INI, "Folders", "Steam_default_vrsettings", $default_vrsettings_File)
		$default_vrsettings_File_BAK = $default_vrsettings_File & ".bak"
	EndIf

	Global $Steamapps_vrmanifest_FilePath = $Steam_Path & "config\steamapps.vrmanifest"
	If Not FileExists($Steamapps_vrmanifest_FilePath & ".bak") Then FileCopy($Steamapps_vrmanifest_FilePath, $Steamapps_vrmanifest_FilePath & ".bak", $FC_CREATEPATH + $FC_OVERWRITE)
	If Not FileExists($Install_DIR & "Backups\steamapps.vrmanifest") Then FileCopy($Steamapps_vrmanifest_FilePath, $Install_DIR & "Backups\steamapps.vrmanifest")

EndFunc   ;==>_Detect_SteamVR_Files
#EndRegion First Start And Update / Empty Check

#Region Func MAIN
Func _Loading_GUI()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (738) :(' & @MIN & ':' & @SEC & ') _Loading_GUI()' & @CR) ;### Function Trace
	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000

	Local $POS_X_Loading_GUI = ($DesktopWidth / 2) - 152

	$GUI_Loading = GUICreate("Loading...please wait...", 250, 65, $POS_X_Loading_GUI, -1, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))
	GUISetIcon(@AutoItExe, -2, $GUI_Loading)
	GUISetBkColor("0x00BFFF")

	$font = "arial"
	GUICtrlCreateLabel("...Loading...", 66, 5, 160, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	GUICtrlSetColor(-1, $COLOR_RED)
	GUICtrlCreateLabel("...Please wait...", 49, 32, 160, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	GUICtrlSetColor(-1, $COLOR_RED)

	GUISetState(@SW_SHOW, $GUI_Loading)
	WinSetOnTop("Loading...please wait...", "", $WINDOWS_ONTOP)
EndFunc   ;==>_Loading_GUI

Func _Preparing_GUI_2()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (761) :(' & @MIN & ':' & @SEC & ') _Preparing_GUI()' & @CR) ;### Function Trace
	Local Const $PG_WS_POPUP = 0x80000000
	Local Const $PG_WS_DLGFRAME = 0x00400000

	$GUI_Preparing = GUICreate("Preparing...please wait...", 250, 65, -1, -1, BitOR($PG_WS_DLGFRAME, $PG_WS_POPUP))
	GUISetIcon(@AutoItExe, -2, $GUI_Preparing)
	GUISetBkColor("0x00BFFF")

	$font = "arial"
	GUICtrlCreateLabel("...Preparing...", 58, 5, 152, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	GUICtrlSetColor(-1, $COLOR_RED)
	GUICtrlCreateLabel("...Please wait...", 49, 32, 160, 25)
	GUICtrlSetFont(-1, 17, 800, 1, $font)
	GUICtrlSetColor(-1, $COLOR_RED)

	GUISetState(@SW_SHOW, $GUI_Preparing)
	WinSetOnTop("Preparing...please wait...", "", $WINDOWS_ONTOP)
EndFunc   ;==>_Loading_GUI

Func _Exit_Preparing_GUI_2()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (782) :(' & @MIN & ':' & @SEC & ') _Exit_Preparing_GUI()' & @CR) ;### Function Trace
	GUIDelete($GUI_Preparing)
EndFunc   ;==>_Loading_GUI

Func _Create_HLL_GUI()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (787) :(' & @MIN & ':' & @SEC & ') _Create_HLL_GUI()' & @CR) ;### Function Trace
	Local $hGUI, $hGraphic, $hPen
	Local $HLL_GUI, $aSize, $aStrings[5]
	Local $btn, $chk, $rdo, $Msg
	Local $GUI_List_Auswahl, $tu_Button0, $to_button1, $to_button2, $to_button3, $to_button4
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $sPath = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\Examples\GUI\Advanced\Images"

	$HLL_GUI = GUICreate($AppName_Window_Main_GUI, 800, $DesktopHeight, $POS_X_GUI, 4, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))
	Global $HLL_GUI_Handle = $HLL_GUI

	; PROGRESS
	Global $Anzeige_Fortschrittbalken = GUICtrlCreateProgress(0, $DesktopHeight - 25, $DesktopWidth, 5)

	;MsgBox(0, $HLL_GUI, $HLL_GUI)

	$Statusbar = _GUICtrlStatusBar_Create($HLL_GUI)
	_GUICtrlStatusBar_SetSimple($Statusbar, True)
	_GUICtrlStatusBar_SetText($Statusbar, "Loading, please wait." & @TAB & "" & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")
	;GUISetState()

	;MsgBox(0, $Statusbar, _GUICtrlStatusBar_IsSimple($Statusbar))

	; Rahmen
	Global $Linie_oben = GUICtrlCreatePic($gfx & "Frame.jpg", 629, 4, 165, 3, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Linie_unten = GUICtrlCreatePic($gfx & "Frame.jpg", 629, 82, 165, 3, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Linie_rechts = GUICtrlCreatePic($gfx & "Frame.jpg", 791, 4, 3, 81, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))
	Global $Linie_links = GUICtrlCreatePic($gfx & "Frame.jpg", 628, 4, 3, 81, BitOR($SS_NOTIFY, $WS_GROUP, $WS_CLIPSIBLINGS))

	; Icon Preview
	Global $Icon_Preview_Image = GUICtrlCreatePic($gfx & "Icon_Preview.jpg", 631, 7, 160, 75)
	GUICtrlSetTip($Icon_Preview_Image, "Shows a preview Icon for the selected application.")



	Global $Button_ReScan_Steam_Library = GUICtrlCreateButton("Rescan Library", 4, 5, 130, 80, $BS_BITMAP) ; 207, 42
	_GUICtrlButton_SetImage($Button_ReScan_Steam_Library, $gfx & "ReScan_SteamLibrary.bmp")
	GUICtrlSetTip($Button_ReScan_Steam_Library, "Scans for all content." & @CRLF & @CRLF & _
			"This includes:" & @CRLF & _
			"- Scan for new games" & @CRLF & _
			"- Download Icons [If Delete Library Data is activated and/or if the app is new]" & @CRLF & _
			"- Search Steamdb Info and Add Player count" & @CRLF & _
			"- Check and Add Resolution Scale" & @CRLF & _
			"- Search Steamdb Info and Add Apps based on their Tags to Categories" & @CRLF & _
			"- Create HTML Game Pages" & @CRLF & _
			"- Syncs Data with VRUB Overlay [If activated]" & @CRLF & @CRLF & _
			"Scan Settings can be changed using the Scan Options.")

	_RM_Button_Scan()

	GUICtrlCreateLabel("", 145, 18, 21, 22)
	GUICtrlSetBkColor(-1, 0)
	GUICtrlSetState(-1, $GUI_DISABLE)
	Local $State_Checkbox_ScanOnlyVR = "", $Checkbox_ScanOnlyVR_Label = ""
	If $ScanOnlyVR = "true" Then $State_Checkbox_ScanOnlyVR = "X"
	If $ScanOnlyVR <> "true" Then $State_Checkbox_ScanOnlyVR = ""
	Global $Checkbox_ScanOnlyVR = GUICtrlCreateLabel($State_Checkbox_ScanOnlyVR, 146, 18 + 1, 19, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetTip($Checkbox_ScanOnlyVR, "Shows only VR Apps" & @CRLF & "[and with an new Scan it scans only for VR Apps]." & @CRLF)
	GUICtrlSetFont(-1, 19)
	GUICtrlSetOnEvent(-1, "_Checkbox_Show_OnlyVR_Apps")
	Global $Checkbox_ScanOnlyVR_Label = GUICtrlCreateLabel("Only VR Apps", 171, 15, 160, 30) ; ; +26
	GUICtrlSetTip($Checkbox_ScanOnlyVR_Label, "Shows only VR Apps" & @CRLF & "[and with an new Scan it scans only for VR Apps]." & @CRLF)
	GUICtrlSetFont(-1, 19, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_Checkbox_Show_OnlyVR_Apps")



	GUICtrlCreateLabel("", 145, 48, 21, 22)
	GUICtrlSetBkColor(-1, 0)
	GUICtrlSetState(-1, $GUI_DISABLE)
	Local $State_Checkbox_ScanAll = "", $Checkbox_ScanOAll_Label = ""
	If $ScanOnlyVR = "false" Then $State_Checkbox_ScanAll = "X"
	If $ScanOnlyVR <> "false" Then $State_Checkbox_ScanAll = ""
	Global $Checkbox_ScanAll = GUICtrlCreateLabel($State_Checkbox_ScanAll, 146, 48 + 1, 19, 20, BitOR($SS_CENTER, $SS_CENTERIMAGE))
	GUICtrlSetTip($Checkbox_ScanAll, "Shows All VR Apps" & @CRLF & "[and with an new scan it scans for All Apps]." & @CRLF)
	GUICtrlSetFont(-1, 19)
	GUICtrlSetOnEvent(-1, "_Checkbox_Show_All_Apps")
	Global $Checkbox_ScanAll_Label = GUICtrlCreateLabel("All Apps", 171, 46, 95, 30) ; ; +26
	GUICtrlSetTip($Checkbox_ScanAll_Label, "Shows All VR Apps" & @CRLF & "[and with an new scan it scans for All Apps]." & @CRLF)
	GUICtrlSetFont(-1, 19, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_Checkbox_Show_All_Apps")




	Global $Checkbox_Main_01_Value = ""
	If $ScanVIVEApps = "true" Then $Checkbox_Main_01_Value = "a"
	Global $Checkbox_Main_01 = GUICtrlCreateLabel($Checkbox_Main_01_Value, 400, 05, 15, 15, 0x1201)
	GUICtrlSetTip($Checkbox_Main_01, "Scans for all content everytime the HomeApp is started." & @CRLF & @CRLF & _
			"This includes:" & @CRLF & _
			"- Scan for new games" & @CRLF & _
			"- Download Icons [If Delete Library Data is activated]" & @CRLF & _
			"- Search and Add Player count" & @CRLF & _
			"- Check and Add Resolution Scale" & @CRLF & _
			"- Syncs Data with VRUB Overlay [If activated]")
	GUICtrlSetFont(-1, 18, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	Global $Checkbox_01_Label = GUICtrlCreateLabel("Scan for Viveport Apps", 420, 04, 200, 20)
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GUICtrlSetTip($Checkbox_01_Label, "Scans for all content everytime the HomeApp is started." & @CRLF & @CRLF & _
			"This includes:" & @CRLF & _
			"- Scan for new games" & @CRLF & _
			"- Download Icons [If Delete Library Data is activated and/or if the app is new]" & @CRLF & _
			"- Search Steamdb Info and Add Player count" & @CRLF & _
			"- Check and Add Resolution Scale" & @CRLF & _
			"- Search Steamdb Info and Add Apps based on their Tags to Categories" & @CRLF & _
			"- Create HTML Game Pages" & @CRLF & _
			"- Syncs Data with VRUB Overlay [If activated]" & @CRLF & @CRLF & _
			"Scan Settings can be changed using the Scan Options.")


	Global $Checkbox_Main_02_Value = ""
	If $ScanOculusApps = "true" Then $Checkbox_Main_02_Value = "a"
	Global $Checkbox_Main_02 = GUICtrlCreateLabel($Checkbox_Main_02_Value, 400, 25, 15, 15, 0x1201)
	GUICtrlSetTip($Checkbox_Main_02, "Delete the old HomeLoader Library Data first before/with an new Scan." & @CRLF)
	GUICtrlSetFont(-1, 18, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	Global $Checkbox_02_Label = GUICtrlCreateLabel("Scan for Oculus Apps", 420, 24, 200, 17)
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GUICtrlSetTip($Checkbox_02_Label, "Requests Steamdb Info from 'https://steamdb.info/...'" & @CRLF & "and adds it to the HomeLoader Library during the Scan." & @CRLF)

	Global $Checkbox_Main_03_Value = ""
	If $Sort_Alphabetical_order = "true" Then $Checkbox_Main_03_Value = "a"
	Global $Checkbox_Main_03 = GUICtrlCreateLabel($Checkbox_Main_03_Value, 400, 45, 15, 15, 0x1201)
	GUICtrlSetTip($Checkbox_Main_03, "Sort Apps in Alphabetical order after/with an new Scan." & @CRLF)
	GUICtrlSetFont(-1, 18, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	Global $Checkbox_03_Label = GUICtrlCreateLabel("Sort Apps in Alphabetical Order", 420, 44, 200, 17)
	GUICtrlSetFont(-1, 11, 400, 1, "arial")
	GUICtrlSetTip($Checkbox_03_Label, "Requests Tags from the Steamdb Info database 'https://steamdb.info/...'" & @CRLF & "and adds all Games to the matching categorie during the Scan." & @CRLF)

	Global $Button_More_Scan_Options = GUICtrlCreateButton("More Settings", 399, 62, 225, 24, $BS_BITMAP)
	GUICtrlSetColor(-1, "0x0000CD")
	GUICtrlSetFont(-1, 10, 600, 2, "arial")
	GUICtrlSetTip($Button_More_Scan_Options, "Opens the Settings Windows that includes more HomeLoader related settings.")
	_RM_More_Scan_Options()





	Global $Button_Restart = GUICtrlCreateButton("Restart", 680, $DesktopHeight - 79, 52, 52, $BS_BITMAP) ;
	_GUICtrlButton_SetImage($Button_Restart, $gfx & "Restart.bmp")
	GUICtrlSetTip($Button_Restart, "Restart.")

	Global $Button_Exit = GUICtrlCreateButton("Exit", 740, $DesktopHeight - 79, 52, 52, $BS_BITMAP)
	_GUICtrlButton_SetImage($Button_Exit, $gfx & "Exit.bmp")
	GUICtrlSetTip($Button_Exit, "Close.")


	Global $ButtonTAB_Steam_Library = GUICtrlCreateButton($TAB1_Label, 3, 90, 130)
	Global $ButtonTAB_Favorites = GUICtrlCreateButton($TAB2_Label, 148, 90, 130)
	Global $ButtonTAB_Custom_1 = GUICtrlCreateButton($TAB3_Label, 278, 90, 130)
	Global $ButtonTAB_Custom_2 = GUICtrlCreateButton($TAB4_Label, 408, 90, 130)
	Global $ButtonTAB_Custom_3 = GUICtrlCreateButton($TAB5_Label, 538, 90, 130)
	Global $ButtonTAB_Custom_4 = GUICtrlCreateButton($TAB6_Label, 668, 90, 130)

	GUICtrlSetTip($ButtonTAB_Steam_Library, "Shows the '" & $TAB1_Label & "' Category.")
	GUICtrlSetTip($ButtonTAB_Favorites, "Shows the '" & $TAB2_Label & "' Category.")
	GUICtrlSetTip($ButtonTAB_Custom_1, "Shows the '" & $TAB3_Label & "' Category." & @CRLF & "Use the 'Mouse Right Click Menu' to change the name of the Category and to set the Tags it.")
	GUICtrlSetTip($ButtonTAB_Custom_2, "Shows the '" & $TAB4_Label & "' Category." & @CRLF & "Use the 'Mouse Right Click Menu' to change the name of the Category and to set the Tags it.")
	GUICtrlSetTip($ButtonTAB_Custom_3, "Shows the '" & $TAB5_Label & "' Category." & @CRLF & "Use the 'Mouse Right Click Menu' to change the name of the Category and to set the Tags it.")
	GUICtrlSetTip($ButtonTAB_Custom_4, "Shows the '" & $TAB6_Label & "' Category." & @CRLF & "Use the 'Mouse Right Click Menu' to change the name of the Category and to set the Tags it.")


	If $ButtonTAB_State = "1" Then

	EndIf

	If $ButtonTAB_State = "2" Then

	EndIf

	If $ButtonTAB_State = "3" Then

	EndIf

	If $ButtonTAB_State = "4" Then

	EndIf

	If $ButtonTAB_State = "5" Then

	EndIf

	If $ButtonTAB_State = "6" Then

	EndIf

	_Create_ListView_1()
	_Create_ListView_2()
	_Create_ListView_3()
	_Create_ListView_4()
	_Create_ListView_5()
	_Create_ListView_6()

	If $ButtonTAB_State = "1" Then GUICtrlSetState($listview, $GUI_SHOW)
	If $ButtonTAB_State = "2" Then GUICtrlSetState($listview_2, $GUI_SHOW)
	If $ButtonTAB_State = "3" Then GUICtrlSetState($listview_3, $GUI_SHOW)
	If $ButtonTAB_State = "4" Then GUICtrlSetState($listview_4, $GUI_SHOW)
	If $ButtonTAB_State = "5" Then GUICtrlSetState($listview_5, $GUI_SHOW)
	If $ButtonTAB_State = "6" Then GUICtrlSetState($listview_6, $GUI_SHOW)

	; Elemente unten


	Global $Checkbox_CreatePage = GUICtrlCreateLabel("", 10, $DesktopHeight - 59, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 22, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetTip($Checkbox_CreatePage, "Checks the checkbox for all application in the List View of the current category.")
	Global $Checkbox_CreatePage_Label = GUICtrlCreateLabel("All", 35, $DesktopHeight - 61, 35, 20)
	GUICtrlSetFont(-1, 19, 400, 1, "arial")
	GUICtrlSetTip($Checkbox_CreatePage_Label, "Checks the checkbox for all application in the List View of the current category.")




	Global $ElementeUntenGroup = GUICtrlCreateGroup("Add Game to Category", 80, $DesktopHeight - 82, 168, 55)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 9, 400, 6, $font_arial)

	Global $Combo_Add_to_Custom = GUICtrlCreateCombo("Choose Category", 86, $DesktopHeight - 65, 155, 32, $CBS_DROPDOWNLIST)
	GUICtrlSetData(-1, $TAB2_Label & "|" & $TAB3_Label & "|" & $TAB4_Label & "|" & $TAB5_Label & "|" & $TAB6_Label, "")
	GUICtrlSetFont(-1, 12, 400, 2, "arial")
	GUICtrlSetTip($Combo_Add_to_Custom, "Choose the Category where you want to add the games to.")




	If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")

	If $ButtonTAB_State = "1" Then
		$ApplicationList_INI_TEMP = $ApplicationList_SteamLibrary_ALL_INI
		If $ScanOnlyVR = "true" Then $ApplicationList_INI_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_INI_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_INI_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_INI_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_INI_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_INI_TEMP = $ApplicationList_Custom_4_INI

	Global $NR_ApplicationsCheck = IniRead($ApplicationList_INI_TEMP, "ApplicationList", "NR_Applications", "")

	If $NR_ApplicationsCheck = "" Or $NR_ApplicationsCheck = "0" Then

		Local $Abfrage = MsgBox($MB_YESNO + $MB_ICONQUESTION, "Scan Library", "The Game Library is empty." & @CRLF & @CRLF & _
				"Do you want to scan your Steam and if available also your" & @CRLF & _
				"Viveport Library?" & @CRLF & @CRLF & _
				'This can also be done manually by using the "Rescan" Button.' & @CRLF)

		If $Abfrage = 6 Then
			GUISetState()
			_Button_ReScan_Steam_Library()
			;_Restart()
		EndIf
	EndIf

	_Read_from_INI_ADD_2_ListView()

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = "1" Then _ButtonTAB_Steam_Library()
	If $ButtonTAB_State = "2" Then _ButtonTAB_Non_Steam_Appl()
	If $ButtonTAB_State = "3" Then _ButtonTAB_Custom_1()
	If $ButtonTAB_State = "4" Then _ButtonTAB_Custom_2()
	If $ButtonTAB_State = "5" Then _ButtonTAB_Custom_3()
	If $ButtonTAB_State = "6" Then _ButtonTAB_Custom_4()
	GUISetState()

	_Set_States()
	_RM_Buttons()

	_Update_ToolTips_Create_HLL_GUI()

	#Region Funktionen Verknüpfen
	GUISetOnEvent($GUI_EVENT_CLOSE, "_Exit")
	GUICtrlSetOnEvent($Button_Restart, "_Restart")
	GUICtrlSetOnEvent($Button_Exit, "_Exit")
	;GUICtrlSetOnEvent($Button_Settings, "_Write_ResolutionScale_OVERLAY_to_SteamVR_VRSettings")
	GUICtrlSetOnEvent($Button_Exit_Settings_GUI, "_Button_Exit_Settings_GUI")




	GUICtrlSetOnEvent($Button_ReScan_Steam_Library, "_Button_ReScan_Steam_Library")
	GUICtrlSetOnEvent($Button_More_Scan_Options, "_Button_More_Scan_Options")

	GUICtrlSetOnEvent($Checkbox_Main_01, "_RM_Checkbox_ScanViveData")
	GUICtrlSetOnEvent($Checkbox_Main_02, "_RM_Checkbox_ScanOculusData")
	GUICtrlSetOnEvent($Checkbox_Main_03, "_RM_Checkbox_Sort_Alphabetical_order")

	GUICtrlSetOnEvent($Checkbox_01_Label, "_RM_Checkbox_ScanViveData")
	GUICtrlSetOnEvent($Checkbox_02_Label, "_RM_Checkbox_ScanOculusData")
	GUICtrlSetOnEvent($Checkbox_03_Label, "_RM_Checkbox_Sort_Alphabetical_order")

	GUICtrlSetOnEvent($ButtonTAB_Steam_Library, "_ButtonTAB_Steam_Library")
	GUICtrlSetOnEvent($ButtonTAB_Favorites, "_ButtonTAB_Non_Steam_Appl")
	GUICtrlSetOnEvent($ButtonTAB_Custom_1, "_ButtonTAB_Custom_1")
	GUICtrlSetOnEvent($ButtonTAB_Custom_2, "_ButtonTAB_Custom_2")
	GUICtrlSetOnEvent($ButtonTAB_Custom_3, "_ButtonTAB_Custom_3")
	GUICtrlSetOnEvent($ButtonTAB_Custom_4, "_ButtonTAB_Custom_4")




	GUICtrlSetOnEvent($Checkbox_CreatePage, "_Checkbox_all")
	GUICtrlSetOnEvent($Checkbox_CreatePage_Label, "_Checkbox_all")

	GUICtrlSetOnEvent($Combo_Add_to_Custom, "_Button_Add_to_Custom")


	GUICtrlSetOnEvent($RM_Item1, "_Start_ListView_Selected")


	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	#EndRegion Funktionen Verknüpfen

	GUIRegisterMsg($WM_notify, "_ClickOnListView")

	Global $Scan_Duration = IniRead($Config_INI, "TEMP", "Scan_Duration", "")
	If $Scan_Duration = "Scanning..." Then $Scan_Duration = ""
	If $Scan_Duration <> "" Then $Scan_Duration = "Library was scanned in: " & $Scan_Duration
	IniWrite($Config_INI, "TEMP", "Scan_Duration", "")

	$NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
	_GUICtrlStatusBar_SetText($Statusbar, "Ready for use..." & $Scan_Duration & @TAB & "Apps: " & $NR_ApplicationsCheck & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")
	If $Autostart_VRUB = "true" Then _GUICtrlStatusBar_SetText($Statusbar, "HomeLoader OVERLAY [VRUB] is enabled..." & "   " & "" & @TAB & "Apps: " & $NR_ApplicationsCheck & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")
EndFunc

Func _HLL_Settings_GUI()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (1155) :(' & @MIN & ':' & @SEC & ') _HLL_Settings_GUI()' & @CR) ;### Function Trace
	$Checkbox_Main_01_Value = ""
	$Checkbox_Main_02_Value = ""
	$Checkbox_Main_03_Value = ""
	$Checkbox_ScanVIVEApps_Value = ""
	$Checkbox_ScanOculusApps_Value = ""
	$Checkbox_Sort_Alphabetical_order_Value = ""
	$Checkbox_Add_Apps_Tags_to_categories_Value = ""
	$Checkbox_Allow_Multiple_Tag_Assignments_Value = ""
	$Checkbox_Add_PlayersOnline_to_Icons_Value = ""
	$Checkbox_Add_SS_to_Icons_Value = ""
	$Checkbox_Add_SS_per_game_Value = ""
	$Checkbox_Create_HTML_GamePage_Value = ""
	$Checkbox_WMR_Shortcut_Files_Value = ""
	$Checkbox_Create_SteamVR_Home_Panels_Value = ""
	$Checkbox_DeleteHomeLoaderLibraryData_Value = ""

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$DeleteHomeLoaderLibraryData = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")
	$ScanOnlyVR = IniRead($Config_INI, "Settings", "ScanOnlyVR", "")
	$ScanVIVEApps = IniRead($Config_INI, "Settings", "ScanVIVEApps", "")
	$ScanOculusApps = IniRead($Config_INI, "Settings", "ScanOculusApps", "")
	$Sort_Alphabetical_order = IniRead($Config_INI, "Settings", "Sort_Alphabetical_order", "")
	$Create_HTML_GamePage = IniRead($Config_INI, "Settings", "Create_HTML_GamePage", "")
	$Create_WMR_Shortcut_Files = IniRead($Config_INI, "Settings", "Create_WMR_Shortcut_Files", "")

	Global $HEIGHT_GUI = 280
	Global $POS_X_1 = 0
	Global $POS_Y_1 = 0
	Global $POS_Y_2 = 385
	Global $POS_Y_3 = 575

	Global $POS_Y_Button_Open_SSD_SetSoundDevice = $POS_Y_2 + 35
	Global $POS_Y_Button_Combo_Playback = $POS_Y_Button_Open_SSD_SetSoundDevice + 30
	Global $POS_Y_Button_Combo_Record = $POS_Y_Button_Combo_Playback + 30
	Global $POS_Y_Button_Exit_Settings_GUI = 310

	Global $Width_Group_1 = 531
	Global $Width_Group_2 = 531
	Global $Width_Group_3 = 531
	Global $HEIGHT_Group_1 = 220
	Global $HEIGHT_Group_2 = 180
	Global $HEIGHT_Group_3 = 98


	$Icon_Folder_1 = IniRead($Config_INI, "Folders", "Icon_Folder_1", "")
	$Icon_Folder_2 = IniRead($Config_INI, "Folders", "Icon_Folder_2", "")
	$Icon_Folder_3 = IniRead($Config_INI, "Folders", "Icon_Folder_3", "")

	$HLL_Settings_GUI = GUICreate($AppName_Window_Settings_GUI, 540, $HEIGHT_GUI, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_EX_CLIENTEDGE, $WS_EX_TOOLWINDOW))


	GUICtrlCreateGroup("Scan Options", $POS_X_1 + 5, $POS_Y_1 + 5, $Width_Group_1, $HEIGHT_Group_1)
	DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", "Explorer", "wstr", 0)
	GUICtrlSetColor(-1, "0x0000FF")
	GUICtrlSetFont(-1, 18, 400, 6, $font_arial)

	$POS_Y_1 = 40
	If $ScanVIVEApps = "true" Then $Checkbox_ScanVIVEApps_Value = "a"
	Global $Checkbox_Settings_4 = GUICtrlCreateLabel($Checkbox_ScanVIVEApps_Value, $POS_X_1 + 10, $POS_Y_1, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_ScanViveData")
	Global $Checkbox_Settings_4_Label = GUICtrlCreateLabel("Scan for Viveport Apps", $POS_X_1 + 38, $POS_Y_1 - 2, 450, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_ScanViveData")

	$POS_Y_1 = $POS_Y_1 + 30
	If $ScanOculusApps = "true" Then $Checkbox_ScanOculusApps_Value = "a"
	Global $Checkbox_Settings_5 = GUICtrlCreateLabel($Checkbox_ScanOculusApps_Value, $POS_X_1 + 10, $POS_Y_1, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_ScanOculusData")
	Global $Checkbox_Settings_5_Label = GUICtrlCreateLabel("Scan for Oculus Apps", $POS_X_1 + 38, $POS_Y_1 - 2, 450, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_ScanOculusData")

	$POS_Y_1 = $POS_Y_1 + 30
	If $Sort_Alphabetical_order = "true" Then $Checkbox_Sort_Alphabetical_order_Value = "a"
	Global $Checkbox_Settings_6 = GUICtrlCreateLabel($Checkbox_Sort_Alphabetical_order_Value, $POS_X_1 + 10, $POS_Y_1, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Sort_Alphabetical_order")
	Global $Checkbox_Settings_6_Label = GUICtrlCreateLabel("Sort Apps in Alphabetical order", $POS_X_1 + 38, $POS_Y_1 - 2, 450, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Sort_Alphabetical_order")

	$POS_Y_1 = $POS_Y_1 + 30
	If $Create_HTML_GamePage = "true" Then $Checkbox_Create_HTML_GamePage_Value = "a"
	Global $Checkbox_Settings_12 = GUICtrlCreateLabel($Checkbox_Create_HTML_GamePage_Value, $POS_X_1 + 10, $POS_Y_1, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Create_HTML_GamePage")
	Global $Checkbox_Settings_12_Label = GUICtrlCreateLabel("Create/Update HTML Pages", $POS_X_1 + 38, $POS_Y_1 - 2, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Create_HTML_GamePage")

	$POS_Y_1 = $POS_Y_1 + 30
	If $Create_WMR_Shortcut_Files = "true" Then $Checkbox_WMR_Shortcut_Files_Value = "a"
	Global $Checkbox_Settings_15 = GUICtrlCreateLabel($Checkbox_WMR_Shortcut_Files_Value, $POS_X_1 + 10, $POS_Y_1, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_WMR_Shortcut_Files")
	Global $Checkbox_Settings_15_Label = GUICtrlCreateLabel("Create/Update WMR Shortcut Files", $POS_X_1 + 38, $POS_Y_1 - 2, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_WMR_Shortcut_Files")

	$POS_Y_1 = $POS_Y_1 + 30
	If $DeleteHomeLoaderLibraryData = "true" Then $Checkbox_DeleteHomeLoaderLibraryData_Value = "a"
	Global $Checkbox_Settings_14 = GUICtrlCreateLabel($Checkbox_DeleteHomeLoaderLibraryData_Value, $POS_X_1 + 10, $POS_Y_1, 20, 20, 0x1201)
	GUICtrlSetFont(-1, 24, 400, 0, "Marlett")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_DeleteHomeLoaderLibraryData")
	Global $Checkbox_Settings_14_Label = GUICtrlCreateLabel("Delete old WMRGL Library Data first", $POS_X_1 + 38, $POS_Y_1 - 2, 470, 28)
	GUICtrlSetFont(-1, 17, 400, 1, "arial")
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_DeleteHomeLoaderLibraryData")

	$POS_Y_Button_Exit_Settings_GUI = $POS_Y_1 + 45
	Global $Button_PAYPAL_DONATE_Settings_GUI = GUICtrlCreateButton("Donate", $POS_X_1 + 5, $POS_Y_Button_Exit_Settings_GUI, 84, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(-1, "_Button_PAYPAL_DONATE_Settings_GUI")
	_GUICtrlButton_SetImage(-1, $gfx & "Paypal_Donate.bmp")
	GUICtrlSetTip($Button_PAYPAL_DONATE_Settings_GUI, "Donate.")

	$POS_Y_Button_Exit_Settings_GUI = $POS_Y_1 + 45
	Global $Button_Exit_Settings_GUI = GUICtrlCreateButton("Exit", $POS_X_1 + 500, $POS_Y_Button_Exit_Settings_GUI, 35, 35, $BS_BITMAP)
	GUICtrlSetOnEvent(-1, "_Button_Exit_Settings_GUI")
	_GUICtrlButton_SetImage(-1, $gfx & "Exit_small.bmp")
	GUICtrlSetTip($Button_Exit_Settings_GUI, "Closes GUI Window.")

	_Update_Objects_Settings_GUI()
	_Update_ToolTips_HLL_Settings_GUI()

	GUISetState()
	$Game_ID = ""
EndFunc   ;==>_Settings_GUI


Func _Update_StatusBar()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (1603) :(' & @MIN & ':' & @SEC & ') _Update_StatusBar()' & @CR) ;### Function Trace
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_TEMP)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview_TEMP, $ListView_Selected_Row_Index)
	Local $Steam_app_Name = $ListView_Item_Array[3]
	Local $Game_ID = $ListView_Item_Array[2]

	Local $all_time_peak_value = IniRead($ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini", "Application_" & $Game_ID, "all_time_peak", "")

	_GUICtrlStatusBar_SetText($Statusbar, $Steam_app_Name & " [" & $Game_ID & "] " & @TAB & "" & @TAB & "")
EndFunc   ;==>_Update_StatusBar

Func _Search_Files()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (1627) :(' & @MIN & ':' & @SEC & ') _Search_Files()' & @CR) ;### Function Trace
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	If $Combo = "ALL" Then Local $s_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"

	If $Combo <> "ALL" Then
		If $Combo = "Steam Library 1" Then $s_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"
		If $Combo = "Steam Library 2" Then $s_LocalFolder = $Install_Folder_Steam_2 & "SteamApps\"
		If $Combo = "Steam Library 3" Then $s_LocalFolder = $Install_Folder_Steam_3 & "SteamApps\"
		If $Combo = "Steam Library 4" Then $s_LocalFolder = $Install_Folder_Steam_4 & "SteamApps\"
		If $Combo = "Steam Library 5" Then $s_LocalFolder = $Install_Folder_Steam_5 & "SteamApps\"
		If $Combo = "" Then $s_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"
		Local $FileList = _FileListToArray($s_LocalFolder, "*.acf", 1)
		$Array_Result = $FileList
		If @error Then
			$ScriptLineNumber_Temp = @ScriptLineNumber
			$AtError_Result = @error
		EndIf
		If $AtError_Result <> "" Or $Array_Result = -1 Then _FileListToArray_Error_Handler()
		Global $Application_NR = 1

		If IsArray($FileList) Then
			If $FileList <> "" Then
				FileDelete($ApplicationList_INI)
				For $NR = 1 To $FileList[0]
					Global $FileList_NR = $FileList[0]
					Global $File_Name = $FileList[$NR]
					Global $File_Path = $s_LocalFolder & $File_Name
					Global $ProcessBar_Status = $NR * 100 / $FileList[0]
					$ProcessBar_Status = $ProcessBar_Status ; - 15
					;GUICtrlSetData($Anzeige_Fortschrittbalken, $ProcessBar_Status)
					If StringLeft(FileRead($File_Path), 3) <> "0x0" Then
						_ApplicationList_Update()
						$Application_NR = $Application_NR + 1
					EndIf
					$File_Path = ""
				Next
				;Sleep(500)
			EndIf
		EndIf
	EndIf

	If $Combo = "ALL" Then
		If $NR_Library_temp = 1 Then $s_LocalFolder = $Install_Folder_Steam_1 & "SteamApps\"
		If $NR_Library_temp = 2 Then $s_LocalFolder = $Install_Folder_Steam_2 & "SteamApps\"
		If $NR_Library_temp = 3 Then $s_LocalFolder = $Install_Folder_Steam_3 & "SteamApps\"
		If $NR_Library_temp = 4 Then $s_LocalFolder = $Install_Folder_Steam_4 & "SteamApps\"
		If $NR_Library_temp = 5 Then $s_LocalFolder = $Install_Folder_Steam_5 & "SteamApps\"

		Local $FileList = _FileListToArray($s_LocalFolder, "*.acf", 1)
		$Array_Result = $FileList
		If @error Then
			$ScriptLineNumber_Temp = @ScriptLineNumber
			$AtError_Result = @error
		EndIf
		If $AtError_Result <> "" Or $Array_Result = -1 Then _FileListToArray_Error_Handler()
		Global $Application_NR = IniRead($ApplicationList_INI, "ApplicationList", "NR_Applications", "") + 1

		If IsArray($FileList) Then
			If $FileList <> "" Then
				For $NR_temp2 = 1 To $FileList[0]
					Global $FileList_NR = $FileList[0]
					Global $File_Name = $FileList[$NR_temp2]
					Global $File_Path = $s_LocalFolder & $File_Name
					Global $ProcessBar_Status = $NR_temp2 * 100 / $FileList[0]
					$ProcessBar_Status = $ProcessBar_Status ; - 15
					;GUICtrlSetData($Anzeige_Fortschrittbalken, $ProcessBar_Status)
					If StringLeft(FileRead($File_Path), 3) <> "0x0" Then
						_ApplicationList_Update()
						$Application_NR = $Application_NR + 1
					EndIf
					$File_Path = ""
				Next
				;Sleep(500)
			EndIf
		EndIf
		$FileList = ""
	EndIf
	;_Read_from_INI_ADD_2_ListView()
EndFunc   ;==>_Search_Files

Func _ApplicationList_Update()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (1705) :(' & @MIN & ':' & @SEC & ') _ApplicationList_Update()' & @CR) ;### Function Trace
	Global $File = $File_Path
	Global $Wert_Zeile = ""

	If $File = "" Then FileWriteLine($scan_log_FILE, "Variable '$File' empty:" & " - " & "_ApplicationList_Update() " & "[" & _Now() & "]")

	If $File <> "" Then
		For $iCount_1 = 1 To 7
			Local $Wert_Zeile_komplett = FileReadLine($File, $iCount_1)

			Local $iPosition = StringInStr($Wert_Zeile_komplett, "appid")
			If $iPosition <> 0 Then
				Global $appid = StringReplace($Wert_Zeile_komplett, '	"appid"		"', '')
				$appid = StringReplace($appid, '"', '')
			EndIf

			Local $iPosition = StringInStr($Wert_Zeile_komplett, "Universe")
			If $iPosition <> 0 Then
				Global $Universe = StringReplace($Wert_Zeile_komplett, '	"Universe"		"', '')
				$Universe = StringReplace($Universe, '"', '')
			EndIf

			Local $iPosition = StringInStr($Wert_Zeile_komplett, "name")
			If $iPosition <> 0 Then
				$name = StringReplace($Wert_Zeile_komplett, '	"name"		"', '')
				$name = StringReplace($name, '"', '')
			EndIf

			Local $iPosition = StringInStr($Wert_Zeile_komplett, "StateFlags")
			If $iPosition <> 0 Then
				Global $StateFlags = StringReplace($Wert_Zeile_komplett, '	"StateFlags"		"', '')
				$StateFlags = StringReplace($StateFlags, '"', '')
			EndIf

			Local $iPosition = StringInStr($Wert_Zeile_komplett, "installdir")
			If $iPosition <> 0 Then
				Global $installdir = StringReplace($Wert_Zeile_komplett, '	"installdir"		"', '')
				$installdir = StringReplace($installdir, '"', '')
			EndIf

			Local $iPosition = StringInStr($Wert_Zeile_komplett, "LastUpdated")
			If $iPosition <> 0 Then
				Global $LastUpdated = StringReplace($Wert_Zeile_komplett, '	"LastUpdated"		"', '')
				$LastUpdated = StringReplace($LastUpdated, '"', '')
			EndIf

			Local $iPosition = StringInStr($Wert_Zeile_komplett, "UpdateResult")
			If $iPosition <> 0 Then
				Global $UpdateResult = StringReplace($Wert_Zeile_komplett, '	"UpdateResult"		"', '')
				$UpdateResult = StringReplace($UpdateResult, '"', '')
			EndIf

			Local $iPosition = StringInStr($Wert_Zeile_komplett, "SizeOnDisk")
			If $iPosition <> 0 Then
				Global $SizeOnDisk = StringReplace($Wert_Zeile_komplett, '	"SizeOnDisk"		"', '')
				$SizeOnDisk = StringReplace($SizeOnDisk, '"', '')
			EndIf

			Local $iPosition = StringInStr($Wert_Zeile_komplett, "buildid")
			If $iPosition <> 0 Then
				Global $buildid = StringReplace($Wert_Zeile_komplett, '	"buildid"		"', '')
				$buildid = StringReplace($buildid, '"', '')
			EndIf

			Local $iPosition = StringInStr($Wert_Zeile_komplett, "LastOwner")
			If $iPosition <> 0 Then
				Global $LastOwner = StringReplace($Wert_Zeile_komplett, '	"LastOwner"		"', '')
				$LastOwner = StringReplace($LastOwner, '"', '')
			EndIf

			Local $iPosition = StringInStr($Wert_Zeile_komplett, "BytesToDownload")
			If $iPosition <> 0 Then
				Global $BytesToDownload = StringReplace($Wert_Zeile_komplett, '	"BytesToDownload"		"', '')
				$BytesToDownload = StringReplace($BytesToDownload, '"', '')
			EndIf

			Local $iPosition = StringInStr($Wert_Zeile_komplett, "BytesDownloaded")
			If $iPosition <> 0 Then
				Global $BytesDownloaded = StringReplace($Wert_Zeile_komplett, '	"BytesDownloaded"		"', '')
				$BytesDownloaded = StringReplace($BytesDownloaded, '"', '')
			EndIf

			Local $iPosition = StringInStr($Wert_Zeile_komplett, "AutoUpdateBehavior")
			If $iPosition <> 0 Then
				Global $AutoUpdateBehavior = StringReplace($Wert_Zeile_komplett, '	"AutoUpdateBehavior"		"', '')
				$AutoUpdateBehavior = StringReplace($AutoUpdateBehavior, '"', '')
			EndIf

			Local $iPosition = StringInStr($Wert_Zeile_komplett, "AllowOtherDownloadsWhileRunning")
			If $iPosition <> 0 Then
				Global $AllowOtherDownloadsWhileRunning = StringReplace($Wert_Zeile_komplett, '	"AllowOtherDownloadsWhileRunning"		"', '')
				$AllowOtherDownloadsWhileRunning = StringReplace($AllowOtherDownloadsWhileRunning, '"', '')
			EndIf
		Next

		IniWrite($ApplicationList_INI, "ApplicationList", "NR_Applications", $Application_NR)
		IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "NR", $Application_NR)
		IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "appid", $appid)
		IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "name", $name)
		IniWrite($ApplicationList_INI, "Application_" & $Application_NR, "installdir", $installdir)

		IniWrite($ApplicationList_INI, "ApplicationList", "NR_Applications", $Application_NR)
		IniWrite($ApplicationList_INI, "Application_" & $appid, "NR", $Application_NR)
		IniWrite($ApplicationList_INI, "Application_" & $appid, "appid", $appid)
		IniWrite($ApplicationList_INI, "Application_" & $appid, "name", $name)
		IniWrite($ApplicationList_INI, "Application_" & $appid, "installdir", $installdir)

		If $appid <> "" Then
			IniWrite($ApplicationList_INI, "Application_" & $appid, "IconPath", $Icons & "steam.app." & $appid & ".jpg")
			IniWrite($ApplicationList_INI, "Application_" & $appid, "IconPath", $Icons & "steam.app." & $appid & ".jpg")
		Else
			IniWrite($ApplicationList_INI, "Application_" & $appid, "IconPath", "")
			IniWrite($ApplicationList_INI, "Application_" & $appid, "IconPath", "")
		EndIf

		_GUICtrlStatusBar_SetText($Statusbar, "" & "Scan SteamLibrary: " & "Nr: " & $Application_NR & ". " & $name & " - " & $appid & @TAB & "" & "" & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")

		_Download_Icon_for_SteamGameID()

		$DeleteHomeLoaderLibraryData = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")
		If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($Icons & "32x32\" & "steam.app." & $appid & ".bmp")
		If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($Icons & "256x256\" & "steam.app." & $appid & ".bmp")

		If Not FileExists($Icons & "32x32\" & "steam.app." & $appid & ".bmp") Then
			;_Get_SteamGame_Icon_32x32()
			_Get_SteamGame_Icon_32x32_new()
		EndIf

		If Not FileExists($Icons & "256x256\" & "steam.app." & $appid & ".ico") Then
			;_Get_SteamGame_Icon_256x256()
		EndIf
	EndIf
EndFunc   ;==>_ApplicationList_Update



Func _Write_CategoryNameTemplate_2_Image()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2497) :(' & @MIN & ':' & @SEC & ') _Write_CategoryNameTemplate_2_Image()' & @CR) ;### Function Trace
	Local $CategoryNameTemplate = $gfx & "CategoryNameTemplate.jpg"
	_GDIPlus_Startup()
	Global $hImage = _GDIPlus_WTOB($CategoryNameTemplate, $InputBox, "Arial", 26, -1, 3, 0, 0, 0x000000, 1, 1)
	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_Shutdown()
	$InputBox = ""

	If FileExists($HomeLoader_Config_Folder & "WTOB.png") Then
		FileCopy($HomeLoader_Config_Folder & "WTOB.png", $HomeLoader_Config_Folder & "CategoryNameImage" & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
		FileDelete($HomeLoader_Config_Folder & "WTOB.png")
	EndIf
	_Write_CategoryNameTemplate_Image_2_Image()
EndFunc   ;==>_Write_PO_TEXT_2_Image

Func _Write_CategoryNameTemplate_Image_2_Image()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2513) :(' & @MIN & ':' & @SEC & ') _Write_CategoryNameTemplate_Image_2_Image()' & @CR) ;### Function Trace
	Global $ImageSizeX = 460, $ImageSizeY = 215
	Global $FAVImageSizeX = 460, $FAVImageSizeY = 45 ; 80 , 60

	$hImage1_Path = $gfx & "CategoryTemplate" & ".jpg"
	$hImage2_Path = $HomeLoader_Config_Folder & "CategoryNameImage.jpg"

	Local $Check_StringSplit_NR = StringInStr($hImage1_Path, "/", "", -1)
	If $Check_StringSplit_NR = "0" Then $Check_StringSplit_NR = StringInStr($hImage1_Path, "\", "", -1)
	Local $Check_Filename_1 = StringTrimLeft($hImage1_Path, $Check_StringSplit_NR)
	Local $Check_Filename_2 = StringRight($Check_Filename_1, 11)
	Local $Check_Filename = $Check_Filename_1

	GUISetState()

	_GDIPlus_Startup()
	$hImage1 = _GDIPlus_ImageLoadFromFile($hImage1_Path)
	$hImage2 = _GDIPlus_ImageLoadFromFile($hImage2_Path)

	$hBMPBuff = _GDIPlus_ImageLoadFromFile($hImage1_Path)
	$hGraphic = _GDIPlus_ImageGetGraphicsContext($hBMPBuff)

	;Graphics
	_GDIPlus_GraphicsClear($hGraphic, 0xFFE8FFE8)

	$hPen = _GDIPlus_PenCreate(0xFFFF0000, 3)

	_GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage1, 0, 0, $ImageSizeX, $ImageSizeY)
	_GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage2, 3, 3, $FAVImageSizeX, $FAVImageSizeY)

	;_GDIPlus_GraphicsDrawRect($hGraphic, 1, 1, 80 + 3, 60 + 3, $hPen)

	GUIRegisterMsg(0xF, "MY_PAINT")
	GUIRegisterMsg(0x85, "MY_PAINT")

	;Save
	Local $NewIcon_Path
	If $TAB_NR_Temp = "3" Then $NewIcon_Path = $Install_DIR & "WebPage\images\GamePage1.png"
	If $TAB_NR_Temp = "4" Then $NewIcon_Path = $Install_DIR & "WebPage\images\GamePage2.png"
	If $TAB_NR_Temp = "5" Then $NewIcon_Path = $Install_DIR & "WebPage\images\GamePage3.png"
	If $TAB_NR_Temp = "6" Then $NewIcon_Path = $Install_DIR & "WebPage\images\GamePage4.png"

	If $NewIcon_Path = "" Then $NewIcon_Path = $Install_DIR & "WebPage\images\" & IniRead($Config_INI, "Settings", "TAB" & $TAB_NR_Temp & "_Name", "") & ".png"

	If $NewIcon_Path <> "" Then
		_GDIPlus_ImageSaveToFile($hBMPBuff, $NewIcon_Path)
	EndIf

	_GDIPlus_PenDispose($hPen)
	_GDIPlus_ImageDispose($hImage1)
	_GDIPlus_ImageDispose($hImage2)
	_GDIPlus_GraphicsDispose($hGraphic)
	_WinAPI_DeleteObject($hBMPBuff)
	_GDIPlus_Shutdown()

	_Quit_PO_Image_2_Image()
EndFunc   ;==>_Write_PO_Image_2_Image

Func MY_PAINT($hWnd, $Msg, $wParam, $lParam)
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2572) :(' & @MIN & ':' & @SEC & ') MY_PAINT()' & @CR) ;### Function Trace
	Return $GUI_RUNDEFMSG
EndFunc   ;==>MY_PAINT


Func _Get_SteamGame_Icon_32x32()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2704) :(' & @MIN & ':' & @SEC & ') _Get_SteamGame_Icon_32x32()' & @CR) ;### Function Trace
	Global $Check_AppId = $appid
	If $Check_AppId <> "" Then
		Local $URL = "https://steamdb.info/app/" & $appid & "/info/"
		$INetGetSource_Check = _INetGetSource($URL)
		If $INetGetSource_Check = "" Then FileWriteLine($scan_log_FILE, "Could not Read '_INetGetSource' :" & $URL & "[" & _Now() & "]")
		Local $WinHttpReq = ObjCreate("WinHttp.WinHttpRequest.5.1")
		If Not @error Then
			$WinHttpReq.Open("GET", $URL, False)
			$WinHttpReq.SetRequestHeader("User-Agent", "Opera/9.80 (X11; Linux i686; Ubuntu/14.10) Presto/2.12.388 Version/12.16")
			$WinHttpReq.Send()
			Local $Data = $WinHttpReq.ResponseText
			;FileWrite(@ScriptDir & "\URL_TEST.txt", $Data)

			Local $iPosition_1 = StringInStr($Data, 'clienttga</td>', $STR_CASESENSE, 1, 1000)
			Local $iPosition_2 = StringInStr($Data, '.jpg" rel="nofollow">', $STR_CASESENSE, 1, 1000)
			Local $iPosition_3 = $iPosition_2 - $iPosition_1
			Local $sString = StringMid($Data, $iPosition_1, $iPosition_3)

			Local $iPosition_1_2 = StringInStr($sString, '<td class="span3">icon</td>', $STR_CASESENSE, 1, 1)
			Local $iPosition_2_2 = StringLen($sString) + 1
			Local $iPosition_3_2 = $iPosition_2_2 - $iPosition_1_2
			Local $sString_2 = StringMid($sString, $iPosition_1_2, $iPosition_3_2)

			Global $HTML_IconLink = StringReplace($sString_2, '<td class="span3">icon</td>', '')
			$HTML_IconLink = StringReplace($HTML_IconLink, '<td><a href="', '')

			If $HTML_IconLink <> "" Then
				Local $URL = $HTML_IconLink & ".jpg"
				Local $Download = InetGet($URL, $Icons & "32x32\" & "steam.app." & $appid & ".jpg", 16, 0)
				;If $Download = 0 Then _URL_Download_Error_Handler()
				If $Download = 0 Then FileCopy($Icons & "32x32\" & "default.bmp", $Icons & "32x32\" & "steam.app." & $appid & ".bmp", $FC_OVERWRITE)
				If $Download <> 0 Then _Convert_Icon_32x32()
				FileDelete($Icons & "32x32\" & "steam.app." & $appid & ".jpg")
			EndIf

			Local $ImageList_Icon = $Icons & "32x32\" & "steam.app." & $appid & ".bmp"
			If Not FileExists($ImageList_Icon) Then
				If StringLeft($appid, 14) = 'steam.overlay.' Then
					Local $Icon_32x32 = $gfx & "Icon_Overlay_Preview_32x32.bmp"
				Else
					Local $Icon_32x32 = $gfx & "Icon_Preview_32x32.bmp"
				EndIf
				FileCopy($Icon_32x32, $ImageList_Icon)
			EndIf
		Else
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Error [_Get_SteamGame_Icon_32x32()]: " & "ObjCreate 'WinHttp.WinHttpRequest.5.1'" & " The requested action with this object has failed. <--- " & "[" & _Now() & "]")
		EndIf
	EndIf
EndFunc   ;==>_Get_SteamGame_Icon_32x32

Func _Get_SteamGame_Icon_32x32_new()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2704) :(' & @MIN & ':' & @SEC & ') _Get_SteamGame_Icon_32x32()' & @CR) ;### Function Trace
	Global $Check_AppId = $appid

	If Not FileExists($Icons & "32x32\") Then DirCreate($Icons & "32x32\")

	If $Check_AppId <> "" Then
		Local $URL = "https://steamdb.info/app/" & $appid & "/info/"
		$INetGetSource_Check = _INetGetSource($URL)

		If $appid <> "" Then
			HttpSetUserAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134")
			Local $URL_Source = BinaryToString(InetRead($URL, 1))

			If $URL_Source <> "" then
				Local $iPosition_1 = StringInStr($URL_Source, 'clienticon</td>', $STR_CASESENSE, 1, 1000)
				Local $iPosition_2 = StringInStr($URL_Source, '.ico" rel="nofollow"', $STR_CASESENSE, 1, 1000)
				Local $iPosition_3 = $iPosition_2 - $iPosition_1
				Local $sString = StringMid($URL_Source, $iPosition_1, $iPosition_3)

				Local $iPosition_1_2 = StringInStr($sString, 'apps', $STR_CASESENSE, 1, 1)
				Local $sString_2 = StringTrimLeft($sString, $iPosition_1_2 + 4)
				Local $iPosition_2_1 = StringInStr($sString_2, '/', $STR_CASESENSE, 1, 1)
				Local $sString_3 = StringTrimLeft($sString_2, $iPosition_2_1)

				Global $Ico_IconLink = $Steam_Path & "steam\games\" & $sString_3 & ".ico"
				IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $appid, "Icon_32x32", $Ico_IconLink)
				IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $appid, "Icon_32x32", $Ico_IconLink)
				;IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Application_NR, "Icon_32x32", $Ico_IconLink)
				;IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Application_NR, "Icon_32x32", $Ico_IconLink)

				If FileExists($Ico_IconLink) Then _Convert_Icon_32x32_new()
			EndIf
		Else
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Error [_Get_SteamGame_Icon_32x32()]: " & "ObjCreate 'WinHttp.WinHttpRequest.5.1'" & " The requested action with this object has failed. <--- " & "[" & _Now() & "]")
		EndIf

		Local $ImageList_Icon = $Icons & "32x32\" & "steam.app." & $appid & ".bmp"
		If Not FileExists($ImageList_Icon) Then
			If StringLeft($appid, 14) = 'steam.overlay.' Then
				Local $Icon_32x32 = $gfx & "Icon_Overlay_Preview_32x32.bmp"
			Else
				Local $Icon_32x32 = $gfx & "Icon_Preview_32x32.bmp"
			EndIf
			FileCopy($Icon_32x32, $ImageList_Icon)
		EndIf
	EndIf
EndFunc   ;==>_Get_SteamGame_Icon_32x32


Func _Get_SteamGame_Icon_256x256()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2756) :(' & @MIN & ':' & @SEC & ') _Get_SteamGame_Icon_256x256()' & @CR) ;### Function Trace
	Global $Check_AppId = $appid
	If $Check_AppId <> "" Then
		Global $Steam_AppId = $appid
		Local $URL = "https://steamdb.info/app/" & $appid & "/info/"
		$INetGetSource_Check = _INetGetSource($URL)
		If $INetGetSource_Check = "" Then FileWriteLine($scan_log_FILE, "Could not Read '_INetGetSource' :" & $URL & "[" & _Now() & "]")
		Local $WinHttpReq = ObjCreate("WinHttp.WinHttpRequest.5.1")
		If Not @error Then
			$WinHttpReq.Open("GET", $URL, False)
			$WinHttpReq.SetRequestHeader("User-Agent", "Opera/9.80 (X11; Linux i686; Ubuntu/14.10) Presto/2.12.388 Version/12.16")
			$WinHttpReq.Send()
			Local $Data = $WinHttpReq.ResponseText

			Local $iPosition_1 = StringInStr($Data, 'clienticon</td>')
			Local $iPosition_2 = StringInStr($Data, '.ico" rel="nofollow')
			Local $iPosition_3 = $iPosition_2 - $iPosition_1

			Local $sString = StringMid($Data, $iPosition_1, $iPosition_3)

			Global $HTML_IconLink = StringReplace($sString, 'clienticon</td>', '')
			$HTML_IconLink = StringReplace($HTML_IconLink, '<td><a href="', '')

			If $HTML_IconLink <> "" Then
				Local $URL = $HTML_IconLink & ".ico"
				Local $InetGet_Temp = InetGet($URL, $Icons & "256x256\" & "steam.app." & $Steam_AppId & ".ico", 16, 0)
			If $InetGet_Temp = 0 Then _URL_Download_Error_Handler()
			EndIf
		Else
			FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " ---> Error [_Get_SteamGame_Icon_256x256()]: " & "ObjCreate 'WinHttp.WinHttpRequest.5.1'" & " The requested action with this object has failed. <--- " & "[" & _Now() & "]")
		EndIf
	EndIf
EndFunc   ;==>_Get_SteamGame_Icon_256x256

Func _Convert_Icon_32x32()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2791) :(' & @MIN & ':' & @SEC & ') _Convert_Icon_32x32()' & @CR) ;### Function Trace
	Global $Check_AppId = $appid
	_GDIPlus_Startup()
	Local $sFile = $Icons & "32x32\" & "steam.app." & $Check_AppId & ".jpg"
	If @error Or Not FileExists($sFile) Then Return
	Local $hImage = _GDIPlus_ImageLoadFromFile($sFile)
	Local $iWidth = 600
	Local $iHeight = _GDIPlus_ImageGetHeight($hImage) * 600 / _GDIPlus_ImageGetWidth($hImage)
	Local $tPalette = _GDIPlus_PaletteInitialize(16, $GDIP_PaletteTypeFixedHalftone27, 16, False, $hImage)
	_GDIPlus_BitmapConvertFormat($hImage, "", $GDIP_DitherTypeDualSpiral8x8, $GDIP_PaletteTypeFixedHalftone27, $tPalette)
	_GDIPlus_ImageSaveToFile($hImage, $Icons & "32x32\" & "steam.app." & $Check_AppId & ".bmp")
	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_Shutdown()
EndFunc   ;==>_Convert_Icon_32x32

Func _Convert_Icon_32x32_new()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2791) :(' & @MIN & ':' & @SEC & ') _Convert_Icon_32x32()' & @CR) ;### Function Trace
	Global $Check_AppId = $appid
	_GDIPlus_Startup()
	Local $sFile = $Ico_IconLink
	If @error Or Not FileExists($sFile) Then Return
	Local $hImage = _GDIPlus_ImageLoadFromFile($sFile)
	Local $iWidth = 600
	Local $iHeight = _GDIPlus_ImageGetHeight($hImage) * 600 / _GDIPlus_ImageGetWidth($hImage)
	Local $tPalette = _GDIPlus_PaletteInitialize(16, $GDIP_PaletteTypeFixedHalftone27, 16, False, $hImage)
	_GDIPlus_BitmapConvertFormat($hImage, "", $GDIP_DitherTypeDualSpiral8x8, $GDIP_PaletteTypeFixedHalftone27, $tPalette)
	_GDIPlus_ImageSaveToFile($hImage, $Icons & "32x32\" & "steam.app." & $Check_AppId & ".bmp")
	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_Shutdown()
EndFunc   ;==>_Convert_Icon_32x32

Func _Download_Icon_for_SteamGameID()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2807) :(' & @MIN & ':' & @SEC & ') _Download_Icon_for_SteamGameID()' & @CR) ;### Function Trace
	Local $Application_appid = $appid
	Local $Download_Icon_path_1_jpg = $Icons & "steam.app." & $Application_appid & ".jpg"
	Local $Download_Icon_path_2_jpg = $Icons & "460x215\steam.app." & $Application_appid & ".jpg"
	Local $Download_Icon_path_3_jpg = $Icon_Folder_1 & "steam.app." & $Application_appid & ".jpg"
	Local $Download_Icon_path_4_jpg = $Icon_Folder_2 & "steam.app." & $Application_appid & ".jpg"
	Local $Download_Icon_path_5_jpg = $Icon_Folder_3 & "steam.app." & $Application_appid & ".jpg"
	Local $Download_Icon_path_6_jpg = $Icon_Folder_4 & "steam.app." & $Application_appid & ".jpg"
	Local $Download_Icon_path_7_jpg = $Icon_Folder_5 & "steam.app." & $Application_appid & ".jpg"

	Local $URL = "http://cdn.akamai.steamstatic.com/steam/apps/" & $Application_appid & "/header.jpg"

	If $Application_appid <> "" Then
		;If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($Download_Icon_path_1_jpg)
		If Not FileExists($Download_Icon_path_1_jpg) Then
			Local $InetGet_Temp = InetGet($URL, $Download_Icon_path_1_jpg, 16, 0)
			If $InetGet_Temp = 0 Then _URL_Download_Error_Handler()
			FileCopy($gfx & "Icon_Preview.jpg", $Download_Icon_path_1_jpg)
		EndIf
		If Not FileExists($Download_Icon_path_2_jpg) Then FileCopy($Download_Icon_path_1_jpg, $Download_Icon_path_2_jpg)
	EndIf
EndFunc   ;==>_Download_Icon_for_SteamGameID

Func _Sync_Icons()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2831) :(' & @MIN & ':' & @SEC & ') _Sync_Icons()' & @CR) ;### Function Trace
	Local $Icon_Folder_Sync
	Local $Icon_Folder_1 = $Install_DIR & "WebPage\images\"
	Local $Icon_Folder_2 = ""
	Local $Icon_Folder_3 = ""
	Local $Icon_Folder_4 = ""

	Local $NR_Icons_Folders = 2

	Local $FileList = _FileListToArray($Icons, "*.jpg", 1)
	$Array_Result = $FileList
	If @error Then
		$ScriptLineNumber_Temp = @ScriptLineNumber
		$AtError_Result = @error
	EndIf
	If $AtError_Result <> "" Or $Array_Result = -1 Then _FileListToArray_Error_Handler()

	If IsArray($FileList) Then
		For $Loop_1 = 1 To $FileList[0]
			For $Loop_2 = 1 To $NR_Icons_Folders
				If $Loop_2 = 1 Then $Icon_Folder_Sync = $Icon_Folder_1
				If $Loop_2 = 2 Then $Icon_Folder_Sync = $Icon_Folder_2

				If FileExists($Icon_Folder_Sync) Then
					If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($Icon_Folder_Sync & $FileList[$Loop_1])
					If Not FileExists($Icons & "460x215\" & $FileList[$Loop_1]) Then FileCopy($Icons & $FileList[$Loop_1], $Icon_Folder_Sync & $FileList[$Loop_1], $FC_OVERWRITE + $FC_CREATEPATH)
					If Not FileExists($Icon_Folder_Sync & $FileList[$Loop_1]) Then FileCopy($gfx & "Icon_Preview.jpg", $Icon_Folder_Sync & $FileList[$Loop_1])
				EndIf
			Next
		Next
	EndIf
EndFunc   ;==>_Sync_Icons

#EndRegion Func MAIN

#Region Func MAIN GUI

Func _Create_ListView_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2871) :(' & @MIN & ':' & @SEC & ') _Create_ListView_1()' & @CR) ;### Function Trace
	$listview = GUICtrlCreateListView("", 0, 115, 800, $DesktopHeight - 198, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview, "NR", 60)
	_GUICtrlListView_AddColumn($listview, "App ID", 105)
	_GUICtrlListView_AddColumn($listview, "Name", 410)
	_GUICtrlListView_AddColumn($listview, "K2", 40, 2)
	_GUICtrlListView_AddColumn($listview, "K3", 40, 2)
	_GUICtrlListView_AddColumn($listview, "K4", 40, 2)
	_GUICtrlListView_AddColumn($listview, "K5", 40, 2)
	_GUICtrlListView_AddColumn($listview, "K6", 40, 2)
	$contextmenu = GUICtrlCreateContextMenu($listview)
	$RM_Item1 = GUICtrlCreateMenuItem("Start Game", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Start_ListView_Selected")
	;GUICtrlSetOnEvent($RM_Item3, "_Create_HTMLView_GUI")

	GUICtrlSetOnEvent($RM_Item3, "_RM_Menu_Item_3")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview, $GUI_HIDE)
EndFunc   ;==>_Create_ListView_1

Func _Create_ListView_2()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2949) :(' & @MIN & ':' & @SEC & ') _Create_ListView_2()' & @CR) ;### Function Trace
	$listview_2 = GUICtrlCreateListView("", 0, 115, 800, $DesktopHeight - 198, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_2, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_2, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image_2 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_2, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_2, "NR", 60)
	_GUICtrlListView_AddColumn($listview_2, "App ID", 105)
	_GUICtrlListView_AddColumn($listview_2, "Name", 630)
	$contextmenu = GUICtrlCreateContextMenu($listview_2)
	$RM_Item1 = GUICtrlCreateMenuItem("Start Game", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Start_ListView_Selected")
	;GUICtrlSetOnEvent($RM_Item3, "_Create_HTMLView_GUI")

	GUICtrlSetOnEvent($RM_Item3, "_RM_Menu_Item_3")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview, $GUI_HIDE)
EndFunc   ;==>_Create_ListView_2

Func _Create_ListView_3()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3025) :(' & @MIN & ':' & @SEC & ') _Create_ListView_3()' & @CR) ;### Function Trace
	$listview_3 = GUICtrlCreateListView("", 0, 115, 800, $DesktopHeight - 198, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_3, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_3, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image_3 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_3, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_3, "NR", 60)
	_GUICtrlListView_AddColumn($listview_3, "App ID", 105)
	_GUICtrlListView_AddColumn($listview_3, "Name", 630)
	$contextmenu = GUICtrlCreateContextMenu($listview_3)
	$RM_Item1 = GUICtrlCreateMenuItem("Start Game", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Start_ListView_Selected")
	;GUICtrlSetOnEvent($RM_Item3, "_Create_HTMLView_GUI")

	GUICtrlSetOnEvent($RM_Item3, "_RM_Menu_Item_3")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview, $GUI_HIDE)
EndFunc   ;==>_Create_ListView_3

Func _Create_ListView_4()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3101) :(' & @MIN & ':' & @SEC & ') _Create_ListView_4()' & @CR) ;### Function Trace
	$listview_4 = GUICtrlCreateListView("", 0, 115, 800, $DesktopHeight - 198, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_4, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_4, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image_4 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_4, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_4, "NR", 60)
	_GUICtrlListView_AddColumn($listview_4, "App ID", 105)
	_GUICtrlListView_AddColumn($listview_4, "Name", 630)
	$contextmenu = GUICtrlCreateContextMenu($listview_4)
	$RM_Item1 = GUICtrlCreateMenuItem("Start Game", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Start_ListView_Selected")
	;GUICtrlSetOnEvent($RM_Item3, "_Create_HTMLView_GUI")

	GUICtrlSetOnEvent($RM_Item3, "_RM_Menu_Item_3")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview, $GUI_HIDE)
EndFunc   ;==>_Create_ListView_4

Func _Create_ListView_5()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3177) :(' & @MIN & ':' & @SEC & ') _Create_ListView_5()' & @CR) ;### Function Trace
	$listview_5 = GUICtrlCreateListView("", 0, 115, 800, $DesktopHeight - 198, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_5, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_5, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image_5 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_5, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_5, "NR", 60)
	_GUICtrlListView_AddColumn($listview_5, "App ID", 105)
	_GUICtrlListView_AddColumn($listview_5, "Name", 630)
	$contextmenu = GUICtrlCreateContextMenu($listview_5)
	$RM_Item1 = GUICtrlCreateMenuItem("Start Game", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Start_ListView_Selected")

	GUICtrlSetOnEvent($RM_Item3, "_RM_Menu_Item_3")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview, $GUI_HIDE)
EndFunc   ;==>_Create_ListView_5

Func _Create_ListView_6()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3236) :(' & @MIN & ':' & @SEC & ') _Create_ListView_6()' & @CR) ;### Function Trace
	$listview_6 = GUICtrlCreateListView("", 0, 115, 800, $DesktopHeight - 198, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	_GUICtrlListView_SetExtendedListViewStyle($listview_6, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_DOUBLEBUFFER, $iStylesEx, $LVS_EX_CHECKBOXES))
	GUICtrlSetFont($listview_6, 16, 500, 1, "arial")

	; Load images
	Global $ListView_Favorite_Image_6 = _GUIImageList_Create(30, 30)
	_GUIImageList_AddBitmap($ListView_Favorite_Image_6, $gfx & "Favorite_1.bmp")

	; Add columns
	_GUICtrlListView_AddColumn($listview_6, "NR", 60)
	_GUICtrlListView_AddColumn($listview_6, "App ID", 105)
	_GUICtrlListView_AddColumn($listview_6, "Name", 630)
	$contextmenu = GUICtrlCreateContextMenu($listview_6)
	$RM_Item1 = GUICtrlCreateMenuItem("Start Game", $contextmenu)
	$RM_Item3 = GUICtrlCreateMenuItem("Steamdb.info", $contextmenu)
	GUICtrlCreateMenuItem("", $contextmenu)
	$RM_Item8 = GUICtrlCreateMenuItem("Move Up", $contextmenu)
	$RM_Item9 = GUICtrlCreateMenuItem("Move Down", $contextmenu)
	$RM_Item11 = GUICtrlCreateMenuItem("Delete", $contextmenu)
	GUICtrlSetOnEvent($RM_Item1, "_Start_ListView_Selected")

	GUICtrlSetOnEvent($RM_Item3, "_RM_Menu_Item_3")
	GUICtrlSetOnEvent($RM_Item8, "_RM_Menu_Item_8")
	GUICtrlSetOnEvent($RM_Item9, "_RM_Menu_Item_9")
	GUICtrlSetOnEvent($RM_Item11, "_RM_Menu_Item11")
	GUICtrlSetState($listview, $GUI_HIDE)
EndFunc   ;==>_Create_ListView_6

Func _Read_from_INI_ADD_2_ListView()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3295) :(' & @MIN & ':' & @SEC & ') _Read_from_INI_ADD_2_ListView()' & @CR) ;### Function Trace
	GUISetState(@SW_LOCK, $HLL_GUI)
	;MsgBox(0, "_Read_from_INI_ADD_2_ListView()", "_Read_from_INI_ADD_2_ListView()")
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	Local $Combo_State = StringReplace($Combo, 'Steam Library ', '')
	$Status_Combo_ApplicationList = IniRead($Config_INI, "Settings", "MainCategory", "")
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $Parameter_Temp = "UpdateLibrary" Then $Status_Combo_ApplicationList = "ALL Categories"

	If $ButtonTAB_State = "1" Then
		If $Status_Combo_ApplicationList = "ALL Categories" Then
			If $ScanOnlyVR = "true" Then
				$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
			Else
				$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
			EndIf
		Else
			$ApplicationList_TEMP = $MainCategory_ApplicationList_Folder & $Status_Combo_ApplicationList & ".ini"
		EndIf
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	$listview_TEMP = $listview
	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6


	$ListView_ImageList_Temp = $ListView_Favorite_Image
	If $ButtonTAB_State = "1" Then $ListView_ImageList_Temp = $ListView_Favorite_Image
	If $ButtonTAB_State = "2" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_2
	If $ButtonTAB_State = "3" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_3
	If $ButtonTAB_State = "4" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_4
	If $ButtonTAB_State = "5" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_5
	If $ButtonTAB_State = "6" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_6

	If $ButtonTAB_State = "1" Then $TAB_Label = $TAB1_Label
	If $ButtonTAB_State = "2" Then $TAB_Label = $TAB2_Label
	If $ButtonTAB_State = "3" Then $TAB_Label = $TAB3_Label
	If $ButtonTAB_State = "4" Then $TAB_Label = $TAB4_Label
	If $ButtonTAB_State = "5" Then $TAB_Label = $TAB5_Label
	If $ButtonTAB_State = "6" Then $TAB_Label = $TAB6_Label

	$NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	_GUICtrlListView_BeginUpdate($listview_TEMP)
	_GUICtrlListView_DeleteAllItems($listview_TEMP)
	For $NR = 0 To $NR_Applications + 1
		Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "NR", "")
		Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "appid", "")
		Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "name", "")
		Global $Application_installdir = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "installdir", "")
		Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "IconPath", "")

		Global $Application_Category_02 = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "Category_2", "")
		Global $Application_Category_03 = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "Category_3", "")
		Global $Application_Category_04 = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "Category_4", "")
		Global $Application_Category_05 = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "Category_5", "")
		Global $Application_Category_06 = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "Category_6", "")

		If $Application_appid <> "" Then
			Local $ListView_RowNR = $NR ; - 1

			If StringLeft($Application_appid, 14) = 'steam.overlay.' Then
				Local $Application_appid_Icon = StringReplace($Application_appid, 'steam.overlay.', '')
				Local $ImageList_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid & ".bmp"
				;MsgBox(0, "1", $ImageList_Icon)
			Else
				Local $ImageList_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid & ".bmp"
				;MsgBox(0, "2", $ImageList_Icon)
			EndIf

			Local $ListView_Icon = $ImageList_Icon
			_GUIImageList_AddBitmap($ListView_ImageList_Temp, $ListView_Icon)
			_GUICtrlListView_SetImageList($listview_TEMP, $ListView_ImageList_Temp, 1)
			_GUICtrlListView_AddItem($listview_TEMP, "", $Application_NR)
			_GUICtrlListView_AddSubItem($listview_TEMP, $ListView_RowNR, $Application_appid, 1)
			_GUICtrlListView_AddSubItem($listview_TEMP, $ListView_RowNR, $Application_name, 2)

			_GUICtrlListView_AddSubItem($listview_TEMP, $ListView_RowNR, $Application_Category_02, 3)
			_GUICtrlListView_AddSubItem($listview_TEMP, $ListView_RowNR, $Application_Category_03, 4)
			_GUICtrlListView_AddSubItem($listview_TEMP, $ListView_RowNR, $Application_Category_04, 5)
			_GUICtrlListView_AddSubItem($listview_TEMP, $ListView_RowNR, $Application_Category_05, 6)
			_GUICtrlListView_AddSubItem($listview_TEMP, $ListView_RowNR, $Application_Category_06, 7)
		EndIf
	Next
	_GUICtrlListView_EndUpdate($listview_TEMP)

	;MsgBox(0, "", $NR_Applications - 1)

	For $NR2 = 0 To $NR_Applications - 1
		Local $Application_appid_last = IniRead($ApplicationList_TEMP, "Application_" & $NR2 + 1, "appid", "")
		If $Application_appid_last <> "" Then
			$ListView_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid_last & ".bmp"
			If StringLeft($Application_appid_last, 14) = 'steam.overlay.' Then
				Local $Application_appid_Icon = StringReplace($Application_appid_last, 'steam.overlay.', '')
				Local $ListView_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid_Icon & ".bmp"
				If Not FileExists($ListView_Icon) Then
					$ListView_Icon = $System_DIR & "gfx\" & "Icon_Overlay_Preview_32x32.bmp"
				EndIf
			Else
				Local $ListView_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid_last & ".bmp"
			EndIf
		EndIf
		_GUICtrlListView_SetItemImage($listview_TEMP, $NR2, $NR2)
	Next

	_GUICtrlListView_EndUpdate($listview_TEMP)
	_GUICtrlStatusBar_SetText($Statusbar, $TAB_Label & @TAB & "Apps: " & $NR_Applications & @TAB & "")
	GUISetState(@SW_UNLOCK, $HLL_GUI)
EndFunc   ;==>_Read_from_INI_ADD_2_ListView

Func _Update_ListView_Icons()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3414) :(' & @MIN & ':' & @SEC & ') _Update_ListView_Icons()' & @CR) ;### Function Trace
	GUISetState(@SW_LOCK, $HLL_GUI)

	$Status_Combo_ApplicationList = "ALL Categories"
	_GUICtrlListView_BeginUpdate($listview)
	_GUICtrlListView_DeleteAllItems($listview)

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $Status_Combo_ApplicationList = "ALL Categories" Then
			If $ScanOnlyVR = "true" Then
				$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
			Else
				$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
			EndIf
		Else
			$ApplicationList_TEMP = $MainCategory_ApplicationList_Folder & $Status_Combo_ApplicationList & ".ini"
		EndIf
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	$listview_TEMP = $listview
	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

	$ListView_ImageList_Temp = $ListView_Favorite_Image
	If $ButtonTAB_State = "1" Then $ListView_ImageList_Temp = $ListView_Favorite_Image
	If $ButtonTAB_State = "2" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_2
	If $ButtonTAB_State = "3" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_3
	If $ButtonTAB_State = "4" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_4
	If $ButtonTAB_State = "5" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_5
	If $ButtonTAB_State = "6" Then $ListView_ImageList_Temp = $ListView_Favorite_Image_6

	Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	_GUICtrlListView_BeginUpdate($listview_TEMP)
	_GUICtrlListView_DeleteAllItems($listview_TEMP)
	For $NR = 0 To $NR_Applications - 1
		Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "NR", "")
		Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "appid", "")
		Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "name", "")
		Global $Application_installdir = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "installdir", "")
		Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "IconPath", "")
		Global $Application_right_now = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "right_now", "")
		Global $Application_24h_peak = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "24h_peak", "")
		Global $Application_all_time_peak = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "all_time_peak", "")
		If $Application_appid <> "" Then
			Local $ListView_RowNR = $NR
			Local $ImageList_Icon_new = $Icons & "32x32\" & "steam.app." & $Application_appid & ".bmp"

			If Not FileExists($ImageList_Icon_new) Then
				FileCopy($gfx & "Icon_Preview_32x32.bmp", $ImageList_Icon_new)
			EndIf

			Local $ListView_Icon = $ImageList_Icon_new
			_GUIImageList_AddBitmap($ListView_ImageList_Temp, $ListView_Icon)
			_GUICtrlListView_SetImageList($listview_TEMP, $ListView_ImageList_Temp, 1)
			_GUICtrlListView_AddItem($listview_TEMP, "", $Application_NR)
			_GUICtrlListView_AddSubItem($listview_TEMP, $ListView_RowNR, $Application_appid, 1)
			_GUICtrlListView_AddSubItem($listview_TEMP, $ListView_RowNR, $Application_name, 2)
			_GUICtrlListView_AddSubItem($listview_TEMP, $ListView_RowNR, $Application_installdir, 3)
			_GUICtrlListView_AddSubItem($listview_TEMP, $ListView_RowNR, $Application_right_now, 4)
		EndIf
	Next
	_GUICtrlListView_EndUpdate($listview_TEMP)
	GUISetState(@SW_UNLOCK, $HLL_GUI)
EndFunc   ;==>_Update_ListView_Icons

Func _ADD_Icons_32x32_to_ListView()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3494) :(' & @MIN & ':' & @SEC & ') _ADD_Icons_32x32_to_ListView()' & @CR) ;### Function Trace
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	Local $Combo_State = StringReplace($Combo, 'Steam Library ', '')
	_GUICtrlListView_BeginUpdate($listview)
	_GUICtrlListView_DeleteAllItems($listview)

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then
			If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
			If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
		EndIf
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
		If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI

	Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	For $NR = 0 To $NR_Applications - 1
		Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "NR", "")
		Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR + 1, "appid", "")

		If $Application_appid <> "" Then
			Local $ListView_RowNR = $NR ; - 1

			Local $ImageList_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid & ".bmp"

			If Not FileExists($ImageList_Icon) Then
				FileCopy($gfx & "Icon_Preview_32x32.bmp", $ImageList_Icon)
			EndIf

			Local $ListView_Icon = $ImageList_Icon
			_GUIImageList_AddBitmap($ListView_Favorite_Image, $ListView_Icon)
			_GUICtrlListView_SetImageList($listview, $ListView_Favorite_Image, 1)
		EndIf
	Next

	For $NR2 = 0 To $NR_Applications - 1
		Local $Application_appid_last = IniRead($ApplicationList_TEMP, "Application_" & $NR2 + 1, "appid", "")
		If $Application_appid_last <> "" Then
			$ListView_Icon = $Icons & "32x32\" & "steam.app." & $Application_appid_last & ".bmp"
			If Not FileExists($ListView_Icon) Then
				FileCopy($gfx & "Icon_Preview_32x32.bmp", $ListView_Icon)
			EndIf
		EndIf
		_GUICtrlListView_SetItemImage($listview, $NR2, $NR2)
	Next
	_GUICtrlListView_EndUpdate($listview)
EndFunc   ;==>_ADD_Icons_32x32_to_ListView

Func _Set_States()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3556) :(' & @MIN & ':' & @SEC & ') _Set_States()' & @CR) ;### Function Trace
	Global $RM_More_Scan_Options_Item_3, $RM_More_Scan_Options_Item_4, $RM_More_Scan_Options_Item_5, $RM_More_Scan_Options_Item_6, $RM_More_Scan_Options_Item_7

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$DeleteHomeLoaderLibraryData = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")
	$Request_Steamdb_info = IniRead($Config_INI, "Settings", "Request_Steamdb_info", "")
	$ScanOnlyVR = IniRead($Config_INI, "Settings", "ScanOnlyVR", "")
	$ScanVIVEApps = IniRead($Config_INI, "Settings", "ScanVIVEApps", "")
	$ScanOculusApps = IniRead($Config_INI, "Settings", "ScanOculusApps", "")
	$Sort_Alphabetical_order = IniRead($Config_INI, "Settings", "Sort_Alphabetical_order", "")
	$Use_Steam_Tags = IniRead($Config_INI, "Settings", "Use_Steam_Tags", "")
	$Allow_Multiple_Tag_Assignments = IniRead($Config_INI, "Settings", "Allow_Multiple_Tag_Assignments", "")
	$Add_Apps_Tags_to_categories = IniRead($Config_INI, "Settings", "Add_Apps_Tags_to_categories", "")
	$Create_HTML_GamePage = IniRead($Config_INI, "Settings", "Create_HTML_GamePage", "")
	$Create_WMR_Shortcut_Files = IniRead($Config_INI, "Settings", "Create_WMR_Shortcut_Files", "")

	$Add_PlayersOnline_to_Icons = IniRead($Config_INI, "Settings", "Add_PlayersOnline_to_Icons", "false")
	$Add_SS_to_Icons = IniRead($Config_INI, "Settings", "Add_SS_to_Icons", "false")
	$Add_SS_per_game = IniRead($Config_INI, "Settings", "Add_SS_per_game", "")
	$Create_SteamVR_Home_Panels = IniRead($Config_INI, "Settings", "Create_SteamVR_Home_Panels", "")
	$Update_Check = IniRead($Config_INI, "Settings", "Update_Check", "")

	If $Request_Steamdb_info = "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_5, $GUI_ENABLE)
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_5, $GUI_DISABLE)
	EndIf

	If $Use_Steam_Tags = "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_3, $GUI_ENABLE)
		GUICtrlSetState($RM_More_Scan_Options_Item_4, $GUI_ENABLE)
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_3, $GUI_DISABLE)
		GUICtrlSetState($RM_More_Scan_Options_Item_4, $GUI_DISABLE)
	EndIf

	If $Add_SS_per_game = "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_6, $GUI_ENABLE)
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_6, $GUI_DISABLE)
	EndIf
EndFunc


#Region Func RM_Menu

Func _RM_Button_Scan()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3601) :(' & @MIN & ':' & @SEC & ') _RM_Button_Scan()' & @CR) ;### Function Trace
	Global $contextmenu_Button_Scan = GUICtrlCreateContextMenu($Button_ReScan_Steam_Library)
	Global $RM_Button_Scan_Item_1_1 = GUICtrlCreateMenuItem("Scan", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_Button_ReScan_Steam_Library")
	Global $RM_Button_Scan_Item_1_2 = GUICtrlCreateMenuItem("Scan Viveport Apps", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_RM_Button_Scan_Item_1_2")
	Global $RM_Button_Scan_Item_1_3 = GUICtrlCreateMenuItem("Scan Oculus Apps", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_RM_Button_Scan_Item_1_3")
	GUICtrlCreateMenuItem("", $contextmenu_Button_Scan)
	Global $RM_Button_Scan_Item_4 = GUICtrlCreateMenuItem("Create HTML Game Pages [All Apps]", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_RM_Create_HTML_GamePages_All")
	Global $RM_Button_Scan_Item_5 = GUICtrlCreateMenuItem("Create WMR Shortcut Files [All Apps]", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_RM_Create_WMR_Startmenu_Files")
	GUICtrlCreateMenuItem("", $contextmenu_Button_Scan)
	Global $RM_Button_Scan_Item_8 = GUICtrlCreateMenuItem("Delete Category Pages", $contextmenu_Button_Scan)
	GUICtrlSetOnEvent(-1, "_RM_Delete_Category_Pages")
	GUICtrlCreateMenuItem("", $contextmenu_Button_Scan)
EndFunc   ;==>_RM_Button_Scan


Func _RM_Button_Scan_Item_1_2()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3632) :(' & @MIN & ':' & @SEC & ') _RM_Button_Scan_Item_1_2()' & @CR) ;### Function Trace
	_ScanViveData()
	_Read_from_INI_ADD_2_ListView()
EndFunc

Func _RM_Button_Scan_Item_1_3()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3639) :(' & @MIN & ':' & @SEC & ') _RM_Button_Scan_Item_1_3()' & @CR) ;### Function Trace
	_ScanOculusData()
	_Read_from_INI_ADD_2_ListView()
EndFunc


Func _RM_Button_Scan_Item_3()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3653) :(' & @MIN & ':' & @SEC & ') _RM_Button_Scan_Item_3()' & @CR) ;### Function Trace
	_Read_from_INI_ADD_2_ListView()
EndFunc


Func _RM_More_Scan_Options()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (3711) :(' & @MIN & ':' & @SEC & ') _RM_More_Scan_Options()' & @CR) ;### Function Trace
	Global $contextmenu_More_Scan_Options = GUICtrlCreateContextMenu($Button_More_Scan_Options)
	Global $RM_More_Scan_Options_Item_1_1 = GUICtrlCreateMenuItem("Scan for Viveport Apps", $contextmenu_More_Scan_Options)
	If $ScanVIVEApps = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_ScanViveData")
	Global $RM_More_Scan_Options_Item_1_2 = GUICtrlCreateMenuItem("Scan for Oculus Apps", $contextmenu_More_Scan_Options)
	If $ScanOculusApps = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_ScanOculusData")
	Global $RM_More_Scan_Options_Item_2 = GUICtrlCreateMenuItem("Sort Apps in Alphabetical order", $contextmenu_More_Scan_Options)
	If $Sort_Alphabetical_order = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Sort_Alphabetical_order")

	Global $RM_More_Scan_Options_Item_8 = GUICtrlCreateMenuItem("Create/Update HTML Pages", $contextmenu_More_Scan_Options)
	If $Create_HTML_GamePage = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_Create_HTML_GamePage")

	Global $RM_More_Scan_Options_Item_9 = GUICtrlCreateMenuItem("Create/Update WMR Shortcut Files", $contextmenu_More_Scan_Options)
	If $Create_WMR_Shortcut_Files = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_WMR_Shortcut_Files")

	Global $RM_More_Scan_Options_Item_10 = GUICtrlCreateMenuItem("Delete old HomeLoader Library Data first", $contextmenu_More_Scan_Options)
	If $DeleteHomeLoaderLibraryData = "true" Then GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlSetOnEvent(-1, "_RM_Checkbox_DeleteHomeLoaderLibraryData")
	GUICtrlCreateMenuItem("", $Button_More_Scan_Options)
EndFunc   ;==>_RM_More_Scan_Options

Func _RM_Buttons()
	Global $contextmenu_1 = GUICtrlCreateContextMenu($ButtonTAB_Steam_Library)

	Global $contextmenu_3 = GUICtrlCreateContextMenu($ButtonTAB_Custom_1)
	Global $RM_Button_Item_3_1 = GUICtrlCreateMenuItem("Change Category Name", $contextmenu_3)
	Global $contextmenu_4 = GUICtrlCreateContextMenu($ButtonTAB_Custom_2)
	Global $RM_Button_Item_4_1 = GUICtrlCreateMenuItem("Change Category Name", $contextmenu_4)
	Global $contextmenu_5 = GUICtrlCreateContextMenu($ButtonTAB_Custom_3)
	Global $RM_Button_Item_5_1 = GUICtrlCreateMenuItem("Change Category Name", $contextmenu_5)
	Global $contextmenu_6 = GUICtrlCreateContextMenu($ButtonTAB_Custom_4)
	Global $RM_Button_Item_6_1 = GUICtrlCreateMenuItem("Change Category Name", $contextmenu_6)

	GUICtrlSetOnEvent($RM_Button_Item_3_1, "_RM_Button_Item_3_1")
	GUICtrlSetOnEvent($RM_Button_Item_4_1, "_RM_Button_Item_4_1")
	GUICtrlSetOnEvent($RM_Button_Item_5_1, "_RM_Button_Item_5_1")
	GUICtrlSetOnEvent($RM_Button_Item_6_1, "_RM_Button_Item_6_1")
EndFunc   ;==>_RM_Buttons

Func _RM_Button_Item_3_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5380) :(' & @MIN & ':' & @SEC & ') _RM_Button_Item_3_1()' & @CR) ;### Function Trace
	Local $InputBox_old = GUICtrlRead($ButtonTAB_Custom_1)
	$InputBox = InputBox("Change Section Name", "Enter the new Section Name and press 'OK' to change the name of this Section.", $TAB3_Label, "", -1, 160)
	If @error = 1 Or @error = 5 Then
		GUICtrlSetData($ButtonTAB_Custom_1, $InputBox_old)
		IniWrite($Config_INI, "Settings", "TAB3_Name", $InputBox_old)
	Else
		GUICtrlSetData($ButtonTAB_Custom_1, $InputBox)
		IniWrite($Config_INI, "Settings", "TAB3_Name", $InputBox)
		$TAB_NR_Temp = "3"
		_Write_CategoryNameTemplate_2_Image()
	EndIf
EndFunc   ;==>_RM_Button_Item_3_1

Func _RM_Button_Item_4_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5395) :(' & @MIN & ':' & @SEC & ') _RM_Button_Item_4_1()' & @CR) ;### Function Trace
	Local $InputBox_old = GUICtrlRead($ButtonTAB_Custom_2)
	$InputBox = InputBox("Change Section Name", "Enter the new Section Name and press 'OK' to change the name of this Section.", $TAB4_Label, "", -1, 160)
	If @error = 1 Or @error = 5 Then
		GUICtrlSetData($ButtonTAB_Custom_2, $InputBox_old)
		IniWrite($Config_INI, "Settings", "TAB4_Name", $InputBox_old)
	Else
		GUICtrlSetData($ButtonTAB_Custom_2, $InputBox)
		IniWrite($Config_INI, "Settings", "TAB4_Name", $InputBox)
		$TAB_NR_Temp = "4"
		_Write_CategoryNameTemplate_2_Image()
	EndIf
EndFunc   ;==>_RM_Button_Item_4_1

Func _RM_Button_Item_5_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5410) :(' & @MIN & ':' & @SEC & ') _RM_Button_Item_5_1()' & @CR) ;### Function Trace
	Local $InputBox_old = GUICtrlRead($ButtonTAB_Custom_3)
	$InputBox = InputBox("Change Section Name", "Enter the new Section Name and press 'OK' to change the name of this Section.", $TAB5_Label, "", -1, 160)
	If @error = 1 Or @error = 5 Then
		GUICtrlSetData($ButtonTAB_Custom_3, $InputBox_old)
		IniWrite($Config_INI, "Settings", "TAB5_Name", $InputBox_old)
	Else
		GUICtrlSetData($ButtonTAB_Custom_3, $InputBox)
		IniWrite($Config_INI, "Settings", "TAB5_Name", $InputBox)
		$TAB_NR_Temp = "5"
		_Write_CategoryNameTemplate_2_Image()
	EndIf
EndFunc   ;==>_RM_Button_Item_5_1

Func _RM_Button_Item_6_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (5425) :(' & @MIN & ':' & @SEC & ') _RM_Button_Item_6_1()' & @CR) ;### Function Trace
	Local $InputBox_old = GUICtrlRead($ButtonTAB_Custom_4)
	$InputBox = InputBox("Change Section Name", "Enter the new Section Name and press 'OK' to change the name of this Section.", $TAB6_Label, "", -1, 160)
	If @error = 1 Or @error = 5 Then
		GUICtrlSetData($ButtonTAB_Custom_4, $InputBox_old)
		IniWrite($Config_INI, "Settings", "TAB6_Name", $InputBox_old)
	Else
		GUICtrlSetData($ButtonTAB_Custom_4, $InputBox)
		IniWrite($Config_INI, "Settings", "TAB6_Name", $InputBox)
		$TAB_NR_Temp = "6"
		_Write_CategoryNameTemplate_2_Image()
	EndIf
EndFunc   ;==>_RM_Button_Item_6_1


Func _RM_Menu_Item_3()

	Local $Combo = "ALL"
	Local $Combo_State = StringReplace($Combo, 'Steam Library ', '')

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
		If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
		If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	$listview_TEMP = $listview
	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_TEMP)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview_TEMP, $ListView_Selected_Row_Index)
	Local $GameName = $ListView_Item_Array[3]
	Local $GameName_Replaced = StringReplace($GameName, ' ', '_')
	Local $Game_ID = $ListView_Item_Array[2]

	Local $GameNR = $ListView_Selected_Row_Nr

	Local $GetItem_NR_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "NR", "")
	Local $GetItem_name_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "name", "")
	Local $GetItem_appid_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "appid", "")

	Local $URL = "https://steamdb.info/app/" & $GetItem_appid_1 & "/"
	;MsgBox(0, "", $URL)
	ShellExecute($URL)
EndFunc

Func _RM_Menu_Item_8() ; RM_UP
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8261) :(' & @MIN & ':' & @SEC & ') _RM_Menu_Item_8()' & @CR) ;### Function Trace
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	Local $Combo_State = StringReplace($Combo, 'Steam Library ', '')

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
		If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
		If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	$listview_TEMP = $listview
	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_TEMP)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview_TEMP, $ListView_Selected_Row_Index)
	Local $GameName = $ListView_Item_Array[3]
	Local $GameName_Replaced = StringReplace($GameName, ' ', '_')
	Local $Game_ID = $ListView_Item_Array[2]

	Local $GameNR = $ListView_Selected_Row_Nr

	Local $GetItem_NR_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "NR", "")
	Local $GetItem_name_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "name", "")
	Local $GetItem_appid_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "appid", "")
	Local $GetItem_right_now_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "right_now", "")
	Local $GetItem_24h_peak_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "24h_peak", "")
	Local $GetItem_all_time_peak_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "all_time_peak", "")
	Local $GetItem_resolutionScale_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "resolutionScale", "")
	Local $GetItem_url_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "url", "")
	Local $GetItem_IconPath_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "IconPath", "")
	Local $GetItem_binary_path_windows_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "binary_path_windows", "")
	Local $GetItem_arguments_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "arguments", "")
	Local $GetItem_image_path_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "image_path", "")
	Local $GetItem_launch_type_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "launch_type", "")
	Local $GetItem_installdir_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "installdir", "")

	Local $GetItem_NR_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "NR", "")
	Local $GetItem_name_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "name", "")
	Local $GetItem_appid_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "appid", "")
	Local $GetItem_right_now_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "right_now", "")
	Local $GetItem_24h_peak_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "24h_peak", "")
	Local $GetItem_all_time_peak_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "all_time_peak", "")
	Local $GetItem_resolutionScale_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "resolutionScale", "")
	Local $GetItem_url_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "url", "")
	Local $GetItem_IconPath_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "IconPath", "")
	Local $GetItem_binary_path_windows_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "binary_path_windows", "")
	Local $GetItem_arguments_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "arguments", "")
	Local $GetItem_image_path_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "image_path", "")
	Local $GetItem_launch_type_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "launch_type", "")
	Local $GetItem_installdir_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR - 1, "installdir", "")

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "NR", $GetItem_NR_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "name", $GetItem_name_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "appid", $GetItem_appid_1)
	If $GetItem_right_now_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "right_now", $GetItem_right_now_1)
	If $GetItem_24h_peak_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "24h_peak", $GetItem_24h_peak_1)
	If $GetItem_all_time_peak_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "all_time_peak", $GetItem_all_time_peak_1)
	If $GetItem_resolutionScale_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "resolutionScale", $GetItem_resolutionScale_1)
	If $GetItem_url_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "url", $GetItem_url_1)
	If $GetItem_IconPath_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "IconPath", $GetItem_IconPath_1)
	If $GetItem_binary_path_windows_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "binary_path_windows", $GetItem_binary_path_windows_1)
	If $GetItem_arguments_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "arguments", $GetItem_arguments_1)
	If $GetItem_image_path_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "image_path", $GetItem_image_path_1)
	If $GetItem_launch_type_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "launch_type", $GetItem_launch_type_1)
	If $GetItem_installdir_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "installdir", $GetItem_installdir_1)

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "NR", $GetItem_NR_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "name", $GetItem_name_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "appid", $GetItem_appid_2)
	If $GetItem_right_now_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "right_now", $GetItem_right_now_2)
	If $GetItem_24h_peak_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "24h_peak", $GetItem_24h_peak_2)
	If $GetItem_all_time_peak_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "all_time_peak", $GetItem_all_time_peak_2)
	If $GetItem_resolutionScale_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "resolutionScale", $GetItem_resolutionScale_2)
	If $GetItem_url_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "url", $GetItem_url_2)
	If $GetItem_IconPath_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "IconPath", $GetItem_IconPath_2)
	If $GetItem_binary_path_windows_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "binary_path_windows", $GetItem_binary_path_windows_2)
	If $GetItem_arguments_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "arguments", $GetItem_arguments_2)
	If $GetItem_image_path_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "image_path", $GetItem_image_path_2)
	If $GetItem_launch_type_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "launch_type", $GetItem_launch_type_2)
	If $GetItem_installdir_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "installdir", $GetItem_installdir_2)

	_Read_from_INI_ADD_2_ListView()
	;_Restart()
EndFunc   ;==>_RM_Menu_Item_8

Func _RM_Menu_Item_9() ; RM_DOWN
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8370) :(' & @MIN & ':' & @SEC & ') _RM_Menu_Item_9()' & @CR) ;### Function Trace
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	Local $Combo_State = StringReplace($Combo, 'Steam Library ', '')

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then
			If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
			If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
		EndIf
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
		If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	$listview_TEMP = $listview
	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_TEMP)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview_TEMP, $ListView_Selected_Row_Index)
	Local $GameName = $ListView_Item_Array[3]
	Local $GameName_Replaced = StringReplace($GameName, ' ', '_')
	Local $Game_ID = $ListView_Item_Array[2]

	Local $GameNR = $ListView_Selected_Row_Nr

	Local $GetItem_NR_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "NR", "")
	Local $GetItem_name_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "name", "")
	Local $GetItem_appid_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "appid", "")
	Local $GetItem_right_now_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "right_now", "")
	Local $GetItem_24h_peak_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "24h_peak", "")
	Local $GetItem_all_time_peak_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "all_time_peak", "")
	Local $GetItem_resolutionScale_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "resolutionScale", "")
	Local $GetItem_url_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "url", "")
	Local $GetItem_IconPath_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "IconPath", "")
	Local $GetItem_binary_path_windows_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "binary_path_windows", "")
	Local $GetItem_arguments_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "arguments", "")
	Local $GetItem_image_path_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "image_path", "")
	Local $GetItem_launch_type_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "launch_type", "")
	Local $GetItem_installdir_1 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "installdir", "")

	Local $GetItem_NR_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "NR", "")
	Local $GetItem_name_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "name", "")
	Local $GetItem_appid_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "appid", "")
	Local $GetItem_right_now_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "right_now", "")
	Local $GetItem_24h_peak_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "24h_peak", "")
	Local $GetItem_all_time_peak_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "all_time_peak", "")
	Local $GetItem_resolutionScale_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "resolutionScale", "")
	Local $GetItem_url_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "url", "")
	Local $GetItem_IconPath_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "IconPath", "")
	Local $GetItem_binary_path_windows_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "binary_path_windows", "")
	Local $GetItem_arguments_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "arguments", "")
	Local $GetItem_image_path_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "image_path", "")
	Local $GetItem_launch_type_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "launch_type", "")
	Local $GetItem_installdir_2 = IniRead($ApplicationList_TEMP, "Application_" & $GameNR + 1, "installdir", "")

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "NR", $GetItem_NR_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "name", $GetItem_name_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "appid", $GetItem_appid_1)
	If $GetItem_right_now_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "right_now", $GetItem_right_now_1)
	If $GetItem_24h_peak_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "24h_peak", $GetItem_24h_peak_1)
	If $GetItem_all_time_peak_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "all_time_peak", $GetItem_all_time_peak_1)
	If $GetItem_resolutionScale_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "resolutionScale", $GetItem_resolutionScale_1)
	If $GetItem_url_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "url", $GetItem_url_1)
	If $GetItem_IconPath_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "IconPath", $GetItem_IconPath_1)
	If $GetItem_binary_path_windows_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "binary_path_windows", $GetItem_binary_path_windows_1)
	If $GetItem_arguments_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "arguments", $GetItem_arguments_1)
	If $GetItem_image_path_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "image_path", $GetItem_image_path_1)
	If $GetItem_launch_type_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "launch_type", $GetItem_launch_type_1)
	If $GetItem_installdir_1 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_2, "installdir", $GetItem_installdir_1)

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "NR", $GetItem_NR_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "name", $GetItem_name_2)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "appid", $GetItem_appid_2)
	If $GetItem_right_now_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "right_now", $GetItem_right_now_2)
	If $GetItem_24h_peak_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "24h_peak", $GetItem_24h_peak_2)
	If $GetItem_all_time_peak_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "all_time_peak", $GetItem_all_time_peak_2)
	If $GetItem_resolutionScale_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "resolutionScale", $GetItem_resolutionScale_2)
	If $GetItem_url_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "url", $GetItem_url_2)
	If $GetItem_IconPath_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "IconPath", $GetItem_IconPath_2)
	If $GetItem_binary_path_windows_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "binary_path_windows", $GetItem_binary_path_windows_2)
	If $GetItem_arguments_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "arguments", $GetItem_arguments_2)
	If $GetItem_image_path_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "image_path", $GetItem_image_path_2)
	If $GetItem_launch_type_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "launch_type", $GetItem_launch_type_2)
	If $GetItem_installdir_2 <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_NR_1, "installdir", $GetItem_installdir_2)

	_Read_from_INI_ADD_2_ListView()
EndFunc   ;==>_RM_Menu_Item_9

Func _RM_Menu_Item11() ; Delete ListView item
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8480) :(' & @MIN & ':' & @SEC & ') _RM_Menu_Item11()' & @CR) ;### Function Trace
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	Local $Combo_State = StringReplace($Combo, 'Steam Library ', '')

	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	$ApplicationList_TEMP = $ApplicationList_INI

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then
			If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
			If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
		EndIf
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
		If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Non_Steam_Appl_INI
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Custom_1_INI
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Custom_2_INI
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Custom_3_INI
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Custom_4_INI

	$listview_TEMP = $listview
	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_TEMP)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $ListView_Item_Array = _GUICtrlListView_GetItemTextArray($listview, $ListView_Selected_Row_Index)
	Local $GameName = $ListView_Item_Array[3]
	Local $GameName_Replaced = StringReplace($GameName, ' ', '_')
	Local $Game_ID = $ListView_Item_Array[2]

	Local $GameNR = $ListView_Selected_Row_Nr
	Local $GameNR_next = $ListView_Selected_Row_Nr + 1
	Local $GetItem_appid_delete = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "appid", "")
	Local $GetItem_appNR_delete = IniRead($ApplicationList_TEMP, "Application_" & $GetItem_appid_delete, "NR", "")

	$GetItem_appid_delete = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $GetItem_appid_delete, "appid", "")
	$GetItem_appNR_delete = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $GetItem_appid_delete, "NR", "")

	IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $GetItem_appNR_delete, "Category_" & $ButtonTAB_State, "")
	IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $GetItem_appid_delete, "Category_" & $ButtonTAB_State, "")

	$GetItem_appid_delete = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $GameNR, "appid", "")
	$GetItem_appNR_delete = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $GetItem_appid_delete, "NR", "")

	IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $GetItem_appNR_delete, "Category_" & $ButtonTAB_State, "")
	IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $GetItem_appid_delete, "Category_" & $ButtonTAB_State, "")


	$GetItem_appid_delete = IniRead($ApplicationList_TEMP, "Application_" & $GameNR, "appid", "")
	$GetItem_appNR_delete = IniRead($ApplicationList_TEMP, "Application_" & $GetItem_appid_delete, "NR", "")

	Local $ApplicationList_NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	Local $GetItem_NR_1 = ""
	Local $GetItem_appid_1 = ""
	Local $GetItem_name_1 = ""
	Local $GetItem_installdir_1 = ""
	Local $GetItem_IconPath_1 = ""
	Local $GetItem_right_now_1 = ""
	Local $GetItem_24h_peak_1 = ""
	Local $GetItem_all_time_peak_1 = ""

	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "NR", $GetItem_NR_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "appid", $GetItem_appid_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "name", $GetItem_name_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "installdir", $GetItem_installdir_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GameNR, "IconPath", $GetItem_IconPath_1)

	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_appid_delete, "NR", $GetItem_NR_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_appid_delete, "appid", $GetItem_appid_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_appid_delete, "name", $GetItem_name_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_appid_delete, "installdir", $GetItem_installdir_1)
	IniWrite($ApplicationList_TEMP, "Application_" & $GetItem_appid_delete, "IconPath", $GetItem_IconPath_1)


	IniWrite($ApplicationList_TEMP, "ApplicationList", "NR_Applications", $ApplicationList_NR_Applications - 1)

	For $Loop_Temp = $GameNR_next To $ApplicationList_NR_Applications
		Local $GameName_before = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "name", "")
		Local $GameName_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "name", "")
		If $GameName_next <> "" Then
			Local $GetItem_NR_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "NR", "")
			Local $GetItem_appid_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "appid", "")
			Local $GetItem_name_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "name", "")
			Local $GetItem_installdir_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "installdir", "")
			Local $GetItem_IconPath_next = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp, "IconPath", "")


			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "NR", $Loop_Temp - 1)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "appid", $GetItem_appid_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "name", $GetItem_name_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "installdir", $GetItem_installdir_next)
			IniWrite($ApplicationList_TEMP, "Application_" & $Loop_Temp - 1, "IconPath", $GetItem_IconPath_next)

		EndIf
		If $Loop_Temp = $ApplicationList_NR_Applications Then
			IniDelete($ApplicationList_TEMP, "Application_" & $GetItem_appid_delete)
			IniDelete($ApplicationList_TEMP, "Application_" & $Loop_Temp)
		EndIf
	Next
	;_Update_ListView_Icons()
	_Read_from_INI_ADD_2_ListView()
EndFunc   ;==>_RM_Menu_Item11
#EndRegion Func RM_Menu

Func _ClickOnListView($hWndGUI, $MsgID, $wParam, $lParam)
	Local $tagNMHDR, $event, $hwndFrom, $code
	$tagNMHDR = DllStructCreate("int;int;int", $lParam)
	If @error Then Return
	$event = DllStructGetData($tagNMHDR, 3)
	If $wParam = $listview Or $wParam = $listview_2 Or $wParam = $listview_3 Or $wParam = $listview_4 Or $wParam = $listview_5 Or $wParam = $listview_6 Then
		If $event = $NM_CLICK Then
			_Change_Preview_Icon_ListView()

			_Update_StatusBar()
		EndIf
		If $event = $NM_DBLCLK Then
			_DB_Click_Listview()
		EndIf
		Local $HL_State = IniRead($Config_INI, "TEMP", "HL_State", "")
		If $HL_State = "take_over_PO" Then
			IniWrite($Config_INI, "TEMP", "HL_State", "")
			_Read_from_INI_ADD_2_ListView()
		EndIf
	EndIf
	$tagNMHDR = 0
	$event = 0
	$lParam = 0
EndFunc   ;==>_ClickOnListView

Func _DB_Click_Listview()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8609) :(' & @MIN & ':' & @SEC & ') _DB_Click_Listview()' & @CR) ;### Function Trace
	Sleep(100)
	_Start_ListView_Selected()
	Sleep(100)
EndFunc   ;==>_DB_Click_Listview

Func _Change_Preview_Icon_ListView()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (8616) :(' & @MIN & ':' & @SEC & ') _Change_Preview_Icon_ListView()' & @CR) ;### Function Trace
	$ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_TEMP)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $Check_AppId = _GUICtrlListView_GetItemText($listview_TEMP, $ListView_Selected_Row_Nr - 1, 1)
	Local $CheckImagePath = $Icons & "steam.app." & $Check_AppId & ".jpg"

	$CheckImagePath = $Icons & "460x215\SS_Values\steam.app." & $Check_AppId & ".jpg"
	If Not FileExists($CheckImagePath) Then $CheckImagePath = $Icons & "460x215\steam.app." & $Check_AppId & ".jpg"
	If Not FileExists($CheckImagePath) Then $CheckImagePath = $Icons & "steam.app." & $Check_AppId & ".jpg"



	If Not FileExists($CheckImagePath) Then
		If $ButtonTAB_State = 1 Then
			If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
			If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_TEMP, "Application_" & $Check_AppId, "IconPath", "")
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_TEMP, "Application_" & $Check_AppId, "image_path", "")
		EndIf

		If $ButtonTAB_State = 2 Then
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Check_AppId, "IconPath", "")
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Check_AppId, "image_path", "")
		EndIf

		If $ButtonTAB_State = 3 Then
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "IconPath", "")
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_Custom_1_INI, "Application_" & $Check_AppId, "image_path", "")
		EndIf

		If $ButtonTAB_State = 4 Then
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "IconPath", "")
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_Custom_2_INI, "Application_" & $Check_AppId, "image_path", "")
		EndIf
		If $ButtonTAB_State = 5 Then
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "IconPath", "")
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_Custom_3_INI, "Application_" & $Check_AppId, "image_path", "")
		EndIf

		If $ButtonTAB_State = 6 Then
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "IconPath", "")
			If Not FileExists($CheckImagePath) Then $CheckImagePath = IniRead($ApplicationList_Custom_4_INI, "Application_" & $Check_AppId, "image_path", "")
		EndIf
	EndIf

	;MsgBox(0, "", $CheckImagePath)

	If $CheckImagePath = "" Or $CheckImagePath = $Icons & "" & ".jpg" Or Not FileExists($CheckImagePath) Then $CheckImagePath = $gfx & "Icon_Preview2.jpg"
	GUICtrlSetImage($Icon_Preview_Image, $CheckImagePath)
EndFunc   ;==>_Change_Preview_Icon_ListView





Func _Checkbox_all()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9118) :(' & @MIN & ':' & @SEC & ') _Checkbox_all()' & @CR) ;### Function Trace
	Local $CheckBox = GUICtrlRead($Checkbox_CreatePage)
	If $CheckBox = "" Then
		GUICtrlSetData($Checkbox_CreatePage, "a")
	Else
		GUICtrlSetData($Checkbox_CreatePage, "")
	EndIf
	_Checkbox_CheckUncheck()
EndFunc   ;==>_Checkbox_all

Func _Checkbox_CheckUncheck()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9129) :(' & @MIN & ':' & @SEC & ') _Checkbox_CheckUncheck()' & @CR) ;### Function Trace
	Local $ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then
			If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
			If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
		EndIf
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
	If $ButtonTAB_State = "3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
	If $ButtonTAB_State = "4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
	If $ButtonTAB_State = "5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
	If $ButtonTAB_State = "6" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"

	Local $Status_Checkbox = GUICtrlRead($Checkbox_CreatePage)

	If $Status_Checkbox = "a" Then
		_GUICtrlListView_SetItemChecked($listview_TEMP, -1)
	EndIf

	If $Status_Checkbox <> "a" Then
		Local $NR_GameNames = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")
		For $LOOP_Checkbox = 0 To $NR_GameNames
			_GUICtrlListView_SetItemChecked($listview_TEMP, $LOOP_Checkbox, False)
		Next
	EndIf
EndFunc   ;==>_Checkbox_CheckUncheck


Func _Button_Add_to_Custom()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9472) :(' & @MIN & ':' & @SEC & ') _Button_Add_to_Custom()' & @CR) ;### Function Trace
	Local $ButtonTAB_State = IniRead($Config_INI, "Settings", "ButtonTAB_State", "")
	Local $Status_Combo_Add_to_Custom = GUICtrlRead($Combo_Add_to_Custom)
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	If $Combo = "" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"

	If $ButtonTAB_State = "1" Then $listview_TEMP = $listview
	If $ButtonTAB_State = "2" Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = "3" Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = "4" Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = "5" Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = "6" Then $listview_TEMP = $listview_6

	If $ButtonTAB_State = "1" Then
		If $Combo = "ALL" Then
			If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
			If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_SteamLibrary_ALL_INI
		EndIf
		If $Combo = "Steam Library 1" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini"
		If $Combo = "Steam Library 2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini"
		If $Combo = "Steam Library 3" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini"
		If $Combo = "Steam Library 4" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini"
		If $Combo = "Steam Library 5" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini"
	EndIf

	If $ButtonTAB_State = "2" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"


	If $Status_Combo_Add_to_Custom <> "Choose TAB" Then
		Local $ButtonTAB_State_0 = GUICtrlRead($ButtonTAB_Favorites)
		Local $ButtonTAB_State_1 = GUICtrlRead($ButtonTAB_Custom_1)
		Local $ButtonTAB_State_2 = GUICtrlRead($ButtonTAB_Custom_2)
		Local $ButtonTAB_State_3 = GUICtrlRead($ButtonTAB_Custom_3)
		Local $ButtonTAB_State_4 = GUICtrlRead($ButtonTAB_Custom_4)

		Local $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"

		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_0 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_1 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_2 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_3 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_4 Then $ApplicationList_target = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"

		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_0 Then $Category_NR = 2
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_1 Then $Category_NR = 3
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_2 Then $Category_NR = 4
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_3 Then $Category_NR = 5
		If $Status_Combo_Add_to_Custom = $ButtonTAB_State_4 Then $Category_NR = 6

		Global $NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")
		Local $LastAppNR = IniRead($ApplicationList_target, "ApplicationList", "NR_Applications", "")
		Local $NewAppNR = $LastAppNR + 1

		For $NR = 1 To $NR_Applications
			If _GUICtrlListView_GetItemChecked($listview_TEMP, $NR - 1) Then
				Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR, "NR", "")
				Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR, "name", "")
				Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")

				If $Category_NR <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $NR, "Category_" & $Category_NR, "X")
				If $Category_NR <> "" Then IniWrite($ApplicationList_TEMP, "Application_" & $Application_appid, "Category_" & $Category_NR, "X")

				IniWrite($ApplicationList_target, "ApplicationList", "NR_Applications", $NewAppNR)
				IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "NR", $NewAppNR)
				IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "name", $Application_name)
				IniWrite($ApplicationList_target, "Application_" & $NewAppNR, "appid", $Application_appid)

				IniWrite($ApplicationList_target, "ApplicationList", "NR_Applications", $NewAppNR)
				IniWrite($ApplicationList_target, "Application_" & $Application_appid, "NR", $NewAppNR)
				IniWrite($ApplicationList_target, "Application_" & $Application_appid, "name", $Application_name)
				IniWrite($ApplicationList_target, "Application_" & $Application_appid, "appid", $Application_appid)

				IniWrite($ApplicationList_target, "ApplicationList", "NR_Applications", $NewAppNR)

				$NewAppNR = $NewAppNR + 1
			Else

			EndIf
		Next
	EndIf
	_Read_from_INI_ADD_2_ListView()
EndFunc   ;==>_Button_Add_to_Custom

Func _Button_HomeLoaderSettings()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9554) :(' & @MIN & ':' & @SEC & ') _Button_HomeLoaderSettings()' & @CR) ;### Function Trace
	If Not WinExists("HomeLoader - SteamVR Start Settings") Then
		;_Settings_GUI()
	EndIf
EndFunc   ;==>_Button_HomeLoaderSettings

Func _Start_ListView_Selected()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9561) :(' & @MIN & ':' & @SEC & ') _Start_ListView_Selected()' & @CR) ;### Function Trace
	$listview_TEMP = $listview
	If $ButtonTAB_State = 1 Then $listview_TEMP = $listview
	If $ButtonTAB_State = 2 Then $listview_TEMP = $listview_2
	If $ButtonTAB_State = 3 Then $listview_TEMP = $listview_3
	If $ButtonTAB_State = 4 Then $listview_TEMP = $listview_4
	If $ButtonTAB_State = 5 Then $listview_TEMP = $listview_5
	If $ButtonTAB_State = 6 Then $listview_TEMP = $listview_6

	Local $ListView_Selected_Row_Index = _GUICtrlListView_GetSelectedIndices($listview_TEMP)
	$ListView_Selected_Row_Index = Int($ListView_Selected_Row_Index)
	Local $ListView_Selected_Row_Nr = $ListView_Selected_Row_Index + 1

	Local $Check_AppId = _GUICtrlListView_GetItemText($listview_TEMP, $ListView_Selected_Row_Nr - 1, 1)
	Local $StringLeft_Check_AppID = StringLeft($Check_AppId, 9)
	Local $StringTrimLeft_Check_AppID = StringTrimLeft($Check_AppId, 9)
	Local $StringLeft_Check_HL = StringLeft($Check_AppId, 5)
	Local $StringLeft_Check_Revive = StringLeft($Check_AppId, 11)

	Local $Viveport_binary_path_windows = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_vive.htc." & $StringTrimLeft_Check_AppID, "binary_path_windows", "")
	If $ScanOnlyVR = "true" Then $Viveport_binary_path_windows = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "Application_vive.htc." & $StringTrimLeft_Check_AppID, "binary_path_windows", "")
	;MsgBox(0, "1", "Application_vive.htc." & $StringTrimLeft_Check_AppID)

	Local $Revive_ShellExecute = $Revive_Path & "Revive\ReviveInjector_x64.exe"

	If $Check_AppId <> "" Then
		If $StringLeft_Check_AppID = "vive.htc." Then
			If Not ProcessExists("Vive.exe") Then
				If FileExists($Viveport_binary_path_windows) Then
					ShellExecute($Viveport_binary_path_windows, "", "")
				Else
					If FileExists($HTCVive_Path & "PCClient\Vive.exe") Then
						ShellExecute($HTCVive_Path & "PCClient\Vive.exe")
						Do
							Sleep(1000)
						Until ProcessExists("Vive.exe")
						Sleep(1000)
					EndIf
				EndIf
			Else
				ShellExecute("vive://runapp/" & $StringTrimLeft_Check_AppID)
			EndIf
		Else
			$StringLeft_Check_AppID = StringLeft($Check_AppId, 11)
			$StringTrimLeft_Check_AppID = StringTrimLeft($Check_AppId, 11)
			If $StringLeft_Check_AppID = "revive.app." Then
				;_Start_Revive_Oculus_App()
			Else
				ShellExecute("steam://rungameid/" & $Check_AppId & "/VR")
			EndIf
		EndIf

		If $StringLeft_Check_HL = "HLNSG" Then
			Local $HLNSG_installdir = IniRead($ApplicationList_Non_Steam_Appl_INI, "Application_" & $Check_AppId, "installdir", "")
			ShellExecute($HLNSG_installdir)
		EndIf

		If $StringLeft_Check_Revive = "revive.app." Then
			ShellExecute($Install_DIR & "WebPage\Revive\" & $Check_AppId & ".bat")
		EndIf

		Sleep(200)
		;_Beenden()
	EndIf
EndFunc   ;==>_Start_ListView_Selected

Func _Combo_SteamLibrary()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9628) :(' & @MIN & ':' & @SEC & ') _Combo_SteamLibrary()' & @CR) ;### Function Trace
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"
	IniWrite($Config_INI, "Settings", "Steam_Library", $Combo)
	FileDelete($ApplicationList_INI)

	If $Combo = "Steam Library 1" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_1.ini") Then
		$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
		If $Install_Folder_Steam_1 <> "" Then
			_Read_from_INI_ADD_2_ListView()
		Else
			MsgBox($MB_ICONWARNING, "Attention!", "Steam Library Folder 1 is empty." & @CRLF & "Go to settings menu and enter the path to Steam Library 1")
			;GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")
			_HLL_Settings_GUI()
		EndIf
	EndIf

	If $Combo = "Steam Library 2" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_2.ini") Then
		$Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
		If $Install_Folder_Steam_2 <> "" Then
			_Read_from_INI_ADD_2_ListView()
		Else
			MsgBox($MB_ICONWARNING, "Attention!", "Steam Library Folder 2 is empty." & @CRLF & "Go to settings menu and enter the path to Steam Library 2")
			;GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")
			_HLL_Settings_GUI()
		EndIf
	EndIf

	If $Combo = "Steam Library 3" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_3.ini") Then
		$Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
		If $Install_Folder_Steam_3 <> "" Then
			_Read_from_INI_ADD_2_ListView()
		Else
			MsgBox($MB_ICONWARNING, "Attention!", "Steam Library Folder 3 is empty." & @CRLF & "Go to settings menu and enter the path to Steam Library 3.")
			;GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")
			_HLL_Settings_GUI()
		EndIf
	EndIf

	If $Combo = "Steam Library 4" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_4.ini") Then
		$Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
		If $Install_Folder_Steam_4 <> "" Then
			_Read_from_INI_ADD_2_ListView()
		Else
			MsgBox($MB_ICONWARNING, "Attention!", "Steam Library Folder 4 is empty." & @CRLF & "Go to settings menu and enter the path to Steam Library 4")
			;GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")
			_HLL_Settings_GUI()
		EndIf
	EndIf

	If $Combo = "Steam Library 5" And Not FileExists($ApplicationList_Folder & "ApplicationList_SteamLibrary_5.ini") Then
		$Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")
		If $Install_Folder_Steam_5 <> "" Then
			_Read_from_INI_ADD_2_ListView()
		Else
			MsgBox($MB_ICONWARNING, "Attention!", "Steam Library Folder 5 is empty." & @CRLF & "Go to settings menu and enter the path to Steam Library 5.ini")
			;GUICtrlSetData($Combo_SteamLibrary, "Steam Library 1")
			_HLL_Settings_GUI()
		EndIf
	EndIf
	_Read_from_INI_ADD_2_ListView()
	GUICtrlSetData($Checkbox_CreatePage, "")
EndFunc   ;==>_Combo_SteamLibrary




Func _ButtonTAB_Steam_Library()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9703) :(' & @MIN & ':' & @SEC & ') _ButtonTAB_Steam_Library()' & @CR) ;### Function Trace
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Steam_Library)
	IniWrite($Config_INI, "Settings", "ButtonTAB_State", "1")
	FileDelete($ApplicationList_INI)
	_GUICtrlListView_DeleteAllItems($listview)
	GUICtrlSetState($listview, $GUI_SHOW)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)

	GUICtrlSetStyle($ButtonTAB_Favorites, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_1, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_2, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_3, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_4, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetBkColor($ButtonTAB_Steam_Library, 0xB0C4DE)
	GUICtrlSetColor($ButtonTAB_Steam_Library, 0x00008B)

	_Read_from_INI_ADD_2_ListView()
EndFunc   ;==>_ButtonTAB_Steam_Library

Func _ButtonTAB_Non_Steam_Appl()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9727) :(' & @MIN & ':' & @SEC & ') _ButtonTAB_Non_Steam_Appl()' & @CR) ;### Function Trace
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Favorites)
	IniWrite($Config_INI, "Settings", "ButtonTAB_State", "2")
	_GUICtrlListView_DeleteAllItems($listview_2)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_SHOW)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)

	GUICtrlSetStyle($ButtonTAB_Steam_Library, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_1, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_2, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_3, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_4, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetBkColor($ButtonTAB_Favorites, 0xB0C4DE)
	GUICtrlSetColor($ButtonTAB_Favorites, 0x00008B)

	_Read_from_INI_ADD_2_ListView()
EndFunc   ;==>_ButtonTAB_Non_Steam_Appl

Func _ButtonTAB_Custom_1()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9750) :(' & @MIN & ':' & @SEC & ') _ButtonTAB_Custom_1()' & @CR) ;### Function Trace
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_1)
	IniWrite($Config_INI, "Settings", "ButtonTAB_State", "3")
	_GUICtrlListView_DeleteAllItems($listview_3)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_SHOW)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)

	GUICtrlSetStyle($ButtonTAB_Steam_Library, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Favorites, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_2, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_3, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_4, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetBkColor($ButtonTAB_Custom_1, 0xB0C4DE)
	GUICtrlSetColor($ButtonTAB_Custom_1, 0x00008B)

	_Read_from_INI_ADD_2_ListView()
EndFunc   ;==>_ButtonTAB_Custom_1

Func _ButtonTAB_Custom_2()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9773) :(' & @MIN & ':' & @SEC & ') _ButtonTAB_Custom_2()' & @CR) ;### Function Trace
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_2)
	IniWrite($Config_INI, "Settings", "ButtonTAB_State", "4")
	_GUICtrlListView_DeleteAllItems($listview_4)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_SHOW)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_HIDE)

	GUICtrlSetStyle($ButtonTAB_Steam_Library, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Favorites, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_1, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_3, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_4, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetBkColor($ButtonTAB_Custom_2, 0xB0C4DE)
	GUICtrlSetColor($ButtonTAB_Custom_2, 0x00008B)

	_Read_from_INI_ADD_2_ListView()
EndFunc   ;==>_ButtonTAB_Custom_2

Func _ButtonTAB_Custom_3()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9796) :(' & @MIN & ':' & @SEC & ') _ButtonTAB_Custom_3()' & @CR) ;### Function Trace
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_3)
	IniWrite($Config_INI, "Settings", "ButtonTAB_State", "5")
	_GUICtrlListView_DeleteAllItems($listview_5)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_SHOW)
	GUICtrlSetState($listview_6, $GUI_HIDE)

	GUICtrlSetStyle($ButtonTAB_Steam_Library, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Favorites, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_1, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_2, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_4, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetBkColor($ButtonTAB_Custom_3, 0xB0C4DE)
	GUICtrlSetColor($ButtonTAB_Custom_3, 0x00008B)

	_Read_from_INI_ADD_2_ListView()
EndFunc   ;==>_ButtonTAB_Custom_3

Func _ButtonTAB_Custom_4()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (9819) :(' & @MIN & ':' & @SEC & ') _ButtonTAB_Custom_4()' & @CR) ;### Function Trace
	$ButtonTAB_State = GUICtrlRead($ButtonTAB_Custom_4)
	IniWrite($Config_INI, "Settings", "ButtonTAB_State", "6")
	_GUICtrlListView_DeleteAllItems($listview_6)
	GUICtrlSetState($listview, $GUI_HIDE)
	GUICtrlSetState($listview_2, $GUI_HIDE)
	GUICtrlSetState($listview_3, $GUI_HIDE)
	GUICtrlSetState($listview_4, $GUI_HIDE)
	GUICtrlSetState($listview_5, $GUI_HIDE)
	GUICtrlSetState($listview_6, $GUI_SHOW)

	GUICtrlSetStyle($ButtonTAB_Steam_Library, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Favorites, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_1, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_2, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetStyle($ButtonTAB_Custom_3, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetBkColor($ButtonTAB_Custom_4, 0xB0C4DE)
	GUICtrlSetColor($ButtonTAB_Custom_4, 0x00008B)

	_Read_from_INI_ADD_2_ListView()
EndFunc   ;==>_ButtonTAB_Custom_4




Func _Button_ReScan_Steam_Library() ; Scan Button
	Local $Timer = TimerInit()
	IniWrite($Config_INI, "TEMP", "Scan_Duration", "Scanning...")

	If WinExists($AppName_Window_Main_GUI) Then _Loading_GUI()

	If WinExists($AppName_Window_Main_GUI) Then GUICtrlSetData($Anzeige_Fortschrittbalken, 10)

	If $ScanOnlyVR <> "true" Then

		Global $Array_Library[1][1] = [["appid"]]
		Local $NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
		For $Loop_Library = 1 To $NR_Applications
			Local $appid_Library_Array = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_Library, "appid", "")
			$Array_Result = _ArrayAdd($Array_Library, $appid_Library_Array)
			If @error Then
				$ScriptLineNumber_Temp = @ScriptLineNumber
				$AtError_Result = @error
			EndIf
			If $AtError_Result <> "" Or $Array_Result = -1 Then _ArrayAdd_Error_Handler()
		Next

		_Scan_SteamLibrary_ALL()
		If WinExists($AppName_Window_Main_GUI) Then GUICtrlSetData($Anzeige_Fortschrittbalken, 30)

		Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
		;If WinExists($AppName_Window_Main_GUI) Then _GUICtrlStatusBar_SetText($Statusbar, "Rescan of all Libraries finished." & @TAB & "Apps: " & $ApplicationList_NR_TEMP & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")
	Else
		Global $Array_Library[1][1] = [["appid"]]
		Local $NR_Applications = IniRead($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
		For $Loop_Library = 1 To $NR_Applications
			Local $appid_Library_Array = IniRead($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_Library, "appid", "")
			$Array_Result = _ArrayAdd($Array_Library, $appid_Library_Array)
			If @error Then
				$ScriptLineNumber_Temp = @ScriptLineNumber
				$AtError_Result = @error
			EndIf
			If $AtError_Result <> "" Or $Array_Result = -1 Then _ArrayAdd_Error_Handler()
		Next

		_Read_steamapps_vrmanifest()
		If WinExists($AppName_Window_Main_GUI) Then GUICtrlSetData($Anzeige_Fortschrittbalken, 30)

		Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
		;If WinExists($AppName_Window_Main_GUI) Then _GUICtrlStatusBar_SetText($Statusbar, "Rescan of the VR Libraries finished." & @TAB & "Apps: " & $ApplicationList_NR_TEMP & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")
	EndIf

	If $ScanVIVEApps = "true" Then
		If FileExists($Steam_AppConfig_Json) Then
			If WinExists($AppName_Window_Main_GUI) Then _GUICtrlStatusBar_SetText($Statusbar, "Scan of the Vivveport Library" & @TAB & "Apps: " & $ApplicationList_NR_TEMP & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")
			_ScanViveData()
		EndIf
	EndIf

	If WinExists($AppName_Window_Main_GUI) Then GUICtrlSetData($Anzeige_Fortschrittbalken, 45)

	If $ScanOculusApps = "true" Then
		If FileExists($Revive_revive_vrmanifest_FilePath) Then
			If WinExists($AppName_Window_Main_GUI) Then _GUICtrlStatusBar_SetText($Statusbar, "Scan of the Oculus Library" & @TAB & "Apps: " & $ApplicationList_NR_TEMP & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")
			_ScanOculusData()
		EndIf
	EndIf

	If WinExists($AppName_Window_Main_GUI) Then GUICtrlSetData($Anzeige_Fortschrittbalken, 60)

	If $Create_HTML_GamePage = "true" Then
		If WinExists($AppName_Window_Main_GUI) Then _GUICtrlStatusBar_SetText($Statusbar, "" & "Creating HTML Game Page Menu..." & @TAB & "" & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")
		_Create_GamePage_Menu_Page()
		If WinExists($AppName_Window_Main_GUI) Then GUICtrlSetData($Anzeige_Fortschrittbalken, 67)
		If WinExists($AppName_Window_Main_GUI) Then _GUICtrlStatusBar_SetText($Statusbar, "" & "Creating HTML Game Pages..." & @TAB & "" & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")
		_Create_GamePages()
		If WinExists($AppName_Window_Main_GUI) Then GUICtrlSetData($Anzeige_Fortschrittbalken, 75)
	EndIf

	If $Create_WMR_Shortcut_Files = "true" Then
		If WinExists($AppName_Window_Main_GUI) Then _GUICtrlStatusBar_SetText($Statusbar, "" & "Creating WMR Shortcut Files..." & @TAB & "" & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")
		_Create_WMR_Startmenu_Files()
		If WinExists($AppName_Window_Main_GUI) Then GUICtrlSetData($Anzeige_Fortschrittbalken, 90)
	EndIf


	If WinExists($AppName_Window_Main_GUI) Then _GUICtrlStatusBar_SetText($Statusbar, "" & "Synchronizing Icons..." & @TAB & "" & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")
	_Sync_Icons()
	If WinExists($AppName_Window_Main_GUI) Then GUICtrlSetData($Anzeige_Fortschrittbalken, 95)

	If WinExists($AppName_Window_Main_GUI) Then _GUICtrlStatusBar_SetText($Statusbar, "" & "Synchronizing Categories..." & @TAB & "" & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")
	Sync_Categories_after_Scan()
	If WinExists($AppName_Window_Main_GUI) Then GUICtrlSetData($Anzeige_Fortschrittbalken, 100)

	Local $TimerDiff = TimerDiff($Timer)
	Local $sec = Round(($TimerDiff / 1000), 2) ; sec
	Local $min = Round(($sec / 60), 2) ; min
	Local $TimerDiff_temp = $sec & " seconds"
	If $sec > 60 Then $TimerDiff_temp = $min & " minutes"

	IniWrite($Config_INI, "TEMP", "Scan_Duration", $TimerDiff_temp)

	If WinExists($AppName_Window_Main_GUI) Then
		GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
		Sleep(500)
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Scan finished in " & $TimerDiff_temp & " " & "")
		_GUICtrlStatusBar_SetText($Statusbar, "" & "Scan finished in " & $TimerDiff_temp & " " & "" & @TAB & "" & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")
		GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
		GUIDelete($GUI_Loading)
		_Restart()
	EndIf
EndFunc   ;==>_Button_ReScan_Steam_Library

Func _Button_More_Scan_Options()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10098) :(' & @MIN & ':' & @SEC & ') _Button_More_Scan_Options()' & @CR) ;### Function Trace
	If Not WinExists("HomeLoader - Settings") Then
		_HLL_Settings_GUI()
	Else
		;MsgBox(0, "Window Exist Check", "Settings Window Exists.")
		;_HLL_Settings_GUI()
	EndIf
EndFunc   ;==>_Button_More_Scan_Options


Func _Scan_SteamLibrary_ALL()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10106) :(' & @MIN & ':' & @SEC & ') _Scan_SteamLibrary_ALL()' & @CR) ;### Function Trace
	;Local $Combo = GUICtrlRead($Combo_SteamLibrary)
	Local $Combo = "ALL"

	If $Combo = "ALL" Then
		If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)

		If $Install_Folder_Steam_1 <> "" Then $NR_temp3 = 1
		If $Install_Folder_Steam_2 <> "" Then $NR_temp3 = 2
		If $Install_Folder_Steam_3 <> "" Then $NR_temp3 = 3
		If $Install_Folder_Steam_4 <> "" Then $NR_temp3 = 4
		If $Install_Folder_Steam_5 <> "" Then $NR_temp3 = 5
		If $NR_temp3 = "" Then $NR_temp3 = 1

		For $NR_Library = 1 To $NR_temp3
			$NR_Library_temp = $NR_Library
			_Search_Files()
			;Sleep(500)
		Next
		$NR_Library_temp = ""
		;_GUICtrlListView_DeleteAllItems($listview)
		Local $SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')
		If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini")

		If $Sort_Alphabetical_order = "true" Then
			_Sort_ApplicationList_ALL()
		Else
			FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
		EndIf
	EndIf

	If $Combo <> "ALL" Then
		If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
		_Search_Files()
		;_GUICtrlListView_DeleteAllItems($listview)
		$SteamLibrary_NR = StringReplace($Combo, 'Steam Library ', '')
		If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini")

		If $Sort_Alphabetical_order = "true" Then
			_Sort_ApplicationList_ALL()
		Else
			FileCopy($ApplicationList_INI, $ApplicationList_Folder & "ApplicationList_SteamLibrary_" & $SteamLibrary_NR & ".ini", $FC_OVERWRITE + $FC_CREATEPATH)
		EndIf
		;Sleep(500)
		;GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
	EndIf

	_GUICtrlStatusBar_SetText($Statusbar, "Rescan of the Libraries finished." & @TAB & "Apps: " & $NR_Applications & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")
EndFunc   ;==>_Scan_SteamLibrary_ALL

Func _Sort_ApplicationList_ALL()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10162) :(' & @MIN & ':' & @SEC & ') _Sort_ApplicationList_ALL()' & @CR) ;### Function Trace
	Global $Array_Sorted[1][6] = [["name", "appid", "right_now", "24h_peak", "all_time_peak", "resolutionScale"]]
	Local $NR_Applications = IniRead($ApplicationList_INI, "ApplicationList", "NR_Applications", "")

	For $Loop_1 = 1 To $NR_Applications
		Local $appid = IniRead($ApplicationList_INI, "Application_" & $Loop_1, "appid", "")
		Local $name = IniRead($ApplicationList_INI, "Application_" & $Loop_1, "name", "")
		Local $right_now = IniRead($ApplicationList_INI, "Application_" & $Loop_1, "right_now", "")
		Local $24h_peak = IniRead($ApplicationList_INI, "Application_" & $Loop_1, "24h_peak", "")
		Local $all_time_peak = IniRead($ApplicationList_INI, "Application_" & $Loop_1, "all_time_peak", "")
		Local $resolutionScale = IniRead($ApplicationList_INI, "Application_" & $Loop_1, "resolutionScale", "")

		Local $sFill = $name & "|" & $appid & "|" & $right_now & "|" & $24h_peak & "|" & $all_time_peak & "|" & $resolutionScale
		$Array_Result = _ArrayAdd($Array_Sorted, $sFill)
		If @error Then
			$ScriptLineNumber_Temp = @ScriptLineNumber
			$AtError_Result = @error
		EndIf
		If $AtError_Result <> "" Or $Array_Result = -1 Then _ArrayAdd_Error_Handler()
	Next

	_ArraySort($Array_Sorted, 0, 1, 0, 0)
	If FileExists($ApplicationList_SteamLibrary_ALL_INI) Then FileDelete($ApplicationList_SteamLibrary_ALL_INI)

	For $Loop_2 = 1 To $NR_Applications
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "ApplicationList", "NR_Applications", $Loop_2)
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_2, "NR", $Loop_2)
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_2, "name", $Array_Sorted[$Loop_2][0])
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_2, "appid", $Array_Sorted[$Loop_2][1])
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_2, "right_now", $Array_Sorted[$Loop_2][2])
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_2, "24h_peak", $Array_Sorted[$Loop_2][3])
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_2, "all_time_peak", $Array_Sorted[$Loop_2][4])
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Loop_2, "resolutionScale", $Array_Sorted[$Loop_2][5])

		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Array_Sorted[$Loop_2][1], "NR", $Loop_2)
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Array_Sorted[$Loop_2][1], "name", $Array_Sorted[$Loop_2][0])
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Array_Sorted[$Loop_2][1], "appid", $Array_Sorted[$Loop_2][1])
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Array_Sorted[$Loop_2][1], "right_now", $Array_Sorted[$Loop_2][2])
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Array_Sorted[$Loop_2][1], "24h_peak", $Array_Sorted[$Loop_2][3])
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Array_Sorted[$Loop_2][1], "all_time_peak", $Array_Sorted[$Loop_2][4])
		IniWrite($ApplicationList_SteamLibrary_ALL_INI, "Application_" & $Array_Sorted[$Loop_2][1], "resolutionScale", $Array_Sorted[$Loop_2][5])
	Next
EndFunc   ;==>_Sort_ApplicationList_ALL

Func _ScanViveData()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10207) :(' & @MIN & ':' & @SEC & ') _ScanViveData()' & @CR) ;### Function Trace

	Local $name_TEMP = "", $NR_TEMP = "", $url_TEMP = "", $appid_TEMP = "", $IconPath_TEMP = "", $binary_path_windows_TEMP = ""
	Global $Viveport_Array_Sorted[1][6] = [["name", "NR", "url", "appid", "IconPath", "binary_path_windows"]]

	Local $NR_LINES_TEMP = _FileCountLines($Steam_AppConfig_Json)

	If $ScanOnlyVR = "true" Then
		$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
	Else
		$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
	EndIf

	For $Loop = 3 To $NR_LINES_TEMP
		Local $Value = FileReadLine($Steam_AppConfig_Json, $Loop)
		Local $Value_1 = StringReplace($Value, '"', '')
		Local $Value_2 = StringReplace($Value_1, ',', '')
		Local $Value_3 = StringRight($Value_2, 15)
		Local $Value_Path = StringLeft($Value_2, StringLen($Value_2) - 15)
		Local $Value_Path_StringReplace_temp = StringReplace($Value_Path, '\\', '\')
		Local $Value_Path_StringReplace = StringReplace($Value_Path_StringReplace_temp, ' ', '')

		If $Value_3 = "app.vrmanifest" Or $Value_3 = "\app.vrmanifest" Then
			Local $Value_2_1 = StringReplace($Value_2, '\\', '\')
			Local $Value_2_2 = StringReplace($Value_2_1, ' ', '')
			Local $Value_AppVRmanifest_1 = FileRead($Value_2_2)
			Local $Value_AppVRmanifest_2 = StringTrimLeft($Value_AppVRmanifest_1, 35)

			Local $StringSplit_Value = StringSplit($Value_AppVRmanifest_2, ",")
			If @error Then
				;$Array_Result = $aArray
				$ScriptLineNumber_Temp = @ScriptLineNumber
				$AtError_Result = @error
				_StringSplit_Error_Handler()
			EndIf
			Local $Application_NR_new = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "") + 1

			Local $NR_TEMP = $Application_NR_new

			For $i = 1 To $StringSplit_Value[0]
				Local $StringSplit_Value_2 = StringSplit($StringSplit_Value[$i], ":")
				If @error Then
					;$Array_Result = $aArray
					$ScriptLineNumber_Temp = @ScriptLineNumber
					$AtError_Result = @error
					_StringSplit_Error_Handler()
				EndIf
				Local $StringSplit_Value_2_1 = StringReplace($StringSplit_Value_2[1], '"', '')
				Local $StringSplit_Value_2_1_1 = StringReplace($StringSplit_Value_2_1, '[', '')
				Local $StringSplit_Value_2_1_2 = StringReplace($StringSplit_Value_2_1_1, '{', '')

				If $StringSplit_Value_2_1_2 = "url" Then
					Local $StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[2], '"', '')
					Local $StringSplit_Value_2_3 = StringReplace($StringSplit_Value_2[3], '"', '')
					Local $StringSplit_Value_2_4 = $StringSplit_Value_2_2 & ":" & $StringSplit_Value_2_3
					Local $url_TEMP = $StringSplit_Value_2_4
				EndIf

				If $StringSplit_Value_2_1_2 = "app_key" Then ; appid
					Local $StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[2], '"', '')
					Local $Application_appid_TEMP = $StringSplit_Value_2_2
					$appid_TEMP = $StringSplit_Value_2_2
				EndIf

				If $StringSplit_Value_2_1_2 = "strings" Then ; NAME
					$StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[4], '"', '')
					Local $name_TEMP = $StringSplit_Value_2_2
				EndIf

				If $StringSplit_Value_2_1_2 = "launch_type" Then
					$StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[2], '"', '')
				EndIf

				If $StringSplit_Value_2_1_2 = "image_path" Then
					$StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[2], '"', '')
					Local $Value_image_path = $Value_Path_StringReplace & $StringSplit_Value_2_2
					Local $IconPath_TEMP = $Value_image_path
					If Not FileExists($Icons & "steam.app." & $Application_appid_TEMP & ".jpg") Or $DeleteHomeLoaderLibraryData = "true" Then
						Local $Download_Icon_path_1_jpg = $Icons & "steam.app." & $Application_appid_TEMP & ".jpg"
						Local $Download_Icon_path_2_jpg = $Icons & "460x215\steam.app." & $Application_appid_TEMP & ".jpg"
						Local $Download_Icon_path_3_jpg = $Icon_Folder_1 & "steam.app." & $Application_appid_TEMP & ".jpg"
						Local $Download_Icon_path_4_jpg = $Icon_Folder_2 & "steam.app." & $Application_appid_TEMP & ".jpg"
						Local $Download_Icon_path_5_jpg = $Icon_Folder_3 & "steam.app." & $Application_appid_TEMP & ".jpg"
						Local $Download_Icon_path_6_jpg = $Icon_Folder_4 & "steam.app." & $Application_appid_TEMP & ".jpg"
						Local $Download_Icon_path_7_jpg = $Icon_Folder_5 & "steam.app." & $Application_appid_TEMP & ".jpg"

						If Not FileExists($Download_Icon_path_1_jpg) Or $DeleteHomeLoaderLibraryData = "true" Then
							FileCopy($Value_image_path, $Download_Icon_path_1_jpg, $FC_OVERWRITE + $FC_CREATEPATH)
						EndIf
					EndIf
					Local $ListView_Icon_Path = $Icons & "32x32\" & "steam.app." & $Application_appid_TEMP & ".bmp"
					If Not FileExists($ListView_Icon_Path) Or $DeleteHomeLoaderLibraryData = "true" Then
						FileCopy($gfx & "Icon_Preview_Viveport_32x32.bmp", $ListView_Icon_Path, $FC_OVERWRITE + $FC_CREATEPATH)
					EndIf
				EndIf

				If $StringSplit_Value_2_1_2 = "is_dashboard_overlay" Then
					$StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[2], '"', '')
				EndIf

				If $StringSplit_Value_2_1_2 = "arguments" Then
					$StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[2], '"', '')
				EndIf

				If $StringSplit_Value_2_1_2 = "binary_path_windows" Then
					$StringSplit_Value_2_2 = StringReplace($StringSplit_Value_2[2], '"', '')
					Local $StringSplit_Value_2_2_1 = StringReplace($StringSplit_Value_2_2, ']', '')
					Local $StringSplit_Value_2_2_2 = StringReplace($StringSplit_Value_2_2_1, '}', '')
					Local $StringSplit_Value_2_2_3 = $Value_Path_StringReplace & $StringSplit_Value_2_2_2
					Local $binary_path_windows_TEMP = $StringSplit_Value_2_2_3
				EndIf
			Next

			Local $sFill = $name_TEMP & "|" & $NR_TEMP & "|" & $url_TEMP & "|" & $appid_TEMP & "|" & $IconPath_TEMP & "|" & $binary_path_windows_TEMP
			If $appid_TEMP <> "" Then
				$Array_Result = _ArrayAdd($Viveport_Array_Sorted, $sFill)
				If @error Then
					$ScriptLineNumber_Temp = @ScriptLineNumber
					$AtError_Result = @error
				EndIf
				If $AtError_Result <> "" Or $Array_Result = -1 Then _ArrayAdd_Error_Handler()
			EndIf
			;GUICtrlSetData($Anzeige_Fortschrittbalken, $Loop * 100 / $NR_LINES_TEMP)

			If WinExists($AppName_Window_Main_GUI) Then
				_GUICtrlStatusBar_SetText($Statusbar, "" & "Scan Viveport: " & "Nr: " & $NR_TEMP & " - " & "Name: " & $name_TEMP & " - " & "SteamAppID: " & $appid_TEMP & @TAB & "" & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")
			EndIf

			$NR_TEMP = $NR_TEMP + 1
			$name_TEMP = ""
			$NR_TEMP = ""
			$url_TEMP = ""
			$appid_TEMP = ""
			$IconPath_TEMP = ""
			$binary_path_windows_TEMP = ""
		EndIf

	Next

	;_ArrayDisplay($Viveport_Array_Sorted)

	If $Sort_Alphabetical_order = "true" Then
		_ArraySort($Viveport_Array_Sorted, 0, 1, 0, 0)
	EndIf

	Local $NR_Game = UBound($Viveport_Array_Sorted) - 1
	;MsgBox(0, "$NR_Game", $NR_Game)

	For $Loop_1 = 1 To $NR_Game
		Local $Application_NR_new = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "") + 1

		IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "NR", $Application_NR_new)
		IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "url", $Viveport_Array_Sorted[$Loop_1][2])
		IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "appid", $Viveport_Array_Sorted[$Loop_1][3])
		IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "name", $Viveport_Array_Sorted[$Loop_1][0])
		IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "IconPath", $Viveport_Array_Sorted[$Loop_1][4])
		IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "binary_path_windows", $Viveport_Array_Sorted[$Loop_1][5])

		IniWrite($ApplicationList_TEMP, "Application_" & $Viveport_Array_Sorted[$Loop_1][3], "NR", $Application_NR_new)
		IniWrite($ApplicationList_TEMP, "Application_" & $Viveport_Array_Sorted[$Loop_1][3], "url", $Viveport_Array_Sorted[$Loop_1][2])
		IniWrite($ApplicationList_TEMP, "Application_" & $Viveport_Array_Sorted[$Loop_1][3], "appid", $Viveport_Array_Sorted[$Loop_1][3])
		IniWrite($ApplicationList_TEMP, "Application_" & $Viveport_Array_Sorted[$Loop_1][3], "name", $Viveport_Array_Sorted[$Loop_1][0])
		IniWrite($ApplicationList_TEMP, "Application_" & $Viveport_Array_Sorted[$Loop_1][3], "IconPath", $Viveport_Array_Sorted[$Loop_1][4])
		IniWrite($ApplicationList_TEMP, "Application_" & $Viveport_Array_Sorted[$Loop_1][3], "binary_path_windows", $Viveport_Array_Sorted[$Loop_1][5])

		IniWrite($ApplicationList_TEMP, "ApplicationList", "NR_Applications", $Application_NR_new)
	Next

	;$NR_Game = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

	;For $Loop_1 = 1 To $NR_Game
		;$appid_TEMP = IniRead($ApplicationList_TEMP, "Application_" & $Loop_1, "appid", "")
		;MsgBox(0, "$appid_TEMP", $appid_TEMP)

		;If StringLeft($appid_TEMP, 9) = "vive.htc." Then
			;Local $Bat_Filename = $Viveport_Bat_File_Folder & $appid_TEMP & ".bat"
			;If Not FileExists($Bat_Filename) Then _Create_Viveport_Bat_Files()
		;EndIf
	;Next

	;GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
EndFunc   ;==>_ScanViveData

Func _Create_Viveport_Bat_Files()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10389) :(' & @MIN & ':' & @SEC & ') _Create_Viveport_Bat_Files()' & @CR) ;### Function Trace
	Local $Bat_Filename = $Viveport_Bat_File_Folder & $appid_TEMP & ".bat"

	Local $ApplicationList_Temp_INI = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
	If $ScanOnlyVR = "true" Then $ApplicationList_Temp_INI = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
	If $ScanOnlyVR <> "true" Then $ApplicationList_Temp_INI = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"

	Local $installdir = IniRead($ApplicationList_Temp_INI, "Application_" & $appid_TEMP, "binary_path_windows", "")
	Local $Working_Dir = StringLeft($installdir, StringInStr($installdir, "\", 0, -1) - 1)

	If Not FileExists($Bat_Filename) Then
		Local $File_Content = '@echo off ' & @CRLF & _
								'C:' & @CRLF & _
								'chdir "' & $Working_Dir & '"' & @CRLF & _
								'"' & $installdir & '"' & @CRLF & _
								'@echo.' & @CRLF

		FileWrite($Bat_Filename, $File_Content)
	EndIf
EndFunc

Func _ScanOculusData()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10412) :(' & @MIN & ':' & @SEC & ') _ScanOculusData()' & @CR) ;### Function Trace
	If FileExists($Revive_revive_vrmanifest_FilePath) Then
		Global $OculusData_Array_Sorted[1][6] = [["name", "app_key", "arguments", "binary_path_windows", "image_path", "launch_type"]]

		Local $NR_LINES_TEMP = _FileCountLines($Revive_revive_vrmanifest_FilePath)

		If $ScanOnlyVR = "true" Then
			$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
		Else
			$ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		EndIf

		$Array_Result = _FileReadToArray($Revive_revive_vrmanifest_FilePath, $Revive_revive_vrmanifest_Array)
		If @error Then
			$ScriptLineNumber_Temp = @ScriptLineNumber
			$AtError_Result = @error
		EndIf
		If $AtError_Result <> "" Or $Array_Result = -1 Then _FileReadToArray_Error_Handler()
		Local $Loop_End_1 = $Revive_revive_vrmanifest_Array[0]
		$Array_Result = _FileReadToArray($Revive_support_vrmanifest_FilePath, $Revive_support_vrmanifest_Array)
		If @error Then
			$ScriptLineNumber_Temp = @ScriptLineNumber
			$AtError_Result = @error
		EndIf

		;MsgBox(0, "$Revive_support_vrmanifest_Array[0]", $Revive_support_vrmanifest_Array[0])
		;_ArrayDisplay($Revive_support_vrmanifest_Array)

		If $AtError_Result <> "" Or $Array_Result = -1 Then _FileReadToArray_Error_Handler()
		Local $Loop_End_2 = $Revive_support_vrmanifest_Array[0]

		;GUICtrlSetData($Anzeige_Fortschrittbalken, 33)

		For $Loop_1 = 1 To $Loop_End_1
			$Steamapps_vrmanifest_aArray = _StringBetween($Revive_revive_vrmanifest_Array[$Loop_1], '"', '"', $STR_ENDNOTSTART)

			If $Steamapps_vrmanifest_aArray <> 0 Then
				If $Steamapps_vrmanifest_aArray[0] <> "" Then
					Local $Check_Left = $Steamapps_vrmanifest_aArray[0]
					Local $Check_Right = ""

					If $Check_Left = "app_key" Or $Check_Left = "name" Or $Check_Left = "image_path" Or $Check_Left = "url" Then
						$Check_Right = $Steamapps_vrmanifest_aArray[1]
					EndIf

					If $Check_Left = "app_key" Then
						Local $app_key_TEMP = $Check_Right
						$app_key_TEMP = StringReplace($app_key_TEMP, 'revive.app.', '')

						Local $arguments_TEMP = StringReplace($Revive_revive_vrmanifest_Array[$Loop_1 + 1], '            "arguments": ', '')
						$arguments_TEMP = StringTrimRight($arguments_TEMP, 1)

						Local $binary_path_windows_TEMP = _StringBetween($Revive_revive_vrmanifest_Array[$Loop_1 + 2], '"', '"', $STR_ENDNOTSTART)
						$binary_path_windows_TEMP = $binary_path_windows_TEMP[1]

						Local $image_path_TEMP = _StringBetween($Revive_revive_vrmanifest_Array[$Loop_1 + 3], '"', '"', $STR_ENDNOTSTART)
						$image_path_TEMP = $image_path_TEMP[1]
						If Not FileExists($Icons & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg") Or $DeleteHomeLoaderLibraryData = "true" Then
							Local $Download_Icon_path_1_jpg = $Icons & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_2_jpg = $Icons & "460x215\steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_3_jpg = $Icon_Folder_1 & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_4_jpg = $Icon_Folder_2 & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_5_jpg = $Icon_Folder_3 & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_6_jpg = $Icon_Folder_4 & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_7_jpg = $Icon_Folder_5 & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"

							If Not FileExists($Download_Icon_path_1_jpg) Or $DeleteHomeLoaderLibraryData = "true" Then
								FileCopy($image_path_TEMP, $Download_Icon_path_1_jpg, $FC_OVERWRITE + $FC_CREATEPATH)
							EndIf
						EndIf
						Local $ListView_Icon_Path = $Icons & "32x32\" & "steam.app." & 'revive.app.' & $app_key_TEMP & ".bmp"
						If Not FileExists($ListView_Icon_Path) Or $DeleteHomeLoaderLibraryData = "true" Then
							FileCopy($gfx & "Icon_Preview_Oculus_32x32.bmp", $ListView_Icon_Path, $FC_OVERWRITE + $FC_CREATEPATH)
						EndIf

						Local $launch_type_TEMP = _StringBetween($Revive_revive_vrmanifest_Array[$Loop_1 + 4], '"', '"', $STR_ENDNOTSTART)
						$launch_type_TEMP = $launch_type_TEMP[1]

						Local $app_Name_TEMP = _StringBetween($Revive_revive_vrmanifest_Array[$Loop_1 + 7], '"', '"', $STR_ENDNOTSTART)
						$app_Name_TEMP = $app_Name_TEMP[1]
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'Oculus ', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'oculus-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'felix-and-paul-studios-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'fireproof-games-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'hidden-path-entertainment-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'moshe-ben-zacharia-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'playful-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'think-heavy-ltd-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'ready-at-dawn-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'vr', 'VR')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, '-', ' ')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'dg2vr', 'Defence Grid 2 VR')

						$app_Name_TEMP = _StringProper($app_Name_TEMP)
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'Vr', 'VR')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, '-', ' ')

						Local $sFill = $app_Name_TEMP & "|" & $app_key_TEMP & "|" & $arguments_TEMP & "|" & $binary_path_windows_TEMP & "|" & $image_path_TEMP & "|" & $launch_type_TEMP
						$Array_Result = _ArrayAdd($OculusData_Array_Sorted, $sFill)
						If @error Then
							$ScriptLineNumber_Temp = @ScriptLineNumber
							$AtError_Result = @error
						EndIf
						If $AtError_Result <> "" Or $Array_Result = -1 Then _ArrayAdd_Error_Handler()
						;_ArrayDisplay($OculusData_Array_Sorted)

						If WinExists($AppName_Window_Main_GUI) Then
							_GUICtrlStatusBar_SetText($Statusbar, "" & "Scan Oculus: " & "Nr: " & $Loop_1 & " - " & "Name: " & $app_Name_TEMP & " - " & "SteamAppID: " & $app_key_TEMP & @TAB & "" & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")
						EndIf
					EndIf
				EndIf
			EndIf
		Next

		;GUICtrlSetData($Anzeige_Fortschrittbalken, 66)

		For $Loop_2 = 1 To $Loop_End_2
			$Steamapps_vrmanifest_aArray = _StringBetween($Revive_support_vrmanifest_Array[$Loop_2], '"', '"', $STR_ENDNOTSTART)

			If $Steamapps_vrmanifest_aArray <> 0 Then
				If $Steamapps_vrmanifest_aArray[0] <> "" Then
					Local $Check_Left = $Steamapps_vrmanifest_aArray[0]
					Local $Check_Right = ""

					If $Check_Left = "app_key" Or $Check_Left = "name" Or $Check_Left = "image_path" Or $Check_Left = "url" Then
						$Check_Right = $Steamapps_vrmanifest_aArray[1]
					EndIf

					If $Check_Left = "app_key" Then
						Local $app_key_TEMP = $Check_Right
						$app_key_TEMP = StringReplace($app_key_TEMP, 'revive.app.', '')

						Local $arguments_TEMP = StringReplace($Revive_support_vrmanifest_Array[$Loop_2 + 1], '            "arguments": ', '')
						$arguments_TEMP = StringTrimRight($arguments_TEMP, 1)

						Local $binary_path_windows_TEMP = _StringBetween($Revive_support_vrmanifest_Array[$Loop_2 + 2], '"', '"', $STR_ENDNOTSTART)
						$binary_path_windows_TEMP = $binary_path_windows_TEMP[1]

						Local $image_path_TEMP = _StringBetween($Revive_support_vrmanifest_Array[$Loop_2 + 3], '"', '"', $STR_ENDNOTSTART)
						$image_path_TEMP = $Revive_Path & $image_path_TEMP[1]
						If Not FileExists($Icons & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg") Or $DeleteHomeLoaderLibraryData = "true" Then
							Local $Download_Icon_path_1_jpg = $Icons & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_2_jpg = $Icons & "460x215\steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_3_jpg = $Icon_Folder_1 & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_4_jpg = $Icon_Folder_2 & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_5_jpg = $Icon_Folder_3 & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_6_jpg = $Icon_Folder_4 & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"
							Local $Download_Icon_path_7_jpg = $Icon_Folder_5 & "steam.app." & 'revive.app.' & $app_key_TEMP & ".jpg"

							If Not FileExists($Download_Icon_path_1_jpg) Or $DeleteHomeLoaderLibraryData = "true" Then
								FileCopy($image_path_TEMP, $Download_Icon_path_1_jpg, $FC_OVERWRITE + $FC_CREATEPATH)
							EndIf

						EndIf
						Local $ListView_Icon_Path = $Icons & "32x32\" & "steam.app." & 'revive.app.' & $app_key_TEMP & ".bmp"
						If Not FileExists($ListView_Icon_Path) Or $DeleteHomeLoaderLibraryData = "true" Then
							FileCopy($gfx & "Icon_Preview_Oculus_32x32.bmp", $ListView_Icon_Path, $FC_OVERWRITE + $FC_CREATEPATH)
						EndIf

						Local $launch_type_TEMP = _StringBetween($Revive_support_vrmanifest_Array[$Loop_2 + 4], '"', '"', $STR_ENDNOTSTART)
						$launch_type_TEMP = $launch_type_TEMP[1]

						Local $Check_Position = 0
						Local $app_Name_TEMP = ""

						If $Check_Position = 0 Then
							$Check_Position = StringInStr($Revive_support_vrmanifest_Array[$Loop_2 + 6], "name")
							If $Check_Position <> 0 Then $app_Name_TEMP = _StringBetween($Revive_support_vrmanifest_Array[$Loop_2 + 6], '"', '"', $STR_ENDNOTSTART)
							If $Check_Position <> 0 Then $app_Name_TEMP = $app_Name_TEMP[1]
						EndIf

						If $Check_Position = 0 Then
							$Check_Position = StringInStr($Revive_support_vrmanifest_Array[$Loop_2 + 7], "name")
							If $Check_Position <> 0 Then $app_Name_TEMP = _StringBetween($Revive_support_vrmanifest_Array[$Loop_2 + 7], '"', '"', $STR_ENDNOTSTART)
							If $Check_Position <> 0 Then $app_Name_TEMP = $app_Name_TEMP[1]
						EndIf

						If $Check_Position = 0 Then
							$Check_Position = StringInStr($Revive_support_vrmanifest_Array[$Loop_2 + 8], "name")
							If $Check_Position <> 0 Then $app_Name_TEMP = _StringBetween($Revive_support_vrmanifest_Array[$Loop_2 + 8], '"', '"', $STR_ENDNOTSTART)
							If $Check_Position <> 0 Then $app_Name_TEMP = $app_Name_TEMP[1]
						EndIf

						If $Check_Position = 0 Then
							$Check_Position = StringInStr($Revive_support_vrmanifest_Array[$Loop_2 + 9], "name")
							If $Check_Position <> 0 Then $app_Name_TEMP = _StringBetween($Revive_support_vrmanifest_Array[$Loop_2 + 9], '"', '"', $STR_ENDNOTSTART)
							If $Check_Position <> 0 Then $app_Name_TEMP = $app_Name_TEMP[1]
						EndIf

						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'Oculus ', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'oculus-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'felix-and-paul-studios-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'fireproof-games-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'hidden-path-entertainment-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'moshe-ben-zacharia-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'playful-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'think-heavy-ltd-', '')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'ready-at-dawn-', '')

						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'vr', 'VR')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, '-', ' ')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'dg2vr', 'Defence Grid 2 VR')

						$app_Name_TEMP = _StringProper($app_Name_TEMP)
						$app_Name_TEMP = StringReplace($app_Name_TEMP, 'Vr', 'VR')
						$app_Name_TEMP = StringReplace($app_Name_TEMP, '-', ' ')

						Local $sFill = $app_Name_TEMP & "|" & $app_key_TEMP & "|" & $arguments_TEMP & "|" & $binary_path_windows_TEMP & "|" & $image_path_TEMP & "|" & $launch_type_TEMP
						$Array_Result = _ArrayAdd($OculusData_Array_Sorted, $sFill)
						If @error Then
							$ScriptLineNumber_Temp = @ScriptLineNumber
							$AtError_Result = @error
						EndIf
						If $AtError_Result <> "" Or $Array_Result = -1 Then _ArrayAdd_Error_Handler()
						;_ArrayDisplay($OculusData_Array_Sorted)

						If WinExists($AppName_Window_Main_GUI) Then
							_GUICtrlStatusBar_SetText($Statusbar, "" & "Scan Oculus: " & "Nr: " & $Loop_2 & " - " & "Name: " & $app_Name_TEMP & " - " & "SteamAppID: " & $app_key_TEMP & @TAB & "" & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")
						EndIf
					EndIf
				EndIf
			EndIf
		Next

		;GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
		;_ArrayDisplay($OculusData_Array_Sorted)

		If $Sort_Alphabetical_order = "true" Then
			_ArraySort($OculusData_Array_Sorted, 0, 1, 0, 0)
			;_ArrayDisplay($OculusData_Array_Sorted)
		EndIf

		Local $NR_Game = UBound($OculusData_Array_Sorted) - 1
		;MsgBox(0, "$NR_Game", $NR_Game)

		For $Loop_3 = 1 To $NR_Game
			Local $Application_NR_new = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "") + 1

			IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "NR", $Application_NR_new)
			IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "appid", "revive.app." & $OculusData_Array_Sorted[$Loop_3][1])
			IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "name", $OculusData_Array_Sorted[$Loop_3][0])
			IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "arguments", $OculusData_Array_Sorted[$Loop_3][2])
			IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "binary_path_windows", $OculusData_Array_Sorted[$Loop_3][3])
			IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "image_path", $OculusData_Array_Sorted[$Loop_3][4])
			IniWrite($ApplicationList_TEMP, "Application_" & $Application_NR_new, "launch_type", $OculusData_Array_Sorted[$Loop_3][5])

			IniWrite($ApplicationList_TEMP, "Application_" & "revive.app." & $OculusData_Array_Sorted[$Loop_3][1], "NR", $Application_NR_new)
			IniWrite($ApplicationList_TEMP, "Application_" & "revive.app." & $OculusData_Array_Sorted[$Loop_3][1], "appid", "revive.app." & $OculusData_Array_Sorted[$Loop_3][1])
			IniWrite($ApplicationList_TEMP, "Application_" & "revive.app." & $OculusData_Array_Sorted[$Loop_3][1], "name", $OculusData_Array_Sorted[$Loop_3][0])
			IniWrite($ApplicationList_TEMP, "Application_" & "revive.app." & $OculusData_Array_Sorted[$Loop_3][1], "arguments", $OculusData_Array_Sorted[$Loop_3][2])
			IniWrite($ApplicationList_TEMP, "Application_" & "revive.app." & $OculusData_Array_Sorted[$Loop_3][1], "binary_path_windows", $OculusData_Array_Sorted[$Loop_3][3])
			IniWrite($ApplicationList_TEMP, "Application_" & "revive.app." & $OculusData_Array_Sorted[$Loop_3][1], "image_path", $OculusData_Array_Sorted[$Loop_3][4])
			IniWrite($ApplicationList_TEMP, "Application_" & "revive.app." & $OculusData_Array_Sorted[$Loop_3][1], "launch_type", $OculusData_Array_Sorted[$Loop_3][5])

			IniWrite($ApplicationList_TEMP, "ApplicationList", "NR_Applications", $Application_NR_new)

			Local $Start_File_Path = $Install_DIR & "WebPage\Revive\" & "revive.app." & $OculusData_Array_Sorted[$Loop_3][1] & ".bat"
			Local $Start_File_Path_Replaced = StringReplace($Start_File_Path, '\', '/')
			Local $App_binary_path = StringReplace($OculusData_Array_Sorted[$Loop_3][3], '/', '\')

			Local $App_arguments, $Oculus_App_Path
			Local $Check_Left_1_App_arguments = StringLeft($OculusData_Array_Sorted[$Loop_3][2], 7)
			Local $Check_Left_2_App_arguments = StringLeft($OculusData_Array_Sorted[$Loop_3][2], 10)
			If $Check_Left_1_App_arguments = '"/base ' Then $App_arguments = StringTrimLeft($OculusData_Array_Sorted[$Loop_3][2], 7)
			If $Check_Left_2_App_arguments = '"/library ' Then $App_arguments = StringTrimLeft($OculusData_Array_Sorted[$Loop_3][2], 10)
			$App_arguments = StringReplace($App_arguments, '/', '\')
			$App_arguments = StringReplace($App_arguments, '\\', '\')
			$App_arguments = StringReplace($App_arguments, '"', '')
			If StringRight($App_arguments, 1) = "\" Then $App_arguments = StringTrimRight($App_arguments, 1)
			If $Check_Left_1_App_arguments = '"/base ' Then $Oculus_App_Path = $Oculus_Path & $App_arguments
			If $Check_Left_2_App_arguments = '"/library ' Then $Oculus_App_Path = $Oculus_Path & $App_arguments

			Local $Revive_App_Path_1 = $Revive_Path & $App_binary_path
			Local $Revive_App_Path_2 = $Oculus_App_Path

			If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($Start_File_Path)
			If Not FileExists($Start_File_Path) Then
				FileWrite($Start_File_Path, '"' & $Revive_App_Path_1 & '" ' & '"' & $Revive_App_Path_2 & '"' & @CRLF & "@echo." & @CRLF & "timeout /t 3")
			EndIf
		Next
		;GUICtrlSetData($Anzeige_Fortschrittbalken, 100)
		;GUICtrlSetData($Anzeige_Fortschrittbalken, 0)
	EndIf
EndFunc   ;==>_ScanOculusData


Func _Checkbox_Show_OnlyVR_Apps()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10716) :(' & @MIN & ':' & @SEC & ') _Checkbox_Show_OnlyVR_Apps()' & @CR) ;### Function Trace
	If $ScanOnlyVR = "false" Then
		Local $State_Checkbox = GUICtrlRead($Checkbox_ScanOnlyVR)
		If $State_Checkbox = "" Then
			GUICtrlSetData($Checkbox_ScanOnlyVR, "X")
			IniWrite($Config_INI, "Settings", "ScanOnlyVR", "true")
			GUICtrlSetData($Checkbox_ScanAll, "")
		Else
			GUICtrlSetData($Checkbox_ScanOnlyVR, "")
			IniWrite($Config_INI, "Settings", "ScanOnlyVR", "false")
			GUICtrlSetData($Checkbox_ScanAll, "X")
		EndIf
		$ScanOnlyVR = IniRead($Config_INI, "Settings", "ScanOnlyVR", "")
		_Restart()
	EndIf
EndFunc   ;==>_Checkbox_Show_OnlyVR_Apps

Func _Checkbox_Show_All_Apps()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10734) :(' & @MIN & ':' & @SEC & ') _Checkbox_Show_All_Apps()' & @CR) ;### Function Trace
	If $ScanOnlyVR = "true" Then
		Local $State_Checkbox = GUICtrlRead($Checkbox_ScanAll)
		If $State_Checkbox = "" Then
			GUICtrlSetData($Checkbox_ScanAll, "X")
			IniWrite($Config_INI, "Settings", "ScanOnlyVR", "false")
			GUICtrlSetData($Checkbox_ScanOnlyVR, "")
		Else
			GUICtrlSetData($Checkbox_ScanAll, "")
			IniWrite($Config_INI, "Settings", "ScanOnlyVR", "true")
			GUICtrlSetData($Checkbox_ScanOnlyVR, "X")
		EndIf
		$ScanOnlyVR = IniRead($Config_INI, "Settings", "ScanOnlyVR", "")
		_Restart()
	EndIf
EndFunc   ;==>_Checkbox_Show_All_Apps

Func Sync_Categories_after_Scan()
	Local $ApplicationList_K1_1 = $ApplicationList_SteamLibrary_ALL_INI
	Local $ApplicationList_K1_2 = $ApplicationList_SteamVRLibrary_ALL_INI
	Local $ApplicationList_K2 = $ApplicationList_Non_Steam_Appl_INI
	Local $ApplicationList_K3 = $ApplicationList_Custom_1_INI
	Local $ApplicationList_K4 = $ApplicationList_Custom_2_INI
	Local $ApplicationList_K5 = $ApplicationList_Custom_3_INI
	Local $ApplicationList_K6 = $ApplicationList_Custom_4_INI

	Local $ApplicationList_K2_NR = IniRead($ApplicationList_K2, "ApplicationList", "NR_Applications", "")
	Local $ApplicationList_K3_NR = IniRead($ApplicationList_K3, "ApplicationList", "NR_Applications", "")
	Local $ApplicationList_K4_NR = IniRead($ApplicationList_K4, "ApplicationList", "NR_Applications", "")
	Local $ApplicationList_K5_NR = IniRead($ApplicationList_K5, "ApplicationList", "NR_Applications", "")
	Local $ApplicationList_K6_NR = IniRead($ApplicationList_K6, "ApplicationList", "NR_Applications", "")

	Local $ApplicationList_NR_Temp = ""

	For $Loop_main = 2 To 6
		If $Loop_main = 2 Then $ApplicationList_NR_Temp = $ApplicationList_K2_NR
		If $Loop_main = 3 Then $ApplicationList_NR_Temp = $ApplicationList_K3_NR
		If $Loop_main = 4 Then $ApplicationList_NR_Temp = $ApplicationList_K4_NR
		If $Loop_main = 5 Then $ApplicationList_NR_Temp = $ApplicationList_K5_NR
		If $Loop_main = 6 Then $ApplicationList_NR_Temp = $ApplicationList_K6_NR
		If $Loop_main = 2 Then $ApplicationList_Temp = $ApplicationList_K2
		If $Loop_main = 3 Then $ApplicationList_Temp = $ApplicationList_K3
		If $Loop_main = 4 Then $ApplicationList_Temp = $ApplicationList_K4
		If $Loop_main = 5 Then $ApplicationList_Temp = $ApplicationList_K5
		If $Loop_main = 6 Then $ApplicationList_Temp = $ApplicationList_K6

		If $ApplicationList_NR_Temp <> "" Then
			For $Loop = 1 To $ApplicationList_NR_Temp
				Local $Check_AppID_Temp = IniRead($ApplicationList_Temp, "Application_" & $Loop, "appid", "")

				If $Check_AppID_Temp <> "" Then
					Local $Check_AppNR_Temp = IniRead($ApplicationList_K1_1, "Application_" & $Check_AppID_Temp, "NR", "")
					If $Check_AppNR_Temp <> "" Then
						IniWrite($ApplicationList_K1_1, "Application_" & $Check_AppID_Temp, "Category_" & $Loop_main, "X")
						IniWrite($ApplicationList_K1_1, "Application_" & $Check_AppNR_Temp, "Category_" & $Loop_main, "X")
					EndIf

					Local $Check_AppNR_Temp = IniRead($ApplicationList_K1_2, "Application_" & $Check_AppID_Temp, "NR", "")
					If $Check_AppNR_Temp <> "" Then
						IniWrite($ApplicationList_K1_2, "Application_" & $Check_AppID_Temp, "Category_" & $Loop_main, "X")
						IniWrite($ApplicationList_K1_2, "Application_" & $Check_AppNR_Temp, "Category_" & $Loop_main, "X")
					EndIf
				EndIf
			Next
		EndIf
	Next
EndFunc

Func _RM_Checkbox_ScanViveData()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10824) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_ScanViveData()' & @CR) ;### Function Trace
	Local $CheckBox = IniRead($Config_INI, "Settings", "ScanVIVEApps", "")
	If $CheckBox <> "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_1_1, $GUI_CHECKED)
		GUICtrlSetData($Checkbox_Main_01, "a")
		GUICtrlSetData($Checkbox_Settings_4, "a")
		IniWrite($Config_INI, "Settings", "ScanVIVEApps", "true")
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_1_1, $GUI_UNCHECKED)
		GUICtrlSetData($Checkbox_Main_01, "")
		GUICtrlSetData($Checkbox_Settings_4, "")
		IniWrite($Config_INI, "Settings", "ScanVIVEApps", "false")
	EndIf
	$ScanVIVEApps = IniRead($Config_INI, "Settings", "ScanVIVEApps", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_ScanViveData

Func _RM_Checkbox_ScanOculusData()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10840) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_ScanOculusData()' & @CR) ;### Function Trace
	Local $CheckBox = IniRead($Config_INI, "Settings", "ScanOculusApps", "")
	If $CheckBox <> "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_1_2, $GUI_CHECKED)
		GUICtrlSetData($Checkbox_Main_02, "a")
		GUICtrlSetData($Checkbox_Settings_5, "a")
		IniWrite($Config_INI, "Settings", "ScanOculusApps", "true")
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_1_2, $GUI_UNCHECKED)
		GUICtrlSetData($Checkbox_Main_02, "")
		GUICtrlSetData($Checkbox_Settings_5, "")
		IniWrite($Config_INI, "Settings", "ScanOculusApps", "false")
	EndIf
	$ScanOculusApps = IniRead($Config_INI, "Settings", "ScanOculusApps", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_ScanOculusData

Func _RM_Checkbox_Sort_Alphabetical_order()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10856) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Sort_Alphabetical_order()' & @CR) ;### Function Trace
	Local $CheckBox = IniRead($Config_INI, "Settings", "Sort_Alphabetical_order", "")
	If $CheckBox <> "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_2, $GUI_CHECKED)
		GUICtrlSetData($Checkbox_Main_03, "a")
		GUICtrlSetData($Checkbox_Settings_6, "a")
		IniWrite($Config_INI, "Settings", "Sort_Alphabetical_order", "true")
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_2, $GUI_UNCHECKED)
		GUICtrlSetData($Checkbox_Main_03, "")
		GUICtrlSetData($Checkbox_Settings_6, "")
		IniWrite($Config_INI, "Settings", "Sort_Alphabetical_order", "false")
	EndIf
	$Sort_Alphabetical_order = IniRead($Config_INI, "Settings", "Sort_Alphabetical_order", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_Sort_Alphabetical_order

Func _RM_Checkbox_Create_HTML_GamePage()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10952) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_Create_HTML_GamePage()' & @CR) ;### Function Trace
	Local $CheckBox = IniRead($Config_INI, "Settings", "Create_HTML_GamePage", "")
	If $CheckBox <> "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_8, $GUI_CHECKED)
		GUICtrlSetData($Checkbox_Settings_12, "a")
		IniWrite($Config_INI, "Settings", "Create_HTML_GamePage", "true")
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_8, $GUI_UNCHECKED)
		GUICtrlSetData($Checkbox_Settings_12, "")
		IniWrite($Config_INI, "Settings", "Create_HTML_GamePage", "false")
	EndIf
	$Create_HTML_GamePage = IniRead($Config_INI, "Settings", "Create_HTML_GamePage", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_Create_HTML_GamePage

Func _RM_Checkbox_WMR_Shortcut_Files()
	Local $CheckBox = IniRead($Config_INI, "Settings", "Create_WMR_Shortcut_Files", "")
	If $CheckBox <> "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_8, $GUI_CHECKED)
		GUICtrlSetData($Checkbox_Settings_15, "a")
		IniWrite($Config_INI, "Settings", "Create_WMR_Shortcut_Files", "true")
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_8, $GUI_UNCHECKED)
		GUICtrlSetData($Checkbox_Settings_15, "")
		IniWrite($Config_INI, "Settings", "Create_WMR_Shortcut_Files", "false")
	EndIf
	$Create_WMR_Shortcut_Files = IniRead($Config_INI, "Settings", "Create_WMR_Shortcut_Files", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_Create_HTML_GamePage

Func _RM_Checkbox_DeleteHomeLoaderLibraryData()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (10984) :(' & @MIN & ':' & @SEC & ') _RM_Checkbox_DeleteHomeLoaderLibraryData()' & @CR) ;### Function Trace
	Local $CheckBox = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")
	If $CheckBox <> "true" Then
		GUICtrlSetState($RM_More_Scan_Options_Item_10, $GUI_CHECKED)
		GUICtrlSetData($Checkbox_Settings_14, "a")
		IniWrite($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "true")
	Else
		GUICtrlSetState($RM_More_Scan_Options_Item_10, $GUI_UNCHECKED)
		GUICtrlSetData($Checkbox_Settings_14, "")
		IniWrite($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "false")
	EndIf
	$DeleteHomeLoaderLibraryData = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")
	_Set_States()
EndFunc   ;==>_RM_Checkbox_DeleteHomeLoaderLibraryData

Func _RM_Create_HTML_GamePages_All()
	_Create_GamePages()
EndFunc   ;==>_RM_Create_HTML_GamePages_All

Func _RM_Create_WMR_Startmenu_Files()
	_Create_WMR_Startmenu_Files()
EndFunc   ;==>_RM_Create_WMR_Startmenu_Files()

Func _RM_Delete_Category_Pages()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11029) :(' & @MIN & ':' & @SEC & ') _RM_Delete_Category_Pages()' & @CR) ;### Function Trace
	If FileExists($ApplicationList_Custom_1_INI) Then FileDelete($ApplicationList_Custom_1_INI)
	If FileExists($ApplicationList_Custom_2_INI) Then FileDelete($ApplicationList_Custom_2_INI)
	If FileExists($ApplicationList_Custom_3_INI) Then FileDelete($ApplicationList_Custom_3_INI)
	If FileExists($ApplicationList_Custom_4_INI) Then FileDelete($ApplicationList_Custom_4_INI)
EndFunc   ;==>_RM_Delete_Category_Pages


#EndRegion Func MAIN GUI

#Region Func Settings GUI

Func _Update_Objects_Settings_GUI()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11188) :(' & @MIN & ':' & @SEC & ') _Update_Objects_Settings_GUI()' & @CR) ;### Function Trace

EndFunc   ;==>_Update_Objects()

Func _Button_Exit_Settings_GUI()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11258) :(' & @MIN & ':' & @SEC & ') _Button_Exit_Settings_GUI()' & @CR) ;### Function Trace
	GUIDelete($HLL_Settings_GUI)
	$Install_Folder_Steam_1 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_1", "")
	$Install_Folder_Steam_2 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_2", "")
	$Install_Folder_Steam_3 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_3", "")
	$Install_Folder_Steam_4 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_4", "")
	$Install_Folder_Steam_5 = IniRead($Config_INI, "Folders", "Install_Folder_Steam_5", "")
EndFunc   ;==>_Button_Exit_Settings_GUI

#EndRegion Func Settings GUI

#Region ToolTips

Func _Update_ToolTips_Create_HLL_GUI()
	GUICtrlSetTip($Icon_Preview_Image, "Shows a preview Icon for the selected application.")
	GUICtrlSetTip($Button_ReScan_Steam_Library, "Scans your game Libraries according to the Settings." & @CRLF & "Change the Scan Settings by using the Button 'More Settings' Button.")
	GUICtrlSetTip($Checkbox_ScanOnlyVR, "Shows only VR Apps" & @CRLF & "[Will only Scan for VR Apps]." & @CRLF)
	GUICtrlSetTip($Checkbox_ScanOnlyVR_Label, "Shows only VR Apps" & @CRLF & "[Will only Scan for VR Apps]." & @CRLF)
	GUICtrlSetTip($Checkbox_ScanAll, "Shows All VR Apps" & @CRLF & "[Will only Scan for All Apps]." & @CRLF)
	GUICtrlSetTip($Checkbox_ScanAll_Label, "Shows All VR Apps" & @CRLF & "[Will only Scan for All Apps]." & @CRLF)
	GUICtrlSetTip($Checkbox_Main_01, "Scans your Game Libraries on HomeLoader Start depending on the current settings." & @CRLF & "Change the Scan Settings by using the Button 'More Settings' Button.")
	GUICtrlSetTip($Checkbox_01_Label, "Scans your Game Libraries on HomeLoader Start depending on the current settings." & @CRLF & "Change the Scan Settings by using the Button 'More Settings' Button.")


	GUICtrlSetTip($Checkbox_Main_02, "Deletes the old HomeLoader Library Data first before the Start of a new Scan." & @CRLF)
	GUICtrlSetTip($Checkbox_02_Label, "Requests the Number of Current Players and adds it to the HomeLoader Library" & @CRLF & " and the Game Icons during the Scan." & @CRLF)
	GUICtrlSetTip($Checkbox_Main_03, "Sort Apps in Alphabetical order during the Scan." & @CRLF)
	GUICtrlSetTip($Checkbox_03_Label, "Requests Steam Tags and adds all Games with matching Tags" & @CRLF & " to the categories during the Scan." & @CRLF)

	GUICtrlSetTip($Button_More_Scan_Options, "Opens the HomeLoader Settings with more HomeLoader related settings.")


	GUICtrlSetTip($Button_Restart, "Restart.")
	GUICtrlSetTip($Button_Exit, "Close.")
	GUICtrlSetTip($ButtonTAB_Steam_Library, "Shows the '" & $TAB1_Label & "' Category.")
	GUICtrlSetTip($ButtonTAB_Favorites, "Shows the '" & $TAB2_Label & "' Category.")
	GUICtrlSetTip($ButtonTAB_Custom_1, "Shows the '" & $TAB3_Label & "' Category." & @CRLF & "Use the 'Mouse Right Click Menu' to change the name of the Category and to set the Tags for it.")
	GUICtrlSetTip($ButtonTAB_Custom_2, "Shows the '" & $TAB4_Label & "' Category." & @CRLF & "Use the 'Mouse Right Click Menu' to change the name of the Category and to set the Tags for it.")
	GUICtrlSetTip($ButtonTAB_Custom_3, "Shows the '" & $TAB5_Label & "' Category." & @CRLF & "Use the 'Mouse Right Click Menu' to change the name of the Category and to set the Tags for it.")
	GUICtrlSetTip($ButtonTAB_Custom_4, "Shows the '" & $TAB6_Label & "' Category." & @CRLF & "Use the 'Mouse Right Click Menu' to change the name of the Category and to set the Tags for it.")
	GUICtrlSetTip($Checkbox_CreatePage, "Checks the checkbox for all application in the List View of the current category.")
	GUICtrlSetTip($Checkbox_CreatePage_Label, "Checks the checkbox for all application in the List View of the current category.")
	GUICtrlSetTip($Combo_Add_to_Custom, "Choose the Category where you want to add the games to.")


EndFunc

Func _Update_ToolTips_HLL_Settings_GUI()
	GUICtrlSetTip($Checkbox_Settings_1, "If it is enabled then it will Scan your Libraries in the background after SteamVR has been started." & @CRLF & "SteamVR Home App needs to be selected [for example 'SteamVR'] for this function to work." & @CRLF)
	GUICtrlSetTip($Checkbox_Settings_1_Label, "If it is enabled then it will Scan your Libraries in the background after SteamVR has been started." & @CRLF & "SteamVR Home App needs to be selected [for example 'SteamVR'] for this function to work." & @CRLF)
	GUICtrlSetTip($Button_PAYPAL_DONATE_Settings_GUI, "Donate.")
	GUICtrlSetTip($Button_Exit_Settings_GUI, "Closes GUI Window.")
EndFunc








Func _Update_ToolTips_Create_SteamVRHome_Environment_Settings_GUI()
	GuiCtrlSetTip($Combo_Environment_Name, "Select the SteamVR Environment you want to use. If you have other Environments saved in your Steam steamvr_environments folder then you can use them too.")
	GuiCtrlSetTip($Button_Prepare_Environment, "Updates and prepares the downloaded HomeLoader SteamVR Workshop Environment.")
	GUICtrlSetTip($Map_Preview_Image, "Shows an preview image of the selected Environment Map.")
	GuiCtrlSetTip($Button_Environment_Apply_Map, "Applies the selected Map to the Environment.")
	GuiCtrlSetTip($Button_Environment_Create_New_Map, "Creates an new Map for use with the HomeLoader SteamVR Home Environment.")
	GuiCtrlSetTip($Button_Environment_Edit_Map, "Creates an new Map for use with the HomeLoader SteamVR Home Environment.")
	GuiCtrlSetTip($Button_Environment_Save_Map, "Creates an new Map for use with the HomeLoader SteamVR Home Environment.")
	GuiCtrlSetTip($Combo_Panel_Layout, "Select saved settings to change the appearance of the panels.")
	GuiCtrlSetTip($Button_Panel_Settings_Apply, "Creates the Game Panels using the current settings.")
	GuiCtrlSetTip($Button_Panel_Settings_Close, "Closes the settings window.")
EndFunc

Func _Update_ToolTips_Create_Set_SteamVR_Home_Panel_GUI_Data()
	GUICtrlSetTip($Map_Preview_Image, "Map Name: " & @TAB & @TAB & $Map_Name & @CRLF & _
										"Environment by: " & @TAB & @TAB & $Map_Environment_by & @CRLF & _
										"Environment source: " & @TAB & $Map_Environment_source & @CRLF & _
										"Model by: " & @TAB & @TAB & $Map_Model_by & @CRLF & _
										"Model source: " & @TAB & @TAB & $Map_Model_source & @CRLF)

EndFunc
#EndRegion ToolTips

#Region Func HomeLoader
Func _Button_PAYPAL_DONATE_Settings_GUI()
	ShellExecute("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=43KCRMJCQB4JN&source=url")
EndFunc

Func _Restart()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11519) :(' & @MIN & ':' & @SEC & ') _Restart()' & @CR) ;### Function Trace
	If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
	;_Create_HLL_GUI()
	If FileExists($Install_DIR & $AppName & ".exe") Then
		ShellExecute($Install_DIR & $AppName & ".exe", "", $Install_DIR)
	Else
		ShellExecute($Install_DIR & $AppName & ".au3", "", $Install_DIR)
	EndIf
	Sleep(750)
	;GUIDelete($HLL_GUI_Handle)
	GUIDelete($HLL_GUI)
	Exit
EndFunc   ;==>_Restart

Func _Exit_Check()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11534) :(' & @MIN & ':' & @SEC & ') _Exit_Check()' & @CR) ;### Function Trace
	If Not ProcessExists("vrmonitor.exe") Then
		FileWrite($stats_log_FILE, @CRLF & "[" & _Now() & "]" & " Exit Check: SteamVR is not running --> Exit [HomeLoaderLibrary]" & " '_Exit_Check()'")

		Exit
	EndIf
EndFunc   ;==>_Exit_Check

Func _Exit()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11555) :(' & @MIN & ':' & @SEC & ') _Exit()' & @CR) ;### Function Trace
	If FileExists($ApplicationList_INI) Then FileDelete($ApplicationList_INI)
	GUIDelete($HLL_GUI)

	Exit
EndFunc   ;==>_Beenden
#EndRegion Func Home Loader

#Region Func Create HTML Pages / Game Pages
Func _Create_GamePage_Menu_Page()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11926) :(' & @MIN & ':' & @SEC & ') _Create_GamePage_Menu_Page()' & @CR) ;### Function Trace
	Local $FileRead_HL_GamePage_Menu_Page_Template = FileRead($Install_DIR & "WebPage\Templates\GamePage_Menu.html")
	Local $FileRead_HL_GamePage_Menu_Page = $Install_DIR & "WebPage\GamePage_Menu.html"

	$TAB1_Label = IniRead($Config_INI, "Settings", "TAB1_Name", "")
	$TAB2_Label = IniRead($Config_INI, "Settings", "TAB2_Name", "")
	$TAB3_Label = IniRead($Config_INI, "Settings", "TAB3_Name", "")
	$TAB4_Label = IniRead($Config_INI, "Settings", "TAB4_Name", "")
	$TAB5_Label = IniRead($Config_INI, "Settings", "TAB5_Name", "")
	$TAB6_Label = IniRead($Config_INI, "Settings", "TAB6_Name", "")
	If $TAB1_Label = "" Then $TAB1_Label = "Library"
	If $TAB2_Label = "" Then $TAB2_Label = "Non-Steam_Appl"
	If $TAB3_Label = "" Then $TAB3_Label = "Custom 1"
	If $TAB4_Label = "" Then $TAB4_Label = "Custom 2"
	If $TAB5_Label = "" Then $TAB5_Label = "Custom 3"
	If $TAB6_Label = "" Then $TAB6_Label = "Custom 4"

	Local $FileRead_HL_GamePage_Menu_Page_Replace = StringReplace($FileRead_HL_GamePage_Menu_Page_Template, '___Label_3___', $TAB3_Label)
	$FileRead_HL_GamePage_Menu_Page_Replace = StringReplace($FileRead_HL_GamePage_Menu_Page_Replace, '___Label_4___', $TAB4_Label)
	$FileRead_HL_GamePage_Menu_Page_Replace = StringReplace($FileRead_HL_GamePage_Menu_Page_Replace, '___Label_5___', $TAB5_Label)
	$FileRead_HL_GamePage_Menu_Page_Replace = StringReplace($FileRead_HL_GamePage_Menu_Page_Replace, '___Label_6___', $TAB6_Label)

	If FileExists($FileRead_HL_GamePage_Menu_Page) Then FileDelete($FileRead_HL_GamePage_Menu_Page)
	FileWrite($FileRead_HL_GamePage_Menu_Page, $FileRead_HL_GamePage_Menu_Page_Replace)
EndFunc   ;==>_Create_VRToolBox_HL_StartPage

Func _Create_GamePages()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (11953) :(' & @MIN & ':' & @SEC & ') _Create_GamePages()' & @CR) ;### Function Trace
	$Add_Back_to_HTML_GamePage = IniRead($Config_INI, "Settings", "Add_Back_to_HTML_GamePage", "")
	Local $ApplicationList_TEMP, $GamePage_path, $NR_Applications, $PageName
	Local $Install_DIR_TEMP = StringReplace($Install_DIR, '\', '/')

	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Start Creating Game Pages:")

	For $Loop_Temp = 1 To 6
		If WinExists($AppName_Window_Main_GUI) Then
			;GUICtrlSetData($Anzeige_Fortschrittbalken, ($Loop_Temp * 100 / 6) / 2)
		EndIf

		If $Loop_Temp = 1 Then
			If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
			If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"
		EndIf

		If $Loop_Temp = 2 Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Non-Steam_Appl.ini"
		If $Loop_Temp = 3 Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_1.ini"
		If $Loop_Temp = 4 Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_2.ini"
		If $Loop_Temp = 5 Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_3.ini"
		If $Loop_Temp = 6 Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_Custom_4.ini"

		If $Loop_Temp = 1 Then $GamePage_path = $Install_DIR & "WebPage\GamePage_ALL.html"
		If $Loop_Temp = 2 Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Non-Steam_Appl.html"
		If $Loop_Temp = 3 Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_1.html"
		If $Loop_Temp = 4 Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_2.html"
		If $Loop_Temp = 5 Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_3.html"
		If $Loop_Temp = 6 Then $GamePage_path = $Install_DIR & "WebPage\GamePage_Custom_4.html"

		If $Loop_Temp = 1 Then $PageName = IniRead($Config_INI, "Settings", "TAB1_Name", "Steam Library")
		If $Loop_Temp = 2 Then $PageName = IniRead($Config_INI, "Settings", "TAB2_Name", "Non-Steam_Appl")
		If $Loop_Temp = 3 Then $PageName = IniRead($Config_INI, "Settings", "TAB3_Name", "Custom 1")
		If $Loop_Temp = 4 Then $PageName = IniRead($Config_INI, "Settings", "TAB4_Name", "Custom 2")
		If $Loop_Temp = 5 Then $PageName = IniRead($Config_INI, "Settings", "TAB5_Name", "Custom 3")
		If $Loop_Temp = 6 Then $PageName = IniRead($Config_INI, "Settings", "TAB6_Name", "Custom 4")

		If FileExists($ApplicationList_TEMP) Then
			$NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

			If FileExists($GamePage_path) Then FileDelete($GamePage_path)

			Local $HTML_Content = '<html>' & @CRLF & _
					'<head>' & @CRLF & _
					'    <title>GamePage</title>' & @CRLF & _
					'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
					'</head>' & @CRLF & _
					'<body>' & @CRLF & _
					'<script>' & @CRLF & _
					' ' & @CRLF & _
					'</script>' & @CRLF & _
					'<h1>' & $PageName & '</h1><br><br><br>' & @CRLF & _
					'<div class="icons">' & @CRLF

			If $HomeApp = "VR Toolbox" Then
				$HTML_Content = '<html>' & @CRLF & _
						'<head>' & @CRLF & _
						'    <title>GamePage</title>' & @CRLF & _
						'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
						'</head>' & @CRLF & _
						'<body>' & @CRLF & _
						'<script>' & @CRLF & _
						'    function VRTStartCommand(cmd) {' & @CRLF & _
						"      var s = '{ " & '"LightVRCallback": { "ShellExec": "' & "' + cmd + '" & '" } }' & "';" & @CRLF & _
						'      console.log(s);' & @CRLF & _
						'    }' & @CRLF & _
						'</script>' & @CRLF & _
						'<h1>' & $PageName & '</h1><br><br><br>' & @CRLF & _
						'<div class="icons">' & @CRLF
			EndIf

			If $Add_Back_to_HTML_GamePage = "true" Then
				Local $Content_Back = '<div id="layer_1" style="position: absolute; width: 100px; height: 45px; z-index: 1; left: 22px; top: 30px">' & @CRLF & _
						'	<a href="GamePage_Menu.html">			<img src="images/BACK.png" height="55px" width="100px"></a>' & @CRLF & _
						'</div>' & @CRLF

				$HTML_Content = $HTML_Content & $Content_Back
			EndIf


			FileWrite($GamePage_path, $HTML_Content)

			For $NR = 1 To $NR_Applications
				Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR, "NR", "")
				Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
				Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR, "name", "")
				Global $Application_installdir = IniRead($ApplicationList_TEMP, "Application_" & $NR, "installdir", "")
				Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $Application_appid, "IconPath", "")
				Global $WebPage_IconPath = $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg"

				Local $StringLeft_Application_appid = StringLeft($Application_appid, 9)
				Local $StringTrimLeft_Application_appid = StringTrimLeft($Application_appid, 9)

				If Not FileExists($WebPage_IconPath) Then
					FileCopy($Icons & "steam.app." & $Application_appid & ".jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If Not FileExists($WebPage_IconPath) Then
					FileCopy($Application_IconPath, $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If Not FileExists($WebPage_IconPath) Then
					If $StringLeft_Application_appid <> "vive.htc." Then FileCopy($gfx & "steamVR.app.icon.jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
					If $StringLeft_Application_appid = "vive.htc." Then FileCopy($gfx & "Viveport.app.icon.jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If $Loop_Temp <> 2 Then
					If $HomeApp = "VR Toolbox" Then
						If $StringLeft_Application_appid <> "vive.htc." Then FileWriteLine($GamePage_path, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'steam://rungameid/" & $Application_appid & "');" & '">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
						If $StringLeft_Application_appid = "vive.htc." Then FileWriteLine($GamePage_path, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'vive://runapp/" & $StringTrimLeft_Application_appid & "');" & '">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					EndIf

					If $HomeApp <> "VR Toolbox" Then
						If $StringLeft_Application_appid <> "vive.htc." Then FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="steam://rungameid/' & $Application_appid & ' ">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
						If $StringLeft_Application_appid = "vive.htc." Then FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="vive://runapp/' & $StringTrimLeft_Application_appid & ' ">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					EndIf
				Else
					If $HomeApp = "VR Toolbox" Then
						FileWriteLine($GamePage_path, '<div class="tooltip"><a onclick="VRTStartCommand(' & $Application_appid & "');" & '">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					EndIf

					If $HomeApp <> "VR Toolbox" Then
						FileWriteLine($GamePage_path, '    <div class="tooltip"><a href="' & $Application_appid & ' ">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					EndIf
				EndIf

			Next
			Sleep(100)
			FileWriteLine($GamePage_path, ' </div>')
			FileWriteLine($GamePage_path, '</body>')
			FileWriteLine($GamePage_path, '</html>')
			Sleep(100)
		EndIf
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Game Page " & "'" & $PageName & "' " & "created . [NR of Games = " & $NR_Applications & "]")
	Next

	$ApplicationList_TEMP = ""

	If $ScanOnlyVR = "true" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamVRLibrary_ALL.ini"
	If $ScanOnlyVR <> "true" Then $ApplicationList_TEMP = $ApplicationList_Folder & "ApplicationList_SteamLibrary_ALL.ini"

	For $Loop_Temp_2 = 1 To 2
		$NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")

		If $Loop_Temp_2 = 1 Then
			Local $GamePage_path_temp = $Install_DIR & "WebPage\GamePage_Viveport.html"
			Local $PageName = "Viveport Games"
		EndIf

		If $Loop_Temp_2 = 2 Then
			Local $GamePage_path_temp = $Install_DIR & "WebPage\GamePage_Oculus.html"
			Local $PageName = "Oculus Games"
		EndIf

		If FileExists($GamePage_path_temp) Then FileDelete($GamePage_path_temp)

		Local $HTML_Content = '<html>' & @CRLF & _
				'<head>' & @CRLF & _
				'    <title>GamePage</title>' & @CRLF & _
				'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
				'</head>' & @CRLF & _
				'<body>' & @CRLF & _
				'<script>' & @CRLF & _
				' ' & @CRLF & _
				'</script>' & @CRLF & _
				'<h1>' & $PageName & '</h1><br><br><br>' & @CRLF & _
				'<div class="icons">' & @CRLF

		If $HomeApp = "VR Toolbox" Then
			$HTML_Content = '<html>' & @CRLF & _
					'<head>' & @CRLF & _
					'    <title>GamePage</title>' & @CRLF & _
					'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
					'</head>' & @CRLF & _
					'<body>' & @CRLF & _
					'<script>' & @CRLF & _
					'    function VRTStartCommand(cmd) {' & @CRLF & _
					"      var s = '{ " & '"LightVRCallback": { "ShellExec": "' & "' + cmd + '" & '" } }' & "';" & @CRLF & _
					'      console.log(s);' & @CRLF & _
					'    }' & @CRLF & _
					'</script>' & @CRLF & _
					'<h1>' & $PageName & '</h1><br><br><br>' & @CRLF & _
					'<div class="icons">' & @CRLF
		EndIf

		If $Add_Back_to_HTML_GamePage = "true" Then
			Local $Content_Back = '<div id="layer_1" style="position: absolute; width: 100px; height: 45px; z-index: 1; left: 22px; top: 30px">' & @CRLF & _
					'	<a href="GamePage_Menu.html">			<img src="images/BACK.png" height="55px" width="100px"></a>' & @CRLF & _
					'</div>' & @CRLF

			$HTML_Content = $HTML_Content & $Content_Back
		EndIf

		FileWrite($GamePage_path_temp, $HTML_Content)

		For $Loop_Temp_3 = 1 To $NR_Applications
			If WinExists($AppName_Window_Main_GUI) Then
				;GUICtrlSetData($Anzeige_Fortschrittbalken, ($Loop_Temp_3 * 100 / $NR_Applications))
			EndIf
			Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp_3, "NR", "")
			Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp_3, "appid", "")
			Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp_3, "name", "")
			Global $Application_installdir = IniRead($ApplicationList_TEMP, "Application_" & $Loop_Temp_3, "installdir", "")
			Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $Application_appid, "IconPath", "")
			Global $WebPage_IconPath = $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg"

			If $Loop_Temp_2 = 1 Then
				Local $StringLeft_Check_AppID = StringLeft($Application_appid, 9)
				Local $StringTrimLeft_Check_AppID = StringTrimLeft($Application_appid, 9)
				Local $StringLeft_Application_appid = StringLeft($Application_appid, 9)
				Local $StringTrimLeft_Application_appid = StringTrimLeft($Application_appid, 9)
				Local $AppID_Check_String = "vive.htc."


				If $StringLeft_Application_appid = $AppID_Check_String Then
					If Not FileExists($WebPage_IconPath) Then
						FileCopy($Icons & "steam.app." & $Application_appid & ".jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
					EndIf

					If Not FileExists($WebPage_IconPath) Then
						FileCopy($Application_IconPath, $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
					EndIf

					If Not FileExists($WebPage_IconPath) Then
						If $StringLeft_Application_appid = "vive.htc." Then FileCopy($gfx & "Viveport.app.icon.jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
					EndIf

					If $HomeApp = "VR Toolbox" Then
						If $StringLeft_Application_appid = "vive.htc." Then FileWriteLine($GamePage_path_temp, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'vive://runapp/" & $StringTrimLeft_Application_appid & "');" & '">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					EndIf

					If $HomeApp <> "VR Toolbox" Then
						If $StringLeft_Application_appid = "vive.htc." Then FileWriteLine($GamePage_path_temp, '    <div class="tooltip"><a href="vive://runapp/' & $StringTrimLeft_Application_appid & ' ">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					EndIf
				EndIf
			EndIf

			If $Loop_Temp_2 = 2 Then
				Local $StringLeft_Check_AppID = StringLeft($Application_appid, 11)
				Local $StringTrimLeft_Check_AppID = StringTrimLeft($Application_appid, 11)
				Local $StringLeft_Application_appid = StringLeft($Application_appid, 11)
				Local $StringTrimLeft_Application_appid = StringTrimLeft($Application_appid, 11)
				Local $AppID_Check_String = "revive.app."

				If $StringLeft_Application_appid = $AppID_Check_String Then
					Local $App_binary_path = IniRead($ApplicationList_INI_TEMP, "Application_" & $Application_appid, "binary_path_windows", "")
					$App_binary_path = StringReplace($App_binary_path, '/', '\')
					Local $App_arguments = IniRead($ApplicationList_INI_TEMP, "Application_" & $Application_appid, "arguments", "")
					Local $Check_Left_1_App_arguments = StringLeft($App_arguments, 7)
					Local $Check_Left_2_App_arguments = StringLeft($App_arguments, 10)
					If $Check_Left_1_App_arguments = '/base \' Then $App_arguments = StringTrimLeft($App_arguments, 7)
					If $Check_Left_2_App_arguments = '/library \' Then $App_arguments = StringTrimLeft($App_arguments, 10)
					$App_arguments = StringReplace($App_arguments, '/', '\')
					$App_arguments = StringReplace($App_arguments, '\\', '\')
					$App_arguments = StringReplace($App_arguments, '"', '')
					If StringRight($App_arguments, 1) = "\" Then $App_arguments = StringTrimRight($App_arguments, 1)
					Local $Oculus_App_Path = "C:\Program Files\Oculus\Software\" & $App_arguments
					If $Check_Left_1_App_arguments = '/base \' Then $Oculus_App_Path = "C:\Program Files\Oculus\Support\" & $App_arguments
					If $Check_Left_2_App_arguments = '/library \' Then $Oculus_App_Path = "C:\Program Files\Oculus\Software\" & $App_arguments

					If $HomeApp = "VR Toolbox" Then
						Local $Start_File_Path = $Install_DIR & "WebPage\Revive\" & $Application_appid & ".bat"
						Local $Start_File_Path_Replaced = StringReplace($Start_File_Path, '\', '/')
						Local $Revive_App_Path_1 = $Revive_Path & $App_binary_path
						Local $Revive_App_Path_2 = $Oculus_App_Path

						If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($Start_File_Path)
						If Not FileExists($Start_File_Path) Then
							FileWrite($Start_File_Path, '"' & $Revive_App_Path_1 & '" ' & '"' & $Revive_App_Path_2 & '"' & @CRLF & "@echo." & @CRLF & "timeout /t 3")
						EndIf
					EndIf

					If Not FileExists($WebPage_IconPath) Then
						FileCopy($Icons & "steam.app." & $Application_appid & ".jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
					EndIf

					If Not FileExists($WebPage_IconPath) Then
						FileCopy($Application_IconPath, $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
					EndIf

					If Not FileExists($WebPage_IconPath) Then
						If $StringLeft_Application_appid = "revive.app." Then FileCopy($gfx & "revive.app..jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
					EndIf

					If $HomeApp = "VR Toolbox" Then
						If $StringLeft_Application_appid <> "vive.htc." Then FileWriteLine($GamePage_path_temp, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'file:///" & $Start_File_Path_Replaced & "');" & '">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					EndIf

					If $HomeApp <> "VR Toolbox" Then
						If $StringLeft_Application_appid <> "vive.htc." Then FileWriteLine($GamePage_path_temp, '    <div class="tooltip"><a href="' & $Application_appid & ' ">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
					EndIf
				EndIf
			EndIf
		Next
	Next



	$ApplicationList_TEMP = ""
	$GamePage_path_temp = ""

	For $Loop_Temp_4 = 1 To 30
		If WinExists($AppName_Window_Main_GUI) Then
			;GUICtrlSetData($Anzeige_Fortschrittbalken, ($Loop_Temp_4 * 100 / 30))
		EndIf

		Local $FileName = FileReadLine($Tags_TXT, $Loop_Temp_4)
		$ApplicationList_TEMP = $MainCategory_ApplicationList_Folder & $FileName & ".ini"

		If FileExists($ApplicationList_TEMP) Then
			$NR_Applications = IniRead($ApplicationList_TEMP, "ApplicationList", "NR_Applications", "")
			Local $GamePage_path_temp = $Install_DIR & "WebPage\Tags\" & $FileName & ".html"
			Local $GamePage_Tags_path_folder = $Install_DIR & "WebPage\Tags\"

			If FileExists($GamePage_path_temp) Then FileDelete($GamePage_path_temp)

			Local $HTML_Content = '<html>' & @CRLF & _
					'<head>' & @CRLF & _
					'    <title>GamePage</title>' & @CRLF & _
					'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
					'</head>' & @CRLF & _
					'<body>' & @CRLF & _
					'<script>' & @CRLF & _
					' function goBack() {' & @CRLF & _
					'    window.history.back();' & @CRLF & _
					'}' & @CRLF & _
					' ' & @CRLF & _
					'</script>' & @CRLF & _
					'<h1>' & $FileName & '</h1><br><br><br>' & @CRLF & _
					'<div class="icons">' & @CRLF

			If $HomeApp = "VR Toolbox" Then
				$HTML_Content = '<html>' & @CRLF & _
						'<head>' & @CRLF & _
						'    <title>GamePage</title>' & @CRLF & _
						'    <link href="css/games.css" rel="stylesheet" type="text/css">' & @CRLF & _
						'</head>' & @CRLF & _
						'<body>' & @CRLF & _
						'<script>' & @CRLF & _
						'    function VRTStartCommand(cmd) {' & @CRLF & _
						"      var s = '{ " & '"LightVRCallback": { "ShellExec": "' & "' + cmd + '" & '" } }' & "';" & @CRLF & _
						'      console.log(s);' & @CRLF & _
						'    }' & @CRLF & _
						'</script>' & @CRLF & _
						'<h1>' & $FileName & '</h1><br><br><br>' & @CRLF & _
						'<div class="icons">' & @CRLF
			EndIf

			If $Add_Back_to_HTML_GamePage = "true" Then
				Local $Content_Back = '<div id="layer_1" style="position: absolute; width: 100px; height: 45px; z-index: 1; left: 22px; top: 30px">' & @CRLF & _
						'	<a onclick="goBack()" href="Back.html">			<img src="images/BACK.png" height="55px" width="100px"></a>' & @CRLF & _
						'</div>' & @CRLF

				$HTML_Content = $HTML_Content & $Content_Back
			EndIf

			FileWrite($GamePage_path_temp, $HTML_Content)

			Local $Back_Content = '<meta http-equiv="refresh" content="0; url=file:///' & $Install_DIR & 'WebPage/' & 'GamePage_Tags.html">'

			If FileExists($GamePage_Tags_path_folder & "Back.html") Then FileDelete($GamePage_Tags_path_folder & "Back.html")
			FileWrite($GamePage_Tags_path_folder & "Back.html", $Back_Content)

			For $NR = 1 To $NR_Applications
				Global $Application_NR = IniRead($ApplicationList_TEMP, "Application_" & $NR, "NR", "")
				Global $Application_appid = IniRead($ApplicationList_TEMP, "Application_" & $NR, "appid", "")
				Global $Application_name = IniRead($ApplicationList_TEMP, "Application_" & $NR, "name", "")
				Global $Application_installdir = IniRead($ApplicationList_TEMP, "Application_" & $NR, "installdir", "")
				Global $Application_IconPath = IniRead($ApplicationList_TEMP, "Application_" & $Application_appid, "IconPath", "")
				Global $WebPage_IconPath = $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg"

				Local $StringLeft_Application_appid = StringLeft($Application_appid, 9)
				Local $StringTrimLeft_Application_appid = StringTrimLeft($Application_appid, 9)

				If Not FileExists($WebPage_IconPath) Then
					FileCopy($Icons & "steam.app." & $Application_appid & ".jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If Not FileExists($WebPage_IconPath) Then
					FileCopy($Application_IconPath, $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If Not FileExists($WebPage_IconPath) Then
					If $StringLeft_Application_appid <> "vive.htc." Then FileCopy($gfx & "steamVR.app.icon.jpg", $Install_DIR & "WebPage\images\steam.app." & $Application_appid & ".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
				EndIf

				If $HomeApp = "VR Toolbox" Then
					If $StringLeft_Application_appid <> "vive.htc." Then FileWriteLine($GamePage_path_temp, '<div class="tooltip"><a onclick="VRTStartCommand(' & "'steam://rungameid/" & $Application_appid & "');" & '">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
				EndIf

				If $HomeApp <> "VR Toolbox" Then
					If $StringLeft_Application_appid <> "vive.htc." Then FileWriteLine($GamePage_path_temp, '    <div class="tooltip"><a href="steam://rungameid/' & $Application_appid & ' ">         <img class="icon" src="images/steam.app.' & $Application_appid & '.jpg" width="460" /><br>&nbsp;<span class="tooltiptext">' & $Application_name & '</span></a></div>')
				EndIf
			Next
			Sleep(100)
			FileWriteLine($GamePage_path_temp, ' </div>')
			FileWriteLine($GamePage_path_temp, '</body>')
			FileWriteLine($GamePage_path_temp, '</html>')
			Sleep(100)
		EndIf
		FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " Game Page " & "'" & $FileName & "' " & "created . [NR of Games = " & $NR_Applications & "]")
	Next

	FileWriteLine($stats_log_FILE, "[" & _Now() & "]" & " End creating Game Pages. [NR of created Game Pages  = 6]")

	If WinExists($AppName_Window_Main_GUI) Then
		;GUICtrlSetData($Anzeige_Fortschrittbalken, 50)
	EndIf
EndFunc   ;==>_Create_GamePages

#EndRegion Func Create Game Pages

#Region Read/Write Steam Files
Func _Read_steamapps_vrmanifest()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14741) :(' & @MIN & ':' & @SEC & ') _Read_steamapps_vrmanifest()' & @CR) ;### Function Trace
	If FileExists($ApplicationList_SteamVRLibrary_ALL_INI) Then FileDelete($ApplicationList_SteamVRLibrary_ALL_INI)
	Local $ApplicationList_NR_TEMP = IniRead($ApplicationList_SteamVRLibrary_ALL_INI, "ApplicationList", "NR_Applications", "")
	Local $FileLines = _FileCountLines($Steamapps_vrmanifest_FilePath)
	$Array_Result = _FileReadToArray($Steamapps_vrmanifest_FilePath, $Steamapps_vrmanifest_Array)
	If @error Then
		$ScriptLineNumber_Temp = @ScriptLineNumber
		$AtError_Result = @error
	EndIf
	If $AtError_Result <> "" Or $Array_Result = -1 Then _FileReadToArray_Error_Handler()

	$Loop_End_1 = $Steamapps_vrmanifest_Array[0]

	;_ArrayDisplay($Steamapps_vrmanifest_Array)

	Global $Array_Sorted[1][2] = [["name", "appid"]]

	;If WinExists($AppName_Window_Main_GUI) Then
	;	GUICtrlSetData($Anzeige_Fortschrittbalken, 3)
	;EndIf

	Local $NR_Apps_temp = 1

	For $Loop = 1 To $Loop_End_1
		$Steamapps_vrmanifest_aArray = _StringBetween($Steamapps_vrmanifest_Array[$Loop], '"', '"', $STR_ENDNOTSTART)
		FileWriteLine(@ScriptDir & "\Test.txt", $Steamapps_vrmanifest_Array[$Loop])
		;MsgBox(0, $Loop_End_1, $Steamapps_vrmanifest_Array[$Loop])
		If $Steamapps_vrmanifest_aArray <> 0 Then $NR_Apps_temp = $NR_Apps_temp + 1

		If $Steamapps_vrmanifest_aArray <> 0 Then
			If $Steamapps_vrmanifest_aArray[0] <> "" Then
				Local $Check_Left = $Steamapps_vrmanifest_aArray[0]
				Local $Check_Right = ""

				If $Check_Left = "app_key" Or $Check_Left = "name" Or $Check_Left = "image_path" Or $Check_Left = "url" Then
					$Check_Right = $Steamapps_vrmanifest_aArray[1]
				EndIf

				If $Check_Left = "app_key" Then
					Local $Steam_app_key_TEMP = $Check_Right
					$SteamAppID_TEMP = StringReplace($Steam_app_key_TEMP, 'steam.app.', '')

					Local $Check_Position = StringInStr($Steamapps_vrmanifest_Array[$Loop + 2], "name")
					If $Check_Position <> 0 Then $Steam_app_Name_TEMP = _StringBetween($Steamapps_vrmanifest_Array[$Loop + 2], '"', '"', $STR_ENDNOTSTART)

					If $Check_Position = 0 Then
						$Check_Position = StringInStr($Steamapps_vrmanifest_Array[$Loop + 3], "name")
						If $Check_Position <> 0 Then $Steam_app_Name_TEMP = _StringBetween($Steamapps_vrmanifest_Array[$Loop + 3], '"', '"', $STR_ENDNOTSTART)
						If $Check_Position <> 0 Then $Steam_app_Name_TEMP = $Steam_app_Name_TEMP[1]
					EndIf

					If $Check_Position = 0 Then
						$Check_Position = StringInStr($Steamapps_vrmanifest_Array[$Loop + 4], "name")
						If $Check_Position <> 0 Then $Steam_app_Name_TEMP = _StringBetween($Steamapps_vrmanifest_Array[$Loop + 4], '"', '"', $STR_ENDNOTSTART)
						If $Check_Position <> 0 Then $Steam_app_Name_TEMP = $Steam_app_Name_TEMP[1]
					EndIf

					If $Check_Position = 0 Then
						$Check_Position = StringInStr($Steamapps_vrmanifest_Array[$Loop + 5], "name")
						If $Check_Position <> 0 Then $Steam_app_Name_TEMP = _StringBetween($Steamapps_vrmanifest_Array[$Loop + 5], '"', '"', $STR_ENDNOTSTART)
						If $Check_Position <> 0 Then $Steam_app_Name_TEMP = $Steam_app_Name_TEMP[1]
					EndIf

					If $Check_Position = 0 Then
						$Steam_app_Name_TEMP = ""
					EndIf

					$ApplicationList_NR_TEMP = $ApplicationList_NR_TEMP + 1

					Local $sFill = $Steam_app_Name_TEMP & "|" & $SteamAppID_TEMP
					$Array_Result = _ArrayAdd($Array_Sorted, $sFill)
					If @error Then
						$ScriptLineNumber_Temp = @ScriptLineNumber
						$AtError_Result = @error
					EndIf
					If $AtError_Result <> "" Or $Array_Result = -1 Then _ArrayAdd_Error_Handler()

					If WinExists($AppName_Window_Main_GUI) Then
						_GUICtrlStatusBar_SetText($Statusbar, "" & "Scan SteamLibrary: " & "Nr: " & $ApplicationList_NR_TEMP & " - " & "Name: " & $Steam_app_Name_TEMP & " - " & "SteamAppID: " & $SteamAppID_TEMP & @TAB & "" & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")
					EndIf

					If $ScanOnlyVR = "true" Then
						$appid = $SteamAppID_TEMP
						$DeleteHomeLoaderLibraryData = IniRead($Config_INI, "Settings", "DeleteHomeLoaderLibraryData", "")
						If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($Icons & "32x32\" & "steam.app." & $appid & ".bmp")
						If $DeleteHomeLoaderLibraryData = "true" Then FileDelete($Icons & "256x256\" & "steam.app." & $appid & ".bmp")

						If Not FileExists($Icons & "steam.app." & $appid & ".jpg") Then
							_Download_Icon_for_SteamGameID()
						EndIf

						If Not FileExists($Icons & "32x32\" & "steam.app." & $appid & ".bmp") Then
							;_Get_SteamGame_Icon_32x32()
							_Get_SteamGame_Icon_32x32_new()
						EndIf

						If Not FileExists($Icons & "256x256\" & "steam.app." & $appid & ".ico") Then
							;_Get_SteamGame_Icon_256x256()
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	Next
	;If WinExists($AppName_Window_Main_GUI) Then
	;	GUICtrlSetData($Anzeige_Fortschrittbalken, 6)
	;EndIf

	If $Sort_Alphabetical_order = "true" Then
		_ArraySort($Array_Sorted, 0, 1, 0, 0)
	EndIf

	IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "ApplicationList", "NR_Applications", $ApplicationList_NR_TEMP)

	For $Loop = 1 To $ApplicationList_NR_TEMP
		IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Loop, "NR", $Loop)
		IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Loop, "name", $Array_Sorted[$Loop][0])
		IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Loop, "appid", $Array_Sorted[$Loop][1])
		IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Array_Sorted[$Loop][1], "NR", $Loop)
		IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Array_Sorted[$Loop][1], "name", $Array_Sorted[$Loop][0])
		IniWrite($ApplicationList_SteamVRLibrary_ALL_INI, "Application_" & $Array_Sorted[$Loop][1], "appid", $Array_Sorted[$Loop][1])

		If $Request_Steamdb_info = "true" And $Array_Sorted[$Loop][1] <> "" Then
			$Application_NR = $Loop
			$appid = $Array_Sorted[$Loop][1]
		EndIf

		;If WinExists($AppName_Window_Main_GUI) Then
		;	GUICtrlSetData($Anzeige_Fortschrittbalken, $Loop * 100 / $ApplicationList_NR_TEMP)
		;EndIf
	Next
EndFunc   ;==>_Read_steamapps_vrmanifest
#EndRegion Read/Write Steam Files



Func _Start_Revive_Oculus_App()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (14711) :(' & @MIN & ':' & @SEC & ') _Start_Revive_Oculus_App()' & @CR) ;### Function Trace
	If $ScanOnlyVR = "true" Then $ApplicationList_INI_TEMP = $ApplicationList_SteamVRLibrary_ALL_INI
	If $ScanOnlyVR <> "true" Then $ApplicationList_INI_TEMP = $ApplicationList_SteamLibrary_ALL_INI

	Local $App_binary_path = IniRead($ApplicationList_INI_TEMP, "Application_" & $Check_AppId, "binary_path_windows", "")
	$App_binary_path = StringReplace($App_binary_path, '/', '\')
	Local $App_arguments = IniRead($ApplicationList_INI_TEMP, "Application_" & $Check_AppId, "arguments", "")
	Local $Check_Left_1_App_arguments = StringLeft($App_arguments, 7)
	Local $Check_Left_2_App_arguments = StringLeft($App_arguments, 10)
	If $Check_Left_1_App_arguments = '/base \' Then $App_arguments = StringTrimLeft($App_arguments, 7)
	If $Check_Left_2_App_arguments = '/library \' Then $App_arguments = StringTrimLeft($App_arguments, 10)
	$App_arguments = StringReplace($App_arguments, '/', '\')
	$App_arguments = StringReplace($App_arguments, '\\', '\')
	$App_arguments = StringReplace($App_arguments, '"', '')
	If StringRight($App_arguments, 1) = "\" Then $App_arguments = StringTrimRight($App_arguments, 1)

	Local $Oculus_App_Path = "C:\Program Files\Oculus\Software\" & $App_arguments

	If $Check_Left_1_App_arguments = '/base \' Then $Oculus_App_Path = "C:\Program Files\Oculus\Support\" & $App_arguments
	If $Check_Left_2_App_arguments = '/library \' Then $Oculus_App_Path = "C:\Program Files\Oculus\Software\" & $App_arguments

	MsgBox(0, "_Start_Revive_Oculus_App", $Revive_Path & $App_binary_path & " " & $Oculus_App_Path)

	;ShellExecute($Revive_Path & $App_binary_path, $Oculus_App_Path)
	RunWait($Revive_Path & $App_binary_path & " " & $Oculus_App_Path, "", @SW_HIDE)
EndFunc

Func _Create_WMR_Startmenu_Files()
	_GUICtrlStatusBar_SetText($Statusbar, "Creating WMR Shortcut Files for Startmenu...Please Wait..." & @TAB & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")

	Local $ApplicationList_Temp_INI = $ApplicationList_SteamLibrary_ALL_INI

	If $ScanOnlyVR <> "true" Then
		$ApplicationList_Temp_INI = $ApplicationList_SteamLibrary_ALL_INI
	Else
		$ApplicationList_Temp_INI = $ApplicationList_SteamVRLibrary_ALL_INI
	EndIf

	Local $NR_Rows = IniRead($ApplicationList_Temp_INI, "ApplicationList", "NR_Applications", "")

	Local $WMR_Startmenu_File_Template_Folder = $Install_DIR & "Templates\"
	;Local $WMR_Startmenu_File_Folder = $Install_DIR & "SteamVR\"

	For $Loop = 1 To $NR_Rows
		Local $name_temp = IniRead($ApplicationList_Temp_INI, "Application_" & $Loop, "name", "")
		Local $appid_temp = IniRead($ApplicationList_Temp_INI, "Application_" & $Loop, "appid", "")
		Local $appNR_temp = IniRead($ApplicationList_Temp_INI, "Application_" & $Loop, "appid", "")

		Local $name_temp_Replace_Doppelpunkt = StringReplace($name_temp, ':', '-')

		Local $icon_Path_WMRGL = $Install_DIR & "Icons\32x32\" & "steam.app." & $appid_temp & ".bmp"
		Local $icon_Path_temp = $icon_Path_WMRGL

		Local $icon_Path_temp = IniRead($ApplicationList_Temp_INI, "Application_" & $appid_temp, "Icon_32x32", $icon_Path_WMRGL)

		IniWrite($ApplicationList_Temp_INI, "Application_" & $Loop, "Icon_32x32", $icon_Path_temp)

		Local $Content_XML = '<Application xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">' & @CRLF & _
								'  <VisualElements' & @CRLF & _
								'	ShowNameOnSquare150x150Logo="on"' & @CRLF & _
								'	Square150x150Logo="' & $name_temp_Replace_Doppelpunkt & '.png"' & @CRLF & _
								'	Square70x70Logo="' & $name_temp_Replace_Doppelpunkt & '.png"' & @CRLF & _
								'	ForegroundText="light"' & @CRLF & _
								'	BackgroundColor="#000000">' & @CRLF & _
								'	<MixedRealityModel Path="' & $name_temp_Replace_Doppelpunkt & '.glb">' & @CRLF & _
								'		<SpatialBoundingBox Center="0,0,0" Extents="Auto" />' & @CRLF & _
								'	</MixedRealityModel>' & @CRLF & _
								'  </VisualElements>' & @CRLF & _
								'</Application>'

		Local $StringLeft_Check_AppID = StringLeft($appid_temp, 9)
		Local $StringTrimLeft_Check_AppID = StringTrimLeft($appid_temp, 9)

		Local $Start_SteamVR_Apps = 'URL=steam://launch/' & $appid_temp & '/VR'
		Local $Start_Viveport_Apps = 'URL=vive://runapp/' & $StringTrimLeft_Check_AppID

		Local $Start_App_Line = $Start_SteamVR_Apps

		If $StringLeft_Check_AppID = "vive.htc." Then
			$Start_App_Line = $Start_Viveport_Apps
		Else
			$Start_App_Line = $Start_SteamVR_Apps
		EndIf

		Local $Content_lnk = '[{9F4C2855-9F79-4B39-A8D0-E1D42DE1D5F3}]' & @CRLF & _
								'Prop31="' & $WMR_Startmenu_File_Folder & $name_temp_Replace_Doppelpunkt & '.xml"' & @CRLF & _
								'[InternetShortcut]' & @CRLF & _
								'IDList=' & @CRLF & _
								'IconIndex=0' & @CRLF & _
								$Start_App_Line & @CRLF & _
								'IconFile=' & $icon_Path_temp

		FileWrite($WMR_Startmenu_File_Folder & $name_temp_Replace_Doppelpunkt & ".xml", $Content_XML)
		FileWrite($WMR_Startmenu_File_Folder & $name_temp_Replace_Doppelpunkt & ".url", $Content_lnk)

		Local $FileRead_temp = FileRead($WMR_Startmenu_File_Template_Folder & "WMR_Shortcut_Model\WMR_Shortcut_Model.gltf")
		Local $FileRead_temp_new_1 = StringReplace($FileRead_temp, '            "uri" : "WMR_Shortcut_Model.jpg"', '            "uri" : "' & $name_temp_Replace_Doppelpunkt & '.jpg"')
		Local $FileRead_temp_new_2 = StringReplace($FileRead_temp_new_1, '            "uri" : "WMR_Shortcut_Model.bin"', '            "uri" : "' & $name_temp_Replace_Doppelpunkt & '.bin"')

		FileWrite($WMR_Startmenu_File_Template_Folder & "WMR_Shortcut_Model\" & $name_temp_Replace_Doppelpunkt & ".gltf", $FileRead_temp_new_2)

		FileCopy($Install_DIR & "Icons\" & "steam.app." & $appid_temp & ".jpg", $WMR_Startmenu_File_Template_Folder & "WMR_Shortcut_Model\" & $name_temp_Replace_Doppelpunkt & ".jpg", $FC_CREATEPATH + $FC_OVERWRITE)
		FileCopy($WMR_Startmenu_File_Template_Folder & "WMR_Shortcut_Model\WMR_Shortcut_Model.bin", $WMR_Startmenu_File_Template_Folder & "WMR_Shortcut_Model\" & $name_temp_Replace_Doppelpunkt & ".bin", $FC_CREATEPATH + $FC_OVERWRITE)

		Local $Run_1 = '"' & $WMR_Startmenu_File_Template_Folder & "WMR_Shortcut_Model\WindowsMRAssetConverter.exe" & '"'
		Local $Run_2 = '"' & $WMR_Startmenu_File_Template_Folder & "WMR_Shortcut_Model\" & $name_temp_Replace_Doppelpunkt & ".gltf" & '"'

		RunWait($Run_1 & " " & $Run_2, "", @SW_HIDE)

		FileCopy($WMR_Startmenu_File_Template_Folder & "WMR_Shortcut_Model\" & $name_temp_Replace_Doppelpunkt & ".glb", $WMR_Startmenu_File_Folder & $name_temp_Replace_Doppelpunkt & ".glb", $FC_CREATEPATH + $FC_OVERWRITE)
		FileCopy($WMR_Startmenu_File_Template_Folder & "WMR_Shortcut_Model\" & $name_temp_Replace_Doppelpunkt & ".jpg", $WMR_Startmenu_File_Folder & $name_temp_Replace_Doppelpunkt & ".jpg", $FC_CREATEPATH + $FC_OVERWRITE)

		FileDelete($WMR_Startmenu_File_Template_Folder & "WMR_Shortcut_Model\" & $name_temp_Replace_Doppelpunkt & ".bin")
		FileDelete($WMR_Startmenu_File_Template_Folder & "WMR_Shortcut_Model\" & $name_temp_Replace_Doppelpunkt & ".glb")
		FileDelete($WMR_Startmenu_File_Template_Folder & "WMR_Shortcut_Model\" & $name_temp_Replace_Doppelpunkt & ".gltf")
		FileDelete($WMR_Startmenu_File_Template_Folder & "WMR_Shortcut_Model\" & $name_temp_Replace_Doppelpunkt & ".jpg")
	Next
	_GUICtrlStatusBar_SetText($Statusbar, "WMR Shortcut Files created." & @TAB & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")
EndFunc


#Region ERROR handler
Func MyErrFunc()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (15287) :(' & @MIN & ':' & @SEC & ') MyErrFunc()' & @CR) ;### Function Trace
	Local $HexNumber
	Local $strMsg

	$HexNumber = Hex($oMyError.Number, 8)
	$strMsg = "Error Number: " & $HexNumber & " - "
	$strMsg &= "WinDescription: " & $oMyError.WinDescription & " - "
	$strMsg &= "Script Line: " & $oMyError.ScriptLine & " - "

	Local $Error_Explanation_Write = "[" & _Now() & "]" & " ---> Error [MyErrFunc()]: " & "ObjCreate 'WinHttp.WinHttpRequest.5.1'" & " The requested action with this object has failed. Error retrieving URL... " & $strMsg & " - " & $name & " - " & $appid & "<--- " & "[" & _Now() & "]"

	FileWriteLine($error_log_FILE, @CRLF & $Error_Explanation_Write & @CRLF & @CRLF)
	FileWriteLine($error_log_FILE, "--------------------------------------------------------------------------------------" & @CRLF)

	If WinExists($AppName_Window_Main_GUI) Then
		_GUICtrlStatusBar_SetText($Statusbar, "" & "Error retrieving URL... " & $strMsg & " - " & $name & " - " & $appid & @TAB & "" & @TAB & "'V" & $Version & "' " & "'WMRGL [WMR Game Loader] by Cogent'")
	EndIf
	SetError(1)
EndFunc   ;==>MyErrFunc

Func _ArrayAdd_Error_Handler()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (15308) :(' & @MIN & ':' & @SEC & ') _ArrayAdd_Error_Handler()' & @CR) ;### Function Trace
	Local $Error_From = "_ArrayAdd_Error_Handler"
	Local $HexNumber
	Local $strMsg
	Local $Error_Explanation = ""
	Local $Error_Explanation_Details = ""
	Local $Log_NR_Lines =_FileCountLines($function_log_FILE)
	$Error_Explanation_Details = FileReadLine($function_log_FILE, $Log_NR_Lines - 2)

	Local $Check_String_NR = StringInStr($Error_Explanation_Details, ':')
	Local $Script_Line = StringReplace(StringLeft($Error_Explanation_Details, $Check_String_NR - 3), '@@ (', '')
	;$Script_Line = StringReplace($Script_Line, ') ', '')


	$HexNumber = Hex($oMyError.Number, 8)
	$strMsg = "HomeLoader Version: " & $Version & @CRLF
	$strMsg &= "Error Number: " & $HexNumber & @CRLF
	$strMsg &= "WinDescription: " & $oMyError.WinDescription & @CRLF
	$strMsg &= "Script Line: " & $Script_Line & " (" & $ScriptLineNumber_Temp & ")" ;& @CRLF


	If $Array_Result = -1 Then $Error_Explanation = "-1 - Failure @error flag to non-zero"
	If $AtError_Result = 1 Then $Error_Explanation = "1 - $aArray is not an array"
	If $AtError_Result = 2 Then $Error_Explanation = "2 - $aArray is not a 1 or 2 dimensional array"
	If $AtError_Result = 3 Then $Error_Explanation = "3 - $vValue has too many columns to fit into $aArray"
	If $AtError_Result = 4 Then $Error_Explanation = "4 - $iStart outside array bounds (2D only)"
	If $AtError_Result = 5 Then $Error_Explanation = "5 - Number of dimensions for $avArray and $vValue arrays do not match"


	If $Error_Explanation = "" Then $Error_Explanation = "(No explanation available)"

	Local $Error_Explanation_Write = "An error occurred." & " - " & "[" & _Now() & "]" & @CRLF & _
										"HomeLoader has written some informations in to the" & @CRLF & _
										"log file and cancels the current action." & @CRLF & @CRLF & _
										$Error_From & @CRLF & @CRLF & _
										"Description:" & @CRLF & _
										$strMsg & @CRLF & @CRLF & _
										"Explanation:" & @CRLF & _
										$Error_Explanation & @CRLF & _
										$Error_Explanation_Details & @CRLF


	;FileWriteLine($error_log_FILE, "@error '_ArrayAdd' " & "[" & _Now() & "]" & " : " & $strMsg & " - " & $AtError_Result & @CRLF)
	FileWriteLine($error_log_FILE, @CRLF & $Error_Explanation_Write & @CRLF)
	FileWriteLine($error_log_FILE, "--------------------------------------------------------------------------------------" & @CRLF)

	;Local $Abfrage = MsgBox($MB_YESNO + $MB_TOPMOST + $MB_TASKMODAL + $MB_ICONERROR, "An error occurred", $Error_Explanation_Write & @CRLF & @CRLF & @CRLF & _
	;																					"Do you want to open the folder with the log files for further investigation?" & @CRLF & @CRLF)

	;If $Abfrage = 6 Then
	;	ShellExecute($Install_DIR & "System\logs\")
	;EndIf

	SetError(1)
EndFunc

Func _FileListToArray_Error_Handler()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (15365) :(' & @MIN & ':' & @SEC & ') _FileListToArray_Error_Handler()' & @CR) ;### Function Trace
	Local $Error_From = "_FileListToArray_Error_Handler"
	Local $HexNumber
	Local $strMsg
	Local $Error_Explanation = ""
	Local $Error_Explanation_Details = ""
	Local $Log_NR_Lines =_FileCountLines($function_log_FILE)
	$Error_Explanation_Details = FileReadLine($function_log_FILE, $Log_NR_Lines - 2)

	Local $Check_String_NR = StringInStr($Error_Explanation_Details, ':')
	Local $Script_Line = StringReplace(StringLeft($Error_Explanation_Details, $Check_String_NR - 3), '@@ (', '')
	;$Script_Line = StringReplace($Script_Line, ') ', '')


	$HexNumber = Hex($oMyError.Number, 8)
	$strMsg = "HomeLoader Version: " & $Version & @CRLF
	$strMsg &= "Error Number: " & $HexNumber & @CRLF
	$strMsg &= "WinDescription: " & $oMyError.WinDescription & @CRLF
	$strMsg &= "Script Line: " & $Script_Line & " (" & $ScriptLineNumber_Temp & ")" ;& @CRLF

	If $Array_Result = 0 Then $Error_Explanation = "0 - @error flag set to non-zero and $vReturn is set to 0."
	If $AtError_Result = 1 Then $Error_Explanation = "1 - Error opening specified file"
	If $AtError_Result = 2 Then $Error_Explanation = "2 - Unable to split the file"
	If $AtError_Result = 3 Then $Error_Explanation = "3 - File lines have different numbers of fields (only if $FRTA_INTARRAYS flag not set)"
	If $AtError_Result = 4 Then $Error_Explanation = "4 - No delimiters found (only if $FRTA_INTARRAYS flag not set)"


	If $Error_Explanation = "" Then $Error_Explanation = "(No explanation available)"

	Local $Error_Explanation_Write = "An error occurred." & " - " & "[" & _Now() & "]" & @CRLF & _
										"HomeLoader has written some informations in to the" & @CRLF & _
										"log file and cancels the current action." & @CRLF & @CRLF & _
										$Error_From & @CRLF & @CRLF & _
										"Description:" & @CRLF & _
										$strMsg & @CRLF & @CRLF & _
										"Explanation:" & @CRLF & _
										$Error_Explanation & @CRLF & _
										$Error_Explanation_Details & @CRLF


	;FileWriteLine($error_log_FILE, "@error '_ArrayAdd' " & "[" & _Now() & "]" & " : " & $strMsg & " - " & $AtError_Result & @CRLF)
	FileWriteLine($error_log_FILE, @CRLF & $Error_Explanation_Write & @CRLF)
	FileWriteLine($error_log_FILE, "--------------------------------------------------------------------------------------" & @CRLF)

	;Local $Abfrage = MsgBox($MB_YESNO + $MB_TOPMOST + $MB_TASKMODAL + $MB_ICONERROR, "An error occurred", $Error_Explanation_Write & @CRLF & @CRLF & @CRLF & _
	;																					"Do you want to open the folder with the log files for further investigation?" & @CRLF & @CRLF)

	;If $Abfrage = 6 Then
	;	ShellExecute($Install_DIR & "System\logs\")
	;EndIf

	SetError(1)
EndFunc

Func _FileReadToArray_Error_Handler()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (15420) :(' & @MIN & ':' & @SEC & ') _FileReadToArray_Error_Handler()' & @CR) ;### Function Trace
	Local $Error_From = "_FileReadToArray_Error_Handler"
	Local $HexNumber
	Local $strMsg
	Local $Error_Explanation = ""
	Local $Error_Explanation_Details = ""
	Local $Log_NR_Lines =_FileCountLines($function_log_FILE)
	$Error_Explanation_Details = FileReadLine($function_log_FILE, $Log_NR_Lines - 2)

	Local $Check_String_NR = StringInStr($Error_Explanation_Details, ':')
	Local $Script_Line = StringReplace(StringLeft($Error_Explanation_Details, $Check_String_NR - 3), '@@ (', '')
	;$Script_Line = StringReplace($Script_Line, ') ', '')


	$HexNumber = Hex($oMyError.Number, 8)
	$strMsg = "HomeLoader Version: " & $Version & @CRLF
	$strMsg &= "Error Number: " & $HexNumber & @CRLF
	$strMsg &= "WinDescription: " & $oMyError.WinDescription & @CRLF
	$strMsg &= "Script Line: " & $Script_Line & " (" & $ScriptLineNumber_Temp & ")" ;& @CRLF

	If $AtError_Result = 1 Then $Error_Explanation = "1 - Folder not found or invalid"
	If $AtError_Result = 2 Then $Error_Explanation = "2 - Invalid $sFilter"
	If $AtError_Result = 3 Then $Error_Explanation = "3 - Invalid $iFlag"
	If $AtError_Result = 4 Then $Error_Explanation = "4 - No File(s) Found"


	If $Error_Explanation = "" Then $Error_Explanation = "(No explanation available)"

	Local $Error_Explanation_Write = "An error occurred." & " - " & "[" & _Now() & "]" & @CRLF & _
										"HomeLoader has written some informations in to the" & @CRLF & _
										"log file and cancels the current action." & @CRLF & @CRLF & _
										$Error_From & @CRLF & @CRLF & _
										"Description:" & @CRLF & _
										$strMsg & @CRLF & @CRLF & _
										"Explanation:" & @CRLF & _
										$Error_Explanation & @CRLF & _
										$Error_Explanation_Details & @CRLF


	;FileWriteLine($error_log_FILE, "@error '_ArrayAdd' " & "[" & _Now() & "]" & " : " & $strMsg & " - " & $AtError_Result & @CRLF)
	FileWriteLine($error_log_FILE, @CRLF & $Error_Explanation_Write & @CRLF)
	FileWriteLine($error_log_FILE, "--------------------------------------------------------------------------------------" & @CRLF)

	;Local $Abfrage = MsgBox($MB_YESNO + $MB_TOPMOST + $MB_TASKMODAL + $MB_ICONERROR, "An error occurred", $Error_Explanation_Write & @CRLF & @CRLF & @CRLF & _
	;																					"Do you want to open the folder with the log files for further investigation?" & @CRLF & @CRLF)

	;If $Abfrage = 6 Then
	;	ShellExecute($Install_DIR & "System\logs\")
	;EndIf

	SetError(1)
EndFunc

Func _StringSplit_Error_Handler()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (15474) :(' & @MIN & ':' & @SEC & ') _StringSplit_Error_Handler()' & @CR) ;### Function Trace
	Local $Error_From = "_StringSplit_Error_Handler"
	Local $HexNumber
	Local $strMsg
	Local $Error_Explanation = ""
	Local $Error_Explanation_Details = ""
	Local $Log_NR_Lines =_FileCountLines($function_log_FILE)
	$Error_Explanation_Details = FileReadLine($function_log_FILE, $Log_NR_Lines - 2)

	Local $Check_String_NR = StringInStr($Error_Explanation_Details, ':')
	Local $Script_Line = StringReplace(StringLeft($Error_Explanation_Details, $Check_String_NR - 3), '@@ (', '')
	;$Script_Line = StringReplace($Script_Line, ') ', '')


	$HexNumber = Hex($oMyError.Number, 8)
	$strMsg = "HomeLoader Version: " & $Version & @CRLF
	$strMsg &= "Error Number: " & $HexNumber & @CRLF
	$strMsg &= "WinDescription: " & $oMyError.WinDescription & @CRLF
	$strMsg &= "Script Line: " & $Script_Line & " (" & $ScriptLineNumber_Temp & ")" ;& @CRLF

	If $AtError_Result = 1 Then $Error_Explanation = "1 - Folder not found or invalid"
	If $AtError_Result = 2 Then $Error_Explanation = "2 - Invalid $sFilter"
	If $AtError_Result = 3 Then $Error_Explanation = "3 - Invalid $iFlag"
	If $AtError_Result = 4 Then $Error_Explanation = "4 - No File(s) Found"


	If $Error_Explanation = "" Then $Error_Explanation = "(No explanation available)"

	Local $Error_Explanation_Write = "An error occurred." & " - " & "[" & _Now() & "]" & @CRLF & _
										"HomeLoader has written some informations in to the" & @CRLF & _
										"log file and cancels the current action." & @CRLF & @CRLF & _
										$Error_From & @CRLF & @CRLF & _
										"Description:" & @CRLF & _
										$strMsg & @CRLF & @CRLF & _
										"Explanation:" & @CRLF & _
										$Error_Explanation & @CRLF & _
										$Error_Explanation_Details & @CRLF


	;FileWriteLine($error_log_FILE, "@error '_ArrayAdd' " & "[" & _Now() & "]" & " : " & $strMsg & " - " & $AtError_Result & @CRLF)
	FileWriteLine($error_log_FILE, @CRLF & $Error_Explanation_Write & @CRLF)
	FileWriteLine($error_log_FILE, "--------------------------------------------------------------------------------------" & @CRLF)

	;Local $Abfrage = MsgBox($MB_YESNO + $MB_TOPMOST + $MB_TASKMODAL + $MB_ICONERROR, "An error occurred", $Error_Explanation_Write & @CRLF & @CRLF & @CRLF & _
	;																					"Do you want to open the folder with the log files for further investigation?" & @CRLF & @CRLF)

	;If $Abfrage = 6 Then
	;	ShellExecute($Install_DIR & "System\logs\")
	;EndIf

	SetError(1)
EndFunc

Func _URL_Download_Error_Handler()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (15528) :(' & @MIN & ':' & @SEC & ') _URL_Download_Error_Handler()' & @CR) ;### Function Trace
	Local $Error_From = "_URL_Download_Error_Handler"
	Local $HexNumber
	Local $strMsg
	Local $Error_Explanation = ""
	Local $Error_Explanation_Details = ""
	Local $Log_NR_Lines =_FileCountLines($function_log_FILE)
	$Error_Explanation_Details = FileReadLine($function_log_FILE, $Log_NR_Lines - 2)

	Local $Check_String_NR = StringInStr($Error_Explanation_Details, ':')
	Local $Script_Line = StringReplace(StringLeft($Error_Explanation_Details, $Check_String_NR - 3), '@@ (', '')
	;$Script_Line = StringReplace($Script_Line, ') ', '')


	$HexNumber = Hex($oMyError.Number, 8)
	$strMsg = "HomeLoader Version: " & $Version & @CRLF
	$strMsg &= "Error Number: " & $HexNumber & @CRLF
	$strMsg &= "WinDescription: " & $oMyError.WinDescription & @CRLF
	$strMsg &= "Script Line: " & $Script_Line & " (" & $ScriptLineNumber_Temp & ")" ;& @CRLF

	If $AtError_Result = 1 Then $Error_Explanation = "1 - Folder not found or invalid"
	If $AtError_Result = 2 Then $Error_Explanation = "2 - Invalid $sFilter"
	If $AtError_Result = 3 Then $Error_Explanation = "3 - Invalid $iFlag"
	If $AtError_Result = 4 Then $Error_Explanation = "4 - No File(s) Found"


	If $Error_Explanation = "" Then $Error_Explanation = "(No explanation available)"

	Local $Error_Explanation_Write = "An error occurred." & " - " & "[" & _Now() & "]" & @CRLF & _
										"HomeLoader has written some informations in to the" & @CRLF & _
										"log file and cancels the current action." & @CRLF & @CRLF & _
										$Error_From & @CRLF & @CRLF & _
										"Description:" & @CRLF & _
										$strMsg & @CRLF & @CRLF & _
										"Explanation:" & @CRLF & _
										$Error_Explanation & @CRLF & _
										$Error_Explanation_Details & @CRLF


	;FileWriteLine($error_log_FILE, "@error '_ArrayAdd' " & "[" & _Now() & "]" & " : " & $strMsg & " - " & $AtError_Result & @CRLF)
	FileWriteLine($error_log_FILE, @CRLF & $Error_Explanation_Write & @CRLF)
	FileWriteLine($error_log_FILE, "--------------------------------------------------------------------------------------" & @CRLF)

	;Local $Abfrage = MsgBox($MB_YESNO + $MB_TOPMOST + $MB_TASKMODAL + $MB_ICONERROR, "An error occurred", $Error_Explanation_Write & @CRLF & @CRLF & @CRLF & _
	;																					"Do you want to open the folder with the log files for further investigation?" & @CRLF & @CRLF)

	;If $Abfrage = 6 Then
		;ShellExecute($Install_DIR & "System\logs\")
	;EndIf

	SetError(1)
EndFunc
#EndRegion ERROR handler


Func _Quit_PO_Image_2_Image()
	If $Debug_Mode = "true" Then FileWriteLine($function_log_FILE, @CRLF & '@@ (2577) :(' & @MIN & ':' & @SEC & ') _Quit_PO_Image_2_Image()' & @CR) ;### Function Trace
	If FileExists($HomeLoader_Config_Folder & "Icon_NR_Background" & ".jpg") Then FileDelete($HomeLoader_Config_Folder & "Icon_NR_Background" & ".jpg")
	If FileExists($HomeLoader_Config_Folder & "CategoryNameImage" & ".jpg") Then FileDelete($HomeLoader_Config_Folder & "CategoryNameImage" & ".jpg")
	If FileExists($HomeLoader_Config_Folder & "WTOB" & ".png") Then FileDelete($HomeLoader_Config_Folder & "WTOB" & ".png")
	If FileExists($HomeLoader_Config_Folder & "Icon_NR_Background" & ".jpg") Then FileDelete($HomeLoader_Config_Folder & "Icon_NR_Background" & ".jpg")
	If FileExists($HomeLoader_Config_Folder & "CategoryNameImage" & ".jpg") Then FileDelete($HomeLoader_Config_Folder & "CategoryNameImage" & ".jpg")
	If FileExists($HomeLoader_Config_Folder & "WTOB" & ".png") Then FileDelete($HomeLoader_Config_Folder & "WTOB" & ".png")
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_ImageDispose($hImage1)
	_GDIPlus_ImageDispose($hImage2)
	_GDIPlus_GraphicsDispose($hGraphic)
	_WinAPI_DeleteObject($hBMPBuff)
	_GDIPlus_Shutdown()
EndFunc   ;==>_Quit_PO_Image_2_Image

