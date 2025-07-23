Return-Path: <linux-i2c+bounces-12006-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DA1B0EFE1
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 12:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E55161893698
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 10:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FAEA28505D;
	Wed, 23 Jul 2025 10:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZFeCun8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487484204E;
	Wed, 23 Jul 2025 10:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753266647; cv=none; b=D5u6v+MVpzefxtV3X7LfU/cdOijGspIiDHI0ZpxUtC8YjVAFYwAP0+bDmCjhwpaZ6ADMhGu2TwgUYZCzvPa/MWFmWxmrEYKvWkGwOeJuHoe4YfCwHz2N1wEbeaHHgpQcaDeE/MZfvGXWUer+T06/vy19jIKBRgfIwZCLk7tq1xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753266647; c=relaxed/simple;
	bh=ZrYyFE1RNxcg54HRe+wiJ/9APC6lKR7QItphur8ntNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lv1p0j4wKtkY+J5y1jWBLzUIhPdmaOdPIwPPGRnRGZwBIRv0YR8Z3dCvR56gscDMwr0hJ9Br1vatFm8EKus2jq9MPMV0aX+V/AYJyUefVCuGYl9dasvBYtY5m42PaU7jOdkNqB+EUXr6WyaL3k0AaoQ/4NVO5WxZjLH6dZJCiag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZFeCun8; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e8d7122c3a5so5597088276.1;
        Wed, 23 Jul 2025 03:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753266645; x=1753871445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LA7ngCL+inJRE+v5ucYQaFMllQEH7zLcZ73D/ihvwEw=;
        b=WZFeCun8NPSONBks4RkXsVinb6Gvj3d06WyIg5lTbgxWb5YuMpP6rv1NMJUdAdRmGy
         ZBfyD1p0rfvBBmyDiFbPlNSnf1hIFP2e/5ZpJ0XfV9nRiE53Vlv95FguZU7OTH1vXMdA
         PV8tyzHABJ+0TMJ/N79n9Tshs6+fIY2GXfET3tqq4j+D0V+3HbN/5GaLcz5D1Vufu2Oz
         yJWTsCT1y1K/tg0BHfAL7SqTs85VtGVj1rxFep/pb3jyzgdcEkRkpBw+kzS3B3wcy5Ho
         3n2QVde4L/k6LucSx3eVngZHGw9LokbcYPPG4Th8W4xOtWZ3dDuevxvBEpJyooUW7HVK
         lJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753266645; x=1753871445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LA7ngCL+inJRE+v5ucYQaFMllQEH7zLcZ73D/ihvwEw=;
        b=NZAMeMp7tp8Coi/GAxaISf0jf9v1lk2Nu6AkR4CVpG6nOD550y76OX3EMnHhleej3R
         cSkpBI//gHEgyjVsCbEY+bLaeUKjfAf0gNd5U2CMlr1f8bbXHNEvOwzelFHKjSz8furv
         i6zlxi+IORwTHYV0Re8dTDCzGhrejArrtkXyuoKUFs/OeWFMx7DLylz7QE0Cb1iWLL1D
         eL0a0o4sPju+epAVf3SCKhp45wmmY7SKnR52i5sV/rXCqpyim4G8D80vlxxtIC93E4qo
         6xc+BcBiwSAA+saSthprmPelmTxUs6Jhe08+Ma2hRYGSLDoQaPjjT5JTuC/zC6FoRdge
         5ZdA==
