Return-Path: <linux-i2c+bounces-10239-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2065A823BD
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 13:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A5718A4514
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Apr 2025 11:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB9625E80F;
	Wed,  9 Apr 2025 11:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VjPFJfeT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C485E25E460
	for <linux-i2c@vger.kernel.org>; Wed,  9 Apr 2025 11:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744198786; cv=none; b=SyAKfZygDizmB1jCF3aG9Xytr20rWarq5vWfBvBAuGWcjIs52i2sG2csfvqdxlokPTournYNtv63YLGK8An/huDwd5WDnwZLcCA3k4+oCUeSKcQwyWfuMPYKfAPJi8QhX4k+U59wchR1iF3tiHOjjneGfOjUU0VtT99ycjujcSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744198786; c=relaxed/simple;
	bh=9JPqM5tB/xt7Ke455v87Sqtbxm1iucVYBgzAxrP0jGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=js+wYbPb8xs3K8tifPOAubo8GCsa5BU6+Xb4aOf+t9Wc0Gn0czKEPcztpjuTqwoL1DlGhYKMcUDNuYAGKFxr7LoDGUyFBUxU4qcUNbIqYC1NtY+0+zaJLkUFuOsKIwockgKzJEXhRg0rWKggkQ2vWHtrbbAZaf9B3ef/WI0XUrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VjPFJfeT; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so57815471fa.2
        for <linux-i2c@vger.kernel.org>; Wed, 09 Apr 2025 04:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744198780; x=1744803580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqZ7G3XZuno9/BWbcpOUNm32JyzY1vuuWJOOv2PSiuI=;
        b=VjPFJfeTDcr+YOimJmfUKCRre4cvyvMoztN40x+rVmN/gFCrsjWZooaMa4NWgFRIQY
         v4P/wybg88s+yluq7ZaZ3Nc588R04lNCZ65f4OtGk7PjMsHry6jPbvODKScRp8J0wk79
         kit3JuGHoD1ziXbjYwtl6PT74XaFzEUEzTTzDK8iH61hSAK9txF4Ix1J7Jt6/ol90xaS
         NOoeFGTm8xM3NEzRtE95HKe/WfFi0rFE2nz5fFrG7NucT7I1hhbwHhBKzRtqg/oE9Rdf
         L0kLJagr97uuj8NuZ5bNWLEqEx2/d69Q9eDldyNhHugWeWhycah/4AZMNq/y50vo8V6U
         TMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744198780; x=1744803580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqZ7G3XZuno9/BWbcpOUNm32JyzY1vuuWJOOv2PSiuI=;
        b=LDq1ks0wgmLuMqHfN+DCkBHVXJ10QOGw8ZoGFnvif7EmYaxz0ElSirfA1P77wdEPC7
         ulJhLyiMkxwKOolNlzxD1D5iAHATbIjIyA3yREnUqGLT6vaviZWECfHykyqoS9iMBRc8
         WnPtGw2qWHAdO1+6sz3j2mIms5evUyje49fKgVqsp8eyc841v4XcGh/7liZ64VtZeFIV
         frLFZbK2IKOAc0jzdfYzs/f6o3GazUqP+gOlxPIdZju8giQ5AqR+QglGGHp4hPyax7wH
         wMA/CfQPA4Vi1JzG/+9rKi6sk3zmnjDuUXNvid2AoXZQw4P6EFQrNzBFArbhjI5l8+45
         ICmw==
X-Forwarded-Encrypted: i=1; AJvYcCVbGuaHzW3IiBtMDfs6RtZjJHicRM5h8rhBE+U874hRp5ExcISpudnlcJSL9lF0l9v3VkQ13SIoEX0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4yLkvkII/y5UCfcZ6yqmuD24Mo0+KADqhF3iSACEp3Erm3ZDD
	igszydVAw9TZMSrqTLcwCqFn5ttmkFzEYxQ68cuOrtFiNs7MreT5Yeo+UIyeAie4bc3ygLOMqDa
	cp6l8qrAIQbxZXFPFvTYU5Q89UV2hr3Jtxoukng==
