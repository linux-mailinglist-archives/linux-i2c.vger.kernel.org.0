Return-Path: <linux-i2c+bounces-4076-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E8990C969
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 13:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C63531C233A7
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 11:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96151419BA;
	Tue, 18 Jun 2024 10:27:06 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8401865C;
	Tue, 18 Jun 2024 10:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706426; cv=none; b=S0+bZjsUCP/uE6QlC9WJ5HB4XZJrfkZU07jkso6vYUAMUR2nUydA/HesYU4YzZ+H6o0U8vrLqaZndDVTgVxH/3IHw/qZgxL1lAixsmlkP3q2ltQJeagN/rP1NyI1ZAMV9BFNfOSN97Wh9sdrk5GwxpTN9C+2b4MVsnmgM7AfsAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706426; c=relaxed/simple;
	bh=EgwFcIP4Mgljm56n1SRuhnk08QUmy5FNLyu1V4L8EGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CoaxXyJqLjjElZ/9MOo8gts2PMcPdHS1Rqdh+T62mUToOUwvBZ6LnUV6wSPWdSZb/2SUYAgA9iR0lh029ppTfjXO3N1e9SM+wq4wMW3dsp9W/C+f9bBGdUGTMC740xcHEUQFZOGPYyjaS0IQMU+H/FTElHbW2ZZg8R0jC890Fus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id B8FE361E5FE01;
	Tue, 18 Jun 2024 12:25:55 +0200 (CEST)
Message-ID: <f20ea816-5165-401e-948f-6e77682a2d1b@molgen.mpg.de>
Date: Tue, 18 Jun 2024 12:25:55 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] i2c: smbus: Support DDR5 SPD EEPROMs
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Armin Wolf <W_Armin@gmx.de>, Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-6-linux@roeck-us.net>
 <a5aa120d-8497-4ca8-9752-7d800240b999@molgen.mpg.de>
 <efb77b37-30e5-48a8-b4af-eb9995a2882b@roeck-us.net>
 <33f369c1-1098-458e-9398-30037bd8c5aa@molgen.mpg.de>
 <4e09b843-3d2d-46d7-a8e1-2eabc4382dc7@roeck-us.net>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <4e09b843-3d2d-46d7-a8e1-2eabc4382dc7@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Guenter,


Thank you for your support.


Am 17.06.24 um 17:49 schrieb Guenter Roeck:

> On Mon, Jun 17, 2024 at 04:42:47PM +0200, Paul Menzel wrote:
> [ ... ]
>>
>> I applied your patch
>>
>>      $ git log --oneline --no-decorate -2
>>      00058a6 eeprom: Add basic spd5118 support
>>      a0e5865 i2cdetect: only use "newer" I2C_FUNC_* flags if they exist
>>
>> but reading eeprom fails:
>>
>>      $ sudo ./eeprom/decode-dimms
> 
> decode-dimms does not need sudo, but that should not make a difference.
> 
>>      Cannot read /sys/bus/i2c/drivers/spd5118/0-0050/eeprom at ./eeprom/decode-dimms line 2465.
>>
> Well, it _is_ a hack ;-), but that specific operation should not fail.
> 
> Please try the following:
> 
> ls -l /sys/bus/i2c/drivers/spd5118/0-0050/eeprom
> cp /sys/bus/i2c/drivers/spd5118/0-0050/eeprom /tmp
> od -t x1 /sys/bus/i2c/drivers/spd5118/0-0050/eeprom

     $ ls -l /sys/bus/i2c/drivers/spd5118/0-0050/eeprom
     -r--r--r-- 1 root root 1024 Jun 18 12:17 /sys/bus/i2c/drivers 
/spd5118/0-0050/eeprom
     $ cp /sys/bus/i2c/drivers/spd5118/0-0050/eeprom /tmp
     cp: error reading '/sys/bus/i2c/drivers/spd5118/0-0050/eeprom': No 
such device or address
     $ od -t x1 /sys/bus/i2c/drivers/spd5118/0-0050/eeprom
     od: /sys/bus/i2c/drivers/spd5118/0-0050/eeprom: read error: No such 
device or address
     0000000

