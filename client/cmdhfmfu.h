#include "cmdhfmf.h"
#include "cmdhf14a.h"

#ifndef CMDHFMFU_H__
#define CMDHFMFU_H__

int CmdHF14AMfUWrBl(const char *Cmd);
int CmdHF14AMfURdBl(const char *Cmd);

//Crypto Cards
int CmdHF14AMfucAuth(const char *Cmd);
int CmdHF14AMfucSetPwd(const char *Cmd);
int CmdHF14AMfucSetUid(const char *Cmd);
int CmdHF14AMfuGenDiverseKeys(const char *Cmd);
int CmdHF14AMfuPwdGen(const char *Cmd);

//general stuff
int CmdHF14AMfUDump(const char *Cmd);
int CmdHF14AMfUInfo(const char *Cmd);
int CmdHF14AMfUeLoad(const char *Cmd);
int CmdHF14AMfUSim(const char *Cmd);

uint32_t GetHF14AMfU_Type(void);
int ul_print_type(uint32_t tagtype, uint8_t spacer);
void ul_switch_off_field(void);

int usage_hf_mfu_info(void);
int usage_hf_mfu_dump(void);
int usage_hf_mfu_rdbl(void);
int usage_hf_mfu_wrbl(void);
int usage_hf_mfu_eload(void);
int usage_hf_mfu_sim(void);
int usage_hf_mfu_ucauth(void);
int usage_hf_mfu_ucsetpwd(void);
int usage_hf_mfu_ucsetuid(void);
int usage_hf_mfu_gendiverse(void);
int  usage_hf_mfu_pwdgen(void);

int CmdHFMFUltra(const char *Cmd);

uint32_t ul_ev1_pwdgenA(uint8_t* uid);
uint32_t ul_ev1_pwdgenA(uint8_t* uid);
uint32_t ul_ev1_pwdgenC(uint8_t* uid);

uint16_t ul_ev1_packgenA(uint8_t* uid);
uint16_t ul_ev1_packgenA(uint8_t* uid);
uint16_t ul_ev1_packgenA(uint8_t* uid);

typedef enum TAGTYPE_UL {
	UNKNOWN       = 0x000000,
	UL            = 0x000001,
	UL_C          = 0x000002,
	UL_EV1_48     = 0x000004,
	UL_EV1_128    = 0x000008,
	NTAG          = 0x000010,
	NTAG_203      = 0x000020,
	NTAG_210      = 0x000040,
	NTAG_212      = 0x000080,
	NTAG_213      = 0x000100,
	NTAG_215      = 0x000200,
	NTAG_216      = 0x000400,
	MY_D          = 0x000800,
	MY_D_NFC      = 0x001000,
	MY_D_MOVE     = 0x002000,
	MY_D_MOVE_NFC = 0x004000,
	MY_D_MOVE_LEAN= 0x008000,
	NTAG_I2C_1K   = 0x010000,
	NTAG_I2C_2K   = 0x020000,
	FUDAN_UL      = 0x040000,
	MAGIC         = 0x080000,
	UL_MAGIC      = UL | MAGIC,
	UL_C_MAGIC    = UL_C | MAGIC,
	UL_ERROR      = 0xFFFFFF,
} TagTypeUL_t;

#endif