X-Gm-Gg: ASbGncvta5j2p71HfJnAjTrk1KapJU/saICQEfq2AzRC+LskONqp4w0bYIu9Z/9Ffu3
	Lgnbmoka3qYkQ0Qhvdwz/Qw+Zd/amRlC/+y5QppNpNKD0QcHzM2lCi/hvr+a+3p9UoxOMmGXlyo
	kCgQUUsaGAEnxwiTLbJtOP8SnzmpVE1fwy94J9e7OOqcxEpczD7JjfmQ==
X-Google-Smtp-Source: AGHT+IH2rhh9UZr3gT+gk9vauBbff4rqoLJ0eK+N4IMBNrWJkLz7WugNYn/eMwW03Soju/MnS5YCOKqclgKaC+gr7b8=
X-Received: by 2002:a2e:a916:0:b0:30b:aabf:fa8 with SMTP id
 38308e7fff4ca-30f438a304cmr9221251fa.28.1744198779776; Wed, 09 Apr 2025
 04:39:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409082752.3697532-1-tmyu0@nuvoton.com> <20250409082752.3697532-3-tmyu0@nuvoton.com>
In-Reply-To: <20250409082752.3697532-3-tmyu0@nuvoton.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 9 Apr 2025 13:39:28 +0200
X-Gm-Features: ATxdqUFijEYx6QdFRrhVQhViJ0ULDwLemnwxjabwnPjw2A_QybzwG7P-pxJwIsc
Message-ID: <CAMRc=Meb9wbhd_wH0OBGAivgUA3-3_+-E5neE+b32T54zQkQjg@mail.gmail.com>
Subject: Re: [PATCH v9 2/7] gpio: Add Nuvoton NCT6694 GPIO support
To: a0282524688@gmail.com
Cc: lee@kernel.org, linus.walleij@linaro.org, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org, 
	Ming Yu <tmyu0@nuvoton.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 10:28=E2=80=AFAM <a0282524688@gmail.com> wrote:
