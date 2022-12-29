Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9238C6589F8
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Dec 2022 08:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233042AbiL2HcJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Dec 2022 02:32:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233044AbiL2HcF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Dec 2022 02:32:05 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E2C212A90;
        Wed, 28 Dec 2022 23:32:03 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id tz12so43255097ejc.9;
        Wed, 28 Dec 2022 23:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tFzVpEFAc7K+Vt+oAjXGPFPLJF61ACW2fyTFNlsKf0w=;
        b=GwKY9Vy9sER0WOm+SjW90uwpKfh5LPZ+ULB2fosmyTL9xnj6xJDYo3Zdhik4NDjwZ5
         +nKwD0el2fc/0dcQPjQIlzhLK9Ey9NUubJ9RqoKpsfzukNtS3q0uV3diCUCBydHqqcA6
         J4Uq2kpaz52U2YzMemOrFSWxZiiKNJoMZaaAH2lxtieozQ1FF8VqnPNsIEEwBnxHjcZy
         zNTybIwDWHA5UpY/yZZOGwnN0vD2i0olP/kNShfS67q1O3n8eYRuRyZzroN84lXEqS1U
         iDHCgqgNoGizsLXwJ+Bv8hkq6qvFvu9N+pihET0xOpZYXTi3SgPqn2B1251dUO0xR1nh
         1W+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFzVpEFAc7K+Vt+oAjXGPFPLJF61ACW2fyTFNlsKf0w=;
        b=jKF3GcazAoyBannsU2Wq6ZUOir/7EyhdXZ1ultm8Gv7kKDLnJaxO+OsCg/PZ31E36J
         9zMt4xFfsADRddLj67Uxl7N3Wa+H8DOF8xp6Acd60rXQ7dB6CGHZ7eB5rmC7JNr7Hsp/
         U8puKQk23+Ly6H07h7TpHdJFn1wt3HB2tJR6xXiKzeylguvU0c04Ywsr7onEfOQ/9MqE
         GLAXszEEfqZ8V74k/CTexYHhGVbpzmQo5DpiIT7/sBl4aQ2DvLpnuoqtLD0ptsB/yaqO
         eLkmT3gwkXvTzQklH+rUKZBMnXjeCHpnlNlqI0I/De9nPvGsMBRMKF2Og2VhQ4tjvORB
         IzJA==
X-Gm-Message-State: AFqh2koWJtC1fjzmcKbrJgo5D1p1BjY+7Iqm+fCSL2XU+vUcdWtm545n
        JqXVyuOP+oSLps8RvPqOQLHWBvyhlKV3Att0jWQ=
X-Google-Smtp-Source: AMrXdXswgwmT56brOvP2/gqW8vL3NYl6Aj4vIsHtgapQzQrY8gMW/G9Kxo/Q5qIUOjqUMjvRfcvP1FpZEy0yBdsYdT0=
X-Received: by 2002:a17:907:a510:b0:7c0:e060:e819 with SMTP id
 vr16-20020a170907a51000b007c0e060e819mr3590920ejc.763.1672299121891; Wed, 28
 Dec 2022 23:32:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1671688961.git.zhoubinbin@loongson.cn> <9d3e4997519fd9ecebae6fd241148cc22d3fe04f.1671688961.git.zhoubinbin@loongson.cn>
 <Y6tqPenv3NBEl9qD@smile.fi.intel.com>
In-Reply-To: <Y6tqPenv3NBEl9qD@smile.fi.intel.com>
From:   Binbin Zhou <zhoubb.aaron@gmail.com>
Date:   Thu, 29 Dec 2022 15:31:47 +0800
Message-ID: <CAMpQs4L-2stVQA43hd2Q-uR8fgekLZJmWzmBZvEDg1+AvT3uSQ@mail.gmail.com>
Subject: Re: [PATCH V8 3/4] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
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

Sorry for my late reply.

On Wed, Dec 28, 2022 at 5:57 AM Andy Shevchenko <andy@kernel.org> wrote:
>
> On Fri, Dec 23, 2022 at 05:00:51PM +0800, Binbin Zhou wrote:
> > This I2C module is integrated into the Loongson-2K SoCs and Loongson
> > LS7A bridge chip.
>
> ...
>
> > +static int ls2x_i2c_xfer_one(struct ls2x_i2c_priv *priv,
> > +                          struct i2c_msg *msg, bool stop)
> > +{
> > +     int ret;
> > +     bool is_read = msg->flags & I2C_M_RD;
> > +
> > +     /* Contains steps to send start condition and address */
> > +     ret = ls2x_i2c_start(priv, msg);
> > +     if (!ret) {
> > +             if (is_read)
> > +                     ret = ls2x_i2c_rx(priv, msg->buf, msg->len);
> > +             else
> > +                     ret = ls2x_i2c_tx(priv, msg->buf, msg->len);
> > +
> > +             if (!ret && stop)
> > +                     ret = ls2x_i2c_stop(priv);
> > +     }
> > +
> > +     if (ret == -ENXIO)
> > +             ls2x_i2c_stop(priv);
> > +     else if (ret < 0)
> > +             ls2x_i2c_init(priv);
> > +
> > +     return ret;
> > +}
>
> Still this code is odd from reader's perspective. It's in particular not clear
> if the stop can be called twice in a row. I recommend to split it to two

