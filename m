Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1855877DE8C
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Aug 2023 12:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243861AbjHPKW0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Aug 2023 06:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243884AbjHPKWJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Aug 2023 06:22:09 -0400
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C01B5E7C
        for <linux-i2c@vger.kernel.org>; Wed, 16 Aug 2023 03:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=WWV/9y0xwOKfnJhNG1dl4bNZQhd6Mi2M16eWJXnMtHw=; b=gn5z4O79L5YuZvRg+C9dwtyS+W
        spwMEXwxzdaz9I7BqduJevmMfL8X1R32w5JQ0n0VREB8qe7vI9HQKZA2IYxxy2VLapzF4rwR7AuMU
        HYkg8e0ZWENmI2CqfxJrOvUInBlSpaMGE6v/S7Q7grMy6E3IzuSV3MSTj1SyoIs1Qxpa0dTCg/BVm
        rQUJEA2oUQm0NnYGqUuCvi0PapTKqRATc5PAv+iW1pDDhQs/p7/lxuhhhvBxqbp0Dc0b4aZudsZiA
        Cb8p8Mi3Vtz/0xuKMlrVrZVdCyk1Nc6U3absMv+hyIuo2QqB+bXTfEo0iEXoydhDU0Tm341t40p8b
        n918v9cA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53150)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <linux@armlinux.org.uk>)
        id 1qWDf8-0002eK-0g;
        Wed, 16 Aug 2023 11:22:02 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1qWDf6-0007wF-4P; Wed, 16 Aug 2023 11:22:00 +0100
Date:   Wed, 16 Aug 2023 11:22:00 +0100
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
Message-ID: <ZNyjSO5OFNWOshii@shell.armlinux.org.uk>
References: <20230816094618.2854084-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816094618.2854084-1-ruanjinjie@huawei.com>
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

On Wed, Aug 16, 2023 at 05:46:18PM +0800, Ruan Jinjie wrote:
> Use IS_ERR_OR_NULL() instead of open-coding it
> to simplify the code.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/i2c/busses/i2c-at91-master.c | 2 +-
>  drivers/i2c/busses/i2c-imx.c         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
> index 94cff1cd527e..0e454c04a145 100644
> --- a/drivers/i2c/busses/i2c-at91-master.c
> +++ b/drivers/i2c/busses/i2c-at91-master.c
> @@ -831,7 +831,7 @@ static int at91_init_twi_recovery_gpio(struct platform_device *pdev,
>  	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
>  
>  	rinfo->pinctrl = devm_pinctrl_get(&pdev->dev);
> -	if (!rinfo->pinctrl || IS_ERR(rinfo->pinctrl)) {
> +	if (IS_ERR_OR_NULL(rinfo->pinctrl)) {
>  		dev_info(dev->dev, "can't get pinctrl, bus recovery not supported\n");
>  		return PTR_ERR(rinfo->pinctrl);
>  	}
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 10e89586ca72..8807c90df749 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1388,7 +1388,7 @@ static int i2c_imx_init_recovery_info(struct imx_i2c_struct *i2c_imx,
>  	struct i2c_bus_recovery_info *rinfo = &i2c_imx->rinfo;
>  
>  	i2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);
> -	if (!i2c_imx->pinctrl || IS_ERR(i2c_imx->pinctrl)) {
> +	if (!IS_ERR_OR_NULL(i2c_imx->pinctrl)) {
>  		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
>  		return PTR_ERR(i2c_imx->pinctrl);
>  	}

As stated in my previous reply to a similar patch, devm_pinctrl_get()
can not return NULL, so it makes more sense to remove the test for NULL
rather than "cleaning up" the buggy code, but leaving the bugs behind.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
