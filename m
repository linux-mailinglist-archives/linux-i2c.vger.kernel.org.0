Return-Path: <linux-i2c+bounces-9843-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3465FA63C78
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 04:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B1851884FED
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 03:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2B81714B4;
	Mon, 17 Mar 2025 02:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ButwyNG9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA92C1459F7;
	Mon, 17 Mar 2025 02:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742180244; cv=none; b=MWlRnFe42gRPPRKYKUYMrDrJIj+9N0w2fP4+BFWyFHxqm+O2ZqJcA2OmZr7jRscS93e3IWoxaNlAlj4KPJXMs1FcC6H4DSysprjuNTGCmvDxnU8Nzyj+tiQE32RMZEGw79guWWhIRQ14fvL+kRpsdRRxt8z5GWmW20U+FVqL2+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742180244; c=relaxed/simple;
	bh=9mlFfJiEf42tYl/1iXd9RSCIbvQZEY1nXb5FFmZS1oM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=urvS6OOxWKKMuMUCyCOCy/xX+HMXGPIzFamgoCE00FQYtP1qz59ikO3PiauqT2BdySjiJfu70RDfk3+sVgN8K8iNir6iER3DINZgqq2WMQ/is91udmc0cGkF3vNFUgvsGzeo4gIf3sdxor5cGKd9lhBh9dfhqMNJT3UusyIOQnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ButwyNG9; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6fedefb1c9cso32377397b3.0;
        Sun, 16 Mar 2025 19:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742180241; x=1742785041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q13rgmLCF5RDbuOzXATzxJko5WiYCU8LRUxtxe72VTI=;
        b=ButwyNG9ErrzeKnaV+Fgr9yN1DwVTutdZyrrc3gyJe6UnmJTG3c0dDOKFGVtdaFd8u
         aKtQR4ufOS3gC/AKa9AMvsGzqcXFfITSsXCCgv2Glx1ZVzd2bA4K39AnzBAn/NkOFxNh
         aU1HoZnUPsZDjGx0FLMgV4GWwz7j6EbffCjnxO7woUnpG5KX/MM1Qo1WLqn+qRneUAJa
         KvXlCzKye9CSK9rw2y99klliFLVlGmL4ptpKTpCcIW/xkt9eGxyvkYpMxt1K1Tt4BzXa
         7KsnwROrPJMHfu2Y7mZvbOFS5AWsOMzr2RDDL6Va4E+YSf5aibLGLL9S11D1fu+6XbFd
         Y0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742180241; x=1742785041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q13rgmLCF5RDbuOzXATzxJko5WiYCU8LRUxtxe72VTI=;
        b=Ge47Yh3tLFAVR/FL0UORERRB3+O0HbQxqHRcSlo8fMCyYDdMChcc6mvpqEu/TwUycf
         /u+Ar2plMJl7UtR9vRWKPDbqdLm7i/M+etZ2jstVIAzuVMWwzkm6YePPLXXCZLAk405L
         Q62d5+IjxWv73gKB7J8Vgq8q++4tDTbsxUpbJGTiiCxWBsl+J+BeYzJDM3/+ZNIGBR4I
         2hnYpFP5GiWvRHV0K8JH7tFCu4IbJlgvzBQG3Aqye6UVa8MWLY5ZqKcCgXQFfOu5xinM
         i6kiWFUW1vtKOEn1pYnbVU1yPT5y91gA3BQzhLDd4/F0NH8ONReFYLIuGWtJ3DhtCnbC
         uwCw==
