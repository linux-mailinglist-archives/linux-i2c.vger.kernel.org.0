Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14B9464C636
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Dec 2022 10:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237700AbiLNJp5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Dec 2022 04:45:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbiLNJpz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Dec 2022 04:45:55 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C93D75F8C;
        Wed, 14 Dec 2022 01:45:53 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id qk9so43181378ejc.3;
        Wed, 14 Dec 2022 01:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pi0Xc7ocKeXx6Ak1hOFEArqIKdIzV8Qe/JBw4GdHYCY=;
        b=UtMVTLrU278e6+T84oIh5qkQyzu5j+g+Uttm2hE6aoOYpP3W3x2kLfZZl9/MBmKVRc
         JydbZMaQz8bMaIb8KpEee8IYSTZYA9MBoHR2AQXfqjfGR0SImOfgN3Bn6oWoO5I4oGus
         bmwC7J0FsPwgH6dWXOustffI96hLxcih3u4Alx/TIvX3mz9Y2z+sn9okxeZXkKIPtzUU
         65jRsSqtXo8zDLhxLZcGNuRf1TiiEootJOyKltQ3+plR2iKGeuZoWYNigeurepK06uFe
         LNoYDz6vWSoexMfcFIL2qqJWqkrr5EPCycOJ5YN0c28AXhJfks9vVWV4lFZo4IeApFgX
         MRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pi0Xc7ocKeXx6Ak1hOFEArqIKdIzV8Qe/JBw4GdHYCY=;
        b=alNn1wH66W/r1hI8GtzwTSVbMHsm2xc1mab/T08IlXAIY/OHsFMsKkcgIHrzKVvJTW
         Mls64i8pCmgzmA+z8NUywLegN4TUHH6FO8TsmdzopkjFjBPGLDox2fSXNnlzjuLiHAPI
         Nfz/GCcChS00Tuu2Ko7O2s88wO25NoYhD+vVCIjDmX3xMy/K6S6OtRXbLEm8vgovQLa6
         2sA8Zrb19NCnMr+Dd/lcTISajV8lb7FLcOXHUWn0OVof7vPABye2yBVYSnMKCgbtBKao
         2K3pwLzeYRp5OpW0rvm/0cPwsYuhjLCyFAAfCRzSJoiKyFP0kb6dxHtByORpFB/K+AKe
         gegw==
X-Gm-Message-State: ANoB5plTpx9VzACDsg0aINECgEmr26MpKClGC6unPRz6OK+LzcVUefaE
        UTf7twSnqsKwK0Zuwamw0alQxhF3bY+MH7d9RlY=
X-Google-Smtp-Source: AA0mqf7XAalqE1A3819qJjgVuoa5tzP4Ctc+4MitcYz5TFxYNGr4UfmG4crt3vrxHnHLcrzm9rlW1YEFkhsxoftVGFc=
X-Received: by 2002:a17:907:7782:b0:7b6:dd6d:b829 with SMTP id
 ky2-20020a170907778200b007b6dd6db829mr69355763ejc.602.1671011151747; Wed, 14
 Dec 2022 01:45:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1670897253.git.zhoubinbin@loongson.cn> <bf55d05a50dc1e9453d124033ff368e9500ed4ed.1670897253.git.zhoubinbin@loongson.cn>
 <Y5iS/ReDrO3B4Ksl@smile.fi.intel.com>
In-Reply-To: <Y5iS/ReDrO3B4Ksl@smile.fi.intel.com>
From:   Binbin Zhou <zhoubb.aaron@gmail.com>
Date:   Wed, 14 Dec 2022 17:45:38 +0800
Message-ID: <CAMpQs4JX-NWJt0-G1nOKcQdOKudmqzv=sKwpSAYYVapQ68JwMw@mail.gmail.com>
Subject: Re: [PATCH V6 3/4] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy:


On Tue, Dec 13, 2022 at 10:58 PM Andy Shevchenko <andy@kernel.org> wrote:
>
> On Tue, Dec 13, 2022 at 04:26:57PM +0800, Binbin Zhou wrote:
> > This I2C module is integrated into the Loongson-2K SoCs and Loongson
> > LS7A bridge chip.
>
> ...
>
> > +// SPDX-License-Identifier: GPL-2.0
>
> GPL-2.0-only
>
> > +/*
> > + * Loongson-2K/Loongson LS7A I2C master mode driver
> > + *
> > + * Copyright (C) 2013 Loongson Technology Corporation Limited.
> > + * Copyright (C) 2014-2017 Lemote, Inc.
> > + * Copyright (C) 2018-2022 Loongson Technology Corporation Limited.
> > + *
> > + * Originally written by liushaozong
>
> > + *
>
> No need to have this blank line.
>
> > + * Rewritten for mainline by Binbin Zhou <zhoubinbin@loongson.cn>
> > + */
>
> ...
>
> > +#include <linux/bits.h>
> > +#include <linux/completion.h>
> > +#include <linux/device.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/platform_device.h>
>
> + property.h at least for dev_fwnode().
>
> > +#include <linux/units.h>
>
> ...
>
> > +#define I2C_LS2X_PRER_LO     0x0 /* Freq Division Low Byte Register */
> > +#define I2C_LS2X_PRER_HI     0x1 /* Freq Division High Byte Register */
>
> _HI is not used, can we just drop the suffix?

I will drop it.

