Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6C28B26C
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 10:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727824AbfHMI1u convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 13 Aug 2019 04:27:50 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39132 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727777AbfHMI1t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Aug 2019 04:27:49 -0400
Received: by mail-ot1-f67.google.com with SMTP id b1so1287727otp.6;
        Tue, 13 Aug 2019 01:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m1OIZFj26BwIE1RfD4PybZuF/vdbFuF/CR3tbWsnxSg=;
        b=UQ5nHlcwgEj+f5pyE0Z7TKFQcyFPmP8JHKoKAYHw3e1w57IyBIbInBXmtJc6hoSPDE
         qYIX4NJmYzJEyZUKckhjPi4rGP4bGy82FTN4VDyyWmklw9Q6SM24u3CEq53QGF0n2j08
         1e6vLiY/JphqTY9a1Pz+/tcDizRVI22ednlP5+bhsgR7sUyiFQ+v53vSy2BI4gSA7TsW
         nbFFGVwFkbWnJ0hG2V/XlK7hGroixyUtIztcXPanc8066bMgYIz2anlM38ZwA7ucN0iQ
         jmOyoF8AARIWZ1f0SO2r01k/13lDR7epYFuqej6f/KTDnIOqjWERoh5ih5GrUK5gdhqi
         lB8g==
X-Gm-Message-State: APjAAAXywGLfBzTvQ8nWQuPpsI9DFfIiV6d7+4z4i/+GvEJS1KI+u2el
        PWrwF8fFSIbFcUznm0dwLGEJcokVeOeOnn9x/lE=
X-Google-Smtp-Source: APXvYqxuxIc1xlIvDlv6mcGeQ07gUAzO626QYNHM9B59IiTj8edlUxF5tj4m4kMQFqjetCCED6bv0k4e/NUom8A/swU=
X-Received: by 2002:aca:bd43:: with SMTP id n64mr656146oif.148.1565684868735;
 Tue, 13 Aug 2019 01:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190812235237.21797-1-max@enpas.org> <20190812235237.21797-3-max@enpas.org>
 <20190813080237.GA29986@roeck-us.net>
In-Reply-To: <20190813080237.GA29986@roeck-us.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Aug 2019 10:27:37 +0200
Message-ID: <CAMuHMdXHbjfrdusGB3qvcu1a=W65Ef1-NrvcCv1h9E9uicknLg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] hwmon/ltc2990: Add platform_data support
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Max Staudt <max@enpas.org>, Linux I2C <linux-i2c@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Günter,

On Tue, Aug 13, 2019 at 10:02 AM Guenter Roeck <linux@roeck-us.net> wrote:
> On Tue, Aug 13, 2019 at 01:52:36AM +0200, Max Staudt wrote:
> > This allows code using i2c_new_device() to specify a measurement mode.
> >
> > Signed-off-by: Max Staudt <max@enpas.org>
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> >  drivers/hwmon/ltc2990.c               |  9 +++++++++
> >  include/linux/platform_data/ltc2990.h | 11 +++++++++++
> >  2 files changed, 20 insertions(+)
> >  create mode 100644 include/linux/platform_data/ltc2990.h
> >
> > diff --git a/drivers/hwmon/ltc2990.c b/drivers/hwmon/ltc2990.c
> > index f9431ad43..f19b9c50c 100644
> > --- a/drivers/hwmon/ltc2990.c
> > +++ b/drivers/hwmon/ltc2990.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/platform_data/ltc2990.h>
> >
> >  #define LTC2990_STATUS       0x00
> >  #define LTC2990_CONTROL      0x01
> > @@ -206,6 +207,7 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c,
> >       int ret;
> >       struct device *hwmon_dev;
> >       struct ltc2990_data *data;
> > +     struct ltc2990_platform_data *pdata = dev_get_platdata(&i2c->dev);
> >       struct device_node *of_node = i2c->dev.of_node;
> >
> >       if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
> > @@ -227,6 +229,13 @@ static int ltc2990_i2c_probe(struct i2c_client *i2c,
> >               if (data->mode[0] & ~LTC2990_MODE0_MASK ||
> >                   data->mode[1] & ~LTC2990_MODE1_MASK)
> >                       return -EINVAL;
> > +     } else if (pdata) {
> > +             data->mode[0] = pdata->meas_mode[0];
> > +             data->mode[1] = pdata->meas_mode[1];
> > +
> > +             if (data->mode[0] & ~LTC2990_MODE0_MASK ||
> > +                 data->mode[1] & ~LTC2990_MODE1_MASK)
> > +                     return -EINVAL;
>
> I would prefer if the driver was modified to accept device
> properties, and if those were set using the appropriate
> fwnode function. Any reason for not doing that ?

That was my first thought as well, but isn't that limited to DT and ACPI
properties (for now)?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
