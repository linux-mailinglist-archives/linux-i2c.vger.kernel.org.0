Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54496781356
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Aug 2023 21:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349085AbjHRTVO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Aug 2023 15:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379627AbjHRTUl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Aug 2023 15:20:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA663C31
        for <linux-i2c@vger.kernel.org>; Fri, 18 Aug 2023 12:20:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8A04060B55
        for <linux-i2c@vger.kernel.org>; Fri, 18 Aug 2023 19:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C35C433C8;
        Fri, 18 Aug 2023 19:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692386439;
        bh=qByebR89QmmybgGibelofE7MQH9WyYKDnVrR3HgPI1g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TlpRH4hFovkmof6hxHaING05VUqHYSGo9ZgoaHYew51vvI3hHLqnhQ20cJDpJdK04
         6CznugI4gmJYwFIocSXL96MT4x2uNNgPU7Xsb6n4nvHn+uIqOTbYewBzlyTywhZWZl
         2yDt1da6l8BXDn0gbo8TE76fyqLdJuUm9aCLat/J2dnom9m6B2arMg7JavWxV2gtpD
         w8QC0lK2t8W8GTSHZKE4xeEwh3JnKg5zov0cEFaJp21yBLTvej21RX6ITck+yJ8Q8n
         fi6S1bF5dvEtE5CgrTO87nTawLPjhAvUuu5GpFgyjXMIp1YIgRZSurlC+psBOYoH9w
         eIhgLdz1vzuww==
Date:   Fri, 18 Aug 2023 21:20:34 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
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
Message-ID: <20230818192034.bgjmurn2rp7ngyel@intel.intel>
References: <20230818074509.295220-1-ruanjinjie@huawei.com>
 <ZN8ptWv6Dn2pdWtF@shell.armlinux.org.uk>
 <CACRpkdY=1XOo24u6m1xRxWM_JNUtwQZoomWCTTwgufB7kbPfwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdY=1XOo24u6m1xRxWM_JNUtwQZoomWCTTwgufB7kbPfwg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Fri, Aug 18, 2023 at 06:42:11PM +0200, Linus Walleij wrote:
> On Fri, Aug 18, 2023 at 10:20 AM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > On Fri, Aug 18, 2023 at 03:45:08PM +0800, Ruan Jinjie wrote:
> 
> > >       i2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);
> > > -     if (!i2c_imx->pinctrl || IS_ERR(i2c_imx->pinctrl)) {
> > > +     if (IS_ERR(i2c_imx->pinctrl)) {
> > >               dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
> > >               return PTR_ERR(i2c_imx->pinctrl);
> > >       }
> >
> > I haven't looked at the AT91 version, but... isn't the original code
> > entirely correct?
> >
> > If pinctrl is not available (thus devm_pinctrl_get() returns NULL) then
> > recovery can't work, because we can't switch the I2C pins between the
> > I2C controller and GPIO. So, isn't it quite correct to print
> > "can't get pinctrl, bus recovery not supported" because the I2C bus
> > can't be recovered without pinctrl?
> >
> > The PTR_ERR() is also fine - because if pinctrl is not present and
> > returns NULL, we'll end up returning zero, which is exactly what we
> > want.
> 
> Oh, you're probably absolutely right about that.
> 
> > The alternative would be to open code that, maybe with a more accurate
> > message:
> >
> >         if (!i2c_imx->pinctrl) {
> >                 dev_info(&pdev->dev, "pinctrl unavailable, bus recovery not supported\n");
> >                 return 0;
> >         }
> >         if (IS_ERR(i2c_imx->pinctrl) {
> >                 ...
> 
> This is a way better patch. It makes the implicit explicit.

we could also use

	if (IS_ERR_OR_NULL(i2c_imx->pinctrl))
		...

without changing any logic in the driver.

Andi
