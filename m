Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4545598E1
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jun 2022 13:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbiFXLy1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jun 2022 07:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231760AbiFXLy0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Jun 2022 07:54:26 -0400
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA582517D6;
        Fri, 24 Jun 2022 04:54:25 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 8so1104178vkg.10;
        Fri, 24 Jun 2022 04:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ySzXjn+gIQ0HXdMPIOBsVEFx6xUqIK4HbBW1vGEUVas=;
        b=7jVetdTJelvzfmm94VkhUXNYyHT5A70urPOfKMu/1tj3Jwc1g13kbBRUlx3aPUviPk
         uBqNlqw/yGocQ5i6s0HD/C8ReHbjwWGoEeWQoQPjjpa2O8Ctl4OkseYAwMKogbL/PM+I
         c4eL++ysaV+YagC2QKIB5Bqtp63CiWSnezSL+ffWNMfwDEIcowVjuC4hkZljKiS3kJQ0
         5/fgKVOzGiZefZwNe5pGZu8RQRx3mwSuSAY5fqQWz7R7xM7zxsNxgM0q+O1edNupofY4
         hmtQJIWAE2eq0VtVmz9HrX1DgQVutyNDMZKyTz1sm1Nn63BN492eAuWhLm2TbvEcCn6E
         wRDg==
X-Gm-Message-State: AJIora/U/yoZzs5VwsY/WEQQSfP+XCSQ3UpQBW4IYXf52tJXEZtLCpav
        Ji3beeYtlAx1+MxmpTsAQGwj5nH0Hq2Gjw==
X-Google-Smtp-Source: AGRyM1uwG/bw/l85vZJ/SedkDDLACPz6mAw9IG66yLks7bZoNqx4x8f2uRNIKfyJ+O6qS40OoCustA==
X-Received: by 2002:a1f:31d2:0:b0:36c:ac65:5716 with SMTP id x201-20020a1f31d2000000b0036cac655716mr4314113vkx.29.1656071664796;
        Fri, 24 Jun 2022 04:54:24 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id b138-20020a1f1b90000000b0036c5098f621sm284355vkb.22.2022.06.24.04.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 04:54:24 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id 90so755149uam.8;
        Fri, 24 Jun 2022 04:54:24 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr8958150ybq.543.1656071349784; Fri, 24
 Jun 2022 04:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220624101736.27217-1-phil.edworthy@renesas.com>
 <20220624101736.27217-3-phil.edworthy@renesas.com> <CAK8P3a085ZuyTXAWupo56wwfKdkM9EFnkPHXzxTxwTUUR5ee9Q@mail.gmail.com>
In-Reply-To: <CAK8P3a085ZuyTXAWupo56wwfKdkM9EFnkPHXzxTxwTUUR5ee9Q@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Jun 2022 13:48:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNvFARZgM1QX_t9aq1Kh84i2aCxcG5k9LqDM=wQu15pw@mail.gmail.com>
Message-ID: <CAMuHMdWNvFARZgM1QX_t9aq1Kh84i2aCxcG5k9LqDM=wQu15pw@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: Add Renesas RZ/V2M controller
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jie Deng <jie.deng@intel.com>, Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Olof Johansson <olof@lixom.net>,
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

Hi Arnd,

On Fri, Jun 24, 2022 at 1:27 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Jun 24, 2022 at 12:17 PM Phil Edworthy
> <phil.edworthy@renesas.com> wrote:
> >
> > Yet another i2c controller from Renesas that is found on the RZ/V2M
> > (r9a09g011) SoC. It can support only 100kHz and 400KHz operation.
>
> I see nothing wrong with this, just one suggestion for a cleanup:
>
> > +#ifdef CONFIG_PM_SLEEP
> > +static int rzv2m_i2c_suspend(struct device *dev)
> ...> +static const struct dev_pm_ops rzv2m_i2c_pm_ops = {
> > +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(rzv2m_i2c_suspend, rzv2m_i2c_resume)
> > +};
> > +
> > +#define DEV_PM_OPS (&rzv2m_i2c_pm_ops)
> > +#else
> > +#define DEV_PM_OPS NULL
> > +#endif /* CONFIG_PM_SLEEP */
>
> Remove the #ifdef here, and use the new NOIRQ_SYSTEM_SLEEP_PM_OPS()
> in place of SET_NOIRQ_SYSTEM_SLEEP_PM_OPS().

Cool, TIL!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
