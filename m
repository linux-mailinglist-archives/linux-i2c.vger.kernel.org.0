Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37185786A35
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Aug 2023 10:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbjHXIf3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Aug 2023 04:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240573AbjHXIfI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Aug 2023 04:35:08 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E02051996
        for <linux-i2c@vger.kernel.org>; Thu, 24 Aug 2023 01:35:02 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1qZ5nq-0002gQ-NO; Thu, 24 Aug 2023 10:34:54 +0200
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1qZ5np-0000Hv-3Z; Thu, 24 Aug 2023 10:34:53 +0200
Date:   Thu, 24 Aug 2023 10:34:53 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Jinjie Ruan <ruanjinjie@huawei.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux@armlinux.org.uk, linus.walleij@linaro.org,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH -next v3] I2C: Make return value check more accurate and
 explicit for devm_pinctrl_get()
Message-ID: <20230824083453.GB31399@pengutronix.de>
References: <20230821032914.1976317-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230821032914.1976317-1-ruanjinjie@huawei.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 21, 2023 at 11:29:14AM +0800, Jinjie Ruan wrote:
> If pinctrl is not available (thus devm_pinctrl_get() returns NULL) then
> recovery can't work, because we can't switch the I2C pins between the
> I2C controller and GPIO. So, it is quite correct to print
> "can't get pinctrl, bus recovery not supported" because the I2C bus
> can't be recovered without pinctrl.
> 
> The PTR_ERR() is also fine - because if pinctrl is not present and
> returns NULL, we'll end up returning zero, which is exactly what we
> want.
> 
> However, open code that with a more accurate message will be more explicit
> for NULL case when CONFIG_PINCTRL is not defined.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
> ---
> v3:
> - Split into two if() statements instead of removing the NULL checks.
> - Remove the fix tags.
> - Update the commit title and message.
> - Update to bring the author's name before.
> v2:
> - Remove NULL check instead of using IS_ERR_OR_NULL() to avoid leaving them behind.
> - Update the commit title and message.
> ---
>  drivers/i2c/busses/i2c-at91-master.c | 6 +++++-
>  drivers/i2c/busses/i2c-imx.c         | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

for the i2c-imx.c

Thank you!

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
