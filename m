Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9ADF780702
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Aug 2023 10:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237446AbjHRIUd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Aug 2023 04:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358557AbjHRIUS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Aug 2023 04:20:18 -0400
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF3F2684
        for <linux-i2c@vger.kernel.org>; Fri, 18 Aug 2023 01:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=owpgb5l/lxuxepAaApb9Hlae+aWMk7hqPLR/YcXjBK0=; b=b+Wia7Y2Sb+DLz7GFyL7e7dNRF
        btSEw8VOxVMSMoqWr8HbRvseHpA2lHDL5Lf6OYswtryIOjZrh5xgPq0xzE5yUpBJ8TDgrMcVnnYzQ
        S4U2LdptlrGzRN+kA21b08foJsTJHCUh00/lVpOMS7f4CC4bfP3hMxIpNGwg4K+0EXrCh9Ywm47PU
        d/sbScrd04aSDJUL/tTzjtH/D2owtcVvxaLd9lxvKJ0DTFHFWG6LwB2JRMVSl8ZTGJqT48+a6sMqv
        nqk+1nDwb/TkRRL8kasuGpj+5s4veAljEan96agfUoNVJQAM7qWRzUx4g/DB+fEC0wzCJ9PqMjNwD
        raBsalfg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60982)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <linux@armlinux.org.uk>)
        id 1qWuiG-0005Jc-10;
        Fri, 18 Aug 2023 09:20:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1qWuiD-0001TD-9m; Fri, 18 Aug 2023 09:20:05 +0100
Date:   Fri, 18 Aug 2023 09:20:05 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        o.rempel@pengutronix.de, linus.walleij@linaro.org,
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
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH -next v2 RESEND] I2C: Fix return value check for
 devm_pinctrl_get()
Message-ID: <ZN8ptWv6Dn2pdWtF@shell.armlinux.org.uk>
References: <20230818074509.295220-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230818074509.295220-1-ruanjinjie@huawei.com>
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

On Fri, Aug 18, 2023 at 03:45:08PM +0800, Ruan Jinjie wrote:
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 10e89586ca72..05d55893f04e 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1388,7 +1388,7 @@ static int i2c_imx_init_recovery_info(struct imx_i2c_struct *i2c_imx,
>  	struct i2c_bus_recovery_info *rinfo = &i2c_imx->rinfo;
>  
>  	i2c_imx->pinctrl = devm_pinctrl_get(&pdev->dev);
> -	if (!i2c_imx->pinctrl || IS_ERR(i2c_imx->pinctrl)) {
> +	if (IS_ERR(i2c_imx->pinctrl)) {
>  		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not supported\n");
>  		return PTR_ERR(i2c_imx->pinctrl);
>  	}

I haven't looked at the AT91 version, but... isn't the original code
entirely correct?

If pinctrl is not available (thus devm_pinctrl_get() returns NULL) then
recovery can't work, because we can't switch the I2C pins between the
I2C controller and GPIO. So, isn't it quite correct to print
"can't get pinctrl, bus recovery not supported" because the I2C bus
can't be recovered without pinctrl?

The PTR_ERR() is also fine - because if pinctrl is not present and
returns NULL, we'll end up returning zero, which is exactly what we
want.

The alternative would be to open code that, maybe with a more accurate
message:

	if (!i2c_imx->pinctrl) {
		dev_info(&pdev->dev, "pinctrl unavailable, bus recovery not supported\n");
		return 0;
	}
	if (IS_ERR(i2c_imx->pinctrl) {
		...

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