X-Forwarded-Encrypted: i=1; AJvYcCU6GWrSEMJwliQrmgY1nr9OW9cHSyBML7D7WCAVpM/WDumdln+RL6fG2/zfvS8P+0vCCRIdhOEYiaW4zcsb@vger.kernel.org, AJvYcCUt5G/rFeH8RI8mCQ+Vr0SYyZvw5g0H1TOAYaecaOfMiY+8Z1UCM4m8ol/stoFI9TsodORq7ZE3CK7x@vger.kernel.org, AJvYcCV+6QHQy1aVvFzr0oQ9oojcP0vCNZ/5Oge7ObDUbK5gmutFC35Ixv1LZp0B4xtZedEYUfzRCs7pOraGGQ==@vger.kernel.org, AJvYcCVgppt7uv4f3BhixDb/39lQDLZwjzVpNi112vbfJLUEtRfssBvIy9HVXtlFN/nwXqlId87iXTm/7IEq@vger.kernel.org, AJvYcCWHAom1jd6leQ7gdIA4i0YP0Fy/9LqFRBMy6RS92Bu+8Oqy6JTUJGx/FXBlhdUwWBZ24qazb94uptE=@vger.kernel.org, AJvYcCWiKjVM5XYFr/Rx3lnziWUZnLlmYtMRJOI9Hfxiqm/j9B0d0Vd5CgwgkPkZf9TfYWhoV6Ldbkcj4H+Y@vger.kernel.org, AJvYcCXO804JPF8JSlfNFEfYGixyUgBEdcCvt4hDKZ02TzSUv1lGNwhRkGJxa//uakUIVmlJD4/pPO7Q@vger.kernel.org, AJvYcCXpoqMFtpMESiAInY2KwwF11XTzJsMvQ7LfwtvQr4h0F3OIxFoaYot5R/MStLV7fiDmpu2ZkEowo+1B0xM=@vger.kernel.org, AJvYcCXqToz8LYVBXgp0Ax0fzs7pFdepMfwdrAri1950uxsGQoSKp14guc7wm/+x6yVhBE+oVFyUw7mDO5d6dOVR/vM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrA3zCHfFerad2EQ3Aa+VVnlKOopf7JjFdazJMMmIY9/NRkdlc
	mrskUghN51vj3eWpzHwXbamKgtEXpN5te+e2b7fokIv8UzEEIGXFY2B0gLrgY4Tty+lcLPL8zTu
	1/jVhxv9oUmTJGoXl0eXw3TfzAbs=
X-Gm-Gg: ASbGncuV2IezGoU0W5T99v0RHvvB8rOnzOYLDZbGk13vLPTWMxrgvpsF/xXIEjfZLCO
	W0nAYea+gLCQLsCni3/s1q0+AhV15VCmCmdtfku9NxFsGf2lWy3sdxWRcKd3igN8Ael/YLFD9B6
	CitDKgroO8/pWz7NTYxuMe7YIvznf4Ee+mqUnihALL60RsFs7GMv05v5T1dB8bsZ2In/HDJ48=
X-Google-Smtp-Source: AGHT+IEjpIEGecRUiBw09MY4ioZORQGDFKUi+SFS2+bKFd/EFTNjqt6eFJCvjpaHvzQ67aF1HIAaDMHDXnBcsM63X2U=
X-Received: by 2002:a05:690c:3348:b0:6fd:390d:5a9c with SMTP id
 00721157ae682-6ff45f5e769mr142693107b3.10.1742180240607; Sun, 16 Mar 2025
 19:57:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-2-a0282524688@gmail.com> <20250307011542.GE8350@google.com>
In-Reply-To: <20250307011542.GE8350@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 17 Mar 2025 10:57:09 +0800
X-Gm-Features: AQ5f1JqqAwN7OFcwDrtRoNbeDRRCL3hPl6R0Vz_MNynJPBmjq__mo_slOkzQPjk
Message-ID: <CAOoeyxUgiTqtSksfHopEDhZHwNkUq9+d-ojo8ma3PX2dosuwyQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Lee Jones <lee@kernel.org>
Cc: tmyu0@nuvoton.com, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Lee,

Thank you for reviewing,

Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B43=E6=9C=887=E6=97=A5 =E9=
=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:15=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, 25 Feb 2025, Ming Yu wrote:
>
> > The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
> > 6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> > PWM, and RTC.
>
> This needs to go into the Kconfig help passage.
>

Okay, I will move these to Kconfig in the next patch.

> > This driver implements USB device functionality and shares the
> > chip's peripherals as a child device.
>
> This driver doesn't implement USB functionality.
>

Fix it in v9.

> > Each child device can use the USB functions nct6694_read_msg()
> > and nct6694_write_msg() to issue a command. They can also request
> > interrupt that will be called when the USB device receives its
> > interrupt pipe.
> >
> > Signed-off-by: Ming Yu <a0282524688@gmail.com>
>
> Why aren't you signing off with your work address?
>

Fix it in v9.

