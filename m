Return-Path: <linux-i2c+bounces-12913-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93805B54797
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 11:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A2B31889D3A
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Sep 2025 09:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56CA8285417;
	Fri, 12 Sep 2025 09:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWwBZZnt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD8827F017
	for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 09:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757669217; cv=none; b=Ogz7APj7GCcnU9z+xu5OS8iDHlfjk9F7gZQAElSpxoT/fI3vqF9P7uGkAHX3H87nP0YMNco5XSCNGgO7lAeTdxzO8CnqylUzKe2Qk/uDqNi36AmvuZTf7KkYsx9ebdEnR9kNV/JWCqyLhrSuNHojJL6BpW5g/zfv+d8MygqAQiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757669217; c=relaxed/simple;
	bh=irMuxUdQPpGhXnllWkfIl5RxD59rygWBGq/5/FrxZwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IxKtVP4ub+9pANrRgTEuOQBvMKOgaszdTShErESvJDPClt4ktMr/qjuMLwd0OufUQXSzJr5leqFc6cCnYVUbwPHD7tMrHgTDC0n1yv7JIenCLLU5Ymg+f9eGpmvWh7wBXE3JpMQu7JjdhdlHuA9Rqd9Ay/5LJrPiLww29Bpg+u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWwBZZnt; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e96ff16fea1so1147290276.0
        for <linux-i2c@vger.kernel.org>; Fri, 12 Sep 2025 02:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757669214; x=1758274014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjqJ6sVZBbW+81hjVC4Gz65qKs1cRms0/JSBsC2JkMM=;
        b=SWwBZZnt4TAEHY6dVYGZPfvXPxsnEE3t65WVR7lBoQTJalDSLZTTXLKZ1CeNA6InuJ
         fPDz4kEvv/n9CymWiGEuoAiO8Dtv8ausTe7z98WFJNoXfXgysrBj50HdyZ5h3s7s7Jo7
         0vzPWiRlsvgJKw64MEFtKThfj1wUEnmf6IsDzI/0DFjuGsUPQ4RKg7sg3YM/U8BXQcBS
         gPWblGlQNlOkZ4GPEaxJQV6NNy9gBkFgiL5/Gc3eT7gjTDwC2/bljO5lKm59x4IEfqZw
         24BqMC3E+SCfVIP0Rm9FqPd/DjEEfVfA856m9du0hFalEXK6IsWc5vh309oox3gVnp9/
         XQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757669214; x=1758274014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjqJ6sVZBbW+81hjVC4Gz65qKs1cRms0/JSBsC2JkMM=;
        b=O/XaC9OmkaaNCgUyopE8KeO+Po7s4xDiu63HNxHEd0Kc7Jmwu6y1f50talrKg0dkd9
         wt2swRZDHg4TX5ms3QBiZ+Se1gBtJg0RCfO5oaFhcnJBcCNG+dptpkc24cPAA3pNIjfa
         sHLUp8lLFwEb3OtFKAGQM+nv0syZhoIKm6qRgj2/1u6DGG8dZdq06uOrnWefSSWXZpHN
         wh+loWOM8jR8J1VCgw6P6dvR9fcfJ/c0xTNMc4yczwLL47nyt7d+XjW7YPUQofe9OsWU
         auqHRQH2w4Qs8CSNGB5VxEIvVq5ALLf1hCDwIN3wOtQ1HQw978i1W8z0+yYyTpIXT9mr
         lE/A==
X-Forwarded-Encrypted: i=1; AJvYcCWOsP2W+z07qZ+R7Sp/fBdJhXUdho8pTF7KljKGeHU5tkSO6DngkvgbUnhB/zq9XmLVjJmf9KrY9F8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5wEKVpYekZgfud+W2TsphMqz4k7PM4T6L3cVKYGPKN0T72cIe
	K8APCO9IW2NB1GHwSvkPUC4xV8nvs2zXLeWQueUaQJqrAmtf9i8HsgR0KyclhsLsSLaElZuTKWY
	fXRBpya3+KZhDKGSEqeQR/0d31VvzoC8=
