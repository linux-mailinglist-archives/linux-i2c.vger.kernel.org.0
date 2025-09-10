Return-Path: <linux-i2c+bounces-12829-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A905CB517C2
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 15:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0D493B37E6
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Sep 2025 13:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F28A1E102D;
	Wed, 10 Sep 2025 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CTpkmJkZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9FE1DB34C
	for <linux-i2c@vger.kernel.org>; Wed, 10 Sep 2025 13:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757510439; cv=none; b=IKPOQV+GHSTArCSLlISnlsk3LkS18K38MxZ0OHqcLGHe/0YIgUNWPpTbQDybDJXaqHRZISy0zO4UqPLW2voUCLgJL757Fk67YBVb8gfN1+RhoYhviPxIHH1L8aS9C0JWjeX4FImp+MkJ5Ic3cMML7P3TzFCtNLjs/5g9oBJ6U3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757510439; c=relaxed/simple;
	bh=XseQeA7sXB9vEWlhl8sP7mXuhQrwTs6I/tpTJTtr9OQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oHznGWwu4hhxFSoG00S+HEr+LQQJWy1GULc3PHrWqtFE5GFcRcyoKmy6BE5q4YTWJX3roQ01RNXWg+W5OUonH+HHYGvZSDJz+IyqGsA1Nfmv7MTpETHWl1ssFdHm4cZyYQKtL67giOKghYDDbevW9nmuDP5AR5wu+FdKhY+MCgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=CTpkmJkZ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-56afe77bc1eso1063745e87.0
        for <linux-i2c@vger.kernel.org>; Wed, 10 Sep 2025 06:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757510436; x=1758115236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usNnOQgay2wuHNuAsZIrVK6KkYxVcLo34sEGpIoKo6U=;
        b=CTpkmJkZ00pkx+b6rpiiDVMT7r4RD7700e0hhg4QM45anZ+qOpepmGEt27sAd5OKMs
         bVkdRjcambGitUG8RhCajyKi4C23cadUmTG97PqWUVZGvBXc6hpNPoO9Ve2euMTFgoDO
         Fv1c8EldzpAL3VT0qjoRNNtd9OfTbcjhwhKI2uGVC2v8ThtvQiAYYHWXjSBm7qHgod1F
         S0vAadH81VuIuQ4+1PjXJQh1dTjg4/n034LmlsAFylWUhu4tlY8zZFoIMCThxRkcoVs4
         OKGihbGwV+gSpVrIrsGY0+umc+gX6HcfsbBXW7HYSYgsRStKPyhEq9uD/x75XWV3xB6C
         K/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757510436; x=1758115236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usNnOQgay2wuHNuAsZIrVK6KkYxVcLo34sEGpIoKo6U=;
        b=V6DVQ0ccCZOuRpKtd53z6WSrFz/w8WIZ75Fetl75lKrXzTwNUgwreZTIGyHqZuOuvP
         VOm9XR+TSXgP9Tl2v7mbiFwnTmO+nxVCrd6tQOSqVOwjjzjqh+7gOlfmDKMMaiHb+xaE
         kuBRuwXaTUrX3h2JdmLO3hDGP2qymmW2vRc7J1Yw4KItjeqgAbf4Sbe+QG8J3mS3/hVK
         NKh2wgiwtePKrr9LuZcTo1IDU4EISrmpbH84cE+vXPr2CtEMVCKSjsBjicmMnukYMxNx
         XLJBwLoewobAb6/Heaa9Q/cYr4t0yKfQezkLx+qmxQ9NfoPUvxWCzj5TBCqblZTaNFsN
         ra3g==
X-Forwarded-Encrypted: i=1; AJvYcCUVwQUcyNpQD4MjzJuAWtCcP14WB/7eesXp1kB55BwcrDZz+EQ7ZOJ5bbHAjjKUDJQqmYjgp1baGrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDY9YSe+rqVd//oT/NY7Z0mlbvT8zmHatj3Saqlk5rldB2fr0i
	+eN/TcVZwbCGKJiIhBUa42/FBA1AnFbuo5aYBVSo9Ws4th6Xj+92CtEyiAVjISDEs01cEQ1mo0q
	I+VwsaBq5RXR8z/iUi3SK/RZ/mX+T+qqXDrlEnojZ2w==
X-Gm-Gg: ASbGncuAuhuMkNALIbWZ0VK5iVN5ffFR0128Vkml9k+iZRKdbBCayFCKhs3UxsJBa5z
	SHFEtdz7MKSPcV0DHd0l9kJAhEAFReswaSEjqFaqyVv+kwLVswjLe5hEeLPLlSUrCVej0jjiI/B
	cbmAeDWdpBtwReRf50HtwhvDVEA3QNY12n0liEEuJBMdiPvI9woK3AVbu7cGqzj9Fv+25XYZW9K
	aCzqd6TCysrmkZoC77gwfL4BIotWCJJe51j4EQ=
X-Google-Smtp-Source: AGHT+IFGzIpKbCawcWSHU3YFRZA7B9ZLpt7+F1f3L40bSlxrJT4HzCRKZZzF5+nwMXCnxr4NzPDqMPCV/h6C1bMUfIk=
X-Received: by 2002:a05:6512:258a:b0:55f:71d2:e5b6 with SMTP id
 2adb3069b0e04-56262667e84mr4297836e87.30.1757510436175; Wed, 10 Sep 2025
 06:20:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910121749.63853-1-hansg@kernel.org>