> > ---
> >  MAINTAINERS                 |   7 +
> >  drivers/mfd/Kconfig         |  18 ++
> >  drivers/mfd/Makefile        |   2 +
> >  drivers/mfd/nct6694.c       | 378 ++++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/nct6694.h | 102 ++++++++++
> >  5 files changed, 507 insertions(+)
> >  create mode 100644 drivers/mfd/nct6694.c
> >  create mode 100644 include/linux/mfd/nct6694.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 873aa2cce4d7..c700a0b96960 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16918,6 +16918,13 @@ F:   drivers/nubus/
> >  F:   include/linux/nubus.h
> >  F:   include/uapi/linux/nubus.h
> >
> > +NUVOTON NCT6694 MFD DRIVER
> > +M:   Ming Yu <tmyu0@nuvoton.com>
> > +L:   linux-kernel@vger.kernel.org
>
> This is the default list.  You shouldn't need to add that here.
>

Remove it in v9.

> > +S:   Supported
> > +F:   drivers/mfd/nct6694.c
> > +F:   include/linux/mfd/nct6694.h
> > +
> >  NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
> >  M:   Antonino Daplas <adaplas@gmail.com>
> >  L:   linux-fbdev@vger.kernel.org
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 6b0682af6e32..c97a2bdcea0b 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -1045,6 +1045,24 @@ config MFD_MENF21BMC
> >         This driver can also be built as a module. If so the module
> >         will be called menf21bmc.
> >
> > +config MFD_NCT6694
> > +     tristate "Nuvoton NCT6694 support"
> > +     select MFD_CORE
> > +     depends on USB
> > +     help
> > +       This enables support for the Nuvoton USB device NCT6694, which =
shares
> > +       peripherals.
> > +
> > +       This driver provides core APIs to access the NCT6694 hardware
> > +       monitoring and control features.
> > +
> > +       The NCT6694 is a versatile multi-function device that supports
>
> Please drop the term multi-function device and replace it what a proper
> description of the devices.
>

Fix it in v9.

> > +       functionalities such as GPIO, I2C, CAN, WDT, HWMON, and RTC
> > +       management.
>
> All of these line breaks should be removed.
>

Fix these in v9.

> > +       Additional drivers must be enabled to utilize the specific
> > +       functionalities of the device.
> > +
> >  config MFD_OCELOT
> >       tristate "Microsemi Ocelot External Control Support"
> >       depends on SPI_MASTER
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index 9220eaf7cf12..7725b732e265 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -121,6 +121,8 @@ obj-$(CONFIG_MFD_MC13XXX) +=3D mc13xxx-core.o
> >  obj-$(CONFIG_MFD_MC13XXX_SPI)        +=3D mc13xxx-spi.o
> >  obj-$(CONFIG_MFD_MC13XXX_I2C)        +=3D mc13xxx-i2c.o
> >
> > +obj-$(CONFIG_MFD_NCT6694)    +=3D nct6694.o
> > +
> >  obj-$(CONFIG_MFD_CORE)               +=3D mfd-core.o
> >
> >  ocelot-soc-objs                      :=3D ocelot-core.o ocelot-spi.o
> > diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
> > new file mode 100644
> > index 000000000000..c82457679ca6
> > --- /dev/null
> > +++ b/drivers/mfd/nct6694.c
> > @@ -0,0 +1,378 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Nuvoton NCT6694 core driver using USB interface to provide
> > + * access to the NCT6694 hardware monitoring and control features.
> > + *
> > + * The NCT6694 is a versatile multi-function device that supports
>
> Here too.
>

Fix it in v9.

> > + * functionalities such as GPIO, I2C, CAN, WDT, HWMON and RTC
> > + * management.
> > + *
> > + * Copyright (C) 2024 Nuvoton Technology Corp.
>
> This goes at the top.
>

Fix it in v9.

> > + */
> > +
> > +#include <linux/bits.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mfd/nct6694.h>
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +#include <linux/usb.h>
> > +
> > +static const struct mfd_cell nct6694_dev[] =3D {
> > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x0),
>
> "-gpio" usually goes on the end.
>

Fix it in v9.

> > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x1),
>
> IDs are usually given in base-10.
>

Fix it in v9.

> Why are you manually adding the device IDs?
>
> PLATFORM_DEVID_AUTO doesn't work for you?
>

I need to manage these IDs to ensure that child devices can be
properly utilized within their respective modules.

> > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x2),
> > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x3),
> > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x4),
> > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x5),
> > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x6),
> > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x7),
> > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x8),
> > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0x9),
> > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xA),
> > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xB),
> > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xC),
> > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xD),
> > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xE),
> > +     MFD_CELL_BASIC("gpio-nct6694", NULL, NULL, 0, 0xF),
> > +
> > +     MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x0),
> > +     MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x1),
> > +     MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x2),
> > +     MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x3),
> > +     MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x4),
> > +     MFD_CELL_BASIC("i2c-nct6694", NULL, NULL, 0, 0x5),
> > +
> > +     MFD_CELL_BASIC("nct6694_canfd", NULL, NULL, 0, 0x0),
>
> Why has the naming convention changed here?
>