X-Gm-Gg: ASbGncuMlrsgFGEuhcq+yjVlRVw7dWa4brpFfcO7HZ1bxgXLxjkYK9OpxrGfh3pUiib
	Jt0YNWYzHzYICUqLG2zRR0KSNwbIYdsMl1FHXJz4Xs9kdQbv1KZ+8rvBlQfOA6X/pETJP/wTc2w
	TB7EqWA3g3btJ073Y2aawaKUyU2BAH5jBn+4ORgZ/g6g5OWNX24Kp3Ix4EiNyWDZUqkp+yzJhu1
	VDMskCYqBRQGnkznyTWvV3A6TWC1EmlipO/CwNIEQ==
X-Google-Smtp-Source: AGHT+IG61YFPc3YGuNiMETzC0WD9PzNGrl373v6tL4lQFqcwQxvrhZOjgmVX4wLgLgCCLbEF0I9n9Kd7vwxOoB3218U=
X-Received: by 2002:a05:6902:6c04:b0:e9b:b6a6:216d with SMTP id
 3f1490d57ef6-ea3d99deb44mr1421038276.6.1757669213539; Fri, 12 Sep 2025
 02:26:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912091952.1169369-1-a0282524688@gmail.com>
In-Reply-To: <20250912091952.1169369-1-a0282524688@gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 12 Sep 2025 17:26:42 +0800
X-Gm-Features: AS18NWD_I7dWfOitUs6oodsBaA3yGv6PNX81cd4GGbkJxsl0noZ-MKhhm4cuxwk
Message-ID: <CAOoeyxWwJGCQLDPZLLYMODnKGT22aMEgpCrTireLZkOukAg5vQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v14 0/7] Add Nuvoton NCT6694 MFD drivers
To: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<a0282524688@gmail.com> =E6=96=BC 2025=E5=B9=B49=E6=9C=8812=E6=97=A5 =E9=80=
=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:20=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Ming Yu <a0282524688@gmail.com>
>
> This patch series introduces support for Nuvoton NCT6694, a peripheral
> expander based on USB interface. It models the chip as an MFD driver
> (1/7), GPIO driver(2/7), I2C Adapter driver(3/7), CANfd driver(4/7),
> WDT driver(5/7), HWMON driver(6/7), and RTC driver(7/7).
>
> The MFD driver implements USB device functionality to issue
> custom-define USB bulk pipe packets for NCT6694. Each child device can
> use the USB functions nct6694_read_msg() and nct6694_write_msg() to issue
> a command. They can also request interrupt that will be called when the
> USB device receives its interrupt pipe.
>
> The following introduces the custom-define USB transactions:
>         nct6694_read_msg - Send bulk-out pipe to write request packet
>                            Receive bulk-in pipe to read response packet
>                            Receive bulk-in pipe to read data packet
>
>         nct6694_write_msg - Send bulk-out pipe to write request packet
>                             Send bulk-out pipe to write data packet
>                             Receive bulk-in pipe to read response packet
>                             Receive bulk-in pipe to read data packet
>
> Changes since version 13:
> - Update to guard(spinlock_irqsave)() in nct6694.c
> - Add struct i2c_adapter_quirks in i2c-nct6694.c
> - Rebased on top of v6.17-rc3 as requested

typo: v6.17-rc1

