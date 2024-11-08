Return-Path: <linux-i2c+bounces-7888-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 799EC9C1C5B
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 12:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DDBF28675F
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 11:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD61B1E47CC;
	Fri,  8 Nov 2024 11:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSXJR8VF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B822A1E411C;
	Fri,  8 Nov 2024 11:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731066218; cv=none; b=Xg1hKjztQPG+1AEFvOCmPkFMGSOZAnTT9f9nMob2W/PYg9RIKVIepYgJSHCY6/xJZ8G6b5rKewZqqjT696S1D+Vwdvn4XsEfXjNp57wGu4fZ30969oTIkiTgTTXgeQd4xbhJCt7jaipTDj1huQwNiyYE+ry40fbNkZCmfUIfNt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731066218; c=relaxed/simple;
	bh=Z3MeimcWKFPerfkdRx+VIeqamhgH8+tIyeVb8VnnHF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3X7CPFp+WNyDtK2reKuK4nSyoXDSP64JyTCiUt18g/Ik0sKmovLrnH6RV44iT9LLx3NvJbZtXcDIIIidQNcCuzdoGBqnHHxVSiJ1Gpw1Nyjtk9yHLO0hfi0ErLY9EFtF/nEuofTvyagLAB4N28EmAl3DPYl2putaUTXEdSy0nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSXJR8VF; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-50d2e71de18so937539e0c.1;
        Fri, 08 Nov 2024 03:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731066214; x=1731671014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfcwEoz6eKwfBjamac5TTZRnWnKEPKFYSt1spQknwl0=;
        b=WSXJR8VFY56GLG1d6WSLqYsKOKsBAc12yOyLqe8d61IhNnsXPpIRL3Kb7t24cjyHtH
         21JFN7471IbP0uy+aHZ1va65DZm2p3E47EqDugC52wc/QDCPhts9O29fY06isovewSqh
         6gyQjULn0LMPLwmzstG3iDFomknEBB8NFlSjo6Vu/JOXmJ29sfnLLV+FnM1XIaeEXfNX
         Y4WATjF2NF/dQWS0JNRmMjuYB3ol2GJbsEsGMTAAH8kf4mqjYJ3gEjuaD86kb2YqqHu6
         Nx6syL7rh2+AtFc94+fJ0xIq+vtVst/KMCkCTIhvHS7T4AIdkkPpRoClaPo00kaPm1AZ
         v7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731066214; x=1731671014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfcwEoz6eKwfBjamac5TTZRnWnKEPKFYSt1spQknwl0=;
        b=G39VonaUDgLaVQHycy+GeVTDAz9+lZNw5uLFQ75V3uutfa53OPHpuYBpG/ISpLiLmN
         Qe60PJwqvmWCniAZvWeRzdhlzMd1YOXxjeJxve28k0nRDCIsZYIZvzF1rL7HaMFR5v7J
         RL4M4+LDhTUUR+mkZmecxVQYfaE47gGCbZ2rK58NyvjmtGFFQsDvlT8bZN/n34oOeqHQ
         PEsxRx4IEPUgFD1+6wGRaqi8vcpgPzANyXaL3Yg28mq7RlxdyrqSd7LTN2v7TVqZgeBA
         Wo0b664fUSW+EIaSOoWIV1892bxrmTlT/ZQLO4CC1CWrhMpasFIn6+rQfM23A2cnPk4g
         jcXw==
X-Forwarded-Encrypted: i=1; AJvYcCWtRjZWsn3FokjbjLwMLPF0wQlzdVbDiIO1x+SDWoGBvPczl2hopucZsl1e8IQVOQFSkK2EAN3nW/xx@vger.kernel.org, AJvYcCXMFQXJh9PgW5l8Upz7rutpz+KtuhHi8u05EIbhq7FRCHQuP6OZvxmfXfKrXg0qsylYYF6DOshGByau@vger.kernel.org
X-Gm-Message-State: AOJu0YwjtjGkEPkM2vfoIbdOEYLGWzkR8gsyaKxAMTkXs8YqsrMeFrVW
	swXRcsGwZp7xVhyhUurvBqe4j7/4d0F51FeB/aew4rV8AGdZx9qwxz3vWkYYzzRj/RegghynYFz
	JWmmAE1VowY6KLizAt5kyVpZIPLFSt1c8
