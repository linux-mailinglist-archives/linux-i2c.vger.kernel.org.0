Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0335645DF
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Jul 2022 10:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbiGCImB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 Jul 2022 04:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbiGCImA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 Jul 2022 04:42:00 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D3D1AE41;
        Sun,  3 Jul 2022 01:41:59 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id c13so5839877qtq.10;
        Sun, 03 Jul 2022 01:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yvorIwcrFiiLPdtmHyBlDuVBktLBtWZmiJ053uS1/Og=;
        b=ql460vhTGtv4f4974UZugoYrvGoQ/P26iBR+zZARnAaKGRaTnxlMfnkqeFMgUwSO7c
         Ao76ql6fr4ibrz5f8tovxl/7ghtTmehgWGtOLgGxKpynKdxSCwFBr2BLjjvNBsqnERtK
         gwyTb3Lvih8K014wYsXMt67NmqDwNSYOElljxC2Dz22kJhIjQP24TJQuByX1l50itbqZ
         ma8VJYBNuR5b0orjSGROTqIzuPj0ypX2ZlziAk2YV93vUTdd5hjQ2FG0BuYog5U3m/BJ
         DRISTmVun0YTlT35axGp6aT0+v8MLF8oNlqrccgwoH5pqFa87AOWiUo5kgmjlG+WLOrk
         p4ig==
X-Gm-Message-State: AJIora+ODmI1UBCQ0kvkA8biyfYqRoQe2myphBYEYfMTxO/jN7HKe8Pe
        rzLefBhFXdDZAz9g/wSCeBuXQWk1MUa7mg==
X-Google-Smtp-Source: AGRyM1tfx7bCw4z86QFqFNfVOL0YX6u3BzYGrSZnNJEFqfS8ZjiVsmtBw+BlwbeCyCzL5dDERWE2Vg==
X-Received: by 2002:ac8:7dd4:0:b0:31b:f083:1ef2 with SMTP id c20-20020ac87dd4000000b0031bf0831ef2mr20165056qte.270.1656837718448;
        Sun, 03 Jul 2022 01:41:58 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id ea23-20020a05620a489700b006af33e58b42sm14689844qkb.43.2022.07.03.01.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Jul 2022 01:41:57 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-31bf3656517so57417127b3.12;
        Sun, 03 Jul 2022 01:41:56 -0700 (PDT)
X-Received: by 2002:a0d:ead0:0:b0:31c:63c3:e615 with SMTP id
 t199-20020a0dead0000000b0031c63c3e615mr12540850ywe.384.1656837716530; Sun, 03
 Jul 2022 01:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220701163916.111435-1-phil.edworthy@renesas.com>
 <20220701163916.111435-3-phil.edworthy@renesas.com> <YsAxSrcAk4jtRYx4@smile.fi.intel.com>
In-Reply-To: <YsAxSrcAk4jtRYx4@smile.fi.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 3 Jul 2022 10:41:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU1-LQJUCsDAfaC4OhRW7ijcpAG9VEUHu_Gu1qE7LdweA@mail.gmail.com>
Message-ID: <CAMuHMdU1-LQJUCsDAfaC4OhRW7ijcpAG9VEUHu_Gu1qE7LdweA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: Add Renesas RZ/V2M controller
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Sat, Jul 2, 2022 at 1:51 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Fri, Jul 01, 2022 at 05:39:16PM +0100, Phil Edworthy wrote:
> > Yet another i2c controller from Renesas that is found on the RZ/V2M
> > (r9a09g011) SoC. It can support only 100kHz and 400KHz operation.

>
> > +static int rzv2m_i2c_suspend(struct device *dev)
> > +{
> > +     struct rzv2m_i2c_priv *priv = dev_get_drvdata(dev);
>
> > +     pm_runtime_get_sync(dev);

pm_runtime_resume_and_get() ;-)

>
> Isn't guaranteed by the runtime PM that device is runtime powered on the system
> suspend?

No, as this is a system sleep callback.

>
> > +     bit_clrl(priv->base + IICB0CTL0, IICB0IICE);
> > +     pm_runtime_put(dev);
> > +
> > +     return 0;
> > +}
>
> ...
>
> > +static int rzv2m_i2c_resume(struct device *dev)
> > +{
> > +     struct rzv2m_i2c_priv *priv = dev_get_drvdata(dev);
> > +     int ret;
> > +
> > +     ret = rzv2m_i2c_clock_calculate(dev, priv);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     pm_runtime_get_sync(dev);

pm_runtime_resume_and_get() ;-)

>
> I'm not sure how it's suppose to work. Isn't it a no-op here?

No, as this is a system sleep callback.

>
> > +     rzv2m_i2c_init(priv);
> > +     pm_runtime_put(dev);
> > +
> > +     return 0;
> > +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