>
> Changes since version 12:
> - Implement IDA in MFD driver to handle per-device IDs
> - Use spinlock to replace irq mutex lock
> - Use same email address in the signature
>
> Changes since version 11:
> - Use platform_device's id to replace IDA
> - Modify the irq_domain_add_simple() to irq_domain_create_simple() in
>   nct6694.c
> - Update struct data_bittiming_params related part in nct6694_canfd.c
> - Fix the typo in the header in nct6694-hwmon.c
>
> Changes since version 10:
> - Add change log for each patch
> - Fix mfd_cell to MFD_CELL_NAME() in nct6694.c
> - Implement IDA to allocate id in gpio-nct6694.c, i2c-nct6694.c,
>   nct6694_canfd.c and nct6694_wdt.c
> - Add header <linux/bitfield.h> in nct6694_canfd.c
> - Add support to config tdc in nct6694_canfd.c
> - Add module parameters to configure WDT's timeout and pretimeout value
>   in nct6694_wdt.c
>
> Changes since version 9:
> - Add devm_add_action_or_reset() to dispose irq mapping
> - Add KernelDoc to exported functions in nct6694.c
>
> Changes since version 8:
> - Modify the signed-off-by with my work address
> - Rename all MFD cell names to "nct6694-xxx"
> - Add irq_dispose_mapping() in the error handling path and in the remove
>   function
> - Fix some comments in nct6694.c and in nct6694.h
> - Add module parameters to configure I2C's baudrate in i2c-nct6694.c
> - Rename all function names nct6694_can_xxx to nct6694_canfd_xxx in
>   nct6694_canfd.c
> - Fix nct6694_canfd_handle_state_change() in nct6694_canfd.c
> - Fix nct6694_canfd_start() to configure NBTP and DBTP in nct6694_canfd.c
> - Add can_set_static_ctrlmode() in nct6694_canfd.c
>
> Changes since version 7:
> - Add error handling for devm_mutex_init()
> - Modify the name of the child devices CAN1 and CAN2 to CAN0 and CAN1.
> - Fix multiline comments to net-dev style in nct6694_canfd.c
>
> Changes since version 6:
> - Fix nct6694_can_handle_state_change() in nct6694_canfd.c
> - Fix warnings in nct6694_canfd.c
> - Move the nct6694_can_priv's bec to the end in nct6694_canfd.c
> - Fix warning in nct6694_wdt.c
> - Fix temp_hyst's data type to signed variable in nct6694-hwmon.c
>
> Changes since version 5:
> - Modify the module name and the driver name consistently
> - Fix mfd_cell to MFD_CELL_NAME() and MFD_CELL_BASIC()
> - Drop unnecessary macros in nct6694.c
> - Update private data and drop mutex in nct6694_canfd.c
> - Fix nct6694_can_handle_state_change() in nct6694_canfd.c
>
> Changes since version 4:
> - Modify arguments in read/write function to a pointer to cmd_header
> - Modify all callers that call the read/write function
> - Move the nct6694_canfd.c to drivers/net/can/usb/
> - Fix the missing rx offload function in nct6694_canfd.c
> - Fix warngings in nct6694-hwmon.c
>
> Changes since version 3:
> - Modify array buffer to structure for each drivers
> - Fix defines and comments for each drivers
> - Add header <linux/bits.h> and use BIT macro in nct6694.c and
>   gpio-nct6694.c
> - Modify mutex_init() to devm_mutex_init()
> - Add rx-offload helper in nct6694_canfd.c
> - Drop watchdog_init_timeout() in nct6694_wdt.c
> - Modify the division method to DIV_ROUND_CLOSEST() in nct6694-hwmon.c
> - Drop private mutex and use rtc core lock in rtc-nct6694.c
> - Modify device_set_wakeup_capable() to device_init_wakeup() in
>   rtc-nct6694.c
>
> Changes since version 2:
> - Add MODULE_ALIAS() for each child driver
> - Modify gpio line names be a local variable in gpio-nct6694.c
> - Drop unnecessary platform_get_drvdata() in gpio-nct6694.c
> - Rename each command in nct6694_canfd.c
> - Modify each function name consistently in nct6694_canfd.c
> - Modify the pretimeout validation procedure in nct6694_wdt.c
> - Fix warnings in nct6694-hwmon.c
>
> Changes since version 1:
> - Implement IRQ domain to handle IRQ demux in nct6694.c
> - Modify USB_DEVICE to USB_DEVICE_AND_INTERFACE_INFO API in nct6694.c
> - Add each driver's command structure
> - Fix USB functions in nct6694.c
> - Fix platform driver registration in each child driver
> - Sort each driver's header files alphabetically
> - Drop unnecessary header in gpio-nct6694.c
> - Add gpio line names in gpio-nct6694.c
> - Fix errors and warnings in nct6694_canfd.c
> - Fix TX-flow control in nct6694_canfd.c
> - Fix warnings in nct6694_wdt.c
> - Drop unnecessary logs in nct6694_wdt.c
> - Modify start() function to setup device in nct6694_wdt.c
> - Add voltage sensors functionality in nct6694-hwmon.c
> - Add temperature sensors functionality in nct6694-hwmon.c
> - Fix overwrite error return values in nct6694-hwmon.c
> - Add write value limitation for each write() function in nct6694-hwmon.c
> - Drop unnecessary logs in rtc-nct6694.c
> - Fix overwrite error return values in rtc-nct6694.c
> - Modify to use dev_err_probe API in rtc-nct6694.c
>
>
> Ming Yu (7):
>   mfd: Add core driver for Nuvoton NCT6694
>   gpio: Add Nuvoton NCT6694 GPIO support
>   i2c: Add Nuvoton NCT6694 I2C support
>   can: Add Nuvoton NCT6694 CANFD support
>   watchdog: Add Nuvoton NCT6694 WDT support
>   hwmon: Add Nuvoton NCT6694 HWMON support
>   rtc: Add Nuvoton NCT6694 RTC support
>
>  MAINTAINERS                         |  12 +
>  drivers/gpio/Kconfig                |  12 +
>  drivers/gpio/Makefile               |   1 +
>  drivers/gpio/gpio-nct6694.c         | 499 +++++++++++++++
>  drivers/hwmon/Kconfig               |  10 +
>  drivers/hwmon/Makefile              |   1 +
>  drivers/hwmon/nct6694-hwmon.c       | 949 ++++++++++++++++++++++++++++
>  drivers/i2c/busses/Kconfig          |  10 +
>  drivers/i2c/busses/Makefile         |   1 +
>  drivers/i2c/busses/i2c-nct6694.c    | 196 ++++++
>  drivers/mfd/Kconfig                 |  15 +
>  drivers/mfd/Makefile                |   2 +
>  drivers/mfd/nct6694.c               | 388 ++++++++++++
>  drivers/net/can/usb/Kconfig         |  11 +
>  drivers/net/can/usb/Makefile        |   1 +
>  drivers/net/can/usb/nct6694_canfd.c | 832 ++++++++++++++++++++++++
>  drivers/rtc/Kconfig                 |  10 +
>  drivers/rtc/Makefile                |   1 +
>  drivers/rtc/rtc-nct6694.c           | 297 +++++++++
>  drivers/watchdog/Kconfig            |  11 +
>  drivers/watchdog/Makefile           |   1 +
>  drivers/watchdog/nct6694_wdt.c      | 307 +++++++++
>  include/linux/mfd/nct6694.h         | 102 +++
>  23 files changed, 3669 insertions(+)
>  create mode 100644 drivers/gpio/gpio-nct6694.c
>  create mode 100644 drivers/hwmon/nct6694-hwmon.c
>  create mode 100644 drivers/i2c/busses/i2c-nct6694.c
>  create mode 100644 drivers/mfd/nct6694.c
>  create mode 100644 drivers/net/can/usb/nct6694_canfd.c
>  create mode 100644 drivers/rtc/rtc-nct6694.c
>  create mode 100644 drivers/watchdog/nct6694_wdt.c
>  create mode 100644 include/linux/mfd/nct6694.h
>
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> --
> 2.34.1
>

