Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1BDC787513
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Aug 2023 18:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239359AbjHXQRm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Aug 2023 12:17:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242477AbjHXQRf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Aug 2023 12:17:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6BDC19A9
        for <linux-i2c@vger.kernel.org>; Thu, 24 Aug 2023 09:17:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 45EAF65306
        for <linux-i2c@vger.kernel.org>; Thu, 24 Aug 2023 16:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB957C433C7;
        Thu, 24 Aug 2023 16:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692893852;
        bh=0+M7zoq0WHaVE26wfktTsuEi2A298+WO4r1QiQDwG4s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k1ofjpBNcc4dRn90B5WKLb08p16SeFC9xTy9u29NLMlC024UbTDKTqxk5hmJWPhQU
         XE7tHwb9faZFTwufpIDwY4pb4den+jD6JlO4H80ORcvL4yiYdArO4V9SbvyiGvj3BM
         HF/JlG5ZslPNo03Jh3kE8GqmxW9fDuvXl2Kos8YqrVHHtgsyDWlh4bFTEeCCZdQKSg
         1HPCKCHY8YIqze9BgVU2D5ZrGcurf0oib8QC1nGFsptSmFpaVOQdyZznLsaUbigmLT
         fgaNj9tBt4NvFxHoJ3ZDtv/pqy2TTGUUKYOa/TXV81LALTHxAGG3DcmPzdtY5Ld2g1
         8XSZP45lBNJPw==
Date:   Thu, 24 Aug 2023 18:17:27 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Jinjie Ruan <ruanjinjie@huawei.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk,
        linus.walleij@linaro.org,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
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
Message-ID: <20230824161727.czobz3p4d5bdxtrh@intel.intel>
References: <20230821032914.1976317-1-ruanjinjie@huawei.com>
 <20230824083453.GB31399@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824083453.GB31399@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Thu, Aug 24, 2023 at 10:34:53AM +0200, Oleksij Rempel wrote:
> On Mon, Aug 21, 2023 at 11:29:14AM +0800, Jinjie Ruan wrote:
> > If pinctrl is not available (thus devm_pinctrl_get() returns NULL) then
> > recovery can't work, because we can't switch the I2C pins between the
> > I2C controller and GPIO. So, it is quite correct to print
> > "can't get pinctrl, bus recovery not supported" because the I2C bus
> > can't be recovered without pinctrl.
> > 
> > The PTR_ERR() is also fine - because if pinctrl is not present and
> > returns NULL, we'll end up returning zero, which is exactly what we
> > want.
> > 
> > However, open code that with a more accurate message will be more explicit
> > for NULL case when CONFIG_PINCTRL is not defined.
> > 
> > Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> > Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> > Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
> > ---
> > v3:
> > - Split into two if() statements instead of removing the NULL checks.
> > - Remove the fix tags.
> > - Update the commit title and message.
> > - Update to bring the author's name before.
> > v2:
> > - Remove NULL check instead of using IS_ERR_OR_NULL() to avoid leaving them behind.
> > - Update the commit title and message.
> > ---
> >  drivers/i2c/busses/i2c-at91-master.c | 6 +++++-
> >  drivers/i2c/busses/i2c-imx.c         | 6 +++++-
> >  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
> 
> for the i2c-imx.c

For some reason lore+lei failed to deliver this message to my
inbox :/

Anyway, looks good!

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Thank you, Jinjie for following up.
Andi