X-Forwarded-Encrypted: i=1; AJvYcCUKdooei4MfnQCzJW0gNWlBGddQZ+OtWKr09kMgVYS9nU73+Kd7fmb9mfYT1Gsb135REZowWy9baDHQ@vger.kernel.org, AJvYcCUMdkf9n97zhH3R28WeVDul5pJ2Yf/M/vo3S76JmzUxs6y6XdErqy+zZNB5DI1xnGjuWPt6CCYq@vger.kernel.org, AJvYcCUe5iM/Sa9/YOXteew7nImwPt2XTnDr48tsxMEZ+xwbpmHgyhhHWZ2hzNI8qJZxxrvQi4od0P0P/dq19a+8@vger.kernel.org, AJvYcCVeZ+GAFTPcOk7o2avic4Y0XxdGryxovEXVVq3ddQ4/nT7zjjbYj5nZDZyctRKi6JzUsEwhcO5khjz+@vger.kernel.org, AJvYcCVmKpfkAIjrTohp3q4eemxMKLkU1YTFGK1g59CWUYXeZl2UTwh4TU15ip8iBZG3ZsQLMd65rczHVlHeNnbHVXk=@vger.kernel.org, AJvYcCWYKH5v5Dzcr/3B5Xny8eOeEGuL0pEbvgv14o37z1Vb8uZTyZmmM0RSe2mHtgjazPYxZzekb2Iknqs3I8Y=@vger.kernel.org, AJvYcCWpNtQOJuhqfj+dYcfO6mX+KRKj6NjjH1oPydtU+gd+wjYauZurERQcY21jSDQWYbznZepvPvSzDfefeA==@vger.kernel.org, AJvYcCX6HbW13g0gXtMcuNgDrwvONDIBRY9L1c5Uq7m15pgri3HdqWMlHFEhJZeZQv2hqTzY6f/AwSyADNUY@vger.kernel.org, AJvYcCXYlf1ZzCw1IlVvvF0lN82iIczJRu6NMxu3TYYg3jYHHgi4Bs/YUVeYGj2uUKFX4uHk4aMlJj0m/tA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQPVJGoBRNfTnekNmnf+sRy/Udr+qlmpBfDFXKGRf+M52XwbEV
	hfQLJMifsWd/TdHoniOb8hy3NDOeNm5fMk3Y8vZs1Z4+E3fWZd0Nz7l0p4P2xHeAcA9/ULbdHZJ
	Zb7ML1p5MW1T0Xsm0LB5KFnHFdVAHjvg=
X-Gm-Gg: ASbGncuHaxxnMVIRoPg8HHpt8m3SMxbSq6uZYCKhZq9VS1S6caLF/Twz3r7t6jqQMo5
	FzYNjObAbpEPtbQawEiKGrb2Hsng1ZrcaB87flR0vCpQgdofg3Z8XyViGzm8SxHBuj8z1UelNEy
	olZdkFhpuk+8PvbFUV2vk7IN30DRJPyWNPidbtm/FQ1ceT8e3jMKBNBLz7TW4em/L1sQld3i4k5
	BbuSLBk2IbaJEAvoQW4fh8frrefdRoMY4Ol40Y7qA==
X-Google-Smtp-Source: AGHT+IGtjUwHyzHtKQ4mrqvi8yeQhMpiGpkgpDBx25yEpA8Cdc5zRk5eSD0faXJ+bObKq5lWLxM0HxvU9SBSEJ+05TM=
X-Received: by 2002:a05:690c:3601:b0:718:4095:89bc with SMTP id
 00721157ae682-719b4227127mr32013927b3.22.1753266644983; Wed, 23 Jul 2025
 03:30:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250715025626.968466-1-a0282524688@gmail.com> <20250723095856.GT11056@google.com>
In-Reply-To: <20250723095856.GT11056@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 23 Jul 2025 18:30:33 +0800
X-Gm-Features: Ac12FXxeadozV19JFZpQNzkVZb_LJVxV9KJ9zIVS_BiMIAH5J9MrfqpSvwxvedo
Message-ID: <CAOoeyxUBHDu8=wKkV7TdUGTqc-At-WD6TMY-qKG1dTu-w83DmA@mail.gmail.com>
Subject: Re: [PATCH v14 0/7] Add Nuvoton NCT6694 MFD drivers
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

Thanks a lot for all the help so far!
Appreciate your support -- looking forward to seeing it merged.


