Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5EB7810AD
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Aug 2023 18:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353048AbjHRQnB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Aug 2023 12:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378854AbjHRQm4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Aug 2023 12:42:56 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C253C2F
        for <linux-i2c@vger.kernel.org>; Fri, 18 Aug 2023 09:42:30 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d72fca0043aso1045008276.1
        for <linux-i2c@vger.kernel.org>; Fri, 18 Aug 2023 09:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692376943; x=1692981743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Pf4ioyh9XZw5mylCfls7puo726mkZDVdsu5OC0qb4w=;
        b=aE4RO8hS6ITZBkjunV2/NaPfM82hBoFaLSSvDZaHH4RN9+trU5zYwHS9LFOW2/ttdl
         eJwqjgl7nXTJDmIstJePRNTw0OdCGvMAa37j2HG1GgphPwHzz913D4spt4R2WHgf1G/U
         /c8luwbPDL9dDlKZrkupk27HMqSlO/cmxpT7RDPB030Q/Rt6P347F4apuRJFXbkWIQun
         TOB1LFPOTu8WwMpZZ0WC/PhTTkZMDBxoFIKAHNqqGHIzAqObQonXOV8pqGq9ye5OCs5f
         uCprAxgcRsfsDzgv8eSuP3rcKat6LeLnld7zMt6k/nR3W8cdlr84+1wgYx1WjZAn/Nrb
         knjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692376943; x=1692981743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Pf4ioyh9XZw5mylCfls7puo726mkZDVdsu5OC0qb4w=;
        b=CQmaPdqgK85+Hr+7oizspEqUZZln2jbQEI5kVoULN+oqXqSHojColZbLTfoYXY9BaV
         hmTfnXlic6b2DazA4btnhWijCyZtiabHTeWdDWgJNVM5G7piTwzu7TnOjvbsRylE8NSm
         kMSNQfh2myPJ2f5EK1dHDOz5DlrOVPEzYMC+/IvlgsmBzG8zYIMde4COme/dloe5izZz
         2yiMGQMVmASW2fWxt4t3ValdDZfqbuCgGqXs61XRyGQsnq2hen/IN2CDSsIwtL7wIOhN
         LCxisy8g7RncR8Pzn4OT7IXQO6UHdZfnLq2Zhr1QyVIaeJrVtFJGnYD8bllNHntEF+sQ
         uJHA==
X-Gm-Message-State: AOJu0YwcPRe7rAyuiOArF5XN9UFcLPy1T8qPSaE1xUdAJqQFveFTLwmd
        F03zRYDlrMCwBsvCFo39gRqLrjX8HWclfa2T/onKrA==
X-Google-Smtp-Source: AGHT+IGiPexSb2adZV3Xmji9yAt0R5sbXYXk+Lfgy77OwfjIs9rFuZ55LCCZQv8F2+GSXd3xmwieHuia00ofwVSTyg0=
X-Received: by 2002:a25:ce0a:0:b0:cf2:a664:688e with SMTP id
 x10-20020a25ce0a000000b00cf2a664688emr3332029ybe.40.1692376943392; Fri, 18
 Aug 2023 09:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230818074509.295220-1-ruanjinjie@huawei.com> <ZN8ptWv6Dn2pdWtF@shell.armlinux.org.uk>
In-Reply-To: <ZN8ptWv6Dn2pdWtF@shell.armlinux.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 18 Aug 2023 18:42:11 +0200
Message-ID: <CACRpkdY=1XOo24u6m1xRxWM_JNUtwQZoomWCTTwgufB7kbPfwg@mail.gmail.com>
Subject: Re: [PATCH -next v2 RESEND] I2C: Fix return value check for devm_pinctrl_get()
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Ruan Jinjie <ruanjinjie@huawei.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, o.rempel@pengutronix.de,
        nicolas.ferre@microchip.com, leoyang.li@nxp.com,
        s.hauer@pengutronix.de,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 18, 2023 at 10:20=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Fri, Aug 18, 2023 at 03:45:08PM +0800, Ruan Jinjie wrote:

> >       i2c_imx->pinctrl =3D devm_pinctrl_get(&pdev->dev);
> > -     if (!i2c_imx->pinctrl || IS_ERR(i2c_imx->pinctrl)) {
> > +     if (IS_ERR(i2c_imx->pinctrl)) {
> >               dev_info(&pdev->dev, "can't get pinctrl, bus recovery not=
 supported\n");
> >               return PTR_ERR(i2c_imx->pinctrl);
> >       }
>
> I haven't looked at the AT91 version, but... isn't the original code
> entirely correct?
>
> If pinctrl is not available (thus devm_pinctrl_get() returns NULL) then
> recovery can't work, because we can't switch the I2C pins between the
> I2C controller and GPIO. So, isn't it quite correct to print
> "can't get pinctrl, bus recovery not supported" because the I2C bus
> can't be recovered without pinctrl?
>
> The PTR_ERR() is also fine - because if pinctrl is not present and
> returns NULL, we'll end up returning zero, which is exactly what we
> want.

Oh, you're probably absolutely right about that.

> The alternative would be to open code that, maybe with a more accurate
> message:
>
>         if (!i2c_imx->pinctrl) {
>                 dev_info(&pdev->dev, "pinctrl unavailable, bus recovery n=
ot supported\n");
>                 return 0;
>         }
>         if (IS_ERR(i2c_imx->pinctrl) {
>                 ...

This is a way better patch. It makes the implicit explicit.

Yours,
Linus Walleij
