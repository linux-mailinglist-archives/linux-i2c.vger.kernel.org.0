Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 172C3560514
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 18:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232082AbiF2P64 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 11:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbiF2P6z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 11:58:55 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3223D13E01;
        Wed, 29 Jun 2022 08:58:54 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id 2so10509574qvc.0;
        Wed, 29 Jun 2022 08:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W+Vt1r6+rqMwrvTJTCgMSy2TvA9kq6OheeKnGSI5F6o=;
        b=1XCJ0Zy7QJ5xwAkgLj8DWiP0Gx3ODtXIAEZieH/yDIx52cpPO9sunVbv3hLb3zs5G2
         4pklHhzA2CFlFZNQ0XH+qvfaz8dcq+fI8k8IrznN32RyPWeDdlmgt4xb9M91UjKnPzM2
         qngpB+0TsrpjULT67PeFqJHb9YMI/QnVtejZSSfLrEoOdXHjOME1pdNd3D8rZ+9UnQLJ
         fZhpEDmbZOb3+j92YqC7VCVEGFFk7GDhdKf4aEGCnf+ADfOLF5CB5Da9bXTppEnjhYwY
         Oy40wNC1Rs5pKVOtyC+4m0lSlBs38AjGdaMA/DJpCVwHCPgmhBHMZHuyteTY5wtzj9C/
         0qjA==
X-Gm-Message-State: AJIora+m1TYMOWutDxyjgdghIm29NsyDi3s0+PxWDAKkUjDtWTYduRKt
        awzePQ9nfSqZD4OEyftINnHuNCoAoiiARQ==
X-Google-Smtp-Source: AGRyM1v5THFlfsXNdGLQS76T87hG2RaCW66U7e+DSphbdojkZW5nsnwYoXi/sMeRSOqpCW7aW+sVrQ==
X-Received: by 2002:ac8:578d:0:b0:31a:e1d7:952a with SMTP id v13-20020ac8578d000000b0031ae1d7952amr3106270qta.103.1656518333078;
        Wed, 29 Jun 2022 08:58:53 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id k201-20020a37a1d2000000b006a716fed4d6sm12785687qke.50.2022.06.29.08.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 08:58:52 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-31bf327d4b5so63144557b3.13;
        Wed, 29 Jun 2022 08:58:52 -0700 (PDT)
X-Received: by 2002:a81:a092:0:b0:318:5c89:a935 with SMTP id
 x140-20020a81a092000000b003185c89a935mr4829130ywg.383.1656518332261; Wed, 29
 Jun 2022 08:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220628194526.111501-1-phil.edworthy@renesas.com>
 <20220628194526.111501-3-phil.edworthy@renesas.com> <YrttwplV9zEgCFji@smile.fi.intel.com>
 <CAMuHMdV1xkCvico_f359xBzkwU5pG3VVJV7O3dHRyy5a9QvyGw@mail.gmail.com> <Yrws5eTtdDZ2szhX@smile.fi.intel.com>
In-Reply-To: <Yrws5eTtdDZ2szhX@smile.fi.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 29 Jun 2022 17:58:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTux2TFMAZL0yV8xJVN4K+gHJpKHJjuOOFXJ+9VCCfQA@mail.gmail.com>
Message-ID: <CAMuHMdUTux2TFMAZL0yV8xJVN4K+gHJpKHJjuOOFXJ+9VCCfQA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: Add Renesas RZ/V2M controller
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

On Wed, Jun 29, 2022 at 12:46 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Jun 29, 2022 at 08:52:27AM +0200, Geert Uytterhoeven wrote:
> > On Tue, Jun 28, 2022 at 11:08 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Tue, Jun 28, 2022 at 08:45:26PM +0100, Phil Edworthy wrote:
>
> ...
>
> > > > +static int rzv2m_i2c_send(struct rzv2m_i2c_priv *priv, struct i2c_msg *msg,
> > > > +                       unsigned int *count)
> > > > +{
> > > > +     unsigned int i;
> > > > +     int ret = 0;
> > >
> > > Redundant assignment, you may return 0 directly.
> >
> > Can you prove msg->len is never zero, and the loop below is always
> > executed at least once?
>
> I don't see how this is related. The ret is used only in the loop body,
>
>         return 0;
>
> outside will suffice. No?

Right, with the "return ret" in the end replaced.

> > The driver does set I2C_AQ_NO_ZERO_LEN, but I don't think the static
> > checkers know ;-)
> >
> > >
> > > > +     for (i = 0; i < msg->len; i++) {
> > > > +             ret = rzv2m_i2c_write_with_ack(priv, msg->buf[i]);
> > > > +             if (ret < 0)
> > > > +                     return ret;
> > > > +     }
> > > > +     *count = i;
> > > > +
> > > > +     return ret;
> > > > +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
