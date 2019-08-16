Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 664289007B
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2019 13:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfHPLHb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Aug 2019 07:07:31 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37412 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbfHPLHb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Aug 2019 07:07:31 -0400
Received: by mail-ot1-f68.google.com with SMTP id f17so9290183otq.4;
        Fri, 16 Aug 2019 04:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a74Tm8RPNkAbVFGrdFYZ+oZtMj0ceyS7G5P9zG6W0zc=;
        b=lfcNDZjtYZ1VvsK95+6DjAxYVWIRkDrLqAHqcHNRXAMKtDlIYvoxtH67jHanklHHbL
         xEI951n44GMAhYkff1FIVGp/O1x9flPhKn9USnVXLOdTlR2v6C0ZQo96dVGBZjcKNlxA
         mKTcPh2lynYk3kDJpoyfTQ/TZ0deV9ME28fiGsFm9q4HnSfMg51/0Tx27n86Ni4C/YC2
         CT8MKOehsW6hmoXovRk0FKx8OZa43SS/2eoFz4s2kT0iGYVfntCtnSGixX6Y2KRwJitj
         S6kKUUn9d1c8kpu3vt8FCmnTICcqeDtp+8o1m9M8tLx5ymxnzl6Qsr45oaKulUrejHkW
         +M4Q==
X-Gm-Message-State: APjAAAWGwZS5yPAth0DDe3O0JUP/UCM3ozOVAJIvsl19yseQ90lAWFh5
        vyimzsfywmgiP9JZvInE/joqQlK9FxinqegXqxY=
X-Google-Smtp-Source: APXvYqweSvKzzU2yU98tPpCNMPpCbxeRqXPuYjS2ztXAExuaKBopqbbOl3oDTc9WDZ6NvJh3DjahpN/Hk/ycN8wzg00=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr7460438otn.297.1565953650124;
 Fri, 16 Aug 2019 04:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <5b9b4383-c1e9-91a6-8ab6-8f831b362dca@enpas.org> <20190816090731.12809-1-max@enpas.org>
In-Reply-To: <20190816090731.12809-1-max@enpas.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 16 Aug 2019 13:07:18 +0200
Message-ID: <CAMuHMdUE_3UEzOv3pmryMwuMRF7RC9-xTG8sXUbpR=r5fKUjrg@mail.gmail.com>
Subject: Re: [PATCH] hwmon/ltc2990: Generalise DT to fwnode support
To:     Max Staudt <max@enpas.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Max,

On Fri, Aug 16, 2019 at 11:09 AM Max Staudt <max@enpas.org> wrote:
> ltc2990 will now use device_property_read_u32_array() instead of
> of_property_read_u32_array() - allowing the use of software nodes
> via fwnode_create_software_node().
>
> This allows code using i2c_new_device() to specify a default
> measurement mode for the LTC2990 via fwnode_create_software_node().
>
> Signed-off-by: Max Staudt <max@enpas.org>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

One minor nit: as the driver no longer uses any of_*() symbols, you can replace
#include <linux/of.h> by #include <linux/property.h>.

> --- a/drivers/hwmon/ltc2990.c
> +++ b/drivers/hwmon/ltc2990.c
> @@ -206,7 +206,6 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c,
>         int ret;
>         struct device *hwmon_dev;
>         struct ltc2990_data *data;
> -       struct device_node *of_node = i2c->dev.of_node;
>
>         if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
>                                      I2C_FUNC_SMBUS_WORD_DATA))
> @@ -218,9 +217,10 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c,
>
>         data->i2c = i2c;
>
> -       if (of_node) {
> -               ret = of_property_read_u32_array(of_node, "lltc,meas-mode",
> -                                                data->mode, 2);
> +       if (dev_fwnode(&i2c->dev)) {
> +               ret = device_property_read_u32_array(&i2c->dev,
> +                                                    "lltc,meas-mode",
> +                                                    data->mode, 2);
>                 if (ret < 0)
>                         return ret;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