X-Google-Smtp-Source: AGHT+IFBymVD4sX41T8IcTtvWmgWTiiAUbGavzOG81hf+VSLYzA2zgSBAWoRW+s2ISV+zUEbUIFSnfe0yDv1Yfo7S14=
X-Received: by 2002:a05:6122:a18:b0:50d:69a8:f5a6 with SMTP id
 71dfb90a1353d-51401e4a84bmr2740308e0c.9.1731066214343; Fri, 08 Nov 2024
 03:43:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACSj6VX77y6K9FNFZn-rMvEL9XSPS6rFDt-STGf1UxgkuS6msw@mail.gmail.com>
 <Zy3P7ld7UUL8XCrR@smile.fi.intel.com> <7fc0f59b8264e965efc96c0aa0ba4c31@dev.tdt.de>
In-Reply-To: <7fc0f59b8264e965efc96c0aa0ba4c31@dev.tdt.de>
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Fri, 8 Nov 2024 14:48:44 +0300
Message-ID: <CACSj6VW7WKv5tiAkLCvSujENJvXq1Mc7_7vtkQsRSz3JGY0i3Q@mail.gmail.com>
Subject: Re: Adding I2C devices to the SMBus (PIIX4) via the ACPI SSDT overlay method
To: Florian Eckert <fe@dev.tdt.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the help!

I've created the following SSDT:
```
DefinitionBlock ("at24.aml", "SSDT", 5, "", "AT24", 1)
{
    External (_SB_.PCI0.SMBS, DeviceObj)

    Scope (\_SB_.PCI0.SMBS)
    {
        Device (SMB0) {
            Name (_ADR, 0)
        }
        Device (SMB1) {
            Name (_ADR, 1)
        }
        Device (SMB2) {
            Name (_ADR, 2)
        }
    }

    Scope (\_SB.PCI0.SMBS)
    {
        Device (EEP0) {
            Name (_HID, "PRP0001")
            Name (_DDN, "Atmel AT24 compatible EEPROM")
            Name (_CRS, ResourceTemplate () {
                I2cSerialBusV2 (
                    0x0050,              // I2C Slave Address
                    ControllerInitiated,
                    400000,              // Bus speed
                    AddressingMode7Bit,
                    "\\_SB.PCI0.SMBS.SMB0",   // Link to ACPI I2C host
controller
                    0
                )
            })

            Name (_DSD, Package () {
                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "compatible", Package() { "atmel,24c128" }=
 },
                }
            })
        }
    }
}
```
and have added it via initrd.
I think I've tried this ACPI code before, but only via acpi_configfs,
which apparently was too late.

Now I can see that SMBS device contains 3 subdevices for the relevant
i2c busses:
```
$ cat /sys/bus/acpi/devices/device\:25/path
\_SB_.PCI0.SMBS
$ ls -l /sys/bus/acpi/devices/device\:25/
total 0
-r--r--r-- 1 root root 4096 Nov  8 12:23 adr
drwxr-xr-x 3 root root    0 Nov  8 12:21 device:26
drwxr-xr-x 3 root root    0 Nov  8 12:21 device:27
drwxr-xr-x 3 root root    0 Nov  8 12:21 device:28
-r--r--r-- 1 root root 4096 Nov  8 12:23 path
lrwxrwxrwx 1 root root    0 Nov  8 12:23 physical_node ->
../../../../pci0000:00/0000:00:14.0
drwxr-xr-x 2 root root    0 Nov  8 12:23 power
drwxr-xr-x 3 root root    0 Nov  8 12:21 PRP0001:00
lrwxrwxrwx 1 root root    0 Nov  8 12:21 subsystem -> ../../../../../bus/ac=
pi
-rw-r--r-- 1 root root 4096 Nov  8 12:21 uevent
drwxr-xr-x 3 root root    0 Nov  8 12:21 wakeup

$ ls -l /sys/bus/acpi/devices/device\:25/device\:26/
total 0
-r--r--r-- 1 root root 4096 Nov  8 12:23 adr
-r--r--r-- 1 root root 4096 Nov  8 12:23 path
lrwxrwxrwx 1 root root    0 Nov  8 12:23 physical_node ->
../../../../../pci0000:00/0000:00:14.0/i2c-7
drwxr-xr-x 2 root root    0 Nov  8 12:23 power
lrwxrwxrwx 1 root root    0 Nov  8 12:21 subsystem -> ../../../../../../bus=
/acpi
-rw-r--r-- 1 root root 4096 Nov  8 12:21 uevent

$ ls -l /sys/bus/acpi/devices/device\:25/device\:27/
total 0
-r--r--r-- 1 root root 4096 Nov  8 12:24 adr
-r--r--r-- 1 root root 4096 Nov  8 12:24 path
lrwxrwxrwx 1 root root    0 Nov  8 12:24 physical_node ->
../../../../../pci0000:00/0000:00:14.0/i2c-9
drwxr-xr-x 2 root root    0 Nov  8 12:24 power
lrwxrwxrwx 1 root root    0 Nov  8 12:21 subsystem -> ../../../../../../bus=
/acpi
-rw-r--r-- 1 root root 4096 Nov  8 12:21 uevent

$ ls -l /sys/bus/acpi/devices/device\:25/device\:28/
total 0
-r--r--r-- 1 root root 4096 Nov  8 12:24 adr
-r--r--r-- 1 root root 4096 Nov  8 12:24 path
lrwxrwxrwx 1 root root    0 Nov  8 12:24 physical_node ->
../../../../../pci0000:00/0000:00:14.0/i2c-8
drwxr-xr-x 2 root root    0 Nov  8 12:24 power
lrwxrwxrwx 1 root root    0 Nov  8 12:21 subsystem -> ../../../../../../bus=
/acpi
-rw-r--r-- 1 root root 4096 Nov  8 12:21 uevent
```