Best regards,
Ming

Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B47=E6=9C=8823=E6=97=A5 =E9=
=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:59=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, 15 Jul 2025, a0282524688@gmail.com wrote:
>
> > From: Ming Yu <a0282524688@gmail.com>
> >
> > This patch series introduces support for Nuvoton NCT6694, a peripheral
> > expander based on USB interface. It models the chip as an MFD driver
> > (1/7), GPIO driver(2/7), I2C Adapter driver(3/7), CANfd driver(4/7),
> > WDT driver(5/7), HWMON driver(6/7), and RTC driver(7/7).
> >
> > The MFD driver implements USB device functionality to issue
> > custom-define USB bulk pipe packets for NCT6694. Each child device can
> > use the USB functions nct6694_read_msg() and nct6694_write_msg() to iss=
ue
> > a command. They can also request interrupt that will be called when the
> > USB device receives its interrupt pipe.
> >
> > The following introduces the custom-define USB transactions:
> >       nct6694_read_msg - Send bulk-out pipe to write request packet
> >                          Receive bulk-in pipe to read response packet
> >                          Receive bulk-in pipe to read data packet
> >
> >       nct6694_write_msg - Send bulk-out pipe to write request packet
> >                           Send bulk-out pipe to write data packet
> >                           Receive bulk-in pipe to read response packet
>
> [...]
>
> > Ming Yu (7):
> >   mfd: Add core driver for Nuvoton NCT6694
> >   gpio: Add Nuvoton NCT6694 GPIO support
> >   i2c: Add Nuvoton NCT6694 I2C support
> >   can: Add Nuvoton NCT6694 CANFD support
> >   watchdog: Add Nuvoton NCT6694 WDT support
> >   hwmon: Add Nuvoton NCT6694 HWMON support
> >   rtc: Add Nuvoton NCT6694 RTC support
> >
> >  MAINTAINERS                         |  12 +
> >  drivers/gpio/Kconfig                |  12 +
> >  drivers/gpio/Makefile               |   1 +
> >  drivers/gpio/gpio-nct6694.c         | 499 +++++++++++++++
> >  drivers/hwmon/Kconfig               |  10 +
> >  drivers/hwmon/Makefile              |   1 +
> >  drivers/hwmon/nct6694-hwmon.c       | 949 ++++++++++++++++++++++++++++
> >  drivers/i2c/busses/Kconfig          |  10 +
> >  drivers/i2c/busses/Makefile         |   1 +
> >  drivers/i2c/busses/i2c-nct6694.c    | 196 ++++++
> >  drivers/mfd/Kconfig                 |  15 +
> >  drivers/mfd/Makefile                |   2 +
> >  drivers/mfd/nct6694.c               | 388 ++++++++++++
> >  drivers/net/can/usb/Kconfig         |  11 +
> >  drivers/net/can/usb/Makefile        |   1 +
> >  drivers/net/can/usb/nct6694_canfd.c | 832 ++++++++++++++++++++++++
> >  drivers/rtc/Kconfig                 |  10 +
> >  drivers/rtc/Makefile                |   1 +
> >  drivers/rtc/rtc-nct6694.c           | 297 +++++++++
> >  drivers/watchdog/Kconfig            |  11 +
> >  drivers/watchdog/Makefile           |   1 +
> >  drivers/watchdog/nct6694_wdt.c      | 307 +++++++++
> >  include/linux/mfd/nct6694.h         | 102 +++
> >  23 files changed, 3669 insertions(+)
> >  create mode 100644 drivers/gpio/gpio-nct6694.c
> >  create mode 100644 drivers/hwmon/nct6694-hwmon.c
> >  create mode 100644 drivers/i2c/busses/i2c-nct6694.c
> >  create mode 100644 drivers/mfd/nct6694.c
> >  create mode 100644 drivers/net/can/usb/nct6694_canfd.c
> >  create mode 100644 drivers/rtc/rtc-nct6694.c
> >  create mode 100644 drivers/watchdog/nct6694_wdt.c
> >  create mode 100644 include/linux/mfd/nct6694.h
>
> I will apply this the other side of the pending merge-window.
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]

