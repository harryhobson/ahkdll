DriveUnLock(l){
static GENERIC_READ:=2147483648,FILE_SHARE_READ:=1,FILE_SHARE_WRITE:=2,OPEN_EXISTING:=3,pmr:=Struct("BOOLEAN"),METHOD_BUFFERED:=0,FILE_READ_ACCESS:=1,IOCTL_STORAGE_BASE:=45
if (-1=hdevice:=DllCall("CreateFile","Str","\\.\" SubStr(l,1,1) ":","Int",GENERIC_READ,"Int",FILE_SHARE_READ|FILE_SHARE_WRITE,"PTR",0,"Int",OPEN_EXISTING,"Int",0,"PTR",0,"PTR"))
return -1
result:=DllCall("DeviceIoControl","PTR",hdevice,"Int",((IOCTL_STORAGE_BASE)<<16)|((FILE_READ_ACCESS)<<14)|((0x0201)<<2)|(0),"PTR",pmr[],"Int",sizeof(pmr),"PTR",0,"Int",0,"PTR*",unused,"PTR",0)
DllCall("CloseHandle","PTR",hdevice)
return result?0:-1
}