In-Reply-To: <20250910121749.63853-1-hansg@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 15:20:24 +0200
X-Gm-Features: Ac12FXyAoKzLZSKI4azLvsrvFG1sk00s-CXgxnYuyzscfcvUnyyEUwXZBEUuPXM
Message-ID: <CAMRc=MdLJSd7JOA5Z=FP7q-XVc2WYMhnj7zO+hk8_0JhB9MTUA@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: Add Intel USBIO GPIO driver
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 2:17=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> From: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>
> Add a a driver for the GPIO auxbus child device of the Intel USBIO USB
> IO-expander used by the MIPI cameras on various new (Meteor Lake and
> later) Intel laptops.
>
> Co-developed-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
> ---
> Changes in v3:
> - Drop (offset >=3D gc->ngpio) check and make usbio_gpio_get_bank_and_pin=
()
>   return void
> - Propagate usbio_gpio_set() ret val in usbio_gpio_direction_output()
> - Use devm_gpiochip_add_data() and drop auxiliary_driver remove() callbac=
k
>
> Changes in v2:
> - Add a config_mutex protect usbio_gpio_update_config() calls, which
>   read-modify-write banks[x].config, racing with each other
> - Adjust usbio_gpio_get() to have an int return value and propagate the
>   usbio_control_msg() return value
> - Use __le16, __le32 type + cpu_to_le16() and friends for on wire words
> - Some small style fixes from Sakari's review
> ---
>  MAINTAINERS               |   1 +
>  drivers/gpio/Kconfig      |  11 ++
>  drivers/gpio/Makefile     |   1 +
>  drivers/gpio/gpio-usbio.c | 250 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 263 insertions(+)
>  create mode 100644 drivers/gpio/gpio-usbio.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3410699ad0b2..53694bd91861 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12699,6 +12699,7 @@ M:      Israel Cepeda <israel.a.cepeda.lopez@inte=
l.com>
>  M:     Hans de Goede <hansg@kernel.org>
>  R:     Sakari Ailus <sakari.ailus@linux.intel.com>
>  S:     Maintained
> +F:     drivers/gpio/gpio-usbio.c
>  F:     drivers/usb/misc/usbio.c
>  F:     include/linux/usb/usbio.h
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index e43abb322fa6..5d3ca3dd2687 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1448,6 +1448,17 @@ config GPIO_LJCA
>           This driver can also be built as a module. If so, the module
>           will be called gpio-ljca.
>
> +config GPIO_USBIO
> +       tristate "Intel USBIO GPIO support"
> +       depends on USB_USBIO
> +       default USB_USBIO
> +       help
> +         Select this option to enable GPIO driver for the INTEL
> +         USBIO driver stack.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called gpio_usbio.
> +
>  config GPIO_LP3943
>         tristate "TI/National Semiconductor LP3943 GPIO expander"
>         depends on MFD_LP3943
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 379f55e9ed1e..8c55e2d5de42 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -90,6 +90,7 @@ obj-$(CONFIG_GPIO_JANZ_TTL)           +=3D gpio-janz-tt=
l.o
>  obj-$(CONFIG_GPIO_KEMPLD)              +=3D gpio-kempld.o
>  obj-$(CONFIG_GPIO_LATCH)               +=3D gpio-latch.o
>  obj-$(CONFIG_GPIO_LJCA)                +=3D gpio-ljca.o
> +obj-$(CONFIG_GPIO_USBIO)               +=3D gpio-usbio.o
>  obj-$(CONFIG_GPIO_LOGICVC)             +=3D gpio-logicvc.o
>  obj-$(CONFIG_GPIO_LOONGSON1)           +=3D gpio-loongson1.o
>  obj-$(CONFIG_GPIO_LOONGSON)            +=3D gpio-loongson.o
> diff --git a/drivers/gpio/gpio-usbio.c b/drivers/gpio/gpio-usbio.c
> new file mode 100644
> index 000000000000..31a376e91877
> --- /dev/null
> +++ b/drivers/gpio/gpio-usbio.c
> @@ -0,0 +1,250 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 Intel Corporation.
> + * Copyright (c) 2025 Red Hat, Inc.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/cleanup.h>
> +#include <linux/dev_printk.h>

No need to pull this if you include device.h.

> +       usbio_acpi_bind(gpio->adev, usbio_gpio_acpi_hids);
> +
> +       for (bank =3D 0; bank < USBIO_MAX_GPIOBANKS && bank_desc[bank].bm=
ap; bank++)
> +               gpio->banks[bank].bitmap =3D le32_to_cpu(bank_desc[bank].=
bmap);
> +
> +       gpio->gc.label =3D ACPI_COMPANION(dev) ?
> +                                       acpi_dev_name(ACPI_COMPANION(dev)=
) : dev_name(dev);
> +       gpio->gc.parent =3D dev;
> +       gpio->gc.owner =3D THIS_MODULE;
> +       gpio->gc.get_direction =3D usbio_gpio_get_direction;
> +       gpio->gc.direction_input =3D usbio_gpio_direction_input;
> +       gpio->gc.direction_output =3D usbio_gpio_direction_output;
> +       gpio->gc.get =3D usbio_gpio_get;
> +       gpio->gc.set =3D usbio_gpio_set;
> +       gpio->gc.set_config =3D usbio_gpio_set_config;
> +       gpio->gc.base =3D -1;
> +       gpio->gc.ngpio =3D bank * USBIO_GPIOSPERBANK;
> +       gpio->gc.can_sleep =3D true;
> +
> +       auxiliary_set_drvdata(adev, gpio);
> +

Now you no longer need this as there's no remove() anymore.

Bart

