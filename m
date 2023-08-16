Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5955577DE31
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Aug 2023 12:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243727AbjHPKIU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Aug 2023 06:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243784AbjHPKIP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Aug 2023 06:08:15 -0400
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8496E3
        for <linux-i2c@vger.kernel.org>; Wed, 16 Aug 2023 03:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=jS5E3IDC20yQUz3d27cNi5f4Pv23ioPbtrI9hkgtSzc=; b=iMaYJgBeJAMEf9HdYIjCwHAOvR
        QxSI7uColcdNvmfU+YwTm5t5MsXqC/kiCB9i+nukULQBddYA+em7erv2iHXSPNYX7+pfuI65R1ph1
        D3zheN9aJaNBRMHRMdzQkWC29cb/f4arJzikIEhAwVfVpKQb3nzbivlPcLy88ZO+iJ7KwXWx58KZB
        q2M15h+DMa4uiKkw1q9nXO7L7Ei+NZERaMfrACZhZMH29TdkABDx/i9FdboU0gfYkpadsBtgdkMKA
        ZeJvjBRXCi5OS/5RpR+GD1DgBZbR6m91yV8MftrCz0kj+MBHPGXpRcAphERXn6zjf5VkgNm9TgDJS
        /Pceuhow==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45230)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <linux@armlinux.org.uk>)
        id 1qWDRe-0002co-15;
        Wed, 16 Aug 2023 11:08:06 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1qWDRb-0007ut-EU; Wed, 16 Aug 2023 11:08:03 +0100
Date:   Wed, 16 Aug 2023 11:08:03 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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
Subject: Re: [PATCH -next] I2C: Use helper function IS_ERR_OR_NULL()
Message-ID: <ZNygA72nKogZvlG3@shell.armlinux.org.uk>
References: <20230816094618.2854084-1-ruanjinjie@huawei.com>
 <50f61322-de65-1632-d404-7dcfe9a82744@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50f61322-de65-1632-d404-7dcfe9a82744@huawei.com>
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

On Wed, Aug 16, 2023 at 05:48:34PM +0800, Ruan Jinjie wrote:
> 
> 
> On 2023/8/16 17:46, Ruan Jinjie wrote:
> > Use IS_ERR_OR_NULL() instead of open-coding it
> > to simplify the code.
> > 
> > Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> > ---
> >  drivers/i2c/busses/i2c-at91-master.c | 2 +-
> >  drivers/i2c/busses/i2c-imx.c         | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
> > index 94cff1cd527e..0e454c04a145 100644
> > --- a/drivers/i2c/busses/i2c-at91-master.c
> > +++ b/drivers/i2c/busses/i2c-at91-master.c
> > @@ -831,7 +831,7 @@ static int at91_init_twi_recovery_gpio(struct platform_device *pdev,
> >  	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
> >  
> >  	rinfo->pinctrl = devm_pinctrl_get(&pdev->dev);
> > -	if (!rinfo->pinctrl || IS_ERR(rinfo->pinctrl)) {
> > +	if (IS_ERR_OR_NULL(rinfo->pinctrl)) {
> >  		dev_info(dev->dev, "can't get pinctrl, bus recovery not supported\n");
> >  		return PTR_ERR(rinfo->pinctrl);
> >  	}
> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > index 10e89586ca72..8807c90df749 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -1388,7 +1388,7 @@ static int i2c_imx_init_recovery_info(struct imx_i2c_struct *i2c_imx,
> >  	struct i2c_bus_recovery_info *rinfo = &i2c_imx->rinfo;
> >  
> >  	i2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);
> > -	if (!i2c_imx->pinctrl || IS_ERR(i2c_imx->pinctrl)) {
> > +	if (!IS_ERR_OR_NULL(i2c_imx->pinctrl)) {
> 
> Sorry, there is a problem, please ignore it.

I don't think these conversions are appropriate for devm_pinctrl_get().
If one reads the code for devm_pinctrl_get() and pinctrl_get(), then
one finds that it will never return NULL.

So the tests for NULL do not serve any practical purpose than giving
coders a warm fuzzy feeling that they've tested for a NULL pointer.
Practically, they are of no use, so should be removed... thus making
the conversion to IS_ERR_OR_NULL() irrelevant.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
