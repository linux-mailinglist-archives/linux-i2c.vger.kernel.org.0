Return-Path: <linux-i2c+bounces-8473-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3669EF1F9
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 17:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D627174E44
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 16:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF13236919;
	Thu, 12 Dec 2024 16:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="hrBykZb6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out.smtpout.orange.fr (out-67.smtpout.orange.fr [193.252.22.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D651C222D67;
	Thu, 12 Dec 2024 16:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734020408; cv=none; b=heFrXqkO46TScbFRGnujpdTAxRMl1Wtxp5i/J1iQ25dGIjumJvffAIEUYAeABaShDGE5G2p6g3oq6lgmSXVUhG+Sn6rbBBvDSVDS/WzWWhU55yf3Gzp92FmIz6t/1hue8MliKi2vJD8kSCqv6UItKPYywstS+2pu6SCy7EQxLlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734020408; c=relaxed/simple;
	bh=1WTawLpM22VVsO7MCnmppbiRvTxqh0PjOroEF1c+9og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PzNj4DgqKFSqnx/gt2OzpHPUKamD8rtQw+gfHBPbjVIH865X17/aCerEE9v2qbJiTBfFh5HK9CNoxXvNCplauxorN7RNtUN8sAJeN6DSg3hloWmv7xxXO8N1HzWFCaZK1jdTXvr9XCJmcPGuq6nGIaRxZT+NBcRYpvAYJAVp/mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=hrBykZb6; arc=none smtp.client-ip=193.252.22.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from mail-ej1-f45.google.com ([209.85.218.45])
	by smtp.orange.fr with ESMTPSA
	id LllstKMYjwPxvLllstdUPZ; Thu, 12 Dec 2024 17:10:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1734019836;
	bh=BHm2u6jBHZpNa6IIRdcDt5V+yEj/eHfBKedn+I+Dfbk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=hrBykZb69u10gI+mbJc/HgFUoRt6LyqPBI7JddcZaTv4Y868d7nbJAofXVrGwVK+c
	 C3N4RA6lO1Od4XYAem2a7cm9liIsNp4WR9U2TZCupxIZBbASScvfujhqcWrf8gzfhT
	 oAkx/h5VnZ1xkHbXtyeDR6kgY8beBNxyuUrUrOhLWdewZTGJIOwEHigYXO1ME4505+
	 MGybw937qi9Liii6qzv91W63x5LTzOT9fsZ7T/oTraulrhsuhwNioFDo5nUX3fGUZY
	 Ieg2v3g4ScnttDfqNygU6X8wk9Bct0ug3jfspd5DU9bn4vOcxG/Vlv1Eeu1dLS1sHZ
	 aMzTksBdxMiHw==
X-ME-Helo: mail-ej1-f45.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 12 Dec 2024 17:10:36 +0100
X-ME-IP: 209.85.218.45
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa6997f33e4so112756566b.3;
        Thu, 12 Dec 2024 08:10:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUeKhSFGBP/u3aVDV786tkBDWSU0/P+c7UoqUQRFcPVcX/CulW2DzitTXrwymb/UyFSnZPR0e8BCpQvzQ==@vger.kernel.org, AJvYcCVSUQCp/PsqJ7mgCHVnqNg049G8g6WnBSDn9aXeknHg/Lr/YOABrS9gjPa+BhcUHdpvG/h5EDlCsAhg43Sh@vger.kernel.org, AJvYcCVtMeqjZ3UamKQzV9qi4W9+C9Ogfc98j4nj9SgbTHoeWnRGqlJ1jKpEjNv6Qf467l2rSrMt0eLToFhLpO8=@vger.kernel.org, AJvYcCWoKPAQW3u23LdDut8TUO/N+nLiyuf6wFxj/R1rk7QOmTNQaX2lwFanHFxy06hgmnIT5aiw1Ae4c37U3Ji/peI=@vger.kernel.org, AJvYcCXOQzBUmS/NzWWETPUYCjTLnwQK4fbW5sneG3I5evDSL0ucGO3wqX2jXZjzty77nW5L1cwjxJR5@vger.kernel.org, AJvYcCXX0CZrxqgHvyq3R2QLCWd4XFMtV7hc+RSGe8agje7DKhBBkc9C7UO2b2yKpHuFXBNHmJRGzR6W/ms=@vger.kernel.org, AJvYcCXoOYX88jvb51fu6evM0kfRJ8tWWHKeTdjML7mY8gaJXjaBcpU4z9LSF+FzcqjiIX8xAm1Xjql6Vr/+@vger.kernel.org, AJvYcCXuOF0Fc2h3+Jckbo3vQMSiZZ3Aq1ww+OHrNUKSZV4bAdyHzHDrnDf0jYHQcNUhNjoyTLNF5xQ33fUK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf24S4MyE/XxIy97HBaKjt1Fy3VRzWOuTwrA8cpKRJLlfQ9FxP
	qonzHl04PsCgLYXFstI6x9z81YHj8TtP0+N2ksoRepqITPGAQLJZ+k+dofMo603h7sLDMJ4UwII
	z7mdFbLheC9A3DaFTUQ9xh2FVigk=
