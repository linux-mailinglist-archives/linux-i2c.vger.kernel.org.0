Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9195560732
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 19:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbiF2RSf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 13:18:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiF2RSf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 13:18:35 -0400
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 780831A81A;
        Wed, 29 Jun 2022 10:18:34 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id i17so25724680qvo.13;
        Wed, 29 Jun 2022 10:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wXWhdEBTbV2up4EX48hH9r3b+lA3Y6CLLpslrOxD3K0=;
        b=N2cqZYRJFjkmwRvQ0cQ/VNu2IotSnz9jByD9KcYko7LlpewY62XwgRd8wfB9LunCNl
         pRZtTMAf7MP8Z+7vVZS2LOo3tcCn3BYAPaNIx46E5JP7ZiHnYlncRxyFRwKuSIWXRGp6
         w7bTNjNVn9Hk5dTq+3IzjQJxSbbHMklH71Gml7XDKTivCr0l9wFoRHhMmdxyxUlMSB/p
         p2ATqBWVZd6yAaDGs3NjFGaD0kqL9imluMQQpBfQeGG2slQjDT5ahV/+3mqzSV2gtG/l
         lzcjhKGSC8s1wzbQjMNSWLsQtkiNwrZK+iBhGhjZu1xxJ08vA8gOsFxx2TdrrJvEnXbv
         mbqA==
X-Gm-Message-State: AJIora9H+C0VNLF1Y9sMlNyiTR5XzXhycmNCWCjdY8CqZ2U7cTFJpdmd
        mS70Pvz2QjGdoVXXnF+AQeBoV41t9CsEIw==
X-Google-Smtp-Source: AGRyM1sarY6A/Bs9v3pw+inXLsGQAJqOW2U+DrbYzSuNSv2rbd1DQ6m8rnp4YHMrOtMiy7i9+ubYHQ==
X-Received: by 2002:a0c:b258:0:b0:470:5709:4007 with SMTP id k24-20020a0cb258000000b0047057094007mr8576008qve.83.1656523113040;
        Wed, 29 Jun 2022 10:18:33 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id d8-20020ac85ac8000000b00304e70585f9sm11967887qtd.72.2022.06.29.10.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 10:18:32 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id p7so27716969ybm.7;
        Wed, 29 Jun 2022 10:18:31 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr4496162ybu.604.1656523111456; Wed, 29
 Jun 2022 10:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220628194526.111501-1-phil.edworthy@renesas.com> <c168df990e1187bf44a5c46be53aa6b20d30d14d.camel@pengutronix.de>
In-Reply-To: <c168df990e1187bf44a5c46be53aa6b20d30d14d.camel@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 29 Jun 2022 19:18:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXV72_BWOpU=O13Fa3-t001YSRdsFePSHBS=Xvh1jY1EQ@mail.gmail.com>
Message-ID: <CAMuHMdXV72_BWOpU=O13Fa3-t001YSRdsFePSHBS=Xvh1jY1EQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] i2c: Add new driver for Renesas RZ/V2M controller
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sven Peter <sven@svenpeter.dev>, Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
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

Hi Philipp,

On Wed, Jun 29, 2022 at 6:21 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Di, 2022-06-28 at 20:45 +0100, Phil Edworthy wrote:
> > The Renesas RZ/V2M SoC (r9a09g011) has a new i2c controller. This series
> > add the driver. One annoying problem is that the SoC uses a single reset
> > line for two i2c controllers, and unfortunately one of the controllers
> > is managed by some firmware, not by Linux. Therefore, the driver just
> > deasserts the reset.
>
> This sounds scary. If the driver is never loaded, and the reset is
> never deasserted, what happens to the firmware trying to access the
> other i2c controller? Does it hang? Or write to the reset controller
> registers to deassert the reset? If so, is there any protection against
> concurrent access from firmware and reset controller driver?


In response to v1, I wrote

| That is actually an integration issue, not an i2c controller issue.
|
| Perhaps we need a RESET_IS_CRITICAL flag, cfr. CLK_IS_CRITICAL,
| to be set by the reset provider?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
