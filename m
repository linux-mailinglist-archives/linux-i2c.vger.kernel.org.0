Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32910737FD6
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Jun 2023 13:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjFULBD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Jun 2023 07:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231719AbjFULBC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Jun 2023 07:01:02 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84F8B6;
        Wed, 21 Jun 2023 04:01:00 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-98cd280cf94so56490066b.1;
        Wed, 21 Jun 2023 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687345259; x=1689937259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dC+CkcFL2MhCtddKaZrPXa9cdLHcEd5ohlN3nSioyXI=;
        b=HXGdzS5MVr9hjWsLy2TyJYAIuVllC1QwFlIIacHf7DsPJtL/qTL7kEeh80inW0XuSv
         6EttBY2nDYeiitf+7hCP20RGQbbMq5WA7xX0FLXQBSou4XLi0R6hfiRDGeYNLoLJV7XQ
         wG/NaRVe4MniyzP9r23orHSLaOna56l+Ksw8td2r/oM2rtA/QQePaJN/agWP8AcJ5VWN
         DXmEAAFv3nEUSmK1L70s3QAZQBKrX8yuW9ClQqSw0FfmWZz0ro4LBQ441POtWW3+9Z20
         8UumjtfXpVujrdZUINXw9bSJPnVWF8WEPiqIOf/w5SUvCwC0pBcOkNbx379qOQEWkghc
         NrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687345259; x=1689937259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dC+CkcFL2MhCtddKaZrPXa9cdLHcEd5ohlN3nSioyXI=;
        b=AH7TxiwvpQ8dhNzJ4ppH7Ju0m/twd6iGnPK2kM7fTHsFNmiJbvo1Z2xTYQS+xcRk6z
         8yNA4eMLAIAOsSRN5M8mPeicKFWChl57+7/LAYVBxzt2Gh4nbghxg81nQDGJFdSyiQjG
         9h2MS4Wi/gERT9OJmcs+VLQnfcaDbgG/QWN9TKSJhtIYqMHUcCzdWUFrrl99VU4Duqgv
         t+WvpzuU/q2/qMoQA9MKIJ6wCMd9L/3IYelhc51egGyN1hVJ8qSydQHP8sgyLPwVSeq4
         8r3D2/qbFnYhes4+lVyF01wO6D0fqesYAVL6YwVubEmSEByBuTjCC1OjTLEs+gY8WOpj
         WHdg==
X-Gm-Message-State: AC+VfDzgkkD+hszB2Z/juIKwf8ygezAlixbD3hYUqFwsUA9xVrPqjb8J
        2W7OdI3Z5UZ4qIwDrDUdygZrWXmlKIl7gOoIwzc=
X-Google-Smtp-Source: ACHHUZ4yWoJDvI8mx0swN29OBx6m3OEEAHGuL+rtd3ygvRSN02lw5h0orw/GBbroJ0PSJWKLvpe4t7VRdems5M2+340=
X-Received: by 2002:a17:907:6292:b0:983:ba44:48af with SMTP id
 nd18-20020a170907629200b00983ba4448afmr14464518ejc.53.1687345259069; Wed, 21
 Jun 2023 04:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230619153732.46258-1-clamor95@gmail.com> <20230619153732.46258-3-clamor95@gmail.com>
 <20230621103219.o2u33nsok7zngikf@intel.intel>
In-Reply-To: <20230621103219.o2u33nsok7zngikf@intel.intel>
From:   Svyatoslav Ryhel <clamor95@gmail.com>
Date:   Wed, 21 Jun 2023 14:00:48 +0300
Message-ID: <CAPVz0n2E5gqCS3mRRjnUM0K__9An_fDcJG_7w0EgR0JG8Dtp=w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: Add GPIO-based hotplug gate
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=D1=81=D1=80, 21 =D1=87=D0=B5=D1=80=D0=B2. 2023=E2=80=AF=D1=80. =D0=BE 13:3=
2 Andi Shyti <andi.shyti@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi,
>
> On Mon, Jun 19, 2023 at 06:37:32PM +0300, Svyatoslav Ryhel wrote:
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > Implement driver for hot-plugged I2C busses, where some devices on
> > a bus are hot-pluggable and their presence is indicated by GPIO line.
> >
> > Co-developed-by: Ion Agorria <ion@agorria.com>
> > Signed-off-by: Ion Agorria <ion@agorria.com>
> > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/i2c/Kconfig            |  11 ++
> >  drivers/i2c/Makefile           |   1 +
> >  drivers/i2c/i2c-hotplug-gpio.c | 266 +++++++++++++++++++++++++++++++++
> >  3 files changed, 278 insertions(+)
> >  create mode 100644 drivers/i2c/i2c-hotplug-gpio.c
>
> without going through the code I am missing the big picture here.
>
> What is this actually doing?

Basically it duplicates the parent i2c bus once detection GPIO triggers
and probes all hot-pluggable devices which are connected to it. Once
GPIO triggers detach signal all hot-pluggable devices are unprobed and
bus removed.

> Is this a new bus driver support?

Most likely not.

> Is this a feature to existing drivers?

Yes, it is more like i2c mux

> Is the GPIO an irq line for signalling hoplugging and can be used by
> any driver or just this one?
>

It can be shared if necessary but usually all hot-pluggable devices
are gathered in one container and are plugged simultaneously.

> Without further discussing technicalities, can you please explain
> better and more in detail what is the scope of this patch, why
> there is a need for such a patch, how this new driver/feature
> has been implemented and finally how it can be used.

This patch is a predecessor of a possible larger patchset which
should bring support for a asus-ec, a i2c mfd device programmed by
Asus for their Transformers tablet line.

This is Micha=C5=82 Miros=C5=82aw, original author quote about this driver:
"The Transformers have a connector that's used for USB, charging or
for attaching a keyboard (called a dock; it also has a battery and
a touchpad). This connector probably (I don't have the means to verify
that) has an I2C bus lines and a "detect" line (pulled low on the dock
side) among the pins. I guess there is either no additional chip or
a transparent bridge/buffer chip, but nothing that could be controlled
by software. For DT this setup could be modelled like an I2C gate or
2-port mux with enable joining two I2C busses (one "closer" to the
CPU -- parent)."

Similar approach is used in Microsoft Surface RT for attachable
Type Cover.

> This would help a lot so that I know already beforehand what I am
> going to read without figuring it out.
>
> Thanks,
> Andi
>
> PS Please notice that my set of questions is even longer than
> your commit log :)