X-Google-Smtp-Source: AGHT+IFvGS39Q624IKF07GqeqUCByzjY7zIhUSAblRV0CFMPxwMOrCpGqL4TwDw9irsDnBXj1+ssKbSOGJ7elO9bzQ0=
X-Received: by 2002:a17:906:3ca9:b0:aa6:423c:8502 with SMTP id
 a640c23a62f3a-aa6b15007ccmr663042066b.60.1734019832762; Thu, 12 Dec 2024
 08:10:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-7-tmyu0@nuvoton.com>
In-Reply-To: <20241210104524.2466586-7-tmyu0@nuvoton.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 13 Dec 2024 01:10:21 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqK+B3nc9bLWR49vwDJX3=pbjOKKoa=e=Pnc7wJNQx7JPQ@mail.gmail.com>
Message-ID: <CAMZ6RqK+B3nc9bLWR49vwDJX3=pbjOKKoa=e=Pnc7wJNQx7JPQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] hwmon: Add Nuvoton NCT6694 HWMON support
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 10/12/2024 at 19:45, Ming Yu wrote:
> This driver supports Hardware monitor functionality for NCT6694 MFD
> device based on USB interface.
>
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---
>  MAINTAINERS                   |   1 +
>  drivers/hwmon/Kconfig         |  10 +
>  drivers/hwmon/Makefile        |   1 +
>  drivers/hwmon/nct6694-hwmon.c | 768 ++++++++++++++++++++++++++++++++++
>  4 files changed, 780 insertions(+)
>  create mode 100644 drivers/hwmon/nct6694-hwmon.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 496fe7d5a23f..d6414eea0463 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16546,6 +16546,7 @@ M:      Ming Yu <tmyu0@nuvoton.com>
>  L:     linux-kernel@vger.kernel.org
>  S:     Supported
>  F:     drivers/gpio/gpio-nct6694.c
> +F:     drivers/hwmon/nct6694-hwmon.c
>  F:     drivers/i2c/busses/i2c-nct6694.c
>  F:     drivers/mfd/nct6694.c
>  F:     drivers/net/can/nct6694_canfd.c
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index dd376602f3f1..df40986424bd 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1636,6 +1636,16 @@ config SENSORS_NCT6683
>           This driver can also be built as a module. If so, the module
>           will be called nct6683.
>
> +config SENSORS_NCT6694
> +       tristate "Nuvoton NCT6694 Hardware Monitor support"
> +       depends on MFD_NCT6694
> +       help
> +         Say Y here to support Nuvoton NCT6694 hardware monitoring
> +         functionality.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called nct6694-hwmon.
> +
>  config SENSORS_NCT6775_CORE
>         tristate
>         select REGMAP
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index b827b92f2a78..27a43e67cdb7 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -168,6 +168,7 @@ obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
>  obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) += menf21bmc_hwmon.o
>  obj-$(CONFIG_SENSORS_MR75203)  += mr75203.o
>  obj-$(CONFIG_SENSORS_NCT6683)  += nct6683.o
> +obj-$(CONFIG_SENSORS_NCT6694)  += nct6694-hwmon.o
>  obj-$(CONFIG_SENSORS_NCT6775_CORE) += nct6775-core.o
>  nct6775-objs                   := nct6775-platform.o
>  obj-$(CONFIG_SENSORS_NCT6775)  += nct6775.o
> diff --git a/drivers/hwmon/nct6694-hwmon.c b/drivers/hwmon/nct6694-hwmon.c
> new file mode 100644
> index 000000000000..b2320d64090b
> --- /dev/null
> +++ b/drivers/hwmon/nct6694-hwmon.c
> @@ -0,0 +1,768 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 HWMON driver based on USB interface.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/hwmon.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/nct6694.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +/* Host interface */
> +#define NCT6694_RPT_MOD                        0xFF
> +#define NCT6694_HWMON_MOD              0x00
> +#define NCT6694_PWM_MOD                        0x01
> +
> +/* Report Channel */
> +#define NCT6694_VIN_IDX(x)             (0x00 + (x))
> +#define NCT6694_TIN_IDX(x)                     \
> +       ({ typeof(x) (_x) = (x);                \
> +        ((_x) < 10) ? (0x10 + ((_x) * 2)) :    \
> +        (0x30 + (((_x) - 10) * 2)); })
> +#define NCT6694_FIN_IDX(x)             (0x50 + ((x) * 2))
> +#define NCT6694_PWM_IDX(x)             (0x70 + (x))
> +#define NCT6694_VIN_STS(x)             (0x68 + (x))
> +#define NCT6694_TIN_STS(x)             (0x6A + (x))
> +#define NCT6694_FIN_STS(x)             (0x6E + (x))
> +
> +/* Message Channel*/
> +/* HWMON Command */
> +/* Command 00h */
> +#define NCT6694_HWMON_CMD0_LEN         0x40
> +#define NCT6694_HWMON_CMD0_OFFSET      0x0000  /* OFFSET = SEL|CMD */
> +#define NCT6694_VIN_EN(x)              (0x00 + (x))
> +#define NCT6694_TIN_EN(x)              (0x02 + (x))
> +#define NCT6694_FIN_EN(x)              (0x04 + (x))
> +#define NCT6694_PWM_EN(x)              (0x06 + (x))
> +#define NCT6694_PWM_FREQ_IDX(x)                (0x30 + (x))
> +/* Command 02h */
> +#define NCT6694_HWMON_CMD2_LEN         0x90
> +#define NCT6694_HWMON_CMD2_OFFSET      0x0002  /* OFFSET = SEL|CMD */
> +#define NCT6694_SMI_CTRL_IDX           0x00
> +#define NCT6694_VIN_HL(x)              (0x10 + ((x) * 2))
> +#define NCT6694_VIN_LL(x)              (0x11 + ((x) * 2))
> +#define NCT6694_TIN_HYST(x)            (0x30 + ((x) * 2))
> +#define NCT6694_TIN_HL(x)              (0x31 + ((x) * 2))
> +#define NCT6694_FIN_HL(x)              (0x70 + ((x) * 2))
> +#define NCT6694_FIN_LL(x)              (0x71 + ((x) * 2))
> +/* PWM Command */
> +#define NCT6694_PWM_CMD1_LEN           0x18
> +#define NCT6694_PWM_CMD1_OFFSET                0x0001
> +#define NCT6694_MAL_VAL(x)             (0x02 + (x))
> +
> +#define NCT6694_FREQ_FROM_REG(reg)     ((reg) * 25000 / 255)
> +#define NCT6694_FREQ_TO_REG(val)       \
> +       (DIV_ROUND_CLOSEST(clamp_val((val), 100, 25000) * 255, 25000))
> +
> +#define NCT6694_LSB_REG_MASK           GENMASK(7, 5)
> +#define NCT6694_TIN_HYST_MASK          GENMASK(7, 5)
> +
> +static inline long in_from_reg(u8 reg)
> +{
> +       return reg * 16;
> +}
> +
> +static inline u8 in_to_reg(long val)
> +{
> +       if (val <= 0)
> +               return 0;
> +       return val / 16;
> +}
> +
> +static inline long temp_from_reg(u8 reg)
> +{
> +       return reg * 1000;
> +}
> +
> +static inline u8 temp_to_reg(long val)
> +{
> +       return val / 1000;
> +}
> +
> +struct nct6694_hwmon_data {
> +       struct nct6694 *nct6694;
> +       struct mutex lock;
> +       unsigned char *xmit_buf;
> +       unsigned char hwmon_en[NCT6694_HWMON_CMD0_LEN];
> +};

A global comment on this series: do not declare your buffers as some
opaque unsigned char arrays. Instead, make it a structure (or an array
of structures if needed) using the little endian types for the
different fields.

You already applied this change to the CAN driver after I made a
comment, please do the same throughout the series.

The same applies with any other comments made by anyone else: do not
only apply to the patch where the comment is made, but apply it
broadly to the series.

Thank you.


Yours sincerely,
Vincent Mailhol

