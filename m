Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 817C37045EC
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 09:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbjEPHNS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 03:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbjEPHNH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 03:13:07 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 294F33C1D;
        Tue, 16 May 2023 00:12:59 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7577ef2fa31so159375785a.0;
        Tue, 16 May 2023 00:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684221178; x=1686813178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGO9+xG9Gq4ZXD8pXatxmlcWQwHNRJ9vNMccCtCt0EA=;
        b=Xhi8eF1w/N78hp/XAtnDVWlRggVyCKEfEvdjsvA4jOzvZ0HYcoiWRZiYF4yElHlfRB
         Q9QivR5vvOEnuNpmGCUEMeEem16ZAM7haxdezkl+svLsgxTKFdaY60wOzZd2XfC8jwew
         PVGOpmyE/Li9IeaD4eOxLYLOd0psMA1Dqv0Yga6NlW2yizjiLEv9RWmErgWNu5CHtWYk
         APF+f2sibJ87QJtK6wJG3dqMzH/BsqACrMxbq1kkZp8K9dzyzjZxGtOEzjeViFNY7JwU
         xl6fpbvH+X7Gp0grh5RAqe4Got0RgMKpShKE2jSwL4GEFixfUPRvd7IiUriZMpLMVZ3M
         pICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684221178; x=1686813178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGO9+xG9Gq4ZXD8pXatxmlcWQwHNRJ9vNMccCtCt0EA=;
        b=JDXW7tTkSDFY8juoqGlRKndRrIsFEVZDjhJdHqQzLflMX81A2PQCbjY+JKwM/5hmLF
         j9MsaWtBCq9OyEZctWYLUtpz0msdzTK/mRQS6zSGV2bQaGEIps0dUNkNGIiYYwozEXhI
         lu7JSux+ulsHnf0ZP/M55ueofLObt/QjnIicZdKpSXEuwgHJwB5C9frqwinbaLW0FY+q
         cjhEQaSxzVBLqBaB1yAtJKWkF3F1rOchVb4nadKDAx9+xwpxu8l0ZHL7FhHZ0vJL6HMq
         na53J2KSA+G/gF7LfBFF3qGP0zE8Jrcl0IXsJ5IJR3FcKMpldR4KoIaUuki5UstUXO/N
         9FsQ==
X-Gm-Message-State: AC+VfDw6TmBrHWN+GN4r5Y0AGparHQKh/XBCNlPFVBKg9kTHdYhNKceG
        2HFChh4zsepXn4yaAnOvB6nWk94Y/yInR/8p4UJY9mHaNro=
X-Google-Smtp-Source: ACHHUZ5uLoRfTIYSGP2GhpHG/Gfu067EFwPcoCBdZEv6Jx8FeCV16WuUB4wsxrMM3veI4Kl44Jrsz6GEAS8u0JPpf8E=
X-Received: by 2002:a05:6214:262d:b0:5f1:6a6a:f556 with SMTP id
 gv13-20020a056214262d00b005f16a6af556mr63769625qvb.16.1684221178175; Tue, 16
 May 2023 00:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230515063200.301026-1-jiawenwu@trustnetic.com>
 <20230515063200.301026-7-jiawenwu@trustnetic.com> <ZGH-fRzbGd_eCASk@surfacebook>
 <00cd01d9879f$8e444950$aaccdbf0$@trustnetic.com>
In-Reply-To: <00cd01d9879f$8e444950$aaccdbf0$@trustnetic.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 16 May 2023 10:12:22 +0300
Message-ID: <CAHp75VdthEZL6GvT5Q=f7rbcDfA5XX=7-VLfVz1kZmBFem_eCA@mail.gmail.com>
Subject: Re: [PATCH net-next v8 6/9] net: txgbe: Support GPIO to SFP socket
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 16, 2023 at 5:39=E2=80=AFAM Jiawen Wu <jiawenwu@trustnetic.com>=
 wrote:

...

> > > +   struct gpio_irq_chip *girq;
> > > +   struct wx *wx =3D txgbe->wx;
> > > +   struct gpio_chip *gc;
> > > +   struct device *dev;
> > > +   int ret;
> >
> > > +   dev =3D &wx->pdev->dev;
> >
> > This can be united with the defintion above.
> >
> >       struct device *dev =3D &wx->pdev->dev;
> >
>
> This is a question that I often run into, when I want to keep this order,
> i.e. lines longest to shortest, but the line of the pointer which get lat=
er
> is longer. For this example:
>
>         struct wx *wx =3D txgbe->wx;
>         struct device *dev =3D &wx->pdev->dev;

So, we locate assignments according to the flow. I do not see an issue here=
.

> should I split the line, or put the long line abruptly there?

The latter is fine.

...

> > > +   gc =3D devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
> > > +   if (!gc)
> > > +           return -ENOMEM;
> > > +
> > > +   gc->label =3D devm_kasprintf(dev, GFP_KERNEL, "txgbe_gpio-%x",
> > > +                              (wx->pdev->bus->number << 8) | wx->pde=
v->devfn);
> > > +   gc->base =3D -1;
> > > +   gc->ngpio =3D 6;
> > > +   gc->owner =3D THIS_MODULE;
> > > +   gc->parent =3D dev;
> > > +   gc->fwnode =3D software_node_fwnode(txgbe->nodes.group[SWNODE_GPI=
O]);
> >
> > Looking at the I=C2=B2C case, I'm wondering if gpio-regmap can be used =
for this piece.
>
> I can access this GPIO region directly, do I really need to use regmap?

It's not a matter of access, it's a matter of using an existing
wrapper that will give you already a lot of code done there, i.o.w.
you don't need to reinvent a wheel.


--=20
With Best Regards,
Andy Shevchenko
