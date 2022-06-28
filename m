Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1C555D55C
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jun 2022 15:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240029AbiF1K0i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jun 2022 06:26:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiF1K0i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jun 2022 06:26:38 -0400
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78DD23191C;
        Tue, 28 Jun 2022 03:26:37 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id q4so19258158qvq.8;
        Tue, 28 Jun 2022 03:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8kdVJ+nUrtv+9x17pnUk0WTRJWf77n+WUzNOlALd4C8=;
        b=qcOK28rTkaKkcb9Bw25lddLPyvLRBsYXiXtnqSFTr8gvYDWmh7T5KZYCryrugN6jbj
         blHaelZcTFiiYqYA0gqG3COSY8D7KJ3/UIrHDm0gzvUhQ90RYTGVdl58BMKec+XzR7bS
         pXtLbDZrbeCY/X3fa/a6nUcFQwJJ7zBo/U0S9ZWqOkw+RH88eQl8Tgez9fmXq59BYH6E
         n3XWIzS0MqwRGyGQUfGca+/k+lVRsHu5FWW9zrU2DYC1rzg8DVHguxrypbw5xrvhXNzQ
         7+xnRNwzn/56k66d7o2J2CC4XS3GbXDG3Hb5GpQSDlOrXFkgZKT16UhkdTNkEGVnx6lN
         +ncQ==
X-Gm-Message-State: AJIora8QPN4VvPrcTMeFTmKXeYllUwR+vMl5ceED3NJB4fNp+1IVECcz
        RrQdpdHOQS5GR69IOFQnN4DjxMIAGIrf9w==
X-Google-Smtp-Source: AGRyM1uix7JznQa67XSwpEVEJE5ObHiqE4OvvIfdTHf+nFxZp8IZSk1uRFbhS3B3rtCICGy1aXglvQ==
X-Received: by 2002:a0c:e888:0:b0:470:4b73:fbb with SMTP id b8-20020a0ce888000000b004704b730fbbmr1569692qvo.128.1656411996404;
        Tue, 28 Jun 2022 03:26:36 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id u16-20020a05620a0c5000b006a6ebde4799sm12240528qki.90.2022.06.28.03.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 03:26:35 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-31772f8495fso111923397b3.4;
        Tue, 28 Jun 2022 03:26:34 -0700 (PDT)
X-Received: by 2002:a81:a092:0:b0:318:5c89:a935 with SMTP id
 x140-20020a81a092000000b003185c89a935mr21559599ywg.383.1656411994350; Tue, 28
 Jun 2022 03:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220624101736.27217-1-phil.edworthy@renesas.com>
 <20220624101736.27217-3-phil.edworthy@renesas.com> <CAK8P3a085ZuyTXAWupo56wwfKdkM9EFnkPHXzxTxwTUUR5ee9Q@mail.gmail.com>
 <CAMuHMdWNvFARZgM1QX_t9aq1Kh84i2aCxcG5k9LqDM=wQu15pw@mail.gmail.com> <YrrVMAdZn9IyQA3b@smile.fi.intel.com>
In-Reply-To: <YrrVMAdZn9IyQA3b@smile.fi.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Jun 2022 12:26:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUdPXtUELBMNih4=wP9xfQ9rD9i+H1=cCNAfPF5rTiUTg@mail.gmail.com>
Message-ID: <CAMuHMdUdPXtUELBMNih4=wP9xfQ9rD9i+H1=cCNAfPF5rTiUTg@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: Add Renesas RZ/V2M controller
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
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

Hi Andy,

On Tue, Jun 28, 2022 at 12:17 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Fri, Jun 24, 2022 at 01:48:58PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Jun 24, 2022 at 1:27 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Fri, Jun 24, 2022 at 12:17 PM Phil Edworthy
> > > <phil.edworthy@renesas.com> wrote:
>
> ...
>
> > > Remove the #ifdef here, and use the new NOIRQ_SYSTEM_SLEEP_PM_OPS()
> > > in place of SET_NOIRQ_SYSTEM_SLEEP_PM_OPS().
> >
> > Cool, TIL!
>
> There are also pm_ptr() and pm_sleep_ptr() macros (need to be used when assign
> dev_pm_ops).

Indeed, I have used the latter in a patch I posted yesterday ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