>
> From: Ming Yu <tmyu0@nuvoton.com>
>
> This driver supports GPIO and IRQ functionality for NCT6694 MFD
> device based on USB interface.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---
>  MAINTAINERS                 |   1 +
>  drivers/gpio/Kconfig        |  12 +
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-nct6694.c | 494 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 508 insertions(+)
>  create mode 100644 drivers/gpio/gpio-nct6694.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f67f78a1d7b0..c3e849701497 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17305,6 +17305,7 @@ F:      include/uapi/linux/nubus.h
>  NUVOTON NCT6694 MFD DRIVER
>  M:     Ming Yu <tmyu0@nuvoton.com>
>  S:     Supported
> +F:     drivers/gpio/gpio-nct6694.c
>  F:     drivers/mfd/nct6694.c
>  F:     include/linux/mfd/nct6694.h
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index f2c39bbff83a..ced4a93dccb6 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1463,6 +1463,18 @@ config GPIO_MAX77650
>           GPIO driver for MAX77650/77651 PMIC from Maxim Semiconductor.
>           These chips have a single pin that can be configured as GPIO.
>
> +config GPIO_NCT6694
> +       tristate "Nuvoton NCT6694 GPIO controller support"
> +       depends on MFD_NCT6694
> +       select GENERIC_IRQ_CHIP
> +       select GPIOLIB_IRQCHIP
> +       help
> +         This driver supports 8 GPIO pins per bank that can all be inter=
rupt
> +         sources.
> +
> +         This driver can also be built as a module. If so, the module wi=
ll be
> +         called gpio-nct6694.
> +
>  config GPIO_PALMAS
>         bool "TI PALMAS series PMICs GPIO"
>         depends on MFD_PALMAS
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index af130882ffee..6a56ec5430c6 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -124,6 +124,7 @@ obj-$(CONFIG_GPIO_MT7621)           +=3D gpio-mt7621.=
o
>  obj-$(CONFIG_GPIO_MVEBU)               +=3D gpio-mvebu.o
>  obj-$(CONFIG_GPIO_MXC)                 +=3D gpio-mxc.o
>  obj-$(CONFIG_GPIO_MXS)                 +=3D gpio-mxs.o
> +obj-$(CONFIG_GPIO_NCT6694)             +=3D gpio-nct6694.o
>  obj-$(CONFIG_GPIO_NOMADIK)             +=3D gpio-nomadik.o
>  obj-$(CONFIG_GPIO_NPCM_SGPIO)          +=3D gpio-npcm-sgpio.o
>  obj-$(CONFIG_GPIO_OCTEON)              +=3D gpio-octeon.o
> diff --git a/drivers/gpio/gpio-nct6694.c b/drivers/gpio/gpio-nct6694.c
> new file mode 100644
> index 000000000000..5b6562814836
> --- /dev/null
> +++ b/drivers/gpio/gpio-nct6694.c
> @@ -0,0 +1,494 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 GPIO controller driver based on USB interface.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/interrupt.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/nct6694.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +/*
> + * USB command module type for NCT6694 GPIO controller.
> + * This defines the module type used for communication with the NCT6694
> + * GPIO controller over the USB interface.
> + */
> +#define NCT6694_GPIO_MOD       0xFF
> +
> +#define NCT6694_GPIO_VER       0x90
> +#define NCT6694_GPIO_VALID     0x110
> +#define NCT6694_GPI_DATA       0x120
> +#define NCT6694_GPO_DIR                0x170
> +#define NCT6694_GPO_TYPE       0x180
> +#define NCT6694_GPO_DATA       0x190
> +
> +#define NCT6694_GPI_STS                0x130
> +#define NCT6694_GPI_CLR                0x140
> +#define NCT6694_GPI_FALLING    0x150
> +#define NCT6694_GPI_RISING     0x160
> +
> +#define NCT6694_NR_GPIO                8
> +
> +struct nct6694_gpio_data {
> +       struct nct6694 *nct6694;
> +       struct gpio_chip gpio;
> +       struct mutex lock;
> +       /* Protect irq operation */
> +       struct mutex irq_lock;
> +
> +       unsigned char reg_val;
> +       unsigned char irq_trig_falling;
> +       unsigned char irq_trig_rising;
> +
> +       /* Current gpio group */
> +       unsigned char group;
> +       int irq;
> +};
> +
> +static int nct6694_get_direction(struct gpio_chip *gpio, unsigned int of=
fset)
> +{
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +       const struct nct6694_cmd_header cmd_hd =3D {
> +               .mod =3D NCT6694_GPIO_MOD,
> +               .offset =3D cpu_to_le16(NCT6694_GPO_DIR + data->group),
> +               .len =3D cpu_to_le16(sizeof(data->reg_val))
> +       };
> +       int ret;
> +
> +       guard(mutex)(&data->lock);
> +
> +       ret =3D nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
> +       if (ret < 0)
> +               return ret;
> +
> +       return !(BIT(offset) & data->reg_val);
> +}
> +
> +static int nct6694_direction_input(struct gpio_chip *gpio, unsigned int =
offset)
> +{
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +       const struct nct6694_cmd_header cmd_hd =3D {
> +               .mod =3D NCT6694_GPIO_MOD,
> +               .offset =3D cpu_to_le16(NCT6694_GPO_DIR + data->group),
> +               .len =3D cpu_to_le16(sizeof(data->reg_val))
> +       };
> +       int ret;
> +
> +       guard(mutex)(&data->lock);
> +
> +       ret =3D nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
> +       if (ret < 0)
> +               return ret;
> +
> +       data->reg_val &=3D ~BIT(offset);
> +
> +       return nct6694_write_msg(data->nct6694, &cmd_hd, &data->reg_val);
> +}
> +
> +static int nct6694_direction_output(struct gpio_chip *gpio,
> +                                   unsigned int offset, int val)
> +{
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +       struct nct6694_cmd_header cmd_hd =3D {
> +               .mod =3D NCT6694_GPIO_MOD,
> +               .offset =3D cpu_to_le16(NCT6694_GPO_DIR + data->group),
> +               .len =3D cpu_to_le16(sizeof(data->reg_val))
> +       };
> +       int ret;
> +
> +       guard(mutex)(&data->lock);
> +
> +       /* Set direction to output */
> +       ret =3D nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
> +       if (ret < 0)
> +               return ret;
> +
> +       data->reg_val |=3D BIT(offset);
> +       ret =3D nct6694_write_msg(data->nct6694, &cmd_hd, &data->reg_val)=
;
> +       if (ret < 0)
> +               return ret;
> +
> +       /* Then set output level */
> +       cmd_hd.offset =3D cpu_to_le16(NCT6694_GPO_DATA + data->group);
> +       ret =3D nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (val)
> +               data->reg_val |=3D BIT(offset);
> +       else
> +               data->reg_val &=3D ~BIT(offset);
> +
> +       return nct6694_write_msg(data->nct6694, &cmd_hd, &data->reg_val);
> +}
> +
> +static int nct6694_get_value(struct gpio_chip *gpio, unsigned int offset=
)
> +{
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +       struct nct6694_cmd_header cmd_hd =3D {
> +               .mod =3D NCT6694_GPIO_MOD,
> +               .offset =3D cpu_to_le16(NCT6694_GPO_DIR + data->group),
> +               .len =3D cpu_to_le16(sizeof(data->reg_val))
> +       };
> +       int ret;
> +
> +       guard(mutex)(&data->lock);
> +
> +       ret =3D nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (BIT(offset) & data->reg_val) {
> +               cmd_hd.offset =3D cpu_to_le16(NCT6694_GPO_DATA + data->gr=
oup);
> +               ret =3D nct6694_read_msg(data->nct6694, &cmd_hd, &data->r=
eg_val);
> +               if (ret < 0)
> +                       return ret;
> +
> +               return !!(BIT(offset) & data->reg_val);
> +       }
> +
> +       cmd_hd.offset =3D cpu_to_le16(NCT6694_GPI_DATA + data->group);
> +       ret =3D nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
> +       if (ret < 0)
> +               return ret;
> +
> +       return !!(BIT(offset) & data->reg_val);
> +}
> +
> +static void nct6694_set_value(struct gpio_chip *gpio, unsigned int offse=
t,
> +                             int val)
> +{
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +       const struct nct6694_cmd_header cmd_hd =3D {
> +               .mod =3D NCT6694_GPIO_MOD,
> +               .offset =3D cpu_to_le16(NCT6694_GPO_DATA + data->group),
> +               .len =3D cpu_to_le16(sizeof(data->reg_val))
> +       };
> +
> +       guard(mutex)(&data->lock);
> +
> +       nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
> +
> +       if (val)
> +               data->reg_val |=3D BIT(offset);
> +       else
> +               data->reg_val &=3D ~BIT(offset);
> +
> +       nct6694_write_msg(data->nct6694, &cmd_hd, &data->reg_val);
> +}
> +
> +static int nct6694_set_config(struct gpio_chip *gpio, unsigned int offse=
t,
> +                             unsigned long config)
> +{
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +       const struct nct6694_cmd_header cmd_hd =3D {
> +               .mod =3D NCT6694_GPIO_MOD,
> +               .offset =3D cpu_to_le16(NCT6694_GPO_TYPE + data->group),
> +               .len =3D cpu_to_le16(sizeof(data->reg_val))
> +       };
> +       int ret;
> +
> +       guard(mutex)(&data->lock);
> +
> +       ret =3D nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
> +       if (ret < 0)
> +               return ret;
> +
> +       switch (pinconf_to_config_param(config)) {
> +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +               data->reg_val |=3D BIT(offset);
> +               break;
> +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> +               data->reg_val &=3D ~BIT(offset);
> +               break;
> +       default:
> +               return -ENOTSUPP;
> +       }
> +
> +       return nct6694_write_msg(data->nct6694, &cmd_hd, &data->reg_val);
> +}
> +
> +static int nct6694_init_valid_mask(struct gpio_chip *gpio,
> +                                  unsigned long *valid_mask,
> +                                  unsigned int ngpios)
> +{
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +       const struct nct6694_cmd_header cmd_hd =3D {
> +               .mod =3D NCT6694_GPIO_MOD,
> +               .offset =3D cpu_to_le16(NCT6694_GPIO_VALID + data->group)=
,
> +               .len =3D cpu_to_le16(sizeof(data->reg_val))
> +       };
> +       int ret;
> +
> +       guard(mutex)(&data->lock);
> +
> +       ret =3D nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
> +       if (ret < 0)
> +               return ret;
> +
> +       *valid_mask =3D data->reg_val;
> +
> +       return ret;
> +}
> +
> +static irqreturn_t nct6694_irq_handler(int irq, void *priv)
> +{
> +       struct nct6694_gpio_data *data =3D priv;
> +       struct nct6694_cmd_header cmd_hd =3D {
> +               .mod =3D NCT6694_GPIO_MOD,
> +               .offset =3D cpu_to_le16(NCT6694_GPI_STS + data->group),
> +               .len =3D cpu_to_le16(sizeof(data->reg_val))
> +       };
> +       unsigned char status;
> +       int ret;
> +
> +       guard(mutex)(&data->lock);
> +
> +       ret =3D nct6694_read_msg(data->nct6694, &cmd_hd, &data->reg_val);
> +       if (ret)
> +               return IRQ_NONE;
> +
> +       status =3D data->reg_val;
> +
> +       while (status) {
> +               int bit =3D __ffs(status);
> +
> +               data->reg_val =3D BIT(bit);
> +               handle_nested_irq(irq_find_mapping(data->gpio.irq.domain,=
 bit));
> +               status &=3D ~BIT(bit);
> +               cmd_hd.offset =3D cpu_to_le16(NCT6694_GPI_CLR + data->gro=
up);
> +               nct6694_write_msg(data->nct6694, &cmd_hd, &data->reg_val)=
;
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int nct6694_get_irq_trig(struct nct6694_gpio_data *data)
> +{
> +       struct nct6694_cmd_header cmd_hd =3D {
> +               .mod =3D NCT6694_GPIO_MOD,
> +               .offset =3D cpu_to_le16(NCT6694_GPI_FALLING + data->group=
),
> +               .len =3D cpu_to_le16(sizeof(data->reg_val))
> +       };
> +       int ret;
> +
> +       guard(mutex)(&data->lock);
> +
> +       ret =3D nct6694_read_msg(data->nct6694, &cmd_hd, &data->irq_trig_=
falling);
> +       if (ret)
> +               return ret;
> +
> +       cmd_hd.offset =3D cpu_to_le16(NCT6694_GPI_RISING + data->group);
> +       return nct6694_read_msg(data->nct6694, &cmd_hd, &data->irq_trig_r=
ising);
> +}
> +
> +static void nct6694_irq_mask(struct irq_data *d)
> +{
> +       struct gpio_chip *gpio =3D irq_data_get_irq_chip_data(d);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> +
> +       gpiochip_disable_irq(gpio, hwirq);
> +}
> +
> +static void nct6694_irq_unmask(struct irq_data *d)
> +{
> +       struct gpio_chip *gpio =3D irq_data_get_irq_chip_data(d);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> +
> +       gpiochip_enable_irq(gpio, hwirq);
> +}
> +
> +static int nct6694_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +       struct gpio_chip *gpio =3D irq_data_get_irq_chip_data(d);
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> +
> +       guard(mutex)(&data->lock);
> +
> +       switch (type) {
> +       case IRQ_TYPE_EDGE_RISING:
> +               data->irq_trig_rising |=3D BIT(hwirq);
> +               break;
> +
> +       case IRQ_TYPE_EDGE_FALLING:
> +               data->irq_trig_falling |=3D BIT(hwirq);
> +               break;
> +
> +       case IRQ_TYPE_EDGE_BOTH:
> +               data->irq_trig_rising |=3D BIT(hwirq);
> +               data->irq_trig_falling |=3D BIT(hwirq);
> +               break;
> +
> +       default:
> +               return -ENOTSUPP;
> +       }
> +
> +       return 0;
> +}
> +
> +static void nct6694_irq_bus_lock(struct irq_data *d)
> +{
> +       struct gpio_chip *gpio =3D irq_data_get_irq_chip_data(d);
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +
> +       mutex_lock(&data->irq_lock);
> +}
> +
> +static void nct6694_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +       struct gpio_chip *gpio =3D irq_data_get_irq_chip_data(d);
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +       struct nct6694_cmd_header cmd_hd =3D {
> +               .mod =3D NCT6694_GPIO_MOD,
> +               .offset =3D cpu_to_le16(NCT6694_GPI_FALLING + data->group=
),
> +               .len =3D cpu_to_le16(sizeof(data->reg_val))
> +       };
> +
> +       scoped_guard(mutex, &data->lock) {
> +               nct6694_write_msg(data->nct6694, &cmd_hd, &data->irq_trig=
_falling);
> +
> +               cmd_hd.offset =3D cpu_to_le16(NCT6694_GPI_RISING + data->=
group);
> +               nct6694_write_msg(data->nct6694, &cmd_hd, &data->irq_trig=
_rising);
> +       }
> +
> +       mutex_unlock(&data->irq_lock);
> +}
> +
> +static const struct irq_chip nct6694_irq_chip =3D {
> +       .name                   =3D "gpio-nct6694",
> +       .irq_mask               =3D nct6694_irq_mask,
> +       .irq_unmask             =3D nct6694_irq_unmask,
> +       .irq_set_type           =3D nct6694_irq_set_type,
> +       .irq_bus_lock           =3D nct6694_irq_bus_lock,
> +       .irq_bus_sync_unlock    =3D nct6694_irq_bus_sync_unlock,
> +       .flags                  =3D IRQCHIP_IMMUTABLE,
> +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
> +static int nct6694_gpio_probe(struct platform_device *pdev)
> +{
> +       const struct mfd_cell *cell =3D mfd_get_cell(pdev);
> +       struct device *dev =3D &pdev->dev;
> +       struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> +       struct nct6694_gpio_data *data;
> +       struct gpio_irq_chip *girq;
> +       int ret, irq, i;
> +       char **names;
> +
> +       irq =3D irq_create_mapping(nct6694->domain,
> +                                NCT6694_IRQ_GPIO0 + cell->id);
> +       if (!irq)
> +               return -EINVAL;
> +
> +       data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data) {
> +               ret =3D -ENOMEM;
> +               goto dispose_irq;
> +       }
> +
> +       names =3D devm_kcalloc(dev, NCT6694_NR_GPIO, sizeof(char *),
> +                            GFP_KERNEL);
> +       if (!names) {
> +               ret =3D -ENOMEM;
> +               goto dispose_irq;
> +       }
> +
> +       for (i =3D 0; i < NCT6694_NR_GPIO; i++) {
> +               names[i] =3D devm_kasprintf(dev, GFP_KERNEL, "GPIO%X%d",
> +                                         cell->id, i);
> +               if (!names[i]) {
> +                       ret =3D -ENOMEM;
> +                       goto dispose_irq;
> +               }
> +       }
> +
> +       data->irq =3D irq;
> +       data->nct6694 =3D nct6694;
> +       data->group =3D cell->id;
> +
> +       data->gpio.names                =3D (const char * const*)names;
> +       data->gpio.label                =3D pdev->name;
> +       data->gpio.direction_input      =3D nct6694_direction_input;
> +       data->gpio.get                  =3D nct6694_get_value;
> +       data->gpio.direction_output     =3D nct6694_direction_output;
> +       data->gpio.set                  =3D nct6694_set_value;

Please use the set_rv variant, regular set is deprecated now.

> +       data->gpio.get_direction        =3D nct6694_get_direction;
> +       data->gpio.set_config           =3D nct6694_set_config;
> +       data->gpio.init_valid_mask      =3D nct6694_init_valid_mask;
> +       data->gpio.base                 =3D -1;
> +       data->gpio.can_sleep            =3D false;
> +       data->gpio.owner                =3D THIS_MODULE;
> +       data->gpio.ngpio                =3D NCT6694_NR_GPIO;
> +
> +       platform_set_drvdata(pdev, data);
> +
> +       ret =3D devm_mutex_init(dev, &data->lock);
> +       if (ret)
> +               goto dispose_irq;
> +
> +       ret =3D devm_mutex_init(dev, &data->irq_lock);
> +       if (ret)
> +               goto dispose_irq;
> +
> +       ret =3D nct6694_get_irq_trig(data);
> +       if (ret) {
> +               dev_err_probe(dev, ret, "Failed to get irq trigger type\n=
");
> +               goto dispose_irq;
> +       }
> +
> +       girq =3D &data->gpio.irq;
> +       gpio_irq_chip_set_chip(girq, &nct6694_irq_chip);
> +       girq->parent_handler =3D NULL;
> +       girq->num_parents =3D 0;
> +       girq->parents =3D NULL;
> +       girq->default_type =3D IRQ_TYPE_NONE;
> +       girq->handler =3D handle_level_irq;
> +       girq->threaded =3D true;
> +
> +       ret =3D devm_request_threaded_irq(dev, irq, NULL, nct6694_irq_han=
dler,
> +                                       IRQF_ONESHOT | IRQF_SHARED,
> +                                       "gpio-nct6694", data);
> +       if (ret) {
> +               dev_err_probe(dev, ret, "Failed to request irq\n");
> +               goto dispose_irq;
> +       }
> +
> +       ret =3D devm_gpiochip_add_data(dev, &data->gpio, data);
> +       if (ret)
> +               goto dispose_irq;
> +
> +       return 0;
> +
> +dispose_irq:
> +       irq_dispose_mapping(irq);
> +       return ret;
> +}
> +
> +static void nct6694_gpio_remove(struct platform_device *pdev)
> +{
> +       struct nct6694_gpio_data *data =3D platform_get_drvdata(pdev);
> +
> +       devm_free_irq(&pdev->dev, data->irq, data);

That's definitely not right. If you need to use the devm_free variant
in remove(), then you're doing something wrong. Most likely you can
rely on the devres release path here...

> +       irq_dispose_mapping(data->irq);

... and schedule this as a custom devm action.

Bart

> +}
> +
> +static struct platform_driver nct6694_gpio_driver =3D {
> +       .driver =3D {
> +               .name   =3D "nct6694-gpio",
> +       },
> +       .probe          =3D nct6694_gpio_probe,
> +       .remove         =3D nct6694_gpio_remove,
> +};
> +
> +module_platform_driver(nct6694_gpio_driver);
> +
> +MODULE_DESCRIPTION("USB-GPIO controller driver for NCT6694");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:nct6694-gpio");
> --
> 2.34.1
>

