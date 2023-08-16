Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB7677DE90
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Aug 2023 12:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243870AbjHPKW6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Aug 2023 06:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243888AbjHPKWf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Aug 2023 06:22:35 -0400
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F4001BE6
        for <linux-i2c@vger.kernel.org>; Wed, 16 Aug 2023 03:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=rtmTw3BxJfSzf7/4fecn/q3SQ2mDfYBmxq1I2TSiu/Q=; b=xrq6KGlIJ5Lr0+l+aCtcv5RXoK
        e9dFpbEpJlg30vb55usE5+AzkPghuEIohy8ouFRFoFtNnsGbq0W0KyGRpwxhUIQZahEcagLqv9+Sq
        A6HmNE2dXKT2I7M91m5dSNboH/C8vxx/mWSy0L5mY39BMug+JPB0qvgMyFOhjnHoX+c3BIdgE77EU
        V+ZlYn9sKhzgUij0QSKWoeaBdpid+sO6dp5Oy4kFJIC8mOXrsdtMlV36onai/UEpe7M7ra8ZfpQRU
        b0FS/zqPvq6NJQyF1Zq5FTDIGdXRTl0piMyvA9LQNobcxO6RMWyWvElTC/5kLEOjHWm5thA/7K3gE
        OG5VARBQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44934)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <linux@armlinux.org.uk>)
        id 1qWDfY-0002ei-05;
        Wed, 16 Aug 2023 11:22:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1qWDfY-0007wN-3H; Wed, 16 Aug 2023 11:22:28 +0100
Date:   Wed, 16 Aug 2023 11:22:28 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Yann Sionneau <yann@sionneau.net>
Cc:     Ruan Jinjie <ruanjinjie@huawei.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
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
Message-ID: <ZNyjZFjfIrsxIfn1@shell.armlinux.org.uk>
References: <20230816094618.2854084-1-ruanjinjie@huawei.com>
 <17f4ce7f-5954-519b-fc62-42655d198933@sionneau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17f4ce7f-5954-519b-fc62-42655d198933@sionneau.net>
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

On Wed, Aug 16, 2023 at 11:51:54AM +0200, Yann Sionneau wrote:
> Le 16/08/2023 à 11:46, Ruan Jinjie a écrit :
> 
> > Use IS_ERR_OR_NULL() instead of open-coding it
> > to simplify the code.
> >   	rinfo->pinctrl = devm_pinctrl_get(&pdev->dev);
> > -	if (!rinfo->pinctrl || IS_ERR(rinfo->pinctrl)) {
> > +	if (IS_ERR_OR_NULL(rinfo->pinctrl)) {
> 
> Can the return of devm_pinctrl_get really be NULL?

No.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
