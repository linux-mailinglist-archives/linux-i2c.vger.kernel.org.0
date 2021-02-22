Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0003219FA
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 15:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbhBVOPr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 09:15:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbhBVONe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Feb 2021 09:13:34 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8554AC06174A;
        Mon, 22 Feb 2021 06:12:52 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d13so7826758plg.0;
        Mon, 22 Feb 2021 06:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wTvuzSsDx5wHEQjCsdWnJWyRmJKaFgdpWavq1bhv6/I=;
        b=pXXMhdxX7vhFRGsWj18RR56E2kMiwbDgIUCVhhZGSSrfM2Nyhx5kyYaGCP3ktf5tbr
         inWpWxjUzuUCIt3FL44TA4I5dg0DEPdng/0/d9aWMrhg46iDfOai/TSq8kFOkMyekDvq
         QL3Difmc2FSps8YCgIMMAaBZb4vWi2l32xK009SViFDQMLXUHQCAip7R6EYJsYJuxOTB
         RKwbmMCG66xz1ALbGWPJXJX4dL/OYqGMz9NmoDvoyb/upp2o4Esbt3cZmdtpbpSh6Z3q
         jHgwmOFm1x/b1MTYvsZEBuXR3tNBzZhEde3xqr8ShhTHwd+6B981xhylMKk36WksLZOS
         wrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wTvuzSsDx5wHEQjCsdWnJWyRmJKaFgdpWavq1bhv6/I=;
        b=J7wL8bP9cBwxQF1cHbhfv4fzEvl5KT8ad6ejcr0F/sYvOAfHFtae9B+V35DH8xa3HO
         7MtkSju+nxqAorq2Z1h/e8QxYVOuHaghUn+wCpPAVfyiPBscD1D3Dzta1KtS48dIdfS1
         mUIZncPSbtXrbY9PwCBXGTT7YeinWXr/TnKSipPg5ZCDQo/zUG9yywdIDKzAr6r7D7LI
         gc7P9ODm7MkRoUpZYRjLxtT4n/qUVWoP00cXVkUNej1OKn/AQu8L3PfuZ3/Za/ltZVEN
         EBu6AH+sD+tlo1851CmSjLpALUJ9BRBhhRLBpFZYetvGZ5bDdPYqrBz0yE/N2ovW2goa
         D4hw==
X-Gm-Message-State: AOAM533V/kb7N4wdqOsHgu+8B5TkuMejBVQpvdLkoG3n8AlZIS2za29h
        Fhz5NJILO5uFYMKQ/o1+EoCFt3c69KgScO0VfSo=
X-Google-Smtp-Source: ABdhPJykkv6u9UtjDofhN3sWJPZJolrvMOjq9nG2MawYjC589/kCKJxpAUPfLJYijfh1vFjiJ26qD2JIUa7R8Y5yPwE=
X-Received: by 2002:a17:90b:3d8:: with SMTP id go24mr24457261pjb.181.1614003171942;
 Mon, 22 Feb 2021 06:12:51 -0800 (PST)
MIME-Version: 1.0
References: <20210222130735.1313443-1-djrscally@gmail.com> <20210222130735.1313443-7-djrscally@gmail.com>
In-Reply-To: <20210222130735.1313443-7-djrscally@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 22 Feb 2021 16:12:35 +0200
Message-ID: <CAHp75Veb=0OOE=iyt5ua46HkMuG6_Xu1bWAxzZX5d3378CrfNg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] mfd: tps68470: Remove tps68470 MFD driver
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        andy.shevchenko@linux.intel.com,
        kieran.bingham+renesas@ideasonboard.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>, me@fabwu.ch,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        devel@acpica.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 22, 2021 at 3:12 PM Daniel Scally <djrscally@gmail.com> wrote:
>
> This driver only covered one scenario in which ACPI devices with _HID
> INT3472 are found, and its functionality has been taken over by the
> intel-skl-int3472 module, so remove it.