>
> ...
>
> > +struct ls2x_i2c_priv {
>
> > +     struct i2c_adapter      adapter;
>
> > +     struct device           *dev;
>
> In some cases you are using adapter.dev, in some this one.
> Also isn't it the dev is the same as adapter.dev.parent?
>
> Hence, why do you need this one?

I checked the use of 'dev' and it can be completely replaced by
'adapter.dev.parent'. I will drop it.

>
> > +     void __iomem            *base;
> > +     struct i2c_timings      i2c_t;
> > +     struct completion       cmd_complete;
> > +};
>
> ...
>
> > +     return ls2x_i2c_send_byte(adap, (LS2X_CR_START | LS2X_CR_WRITE));
>
> Too many parentheses.
>
> ...
>
> > +static int ls2x_i2c_xfer_one(struct i2c_adapter *adap,
> > +                          struct i2c_msg *msg, bool stop)
> > +{
> > +     int ret;
> > +     bool is_read = msg->flags & I2C_M_RD;
> > +
> > +     /* Contains steps to send start condition and address */
> > +     ret = ls2x_i2c_start(adap, msg);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (is_read)
> > +             ret = ls2x_i2c_rx(adap, msg->buf, msg->len);
> > +     else
> > +             ret = ls2x_i2c_tx(adap, msg->buf, msg->len);
> > +
> > +     /* could not acquire bus. bail out without STOP */
> > +     if (ret == -EAGAIN)
> > +             return ret;
>
> So, if ret is *not* 0 and *not* --EAGAIN, why don't we bail out here? It needs
> at least a comment.

After more tests, these judgment conditions may be incomplete.

The following judgment may make more sense:
1. The return value of ls2x_i2c_start() should also be judged.
2. When ret = -ENXIO (no ack), we should stop the bus; for other
errors, such as "arbitration lost", we should reinitialize the i2c
bus.

As follows:
@@ -162,23 +222,24 @@ static int ls2x_i2c_xfer_one(struct i2c_adapter *adap,
 {
        int ret;
        bool is_read = msg->flags & I2C_M_RD;
+       struct ls2x_i2c_priv *priv = i2c_get_adapdata(adap);

        /* Contains steps to send start condition and address */
        ret = ls2x_i2c_start(adap, msg);
-       if (ret)
-               return ret;
-
-       if (is_read)
-               ret = ls2x_i2c_rx(adap, msg->buf, msg->len);
-       else
-               ret = ls2x_i2c_tx(adap, msg->buf, msg->len);
-
-       /* could not acquire bus. bail out without STOP */
-       if (ret == -EAGAIN)
-               return ret;
+       if (!ret) {
+               if (is_read)
+                       ret = ls2x_i2c_rx(adap, msg->buf, msg->len);
+               else
+                       ret = ls2x_i2c_tx(adap, msg->buf, msg->len);
+
+               if (!ret && stop)
+                       ret = ls2x_i2c_stop(adap);
+       }

-       if (stop)
-               ret = ls2x_i2c_stop(adap);
+       if (ret == -ENXIO)
+               ls2x_i2c_stop(adap);
+       else if (ret < 0)
+               ls2x_i2c_reginit(priv);

        return ret;
 }


>
> > +     if (stop)
> > +             ret = ls2x_i2c_stop(adap);
> > +
> > +     return ret;
> > +}
>
> ...
>
> > +static int ls2x_i2c_master_xfer(struct i2c_adapter *adap,
> > +                             struct i2c_msg *msgs, int num)
> > +{
> > +     int ret;
> > +     struct i2c_msg *msg, *emsg = msgs + num;
> > +
> > +     for (msg = msgs; msg < emsg; msg++) {
> > +             /* Emit STOP if it is the last message or I2C_M_STOP is set */
>
> > +             bool stop = (msg + 1 == emsg) || (msg->flags & I2C_M_STOP);
>
> I'm wondering if we can always set the _STOP bit in the flags of the last
> message before entering this loop. In such case you can reduce to one part
> and supply as a parameter directly.

Here, I think the I2C_M_STOP flag can be ignored as long as the last
msg is checked.
As follows:
@@ -190,10 +190,7 @@ static int ls2x_i2c_master_xfer(struct i2c_adapter *adap,
        struct i2c_msg *msg, *emsg = msgs + num;

        for (msg = msgs; msg < emsg; msg++) {
-               /* Emit STOP if it is the last message or I2C_M_STOP is set */
-               bool stop = (msg + 1 == emsg) || (msg->flags & I2C_M_STOP);
-
-               ret = ls2x_i2c_xfer_one(adap, msg, stop);
+               ret = ls2x_i2c_xfer_one(adap, msg, msg == (emsg - 1));
                if (ret)
                        return ret;
        }


>
> > +
> > +             ret = ls2x_i2c_xfer_one(adap, msg, stop);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return num;
> > +}
>
> ...
>
> > +     /* Calculate and set LS2X I2C frequency */
> > +     writel(LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1,
> > +            priv->base + I2C_LS2X_PRER_LO);
>
> writel()?! Shouldn't be writew()?

Sorry, it's my fault, it should be writew().

>
> ...
>
> > +     r = devm_request_irq(dev, irq, ls2x_i2c_isr,
> > +                          IRQF_SHARED, "ls2x-i2c", priv);
>
> There is a room on the previous line for at least one more argument.
>
> > +     if (r < 0)
> > +             return dev_err_probe(dev, r, "Unable to request irq %d\n", irq);
>
> ...
>
> > +subsys_initcall(ls2x_i2c_init_driver);
>
> Non-standard init calls should be commented.

On the LS7A bridge chip, the display subsystem depends on it. The i2c
channel to read the EEID is fixed and the i2c driver should be
initialized earlier than it, otherwise it will cause conflicts.
I will comment this.

Thanks.
Binbin

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>