And my PRP0001 device is finally created and added to the correct bus:
```
$ ls -l /sys/bus/acpi/devices/device\:25/PRP0001\:00/
total 0
-r--r--r-- 1 root root 4096 Nov  8 12:25 hid
-r--r--r-- 1 root root 4096 Nov  8 12:25 modalias
-r--r--r-- 1 root root 4096 Nov  8 12:25 path
lrwxrwxrwx 1 root root    0 Nov  8 12:25 physical_node ->
../../../../../pci0000:00/0000:00:14.0/i2c-7/i2c-PRP0001:00
drwxr-xr-x 2 root root    0 Nov  8 12:25 power
lrwxrwxrwx 1 root root    0 Nov  8 12:21 subsystem -> ../../../../../../bus=
/acpi
-rw-r--r-- 1 root root 4096 Nov  8 12:21 uevent
```

However I was using the at24 device only as an example.
My real target device is jc42
(https://github.com/torvalds/linux/blob/906bd684e4b1e517dd424a354744c5b0aeb=
ef8af/drivers/hwmon/jc42.c#L600).

Here you can see that I can actually provide a driver for it and use:
```
# echo jc42 0x30 > /sys/bus/i2c/devices/i2c-7/new_device
# i2cdetect -y 7
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: 10 11 -- -- -- -- -- -- -- -- -- -- UU -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: 30 -- -- -- -- 35 36 -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- 4a -- -- -- -- --
50: -- -- -- -- 54 -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- 73 -- -- -- --
# cat /sys/bus/i2c/devices/i2c-7/7-001c/hwmon/hwmon4/temp1_input
34000
```

But when I try to perform binding via ACPI, device is created, but for
some reason driver is not connected:
```
$ sudo i2cdetect -y 7
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: 10 11 -- -- -- -- -- -- -- -- -- -- 1c -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: 30 -- -- -- -- 35 36 -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- 4a -- -- -- -- --
50: -- -- -- -- 54 -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- 73 -- -- -- --

$ cat /sys/bus/i2c/devices/i2c-7/i2c-PRP0001\:00/name
jc-42.4-temp

ubuntu@ubuntu-SP3:~$ cat /sys/bus/i2c/devices/i2c-7/i2c-PRP0001\:00/modalia=
s
of:Njc42TCjedec,jc-42.4-temp

$ ls -l /sys/bus/i2c/devices/i2c-7/i2c-PRP0001\:00/
total 0
lrwxrwxrwx 1 root root    0 Nov  8 14:35 firmware_node ->
../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:25/PRP0001:00
-r--r--r-- 1 root root 4096 Nov  8 14:35 modalias
-r--r--r-- 1 root root 4096 Nov  8 14:33 name
drwxr-xr-x 2 root root    0 Nov  8 14:35 power
lrwxrwxrwx 1 root root    0 Nov  8 14:33 subsystem -> ../../../../../bus/i2=
c
-rw-r--r-- 1 root root 4096 Nov  8 14:33 uevent
-r--r--r-- 1 root root 4096 Nov  8 14:35 waiting_for_supplier
```

Does it mean that jc42 driver doesn't support ACPI binding?

Just in case here is my SSDT:
```
DefinitionBlock ("jc42.aml", "SSDT", 5, "", "JC42", 1)
{
    External (_SB_.PCI0.SMBS, DeviceObj)

    Scope (\_SB_.PCI0.SMBS)
    {
        Device (SMB0) {
            Name (_ADR, 0)
        }
        Device (SMB1) {
            Name (_ADR, 1)
        }
        Device (SMB2) {
            Name (_ADR, 2)
        }
    }

    Scope (\_SB.PCI0.SMBS)
    {
        Device (JC42) {
            Name (_HID, "PRP0001")
            Name (_DDN, "JC42 Temperature sensor")
            Name (_CRS, ResourceTemplate () {
                I2cSerialBusV2 (
                    0x001c,              // I2C Slave Address
                    ControllerInitiated,
                    400000,              // Bus speed
                    AddressingMode7Bit,
                    "\\_SB.PCI0.SMBS.SMB0",   // Link to ACPI I2C host
controller
                    0
                )
            })

            Name (_DSD, Package () {
                ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
                Package () {
                    Package () { "compatible", Package() {
"jedec,jc-42.4-temp" } },
                }
            })
        }
    }
}
```

Best regards,
Konstantin Aladyshev

On Fri, Nov 8, 2024 at 12:27=E2=80=AFPM Florian Eckert <fe@dev.tdt.de> wrot=
e:
>
> Hello Konstantin,
>
> On 2024-11-08 09:46, Andy Shevchenko wrote:
> > +Cc: Florian (as this indeed rang a bell to me)
> >
> > https://lore.kernel.org/all/d84fb798722762862a7fb08f1e343b6a@dev.tdt.de=
/
>
> The message was forwarded by Andy because I had a similar problem with
> my APU3 [1]
> from PC-engine [2], which is also using the PIIX4 for I2C (SMBUS).
>
> >> Maybe I need to modify ACPI code somehow to create these
> >> 'physical_nodesX' folders for the relevant i2c-7/8/9 buses?
>
> I don't know if that helps, but with the following SSDT overlay I
> managed
> to get the driver to feel responsible for the mcp23017 via the I2C
> (SMBUS) of
> the APU3. The mcp23017 is used on my APU3 to add additional LEDs to
> '/sys/class/leds'.
>
> ```
> DefinitionBlock ("mcp.aml", "SSDT", 5, "TEST", "MCP", 2)
> {
>          External (\_SB.PCI0.SBUS, DeviceObj)
>
>          Scope (\_SB.PCI0.SBUS)
>          {
>                  Device (I2C0)
>                  {
>                          Name (_ADR, Zero)
>                          Device (GPIO)
>                          {
>                                  Name (_HID, "PRP0001")
>                                  Name (_DDN, "MCP23017 pinctrl")
>                                  Name (_CRS, ResourceTemplate ()
>                                  {
>                                          I2cSerialBus (
>                                                  0x24,
>                                                  ControllerInitiated,
>                                                  100000,
>                                                  AddressingMode7Bit,
>                                                  "\\_SB.PCI0.SBUS.I2C0",
>                                                  0x00
>                                          )
>                                  })
>                                  Name (_DSD, Package ()
>                                  {
>
> ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                                          Package () {
>                                                  Package () {
> "compatible", "microchip,mcp23017" },
>                                          }
>                                  })
>
>                                  Device (LEDS)
>                                  {
>                                          Name (_HID, "PRP0001")
>                                          Name (_DDN, "GPIO LEDs device")
>                                          Name (_CRS, ResourceTemplate ()
> {
>                                                  GpioIo (
>                                                          Exclusive,
>                                                          PullNone,
>                                                          0,
>                                                          0,
>
> IoRestrictionOutputOnly,
>
> "\\_SB.PCI0.SBUS.I2C0.GPIO",
>                                                          0)
>                                                  {
>                                                          0,
>                                                          1,
>                                                          2,
>                                                          3,
>                                                          4,
>                                                          5,
>                                                          6,
>                                                          7,
>                                                  }
>                                          })
>
>                                          Name (_DSD, Package () {
>
> ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                                                  Package () {
>                                                          Package () {
> "compatible", Package() { "gpio-leds" } },
>                                                  },
>
> ToUUID("dbb8e3e6-5886-4ba6-8795-1319f52a966b"),
>                                                  Package () {
>                                                          Package ()
> {"led-0", "LED0"},
>                                                          Package ()
> {"led-1", "LED1"},
>                                                          Package ()
> {"led-2", "LED2"},
>                                                          Package ()
> {"led-3", "LED3"},
>                                                          Package ()
> {"led-4", "LED4"},
>                                                          Package ()
> {"led-5", "LED5"},
>                                                          Package ()
> {"led-6", "LED6"},
>                                                          Package ()
> {"led-7", "LED7"},
>                                                  }
>                                          })
>
>                                          Name (LED0, Package () {
>
> ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                                                  Package () {
>                                                          Package ()
> {"label", "khan:green:led1"},
>                                                          Package ()
> {"default-state", "off"},
>                                                          Package ()
> {"linux,default-trigger", "default-off"},
>                                                          Package ()
> {"gpios", Package () {^LEDS, 0, 0, 1}},
>                                                          Package ()
> {"retain-state-suspended", 1},
>                                                  }
>                                          })
>
>                                          Name (LED1, Package () {
>
> ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                                                  Package () {
>                                                          Package ()
> {"label", "khan:green:led2"},
>                                                          Package ()
> {"default-state", "off"},
>                                                                  Package
> () {"linux,default-trigger", "default-off"},
>                                                          Package ()
> {"gpios", Package () {^LEDS, 0, 1, 1}},
>                                                          Package ()
> {"retain-state-suspended", 1},
>                                                  }
>                                          })
>
>                                          Name (LED2, Package () {
>
> ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                                                  Package () {
>                                                          Package ()
> {"label", "khan:green:led3"},
>                                                          Package ()
> {"default-state", "off"},
>                                                          Package ()
> {"linux,default-trigger", "default-off"},
>                                                          Package ()
> {"gpios", Package () {^LEDS, 0, 2, 1}},
>                                                          Package ()
> {"retain-state-suspended", 1},
>                                                  }
>                                          })
>
>                                          Name (LED3, Package () {
>
> ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                                                  Package () {
>                                                          Package ()
> {"label", "khan:green:led4"},
>                                                          Package ()
> {"default-state", "off"},
>                                                          Package ()
> {"linux,default-trigger", "default-off"},
>                                                          Package ()
> {"gpios", Package () {^LEDS, 0, 3, 1}},
>                                                          Package ()
> {"retain-state-suspended", 1},
>                                                  }
>                                          })
>
>                                          Name (LED4, Package () {
>
> ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                                                  Package () {
>                                                          Package ()
> {"label", "khan:green:led5"},
>                                                          Package ()
> {"default-state", "off"},
>                                                          Package ()
> {"linux,default-trigger", "default-off"},
>                                                          Package ()
> {"gpios", Package () {^LEDS, 0, 4, 1}},
>                                                          Package ()
> {"retain-state-suspended", 1},
>                                                  }
>                                          })
>
>                                          Name (LED5, Package () {
>
> ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                                                  Package () {
>                                                          Package ()
> {"label", "khan:green:led6"},
>                                                          Package ()
> {"default-state", "off"},
>                                                          Package ()
> {"linux,default-trigger", "default-off"},
>                                                          Package ()
> {"gpios", Package () {^LEDS, 0, 5, 1}},
>                                                          Package ()
> {"retain-state-suspended", 1},
>                                                  }
>                                          })
>
>                                          Name (LED6, Package () {
>
> ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                                                  Package () {
>                                                          Package ()
> {"label", "khan:green:led7"},
>                                                          Package ()
> {"default-state", "off"},
>                                                          Package ()
> {"linux,default-trigger", "default-off"},
>                                                          Package ()
> {"gpios", Package () {^LEDS, 0, 6, 1}},
>                                                          Package ()
> {"retain-state-suspended", 1},
>                                                  }
>                                          })
>
>                                          Name (LED7, Package () {
>
> ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                                                  Package () {
>                                                          Package ()
> {"label", "khan:red:led8"},
>                                                          Package ()
> {"default-state", "off"},
>                                                          Package ()
> {"linux,default-trigger", "default-off"},
>                                                          Package ()
> {"gpios", Package () {^LEDS, 0, 7, 1}},
>                                                          Package ()
> {"retain-state-suspended", 1},
>                                                  }
>                                          })
>                                  }
>                          }
>                  }
>          }
> }
> ```
>
> Best regards
>
> Florian
>
> [1] https://pcengines.ch/apu3d4.htm
> [2] https://pcengines.ch/
> [3]
> https://github.com/pcengines/coreboot/blob/8d3e714804b1b2bb5bc89e3ffd9cb3=
c34f8eb0c6/src/southbridge/amd/pi/hudson/acpi/fch.asl#L29