As long as patch 5 accepted
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v3:
>         - Replaced Kconfig dependencies with INTEL_SKL_INT3472 for the tps68470
>           OpRegion and GPIO drivers.
>
>  drivers/acpi/pmic/Kconfig |  2 +-
>  drivers/gpio/Kconfig      |  2 +-
>  drivers/mfd/Kconfig       | 18 --------
>  drivers/mfd/Makefile      |  1 -
>  drivers/mfd/tps68470.c    | 97 ---------------------------------------
>  5 files changed, 2 insertions(+), 118 deletions(-)
>  delete mode 100644 drivers/mfd/tps68470.c
>
> diff --git a/drivers/acpi/pmic/Kconfig b/drivers/acpi/pmic/Kconfig
> index 56bbcb2ce61b..f84b8f6038dc 100644
> --- a/drivers/acpi/pmic/Kconfig
> +++ b/drivers/acpi/pmic/Kconfig
> @@ -52,7 +52,7 @@ endif # PMIC_OPREGION
>
>  config TPS68470_PMIC_OPREGION
>         bool "ACPI operation region support for TPS68470 PMIC"
> -       depends on MFD_TPS68470
> +       depends on INTEL_SKL_INT3472
>         help
>           This config adds ACPI operation region support for TI TPS68470 PMIC.
>           TPS68470 device is an advanced power management unit that powers
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index c70f46e80a3b..998898c72af8 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1343,7 +1343,7 @@ config GPIO_TPS65912
>
>  config GPIO_TPS68470
>         bool "TPS68470 GPIO"
> -       depends on MFD_TPS68470
> +       depends on INTEL_SKL_INT3472
>         help
>           Select this option to enable GPIO driver for the TPS68470
>           chip family.
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index bdfce7b15621..9a1f648efde0 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1520,24 +1520,6 @@ config MFD_TPS65217
>           This driver can also be built as a module.  If so, the module
>           will be called tps65217.
>
> -config MFD_TPS68470
> -       bool "TI TPS68470 Power Management / LED chips"
> -       depends on ACPI && PCI && I2C=y
> -       depends on I2C_DESIGNWARE_PLATFORM=y
> -       select MFD_CORE
> -       select REGMAP_I2C
> -       help
> -         If you say yes here you get support for the TPS68470 series of
> -         Power Management / LED chips.
> -
> -         These include voltage regulators, LEDs and other features
> -         that are often used in portable devices.
> -
> -         This option is a bool as it provides an ACPI operation
> -         region, which must be available before any of the devices
> -         using this are probed. This option also configures the
> -         designware-i2c driver to be built-in, for the same reason.
> -
>  config MFD_TI_LP873X
>         tristate "TI LP873X Power Management IC"
>         depends on I2C
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 14fdb188af02..5994e812f479 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -105,7 +105,6 @@ obj-$(CONFIG_MFD_TPS65910)  += tps65910.o
>  obj-$(CONFIG_MFD_TPS65912)     += tps65912-core.o
>  obj-$(CONFIG_MFD_TPS65912_I2C) += tps65912-i2c.o
>  obj-$(CONFIG_MFD_TPS65912_SPI)  += tps65912-spi.o
> -obj-$(CONFIG_MFD_TPS68470)     += tps68470.o
>  obj-$(CONFIG_MFD_TPS80031)     += tps80031.o
>  obj-$(CONFIG_MENELAUS)         += menelaus.o
>
> diff --git a/drivers/mfd/tps68470.c b/drivers/mfd/tps68470.c
> deleted file mode 100644
> index 4a4df4ffd18c..000000000000
> --- a/drivers/mfd/tps68470.c
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * TPS68470 chip Parent driver
> - *
> - * Copyright (C) 2017 Intel Corporation
> - *
> - * Authors:
> - *     Rajmohan Mani <rajmohan.mani@intel.com>
> - *     Tianshu Qiu <tian.shu.qiu@intel.com>
> - *     Jian Xu Zheng <jian.xu.zheng@intel.com>
> - *     Yuning Pu <yuning.pu@intel.com>
> - */
> -
> -#include <linux/acpi.h>
> -#include <linux/delay.h>
> -#include <linux/i2c.h>
> -#include <linux/init.h>
> -#include <linux/mfd/core.h>
> -#include <linux/mfd/tps68470.h>
> -#include <linux/regmap.h>
> -
> -static const struct mfd_cell tps68470s[] = {
> -       { .name = "tps68470-gpio" },
> -       { .name = "tps68470_pmic_opregion" },
> -};
> -
> -static const struct regmap_config tps68470_regmap_config = {
> -       .reg_bits = 8,
> -       .val_bits = 8,
> -       .max_register = TPS68470_REG_MAX,
> -};
> -
> -static int tps68470_chip_init(struct device *dev, struct regmap *regmap)
> -{
> -       unsigned int version;
> -       int ret;
> -
> -       /* Force software reset */
> -       ret = regmap_write(regmap, TPS68470_REG_RESET, TPS68470_REG_RESET_MASK);
> -       if (ret)
> -               return ret;
> -
> -       ret = regmap_read(regmap, TPS68470_REG_REVID, &version);
> -       if (ret) {
> -               dev_err(dev, "Failed to read revision register: %d\n", ret);
> -               return ret;
> -       }
> -
> -       dev_info(dev, "TPS68470 REVID: 0x%x\n", version);
> -
> -       return 0;
> -}
> -
> -static int tps68470_probe(struct i2c_client *client)
> -{
> -       struct device *dev = &client->dev;
> -       struct regmap *regmap;
> -       int ret;
> -
> -       regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
> -       if (IS_ERR(regmap)) {
> -               dev_err(dev, "devm_regmap_init_i2c Error %ld\n",
> -                       PTR_ERR(regmap));
> -               return PTR_ERR(regmap);
> -       }
> -
> -       i2c_set_clientdata(client, regmap);
> -
> -       ret = tps68470_chip_init(dev, regmap);
> -       if (ret < 0) {
> -               dev_err(dev, "TPS68470 Init Error %d\n", ret);
> -               return ret;
> -       }
> -
> -       ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, tps68470s,
> -                             ARRAY_SIZE(tps68470s), NULL, 0, NULL);
> -       if (ret < 0) {
> -               dev_err(dev, "devm_mfd_add_devices failed: %d\n", ret);
> -               return ret;
> -       }
> -
> -       return 0;
> -}
> -
> -static const struct acpi_device_id tps68470_acpi_ids[] = {
> -       {"INT3472"},
> -       {},
> -};
> -
> -static struct i2c_driver tps68470_driver = {
> -       .driver = {
> -                  .name = "tps68470",
> -                  .acpi_match_table = tps68470_acpi_ids,
> -       },
> -       .probe_new = tps68470_probe,
> -};
> -builtin_i2c_driver(tps68470_driver);
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
