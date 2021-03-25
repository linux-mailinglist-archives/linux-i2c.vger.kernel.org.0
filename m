Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD37B348814
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Mar 2021 05:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhCYEt7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Mar 2021 00:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbhCYEtu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Mar 2021 00:49:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0FBC06174A
        for <linux-i2c@vger.kernel.org>; Wed, 24 Mar 2021 21:49:50 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lPHwF-0001of-4Q; Thu, 25 Mar 2021 05:49:43 +0100
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1lPHwD-0001LY-MX; Thu, 25 Mar 2021 05:49:41 +0100
Date:   Thu, 25 Mar 2021 05:49:41 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: Simplify using devm_clk_get_prepared()
Message-ID: <20210325044941.k6hgn5mxprdnmr3q@pengutronix.de>
References: <20210301135053.1462168-1-u.kleine-koenig@pengutronix.de>
 <20210324201223.75921-1-u.kleine-koenig@pengutronix.de>
 <20210324202232.7pa4vibmhgctvssm@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210324202232.7pa4vibmhgctvssm@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 05:49:02 up 112 days, 18:55, 32 users,  load average: 0.00, 0.03,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Mar 24, 2021 at 09:22:32PM +0100, Uwe Kleine-König wrote:
> On Wed, Mar 24, 2021 at 09:12:23PM +0100, Uwe Kleine-König wrote:
> > devm_clk_get_prepared returns the clk already prepared and the
> > automatically called cleanup cares for unpreparing. So simplify .probe
> > and .remove accordingly.
> > 
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > ---
> > Hello,
> > 
> > this simplification depends on a patch set that introduces
> > devm_clk_get_prepared() and friends.
> > 
> > The most recent version of this patch set can be found at
> > 
> > 	https://lore.kernel.org/r/20210301135053.1462168-1-u.kleine-koenig@pengutronix.de
> > 
> > Unfortunately I didn't get any feedback at all from the clk maintainers
> > on it, so I try to make other maintainers aware of it in the expectation
> > that the simplifications are welcome and so lure the clk maintainers to
> > share their thoughts.
> > 
> > Best regards
> > Uwe
> > 
> >  drivers/i2c/busses/i2c-imx.c | 11 ++---------
> >  1 file changed, 2 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > index b80fdc1f0092..c0e18a6caa38 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -1405,16 +1405,10 @@ static int i2c_imx_probe(struct platform_device *pdev)
> >  	ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
> >  
> >  	/* Get I2C clock */
> > -	i2c_imx->clk = devm_clk_get(&pdev->dev, NULL);
> > +	i2c_imx->clk = devm_clk_get_prepared(&pdev->dev, NULL);
> 
> oops, I got that wrong, this must be devm_clk_get_enabled, not
> devm_clk_get_prepared. So if the clk patches go in, please let me resend
> a fixed patch (or adapt yourself, whatever you prefer).

Hi,

please send fixed version :)

regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