> sudo i2cdump -y -f 0 0x50

     $ sudo LD_LIBRARY_PATH=~/src/i2c-tools/lib tools/i2cdump -y -f 0 0x50
     No size specified (using byte-data access)
     Error: Could not open file `/dev/i2c-0' or `/dev/i2c/0': No such 
file or directory

> All those should work, and the size of /tmp/eeprom should be
> 1024 bytes. The output of i2cdump should start with something like
> 
>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
> 00: 51 18 0a 86 32 03 32 00 00 00 00 07 ff 7f 00 00    Q???2?2......?..
>                                       ^^
> 
> and with
> 
>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
> 00: 51 18 0a 86 32 03 32 00 00 00 00 00 ff 7f 00 00    Q???2?2......?..
>                                       ^^
> 
> after executing the "sensors" command.

Hopefully, I didn’t do something silly, that it does not work on my 
system yet. `sensors` is able to read stuff:

```
$ sensors
spd5118-i2c-0-53
Adapter: SMBus I801 adapter at efa0
temp1:        +20.8°C  (low  =  +0.0°C, high = +55.0°C)
                        (crit low =  +0.0°C, crit = +85.0°C)

spd5118-i2c-0-51
Adapter: SMBus I801 adapter at efa0
temp1:        +21.5°C  (low  =  +0.0°C, high = +55.0°C)
                        (crit low =  +0.0°C, crit = +85.0°C)

coretemp-isa-0000
Adapter: ISA adapter
Package id 0:  +32.0°C  (high = +80.0°C, crit = +100.0°C)
Core 0:        +27.0°C  (high = +80.0°C, crit = +100.0°C)
Core 4:        +29.0°C  (high = +80.0°C, crit = +100.0°C)
Core 8:        +28.0°C  (high = +80.0°C, crit = +100.0°C)
Core 12:       +28.0°C  (high = +80.0°C, crit = +100.0°C)
Core 16:       +25.0°C  (high = +80.0°C, crit = +100.0°C)
Core 20:       +26.0°C  (high = +80.0°C, crit = +100.0°C)
Core 24:       +24.0°C  (high = +80.0°C, crit = +100.0°C)
Core 28:       +28.0°C  (high = +80.0°C, crit = +100.0°C)
Core 32:       +30.0°C  (high = +80.0°C, crit = +100.0°C)
Core 33:       +30.0°C  (high = +80.0°C, crit = +100.0°C)
Core 34:       +30.0°C  (high = +80.0°C, crit = +100.0°C)
Core 35:       +30.0°C  (high = +80.0°C, crit = +100.0°C)
Core 36:       +29.0°C  (high = +80.0°C, crit = +100.0°C)
Core 37:       +29.0°C  (high = +80.0°C, crit = +100.0°C)
Core 38:       +29.0°C  (high = +80.0°C, crit = +100.0°C)
Core 39:       +29.0°C  (high = +80.0°C, crit = +100.0°C)
Core 40:       +31.0°C  (high = +80.0°C, crit = +100.0°C)
Core 41:       +31.0°C  (high = +80.0°C, crit = +100.0°C)
Core 42:       +31.0°C  (high = +80.0°C, crit = +100.0°C)
Core 43:       +31.0°C  (high = +80.0°C, crit = +100.0°C)
Core 44:       +30.0°C  (high = +80.0°C, crit = +100.0°C)
Core 45:       +30.0°C  (high = +80.0°C, crit = +100.0°C)
Core 46:       +30.0°C  (high = +80.0°C, crit = +100.0°C)
Core 47:       +30.0°C  (high = +80.0°C, crit = +100.0°C)

spd5118-i2c-0-52
Adapter: SMBus I801 adapter at efa0
temp1:        +21.5°C  (low  =  +0.0°C, high = +55.0°C)
                        (crit low =  +0.0°C, crit = +85.0°C)

spd5118-i2c-0-50
Adapter: SMBus I801 adapter at efa0
temp1:        +21.5°C  (low  =  +0.0°C, high = +55.0°C)
                        (crit low =  +0.0°C, crit = +85.0°C)
```

