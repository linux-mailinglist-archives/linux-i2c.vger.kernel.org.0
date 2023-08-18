Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6CFB781422
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Aug 2023 22:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379237AbjHRUKF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Aug 2023 16:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379981AbjHRUKD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Aug 2023 16:10:03 -0400
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACED43C0A
        for <linux-i2c@vger.kernel.org>; Fri, 18 Aug 2023 13:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=mA8j5yOq1jqvSsJ5rvO02vK/LMHfAYuokMDir9h3uqs=; b=0bAtkkDRyIMUGj/v7PSG8ADq77
        q8RpPHa+kPe1zQs2oxFLETrp3rzsMvnltfG/Ic4VZ2oSbR9DdVVINVwrC4JYKN/CmU9iTCdbDa0DJ
        K61tF9Q74SR4QE9eJMl5Z75BE8LPhxruOpVAuXZgxJJjsE+S8mjmj5d0gTAQi2rsxHfuIKiKGs3Y4
        KTmzfVdfUzzfLnfVT8dk4OwSMMHQGzh6/hYgVNkEnWW53d7WyJgcQbIJU1yOnL/g6v0wF4zk3aoRY
        57NCE5k1+y8wls6/7O3G/sxNCXwSIxDVoJl8vWkl5dwt0LqVcGWV2dUGlXu6RPgX6R0h5hrvq/SFc
        AF+QvaMA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47448)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <linux@armlinux.org.uk>)
        id 1qX5n5-00063U-13;
        Fri, 18 Aug 2023 21:09:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1qX5n2-0001wC-7u; Fri, 18 Aug 2023 21:09:48 +0100
Date:   Fri, 18 Aug 2023 21:09:48 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Andi Shyti <andi.shyti@kernel.org>
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
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH -next v2 RESEND] I2C: Fix return value check for
 devm_pinctrl_get()
Message-ID: <ZN/QDI9ZHZAWa575@shell.armlinux.org.uk>
References: <20230818074509.295220-1-ruanjinjie@huawei.com>
 <ZN8ptWv6Dn2pdWtF@shell.armlinux.org.uk>
 <CACRpkdY=1XOo24u6m1xRxWM_JNUtwQZoomWCTTwgufB7kbPfwg@mail.gmail.com>
 <20230818192034.bgjmurn2rp7ngyel@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230818192034.bgjmurn2rp7ngyel@intel.intel>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RDNS_NONE,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 18, 2023 at 09:20:34PM +0200, Andi Shyti wrote:
> Hi,
> 
> On Fri, Aug 18, 2023 at 06:42:11PM +0200, Linus Walleij wrote:
> > On Fri, Aug 18, 2023 at 10:20 AM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > > On Fri, Aug 18, 2023 at 03:45:08PM +0800, Ruan Jinjie wrote:
> > 
> > > >       i2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);
> > > > -     if (!i2c_imx->pinctrl || IS_ERR(i2c_imx->pinctrl)) {
> > > > +     if (IS_ERR(i2c_imx->pinctrl)) {
> > > >               dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
> > > >               return PTR_ERR(i2c_imx->pinctrl);
> > > >       }
> > >
> > > I haven't looked at the AT91 version, but... isn't the original code
> > > entirely correct?
> > >
> > > If pinctrl is not available (thus devm_pinctrl_get() returns NULL) then
> > > recovery can't work, because we can't switch the I2C pins between the
> > > I2C controller and GPIO. So, isn't it quite correct to print
> > > "can't get pinctrl, bus recovery not supported" because the I2C bus
> > > can't be recovered without pinctrl?
> > >
> > > The PTR_ERR() is also fine - because if pinctrl is not present and
> > > returns NULL, we'll end up returning zero, which is exactly what we
> > > want.
> > 
> > Oh, you're probably absolutely right about that.
> > 
> > > The alternative would be to open code that, maybe with a more accurate
> > > message:
> > >
> > >         if (!i2c_imx->pinctrl) {
> > >                 dev_info(&pdev->dev, "pinctrl unavailable, bus recovery not supported\n");
> > >                 return 0;
> > >         }
> > >         if (IS_ERR(i2c_imx->pinctrl) {
> > >                 ...
> > 
> > This is a way better patch. It makes the implicit explicit.
> 
> we could also use
> 
> 	if (IS_ERR_OR_NULL(i2c_imx->pinctrl))
> 		...
> 
> without changing any logic in the driver.

IS_ERR_OR_NULL() - is a macro I personally hate, it causes a lot of
trouble. I have mutt setup to mark IS_ERR_OR_NULL with a red background
so it stands out in patches. It is utterly evil, and I really wish we
could get rid of that damn macro.

It also looks wrong.

	if (IS_ERR_OR_NULL(x))
		return PTR_ERR(x);

rings alarm bells for some people, because if x is NULL, then
PTR_ERR(x) is zero.

While this may be what is intended in this case, for a great many
places in the kernel, this is a bug. So I can guarantee that
_someone_ will come along and want to "fix" that to make the NULL
case return an error code, and in doing so end up breaking the
driver.

So... no, just don't.

This is why having two if() statements are a good idea, and is
what Linus means by "making the implicit explicit" - because it
then becomes absolutely obvious what we want to do in the NULL
case, and what we want to do in the error case.

There is none of this ambiguity that I point out above.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