I originally expected the child devices name to directly match its
driver name. Do you think it would be better to standardize the naming
as "nct6694-xxx" ?

> > +     MFD_CELL_BASIC("nct6694_canfd", NULL, NULL, 0, 0x1),
> > +
> > +     MFD_CELL_BASIC("nct6694_wdt", NULL, NULL, 0, 0x0),
> > +     MFD_CELL_BASIC("nct6694_wdt", NULL, NULL, 0, 0x1),
> > +
> > +     MFD_CELL_NAME("nct6694-hwmon"),
> > +     MFD_CELL_NAME("rtc-nct6694"),
>
> There doesn't seem to be any consistency here.
>

Do you think these two should be changed to use MFD_CELL_BASIC()?

> > +};
> > +
> > +static int nct6694_response_err_handling(struct nct6694 *nct6694,
>
> > +{
> > +     switch (err_status) {
> > +     case NCT6694_NO_ERROR:
> > +             return err_status;
>
> This is odd since you already know this will be 0.
>

Fix it in v9.

> > +     case NCT6694_NOT_SUPPORT_ERROR:
> > +             dev_warn(nct6694->dev, "Command is not supported!\n");
>
> Why not dev_err()?
>

Fix it in v9.

> > +             break;
> > +     case NCT6694_NO_RESPONSE_ERROR:
> > +             dev_warn(nct6694->dev, "Command received no response!\n")=
;
> > +             break;
> > +     case NCT6694_TIMEOUT_ERROR:
> > +             dev_warn(nct6694->dev, "Command timed out!\n");
> > +             break;
> > +     case NCT6694_PENDING:
> > +             dev_warn(nct6694->dev, "Command is pending!\n");
>
> Is this an error?
>

Yes, I will fix it to dev_err() in the next patch.

> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     return -EIO;
> > +}
> > +
> > +int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd=
_header *cmd_hd, void *buf)
> > +{
> > +     union nct6694_usb_msg *msg =3D nct6694->usb_msg;
> > +     int tx_len, rx_len, ret;
> > +
> > +     guard(mutex)(&nct6694->access_lock);
> > +
> > +     /* Send command packet to USB device */
>
> This doesn't really describe the next 2 lines.
>
> Move it down?
>

Fix it in v9.

> > +     memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
> > +     msg->cmd_header.hctrl =3D NCT6694_HCTRL_GET;
> > +
> > +     ret =3D usb_bulk_msg(nct6694->udev,
>
> Since you use nct6694->udev a bunch - sometimes twice in the same call,
> it might be nicer to pull it into it's own variable instead of
> dereferencing it all the time.
>

Fix it in v9.

> > +                        usb_sndbulkpipe(nct6694->udev, NCT6694_BULK_OU=
T_EP),
> > +                        &msg->cmd_header, sizeof(*msg), &tx_len,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Receive response packet from USB device */
> > +     ret =3D usb_bulk_msg(nct6694->udev,
> > +                        usb_rcvbulkpipe(nct6694->udev, NCT6694_BULK_IN=
_EP),
> > +                        &msg->response_header, sizeof(*msg), &rx_len,
>
> How can you read sizeof(*msg) Bytes (22?) into the smaller
> response_header (16?) attribute?
>

The size of (*msg) is the same as command_header and response_header (8 byt=
es).

> > +                        nct6694->timeout);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Receive data packet from USB device */
> > +     ret =3D usb_bulk_msg(nct6694->udev,
> > +                        usb_rcvbulkpipe(nct6694->udev, NCT6694_BULK_IN=
_EP),
> > +                        buf, le16_to_cpu(cmd_hd->len), &rx_len,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (rx_len !=3D le16_to_cpu(cmd_hd->len)) {
> > +             dev_err(nct6694->dev, "Expected received length %d, but g=
ot %d\n",
> > +                     le16_to_cpu(cmd_hd->len), rx_len);
> > +             return -EIO;
> > +     }
> > +
> > +     return nct6694_response_err_handling(nct6694, msg->response_heade=
r.sts);
> > +}
> > +EXPORT_SYMBOL(nct6694_read_msg);
> > +
> > +int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cm=
d_header *cmd_hd, void *buf)
> > +{
> > +     union nct6694_usb_msg *msg =3D nct6694->usb_msg;
> > +     int tx_len, rx_len, ret;
> > +
> > +     guard(mutex)(&nct6694->access_lock);
> > +
> > +     /* Send command packet to USB device */
> > +     memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
> > +     msg->cmd_header.hctrl =3D NCT6694_HCTRL_SET;
> > +
> > +     ret =3D usb_bulk_msg(nct6694->udev,
> > +                        usb_sndbulkpipe(nct6694->udev, NCT6694_BULK_OU=
T_EP),
> > +                        &msg->cmd_header, sizeof(*msg), &tx_len,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Send data packet to USB device */
> > +     ret =3D usb_bulk_msg(nct6694->udev,
> > +                        usb_sndbulkpipe(nct6694->udev, NCT6694_BULK_OU=
T_EP),
> > +                        buf, le16_to_cpu(cmd_hd->len), &tx_len,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Receive response packet from USB device */
> > +     ret =3D usb_bulk_msg(nct6694->udev,
> > +                        usb_rcvbulkpipe(nct6694->udev, NCT6694_BULK_IN=
_EP),
> > +                        &msg->response_header, sizeof(*msg), &rx_len,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Receive data packet from USB device */
> > +     ret =3D usb_bulk_msg(nct6694->udev,
> > +                        usb_rcvbulkpipe(nct6694->udev, NCT6694_BULK_IN=
_EP),
> > +                        buf, le16_to_cpu(cmd_hd->len), &rx_len,
> > +                        nct6694->timeout);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (rx_len !=3D le16_to_cpu(cmd_hd->len)) {
> > +             dev_err(nct6694->dev, "Expected transmitted length %d, bu=
t got %d\n",
> > +                     le16_to_cpu(cmd_hd->len), rx_len);
> > +             return -EIO;
> > +     }
> > +
> > +     return nct6694_response_err_handling(nct6694, msg->response_heade=
r.sts);
> > +}
> > +EXPORT_SYMBOL(nct6694_write_msg);
> > +
> > +static void usb_int_callback(struct urb *urb)
> > +{
> > +     struct nct6694 *nct6694 =3D urb->context;
> > +     unsigned int *int_status =3D urb->transfer_buffer;
> > +     int ret;
> > +
> > +     switch (urb->status) {
> > +     case 0:
> > +             break;
> > +     case -ECONNRESET:
> > +     case -ENOENT:
> > +     case -ESHUTDOWN:
> > +             return;
> > +     default:
> > +             generic_handle_irq_safe(irq_find_mapping(nct6694->domain,=
 irq));
> > +             *int_status &=3D ~BIT(irq);
> > +     }
> > +
> > +resubmit:
> > +     ret =3D usb_submit_urb(urb, GFP_ATOMIC);
> > +     if (ret)
> > +             dev_dbg(nct6694->dev, "%s: Failed to resubmit urb, status=
 %pe",
>
> Why debug?
>

Excuse me, do you think it should change to dev_err()?

> > +                     __func__, ERR_PTR(ret));
>
> Remove the __func__ part.
>

Understood.

> > +}
> > +
...
> > +static int nct6694_usb_probe(struct usb_interface *iface,
> > +                          const struct usb_device_id *id)
> > +{
> > +     struct usb_device *udev =3D interface_to_usbdev(iface);
> > +     struct usb_endpoint_descriptor *int_endpoint;
> > +     struct usb_host_interface *interface;
> > +     struct device *dev =3D &iface->dev;
> > +     struct nct6694 *nct6694;
> > +     int pipe, maxp;
> > +     int ret;
> > +
> > +     nct6694 =3D devm_kzalloc(dev, sizeof(*nct6694), GFP_KERNEL);
> > +     if (!nct6694)
> > +             return -ENOMEM;
> > +
> > +     pipe =3D usb_rcvintpipe(udev, NCT6694_INT_IN_EP);
> > +     maxp =3D usb_maxpacket(udev, pipe);
> > +
> > +     nct6694->usb_msg =3D devm_kzalloc(dev, sizeof(union nct6694_usb_m=
sg), GFP_KERNEL);
> > +     if (!nct6694->usb_msg)
> > +             return -ENOMEM;
> > +
> > +     nct6694->int_buffer =3D devm_kzalloc(dev, maxp, GFP_KERNEL);
> > +     if (!nct6694->int_buffer)
> > +             return -ENOMEM;
> > +
> > +     nct6694->int_in_urb =3D usb_alloc_urb(0, GFP_KERNEL);
> > +     if (!nct6694->int_in_urb)
> > +             return -ENOMEM;
> > +
> > +     nct6694->domain =3D irq_domain_add_simple(NULL, NCT6694_NR_IRQS, =
0,
> > +                                             &nct6694_irq_domain_ops,
> > +                                             nct6694);
> > +     if (!nct6694->domain) {
> > +             ret =3D -ENODEV;
> > +             goto err_urb;
> > +     }
> > +
> > +     nct6694->dev =3D dev;
> > +     nct6694->udev =3D udev;
> > +     nct6694->timeout =3D NCT6694_URB_TIMEOUT; /* Wait until URB compl=
etes */
>
> No need to save this known value.
>

Understood, I will drop it in the next patch.

> > +     ret =3D devm_mutex_init(dev, &nct6694->access_lock);
> > +     if (ret)
> > +             goto err_urb;
> > +
> > +     ret =3D devm_mutex_init(dev, &nct6694->irq_lock);
> > +     if (ret)
> > +             goto err_urb;
> > +
> > +     interface =3D iface->cur_altsetting;
> > +     int_endpoint =3D &interface->endpoint[0].desc;
> > +     if (!usb_endpoint_is_int_in(int_endpoint)) {
> > +             ret =3D -ENODEV;
> > +             goto err_urb;
> > +     }
> > +     usb_fill_int_urb(nct6694->int_in_urb, udev, pipe,
> > +                      nct6694->int_buffer, maxp, usb_int_callback,
> > +                      nct6694, int_endpoint->bInterval);
> > +     ret =3D usb_submit_urb(nct6694->int_in_urb, GFP_KERNEL);
> > +     if (ret)
> > +             goto err_urb;
>
> Please unsquash these calls - space them out.
>

Fix these in v9.

> > +
> > +     usb_set_intfdata(iface, nct6694);
> > +
> > +     ret =3D mfd_add_hotplug_devices(dev, nct6694_dev, ARRAY_SIZE(nct6=
694_dev));
> > +     if (ret)
> > +             goto err_mfd;
> > +
> > +     return 0;
> > +
> > +err_mfd:
> > +     usb_kill_urb(nct6694->int_in_urb);
> > +err_urb:
> > +     usb_free_urb(nct6694->int_in_urb);
> > +     return ret;
> > +}
> > +
> > +static void nct6694_usb_disconnect(struct usb_interface *iface)
> > +{
> > +     struct nct6694 *nct6694 =3D usb_get_intfdata(iface);
> > +
> > +     mfd_remove_devices(nct6694->dev);
> > +     usb_kill_urb(nct6694->int_in_urb);
> > +     usb_free_urb(nct6694->int_in_urb);
> > +}
> > +
> > +static const struct usb_device_id nct6694_ids[] =3D {
> > +     { USB_DEVICE_AND_INTERFACE_INFO(NCT6694_VENDOR_ID,
> > +                                     NCT6694_PRODUCT_ID,
> > +                                     0xFF, 0x00, 0x00)},
>
> This should fit on one line.  You can use up to 100-chars.
>

Fix it in v9.

> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(usb, nct6694_ids);
> > +
> > +static struct usb_driver nct6694_usb_driver =3D {
> > +     .name   =3D "nct6694",
>
> Odd spaces.
>

Fix it in v9.

> > +     .id_table =3D nct6694_ids,
> > +     .probe =3D nct6694_usb_probe,
> > +     .disconnect =3D nct6694_usb_disconnect,
> > +};
> > +
>
> Remove this line.
>

Fix it in v9.

> > +module_usb_driver(nct6694_usb_driver);
> > +
> > +MODULE_DESCRIPTION("USB core driver for NCT6694");
>
> This is not a USB driver.
>

Fix it in v9.

> > +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
>
> Different to SoB.
>

Fix it in v9.

> > +MODULE_LICENSE("GPL");
> > diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
> > new file mode 100644
> > index 000000000000..8171f975761e
> > --- /dev/null
> > +++ b/include/linux/mfd/nct6694.h
> > @@ -0,0 +1,102 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Nuvoton NCT6694 USB transaction and data structure.
> > + *
> > + * Copyright (C) 2024 Nuvoton Technology Corp.
>
> At the top.
>

Fix it in v9.

> > + */
> > +


Best regards,
Ming