Sorry,
Actually, I don't quite understand why you keep thinking that the stop
can be called twice in a row.

As I said in my last email, the logic here should be:
In the first case, stop is called when the last msg is transmitted successfully;
In the second case, stop is called when there is a NOACK during the
transmission;
In the third case, init is called when other errors occur during the
transmission, such as TIMEOUT.

The key pointer is the stop function will only return a TIMEOUT error
or 0 for success, so if the stop function above is failed, the stop
function below will never be called twice.

Anyway, I also admit that this part of the code may not be concise and
clear enough, and I have tried the following changes:

1. put the start function into the rx/tx function respectively. As followers:

@@ -177,10 +177,16 @@ static int ls2x_i2c_start(struct ls2x_i2c_priv
*priv, struct i2c_msg *msgs)
        return ls2x_i2c_send_byte(priv, LS2X_CR_START | LS2X_CR_WRITE);
 }

-static int ls2x_i2c_rx(struct ls2x_i2c_priv *priv, u8 *buf, u16 len)
+static int ls2x_i2c_rx(struct ls2x_i2c_priv *priv, struct i2c_msg *msg)
 {
        int ret;
-       u8 rxdata;
+       u8 rxdata, *buf = msg->buf;
+       u16 len = msg->len;
+
+       /* Contains steps to send start condition and address */
+       ret = ls2x_i2c_start(priv, msg);
+       if (ret)
+               return ret;

        while (len--) {
                ret = ls2x_i2c_xfer_byte(priv,
@@ -195,9 +201,16 @@ static int ls2x_i2c_rx(struct ls2x_i2c_priv
*priv, u8 *buf, u16 len)
        return 0;
 }

-static int ls2x_i2c_tx(struct ls2x_i2c_priv *priv, u8 *buf, u16 len)
+static int ls2x_i2c_tx(struct ls2x_i2c_priv *priv, struct i2c_msg *msg)
 {
        int ret;
+       u8 *buf = msg->buf;
+       u16 len = msg->len;
+
+       /* Contains steps to send start condition and address */
+       ret = ls2x_i2c_start(priv, msg);
+       if (ret)
+               return ret;

        while (len--) {
                writeb(*buf++, priv->base + I2C_LS2X_TXR);

2. define the variable 'reinit' in the xfer_one function to mark the
cases where reinit is needed. As follows:

static int ls2x_i2c_xfer_one(struct ls2x_i2c_priv *priv,
                             struct i2c_msg *msg, bool stop)
{
        int ret, ret2;
        bool reinit = false;
        bool is_read = msg->flags & I2C_M_RD;

        if (is_read)
                ret = ls2x_i2c_rx(priv, msg);
        else
                ret = ls2x_i2c_tx(priv, msg);

        if (ret == -EAGAIN) /* could not acquire bus. bail out without STOP */
                return ret;

        if (ret == -ETIMEDOUT) {
                /* Fatal error. Needs reinit. */
                stop = false;
                reinit = true;
        }

        if (stop) {
                ret2 = ls2x_i2c_stop(priv);

                if (ret2) {
                        /* Failed to issue STOP. Needs reinit. */
                        reinit = true;
                        ret = ret ?: ret2;
                }
        }

        if (reinit)
                ls2x_i2c_init(priv);

        return ret;
}


Do you think this is better?

Thanks.

Binbin



> functions and then do something like
>
> _read_one()
> {
>         ret = start();
>         if (ret)
>                 goto _stop; // Do we really need this?
>
>                 ret = rx();
>                 if (ret)
>                         goto _stop; // Do we need this?
>
>                 /* By setting this call the stop */
>                 if (stop)
>                         ret = -ENXIO;
>
>         out_send_stop:
>                 if (ret == ...)
>                         return _stop();
>                 // I don't like above, so this error checking/setting parts
>                 // also can be rethought and refactored accordingly
>
>                 return ret;
> }
>
>
>         if (is_read)
>                 ret = _read_one();
>         else
>                 ret = _write_one();
>
>         if (ret)
>                 _init();
>
>         return ret;
>
>

> --
> With Best Regards,
> Andy Shevchenko
>
>
>
