Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7927F6807E3
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jan 2023 09:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235769AbjA3Iw7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Jan 2023 03:52:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235929AbjA3Iw5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Jan 2023 03:52:57 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3654461B7;
        Mon, 30 Jan 2023 00:52:54 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id dr8so8003008ejc.12;
        Mon, 30 Jan 2023 00:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bqd+AYKseBUG/ZqMySUNAymE7dOTpHE8cVutn9FOQcE=;
        b=cu9Mqtjbt1fqJJ2R65+6eNjiwu8UAjmEKv12h3IQsTALgr9sFHkbuTY61d+ydEWsrd
         hQowFxgPdsJZHwZ43D2IkadgurzXJ8qUWKnQkD5TSctBoFsistF1KaiGbVJNvxC/CM3+
         YZwJiLeQNCrDXkGoTzTBk2t0e6NZus24d+7K2JW0V2L/u/Jw5xLYdRERiiVql2h6otxD
         MKGec9y2LW/wVIjjonBD8f9VhIxjyxUnbrru++LWdF/MtRllwaqWSbVU9GJk2+FWv2m0
         0bvcum9osmW7omzPCSQY495IEUg64er5dbOG+YfaZYm1eW+4CiTKQIHtuLZfw3qRqw4d
         68bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bqd+AYKseBUG/ZqMySUNAymE7dOTpHE8cVutn9FOQcE=;
        b=kJ1KNQhabCF/Pl4jfWQsIe7mjTvj0IHjBojYqBlABty/2wRHveJztNLT+ZuE/eV049
         cZF8rs1n31RP9wB945QiUZH2TvdOQ12M7QryMhGQq0sF3+XPy+gQ9FCKj2lm+ImSUTTC
         Evfmz0Ah0Cv5TmHYeUyhsY1cDBxJ8eRDtnqOuMnTffzpIkWkG+WNI3ZOC9dSqvQq5wyA
         kmT+YW+A6oRP6sDYxRdam1HDfJAzsSuDBjMzJy5WKrb3MFv1rionb/+qLFblZkUv4SoJ
         EoB96UK78MbJHX9C2yThaCvhubarZhOcucCBegsRCZkFeXQYgUB3HoJyxacGwG6sEV5f
         7iVw==
X-Gm-Message-State: AFqh2krK9TPsiXVfQXEDUMwMQjyd17emAKprkjpsz04oczwjX/v2YD5X
        0QIFL5rJwUvc+i7MfO0xTfhQS8JiJ1DNTw2EfxUQ/X3DeLFx5Whr
X-Google-Smtp-Source: AMrXdXvSbcF8crULhPh3gJHBuaC8TbzosJW7VineeWbq4gYqPcrYYG/JXGIYYsksdp9AIrq555FlmE0IKMEcb5dh+2A=
X-Received: by 2002:a17:906:6a8e:b0:86e:3764:4f80 with SMTP id
 p14-20020a1709066a8e00b0086e37644f80mr6254866ejr.239.1675068772856; Mon, 30
 Jan 2023 00:52:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1673340642.git.zhoubinbin@loongson.cn> <77046b03eb0e75b25934406afce597997624a2b8.1673340642.git.zhoubinbin@loongson.cn>
 <Y8paBAVsBJIqLZnH@ninjato>
In-Reply-To: <Y8paBAVsBJIqLZnH@ninjato>
From:   Binbin Zhou <zhoubb.aaron@gmail.com>
Date:   Mon, 30 Jan 2023 16:52:40 +0800
Message-ID: <CAMpQs4LVc2nMR_ZxcqX_vOuyyyhip=fgEfYPqctJGy7YS89=Zg@mail.gmail.com>
Subject: Re: [PATCH V10 3/4] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller
To:     Wolfram Sang <wsa@kernel.org>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Peibao Liu <liupeibao@loongson.cn>
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

Hi Wolfram:

Sorry for the late reply.

On Fri, Jan 20, 2023 at 5:08 PM Wolfram Sang <wsa@kernel.org> wrote:
>
> Hi,
>
> the driver looks mostly good. Thank you for your hard work, and also
> thanks to Andy for his great review efforts again!
>
> > +static unsigned int ls2x_i2c_func(struct i2c_adapter *adap)
> > +{
> > +     return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> > +}
>
> Have you tried messages with zero-length or the SMBUS_QUICK transfer
> which is basically the same? i2cdectect uses it by default, so if that
> works, then we are good.

Yes, I have tried this, and i2cdetect shows the following:

[root@xxx ~]# ./i2c-tools-4.3/tools/i2cdetect -q -y 2
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- 18 -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: 30 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: 50 51 52 53 54 55 56 UU UU UU UU UU UU UU UU --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --
[root@xxx ~]# ./i2c-tools-4.3/tools/i2cdetect -q -y 3
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --

Do you mean this?

>
> > +/* The DC subsystem depends on it, we should initialize it earlier. */
> > +static int __init ls2x_i2c_init_driver(void)
> > +{
> > +     return platform_driver_register(&ls2x_i2c_driver);
> > +}
> > +subsys_initcall(ls2x_i2c_init_driver);
>
> Can't this be handled with deferred probing?

Emm, I've been trying to register using the generic method before and
deferred probing should be a better option.
Also, I'll use module_platform_driver(ls2x_i2c_driver); instead in the
next version.

Thanks.
Binbin

>
> Happy hacking,
>
>    Wolfram
>
