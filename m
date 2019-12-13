Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 152B911E255
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 11:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbfLMKvH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 05:51:07 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:45278 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfLMKvH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Dec 2019 05:51:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=eE4y8gsP10bYUZzcVYOhJBg5DwSCvVSdn/DLmbL2E+c=; b=KG2Q9xxGPQbHwOnzaFTeiWqv4
        MuzEQ0Mo63HBPb6xDidwbS+UxlTKXjYsOz5Rre7ybDEqTIEhVtAKLNr1ynkXWlvSi3D/arx+JZ3N8
        YFBKUjVbMACt0wP04qZzq8vO4IXjdYdPZvE4DDM2iLkIhHZfUO8Fo8RMiC4o/34LinF5a0dYucLi5
        TUwavlFDK6tAG9W9VyaXt4fHQKB/1TlRbEl4ThYBvfIarfWAbrEv9SnX6mZSfDGv9kzpGfu41OeWM
        mhO3sEVGlWYM283yIdijjSph58GOP4dp39WCnfVWjx3iAQbtNao5IQCMJd9Hio/TQ/WHsaLpyk+M/
        tceFikAqw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52398)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1ifiX7-0004Il-Di; Fri, 13 Dec 2019 10:50:53 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1ifiX0-0007pM-S5; Fri, 13 Dec 2019 10:50:46 +0000
Date:   Fri, 13 Dec 2019 10:50:46 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Peng Ma <peng.ma@nxp.com>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        Abel Vesa <abel.vesa@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Bogdan Florin Vlad <bogdan.vlad@nxp.com>,
        BOUGH CHEN <haibo.chen@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Fancy Fang <chen.fang@nxp.com>, Han Xu <han.xu@nxp.com>,
        Horia Geanta <horia.geanta@nxp.com>,
        Iuliana Prodan <iuliana.prodan@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Joakim Zhang <qiangqing.zhang@nxp.com>,
        Jun Li <jun.li@nxp.com>, Leo Zhang <leo.zhang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Mircea Pop <mircea.pop@nxp.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Peter Chen <peter.chen@nxp.com>,
        Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Robin Gong <yibin.gong@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Viorel Suman <viorel.suman@nxp.com>,
        Ying Liu <victor.liu@nxp.com>,
        Zening Wang <zening.wang@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [EXT] Re: [PATCH] i2c: imx: Defer probing if EDMA not available
Message-ID: <20191213105046.GQ25745@shell.armlinux.org.uk>
References: <20191127071136.5240-1-peng.ma@nxp.com>
 <20191128100613.GI25745@shell.armlinux.org.uk>
 <VI1PR04MB4431CF7F051F9439C84F84FAED5A0@VI1PR04MB4431.eurprd04.prod.outlook.com>
 <20191211104347.GA25745@shell.armlinux.org.uk>
 <VI1PR04MB44313AA19A4F81BA1AD9BC5CED5A0@VI1PR04MB4431.eurprd04.prod.outlook.com>
 <20191211114230.GC25745@shell.armlinux.org.uk>
 <VI1PR04MB4431DF2E270FC45A6CC878A9ED550@VI1PR04MB4431.eurprd04.prod.outlook.com>
 <20191212105857.GE25745@shell.armlinux.org.uk>
 <VI1PR04MB44318D7C92B6A29D04840B0DED540@VI1PR04MB4431.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1PR04MB44318D7C92B6A29D04840B0DED540@VI1PR04MB4431.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 13, 2019 at 10:33:51AM +0000, Peng Ma wrote:
> 
> 
> >-----Original Message-----
> >From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
> >Sent: 2019年12月12日 18:59
> >To: Peng Ma <peng.ma@nxp.com>
> >Cc: shawnguo@kernel.org; s.hauer@pengutronix.de;
> >linux-kernel@vger.kernel.org; linux@rempel-privat.de; Abel Vesa
> ><abel.vesa@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>; Anson Huang
> ><anson.huang@nxp.com>; Bogdan Florin Vlad <bogdan.vlad@nxp.com>;
> >BOUGH CHEN <haibo.chen@nxp.com>; Clark Wang
> ><xiaoning.wang@nxp.com>; Daniel Baluta <daniel.baluta@nxp.com>; Fancy
> >Fang <chen.fang@nxp.com>; Han Xu <han.xu@nxp.com>; Horia Geanta
> ><horia.geanta@nxp.com>; Iuliana Prodan <iuliana.prodan@nxp.com>; Jacky
> >Bai <ping.bai@nxp.com>; Joakim Zhang <qiangqing.zhang@nxp.com>; Jun Li
> ><jun.li@nxp.com>; Leo Zhang <leo.zhang@nxp.com>; Leonard Crestez
> ><leonard.crestez@nxp.com>; Mircea Pop <mircea.pop@nxp.com>; Mirela
> >Rabulea <mirela.rabulea@nxp.com>; Peng Fan <peng.fan@nxp.com>; Peter
> >Chen <peter.chen@nxp.com>; Ranjani Vaidyanathan
> ><ranjani.vaidyanathan@nxp.com>; Robert Chiras <robert.chiras@nxp.com>;
> >Robin Gong <yibin.gong@nxp.com>; Shenwei Wang
> ><shenwei.wang@nxp.com>; Viorel Suman <viorel.suman@nxp.com>; Ying Liu
> ><victor.liu@nxp.com>; Zening Wang <zening.wang@nxp.com>;
> >kernel@pengutronix.de; festevam@gmail.com;
> >linux-arm-kernel@lists.infradead.org; linux-i2c@vger.kernel.org
> >Subject: Re: [EXT] Re: [PATCH] i2c: imx: Defer probing if EDMA not available
> >
> >Caution: EXT Email
> >
> >On Thu, Dec 12, 2019 at 03:09:32AM +0000, Peng Ma wrote:
> >> Hello Russell,
> >>
> >> Thanks very much for your strict guidance and comments.
> >> I realized it is hard to us that we want to i2c used edma when edma
> >> probe after i2c probe.
> >
> >I have no problem with that aim.  I'm just very concerned by the proposed
> >implementation, especially when it has already been proven to cause
> >regressions in the kernel. I seem to remember that the infinite loop caused
> >other issues, such as the system being unable to complete booting.
> >
> >> I look forward to discussing with you as below, if you like.
> >> Thanks.
> >>
> >> You say I could do this:
> >> "So, if you want to do this (and yes, I'd also encourage it to be
> >> conditional on EDMA being built-in, as I2C is commonly used as a way
> >> to get at RTCs, which are read before kernel modules can be loaded)
> >> then you MUST move
> >> i2c_imx_dma_request() before
> >> i2c_add_numbered_adapter() to avoid the infinite loop."
> >>
> >> Even if I do this, It's hard to avoid the infinite loop of i2c probe caused by
> >EDMA(build-in) initialization failure.
> >
> >It isn't clear what you mean here.
> >
> >If EDMA fails to probe (because fsl_edma_probe() returns an error other than
> >EPROBE_DEFER) then of_dma_find_controller() will return NULL. That will be
> >propagated down through i2c_imx_dma_request(). This is no different from the
> >case where EDMA is built as a module. It is also no different from the case
> >where EDMA hasn't yet been probed.
> >
> Hello Russell,
> 
> The result of my test is not like that, It is still with probe loop, the test config as follows:

So you haven't tested the scenario that causes the problem.  How
convenient for you.

> 1.EDMA build-in
> 2.return -EINVAL top of fsl_edma_probe when edma probe
> 3.i2c probe with original patch, I put the i2c_imx_dma_request in front of i2c_add_numbered_adapter or used original patch.
> 
> I send you the function of_dma_request_slave_channel could explain it last mail,
> "Return -EPROBE_DEFER" depends on:
> 1. edma not probe or probe failed
> 2. There is edma node in DTS and I2C with edma property

Correct.

I'm sorry, but my patience is wearing very thin. I've explained the
problem in detail, I've explained how you can reproduce it, but it
seems I'm not being listened to. So, I don't have anything further to
add to this discussion that hasn't already been said.

Consider any patch that adds *any* path that can return -EPROBE_DEFER
after a successful call to i2c_add_numbered_adapter() or its similar
functions to be NAK'd by myself on account of this infinite probe loop
that has been proven in previous kernels to occur.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
