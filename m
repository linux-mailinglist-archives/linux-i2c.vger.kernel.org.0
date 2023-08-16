Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58F3B77DE91
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Aug 2023 12:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243872AbjHPKXb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Aug 2023 06:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243884AbjHPKXI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Aug 2023 06:23:08 -0400
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51595E4F
        for <linux-i2c@vger.kernel.org>; Wed, 16 Aug 2023 03:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=htrA3OxmbZUL7P6UZG4IRIeImFj/3Dwvk5s9T3+PzlE=; b=VB4YbKSJw6GEsv+7DHFvUP850C
        +VjET/ah0OoarrODS9Hn80/jRj1fzMTONtK6D5a5UHHnX+ka8iFhshM2Zc5TPpfWKvWaeoaQql9T3
        xo0dRMGqs2dmFbUcnGSTFXVsr6sePO9PCjsve3X2yU8hWs+i02Zs120BTAWO6PCKoDEHW5NK/hEUl
        WcvfiIFn4RbmVmOUTata/Fl9Ow2YIxmNeupr5nbHNUIsW64QFMOM/2/1B0ufgDCxRquFDyYgS021c
        kY+01In9FSYm+8RkWzuosczTiYE3Vpr3az6EzDX5l6q4Z7WrpbSaadMn70p1DF3GTZvPk2CmTPjzP
        tuZVmqIA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50604)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <linux@armlinux.org.uk>)
        id 1qWDg6-0002f8-2o;
        Wed, 16 Aug 2023 11:23:02 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1qWDg6-0007wU-KG; Wed, 16 Aug 2023 11:23:02 +0100
Date:   Wed, 16 Aug 2023 11:23:02 +0100
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
Subject: Re: [PATCH -next RESEND] I2C: Use helper function IS_ERR_OR_NULL()
Message-ID: <ZNyjhnvr606OeI7H@shell.armlinux.org.uk>
References: <20230816095127.2892792-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816095127.2892792-1-ruanjinjie@huawei.com>
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

On Wed, Aug 16, 2023 at 05:51:27PM +0800, Ruan Jinjie wrote:
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

NAK for the reasons mentioned previously. Please instead remove the
unnecessary test for NULL.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
