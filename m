Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6E46527B5E
	for <lists+linux-i2c@lfdr.de>; Mon, 16 May 2022 03:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239061AbiEPBXk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 May 2022 21:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236470AbiEPBXk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 May 2022 21:23:40 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492DB32045;
        Sun, 15 May 2022 18:23:39 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id p1so5290760uak.1;
        Sun, 15 May 2022 18:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7wuXO57c0JtXqV5NdAvSdjaT7cOyGnW8IqIXRcho3Sc=;
        b=jLxemqpwDv3YIlAWxavQtM/R0fB+JS+RanuyHTfmcZVVq1IsYjB7/tbyLeXAnMlWtc
         t1ATdP3DVFy4V8JCbAObbLpC0n5K6OGz4aePehxPCYiKVRfzBB+lfEuxkFK7ziSxLA3X
         F/X1wg1G9xTIQevmNjxcApVZnbyVSnVuwbaUQoVEQXOtqcdB4jYIx4IxNKH7uGa48RTB
         OHXcEHP9GslvHInoVwaPl7bvXCeBJVCjo6DsFtqNZCoh0JMNoAMaFine049A86yv4yqn
         tKQq2RVNInTXx8wj2kycJW9+CBDKflXYyO4nF3cJKtmTJdJcUoiFmRZZy7xOXwd1k7gH
         eHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7wuXO57c0JtXqV5NdAvSdjaT7cOyGnW8IqIXRcho3Sc=;
        b=3BCvRBnJd2Jor6bYZFWJjD1IulJ0w8yeZ5tYPjnhbXc15OCZE2gDg6k0+K8rNDM1v4
         JWftgD/wA7lujOpbEGkKRtj9pOFcZz4aaT/T2u71vH1kT7A2xbFQl//D1tooxwd7S3W1
         L92dz1vZViZfVIzHIg2C5pUc2/oQUZ4RukltbVRBef9HXoJAs/x8oGyS4NG2xJnTJcl6
         cATSrTz3ktBGkxiFuTAwaFVNjMgl8dIxKWW0u8aInFgYn8+kPI1+3Ro6UESoxcASgvtZ
         4roZQwB6kEmwxMLAN8LqtTRq17MTeq8jQKURKNiedv/jlwsWacSFyNsL4GBs2BsVBYdY
         efRQ==
X-Gm-Message-State: AOAM533VwNBE3tJovfXavtu/zGFOzd/NY6S4DTUMJOAXMn0r9i4RYUD+
        xv34yFKbZAErcNQQpGsPDj07C87DVtXRVgpbJCM+hF3hbVvu
X-Google-Smtp-Source: ABdhPJwNLMRahavW5whCZBPGo059+0UY3efbiL9iQ4RtWbjJJpSVEhPXj0XzodbmI/P/D96ykhaUca+cEqub5JmtEXs=
X-Received: by 2002:a9f:31ce:0:b0:360:4d8:3eeb with SMTP id
 w14-20020a9f31ce000000b0036004d83eebmr5136218uad.73.1652664217430; Sun, 15
 May 2022 18:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220510091654.8498-1-warp5tw@gmail.com> <20220510091654.8498-9-warp5tw@gmail.com>
 <Yno8KMycNbJ+VGtc@smile.fi.intel.com> <CACD3sJYVyV_fFJu9zXJGL1ro02KnkHoeNNSNB8O46FRwd6=-BA@mail.gmail.com>
In-Reply-To: <CACD3sJYVyV_fFJu9zXJGL1ro02KnkHoeNNSNB8O46FRwd6=-BA@mail.gmail.com>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Mon, 16 May 2022 09:23:25 +0800
Message-ID: <CACD3sJZxzs28Ruxifw1vjgKmOr0Z3WgC6SpciwjyvkRMZh8ykw@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] i2c: npcm: Remove own slave addresses 2:10
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        wsa@kernel.org, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, sven@svenpeter.dev, jsd@semihalf.com,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy:

I would like to have your comments about the "Fancy indentation"
because I'm not sure if I get the point.

I remove extra empty lines and reformat the commit message.

Please see the details below.

Thank you.

Tyrone Ting <warp5tw@gmail.com> =E6=96=BC 2022=E5=B9=B45=E6=9C=8811=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=889:39=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Andy:
>
> Thank you for your comments and they will be addressed.
>
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2022=E5=B9=
=B45=E6=9C=8810=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:19=E5=AF=AB=
=E9=81=93=EF=BC=9A
> >
> > On Tue, May 10, 2022 at 05:16:53PM +0800, Tyrone Ting wrote:
> > > From: Tali Perry <tali.perry1@gmail.com>
> > >
> > > NPCM can support up to 10 own slave addresses.
> > > In practice, only one address is actually being used.
> > > In order to access addresses 2 and above, need to switch
> > > register banks. The switch needs spinlock.
> > > To avoid using spinlock for this useless feature
> > > removed support of SA >=3D 2.
> >
> > > Also fix returned slave event enum.
> > >
> > > Remove some comment since the bank selection is not
> > > required. The bank selection is not required since
> > > the supported slave addresses are reduced.
> >
> > Fancy indentation. Please fix it in all your commit messages where it a=
pplies.
> >

I modify the commit message as following:

NPCM can support up to 10 own slave addresses. In practice, only one
address is actually being used. In order to access addresses 2 and above,
need to switch register banks. The switch needs spinlock.
To avoid using spinlock for this useless feature removed support of SA >=3D
2. Also fix returned slave event enum.

Remove some comment since the bank selection is not required. The bank
selection is not required since the supported slave addresses are reduced.

> > ...
> >
> > > +     if (addr_type > I2C_SLAVE_ADDR2 && addr_type <=3D I2C_SLAVE_ADD=
R10) {
> > > +             dev_err(bus->dev,
> > > +                     "try to enable more then 2 SA not supported\n")=
;
> >
> > Make it one line and drop {}.
> >
> > > +     }
> >
> > ...
> >
> > > +     if (addr_type > I2C_SLAVE_ADDR2 && addr_type <=3D I2C_SLAVE_ADD=
R10) {
> > > +             dev_err(bus->dev,
> > > +                     "get slave: try to use more then 2 slave addres=
ses not supported\n");
> >
> > As per above be consistent with abbreviations ("SA" here, which makes l=
ine
> > shorter) and follow the above recommendation.
> >
> > > +     }
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
>
> Best Regards,
> Tyrone

Best Regards,
Tyrone
