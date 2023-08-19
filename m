Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB29F781A35
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Aug 2023 16:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbjHSOpk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Aug 2023 10:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233640AbjHSOpj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Aug 2023 10:45:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C6D22A32
        for <linux-i2c@vger.kernel.org>; Sat, 19 Aug 2023 07:45:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E41F560FEC
        for <linux-i2c@vger.kernel.org>; Sat, 19 Aug 2023 14:45:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986DBC433C7;
        Sat, 19 Aug 2023 14:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692456337;
        bh=rovHH8cqXWceDGBoXOGHUjf5ibZD9QoBrvgIUJLlbgs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hKqXh36537x/f4OTuAYnWAYSbAyRIXTICjrqzgMT5tgyE4lZGXVeBvkj6KIzfH4NM
         iaomUXVQaU3eoe7KBl5cfNQD52E7x/jZN+qo4GuNKkC42x5+yKE9HapR15nVBMhbRc
         RY7dvI8JUqgC8gKGXRodJbM1CemvbWzSiNI9ImFKnKrEN6O/uKTAvbtbQLfPu3Fd3c
         OzjSjwf1175s7yuvPqZ2ljUk6UToxgUcghgwipMEb+2QP3U0l7tjQNVOKb98pu0Gug
         HEPRbRpe8umd8u623QDb1H+qot4a7oeBIBSJVeEELR3OHLB8iod/mE01nbEBJahVvx
         L7EjPC3Gcctvw==
Date:   Sat, 19 Aug 2023 16:45:33 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ruan Jinjie <ruanjinjie@huawei.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, o.rempel@pengutronix.de,
        nicolas.ferre@microchip.com, leoyang.li@nxp.com,
        s.hauer@pengutronix.de,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH -next v2 RESEND] I2C: Fix return value check for
 devm_pinctrl_get()
Message-ID: <20230819144533.dc3t777ggcnfq3rh@intel.intel>
References: <20230818074509.295220-1-ruanjinjie@huawei.com>
 <ZN8ptWv6Dn2pdWtF@shell.armlinux.org.uk>
 <CACRpkdY=1XOo24u6m1xRxWM_JNUtwQZoomWCTTwgufB7kbPfwg@mail.gmail.com>
 <20230818192034.bgjmurn2rp7ngyel@intel.intel>
 <ZN/QDI9ZHZAWa575@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZN/QDI9ZHZAWa575@shell.armlinux.org.uk>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Russel,

> > > > >       i2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);
> > > > > -     if (!i2c_imx->pinctrl || IS_ERR(i2c_imx->pinctrl)) {
> > > > > +     if (IS_ERR(i2c_imx->pinctrl)) {
> > > > >               dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
> > > > >               return PTR_ERR(i2c_imx->pinctrl);
> > > > >       }
> > > >
> > > > I haven't looked at the AT91 version, but... isn't the original code
> > > > entirely correct?
> > > >
> > > > If pinctrl is not available (thus devm_pinctrl_get() returns NULL) then
> > > > recovery can't work, because we can't switch the I2C pins between the
> > > > I2C controller and GPIO. So, isn't it quite correct to print
> > > > "can't get pinctrl, bus recovery not supported" because the I2C bus
> > > > can't be recovered without pinctrl?
> > > >
> > > > The PTR_ERR() is also fine - because if pinctrl is not present and
> > > > returns NULL, we'll end up returning zero, which is exactly what we
> > > > want.
> > > 
> > > Oh, you're probably absolutely right about that.
> > > 
> > > > The alternative would be to open code that, maybe with a more accurate
> > > > message:
> > > >
> > > >         if (!i2c_imx->pinctrl) {
> > > >                 dev_info(&pdev->dev, "pinctrl unavailable, bus recovery not supported\n");
> > > >                 return 0;
> > > >         }
> > > >         if (IS_ERR(i2c_imx->pinctrl) {
> > > >                 ...
> > > 
> > > This is a way better patch. It makes the implicit explicit.
> > 
> > we could also use
> > 
> > 	if (IS_ERR_OR_NULL(i2c_imx->pinctrl))
> > 		...
> > 
> > without changing any logic in the driver.
> 
> IS_ERR_OR_NULL() - is a macro I personally hate, it causes a lot of
> trouble. I have mutt setup to mark IS_ERR_OR_NULL with a red background
> so it stands out in patches. It is utterly evil, and I really wish we
> could get rid of that damn macro.
> 
> It also looks wrong.
> 
> 	if (IS_ERR_OR_NULL(x))
> 		return PTR_ERR(x);
> 
> rings alarm bells for some people, because if x is NULL, then
> PTR_ERR(x) is zero.
> 
> While this may be what is intended in this case, for a great many
> places in the kernel, this is a bug. So I can guarantee that
> _someone_ will come along and want to "fix" that to make the NULL
> case return an error code, and in doing so end up breaking the
> driver.
> 
> So... no, just don't.
> 
> This is why having two if() statements are a good idea, and is
> what Linus means by "making the implicit explicit" - because it
> then becomes absolutely obvious what we want to do in the NULL
> case, and what we want to do in the error case.
> 
> There is none of this ambiguity that I point out above.

Yes, I fully agree, IS_ERR_OR_NULL() shoud be almost never be
used in an exit path (unless you are in a void function and few
other cases, like (borderline) this one).

I'm OK also if Ruan goes with what you suggested.

Andi