> Other than that, I can see that your system is an Intel system,
> meaning the i2c controller would be i801, not piix4. I wonder
> if that makes a difference. Has anyone else seeing this tested
> eeprom access with i801 (or any other controller besides piix4),
> by any chance?

Sorry, I only have Intel systems with DDR5 RAM at disposal.


Kind regards,

Paul


PS:

```
$ lsmod | grep i2c
i2c_algo_bit           12288  1 i915
regmap_i2c             12288  1 spd5118
$ grep I2C /boot/config-6.10.0-rc4.mx64.461-00047-g801b6aad6fa7
CONFIG_REGMAP_I2C=m
# CONFIG_SENSORS_LIS3_I2C is not set
# CONFIG_MOUSE_ELAN_I2C is not set
# CONFIG_MOUSE_SYNAPTICS_I2C is not set
# CONFIG_TCG_TIS_I2C is not set
CONFIG_TCG_TIS_I2C_CR50=m
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
# I2C support
CONFIG_I2C=y
CONFIG_ACPI_I2C_OPREGION=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=y
# Multiplexer I2C Chip support
# CONFIG_I2C_MUX_GPIO is not set
# CONFIG_I2C_MUX_LTC4306 is not set
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
# CONFIG_I2C_MUX_REG is not set
# CONFIG_I2C_MUX_MLXCPLD is not set
# end of Multiplexer I2C Chip support
CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=m
# I2C Hardware Bus support
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
CONFIG_I2C_AMD756=m
CONFIG_I2C_AMD756_S4882=m
CONFIG_I2C_AMD8111=m
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=y
CONFIG_I2C_ISCH=m
# CONFIG_I2C_ISMT is not set
CONFIG_I2C_PIIX4=m
CONFIG_I2C_NFORCE2=m
CONFIG_I2C_NFORCE2_S4985=m
# CONFIG_I2C_NVIDIA_GPU is not set
CONFIG_I2C_SIS5595=m
CONFIG_I2C_SIS630=m
CONFIG_I2C_SIS96X=m
CONFIG_I2C_VIA=m
CONFIG_I2C_VIAPRO=m
# CONFIG_I2C_ZHAOXIN is not set
# CONFIG_I2C_SCMI is not set
# I2C system bus drivers (mostly embedded / system-on-chip)
# CONFIG_I2C_CBUS_GPIO is not set
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_GPIO is not set
# CONFIG_I2C_OCORES is not set
# CONFIG_I2C_PCA_PLATFORM is not set
# CONFIG_I2C_SIMTEC is not set
# CONFIG_I2C_XILINX is not set
# External I2C/SMBus adapter drivers
# CONFIG_I2C_DIOLAN_U2C is not set
# CONFIG_I2C_CP2615 is not set
# CONFIG_I2C_PARPORT is not set
# CONFIG_I2C_PCI1XXXX is not set
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TAOS_EVM is not set
# CONFIG_I2C_TINY_USB is not set
# Other I2C/SMBus bus drivers
# CONFIG_I2C_MLXCPLD is not set
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support
# CONFIG_I2C_STUB is not set
# CONFIG_I2C_SLAVE is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support
# I2C GPIO expanders
# end of I2C GPIO expanders
# CONFIG_SENSORS_LTC2947_I2C is not set
# CONFIG_SENSORS_NCT6775_I2C is not set
# CONFIG_SENSORS_OCC_P8_I2C is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_CS42L43_I2C is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_MFD_TPS6594_I2C is not set
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_ATC260X_I2C is not set
CONFIG_VIDEO_V4L2_I2C=y
# audio, video and radio I2C drivers auto-selected by 'Autoselect 
ancillary drivers'
# I2C encoder or helper chips
CONFIG_DRM_I2C_CH7006=m
CONFIG_DRM_I2C_SIL164=m
# CONFIG_DRM_I2C_NXP_TDA998X is not set
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips
CONFIG_I2C_HID=y
# CONFIG_I2C_HID_ACPI is not set
# CONFIG_I2C_HID_OF is not set
# I2C RTC drivers
CONFIG_RTC_I2C_AND_SPI=y
# SPI and I2C RTC drivers
```

