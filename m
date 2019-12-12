Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C54F211CB9B
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2019 11:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728862AbfLLK7N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Dec 2019 05:59:13 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:56934 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728777AbfLLK7N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Dec 2019 05:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=NVAO4NsxMosCRBEylhmBkoWn6ov2knzY5pHJsDnfa7I=; b=dxnweIl6bWU44iMtkgtbb38WH
        6Vgw7Mw7Cu9YmlufX1PCxC7DkzrkiObt0ibqAu2qHWg8CWherkYCL/OOlpK/Hcco8xv4lK3oG+iuW
        zNhtrtSGbIbEf9d1Ej2O93OhTmuzb5Bf1Pxw0qBtg6hPgwJbak5e9FYncgBY/8zWdbQGGbnkxuXC+
        Bq3GMPxQQJiIb6VsUisaqLrr+MMCKiche4wSnBWEabM0Ot9YzV3mUuFNUAfy4CSFfE9vu+Q4O7obn
        o8yEl0cgPKmybjZEMxc+ffqN60M781lzWdLro9IA37tup/D2o+EZM+Ig97HD2+De7HLoOoWVZY4An
        R3IdArweg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51932)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1ifMBS-00069r-91; Thu, 12 Dec 2019 10:59:02 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1ifMBN-0006gn-MP; Thu, 12 Dec 2019 10:58:57 +0000
Date:   Thu, 12 Dec 2019 10:58:57 +0000
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
Message-ID: <20191212105857.GE25745@shell.armlinux.org.uk>
References: <20191127071136.5240-1-peng.ma@nxp.com>
 <20191128100613.GI25745@shell.armlinux.org.uk>
 <VI1PR04MB4431CF7F051F9439C84F84FAED5A0@VI1PR04MB4431.eurprd04.prod.outlook.com>
 <20191211104347.GA25745@shell.armlinux.org.uk>
 <VI1PR04MB44313AA19A4F81BA1AD9BC5CED5A0@VI1PR04MB4431.eurprd04.prod.outlook.com>
 <20191211114230.GC25745@shell.armlinux.org.uk>
 <VI1PR04MB4431DF2E270FC45A6CC878A9ED550@VI1PR04MB4431.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR04MB4431DF2E270FC45A6CC878A9ED550@VI1PR04MB4431.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 12, 2019 at 03:09:32AM +0000, Peng Ma wrote:
> Hello Russell,
> 
> Thanks very much for your strict guidance and comments.
> I realized it is hard to us that we want to i2c used edma when edma
> probe after i2c probe.

I have no problem with that aim.  I'm just very concerned by the
proposed implementation, especially when it has already been proven
to cause regressions in the kernel. I seem to remember that the
infinite loop caused other issues, such as the system being unable
to complete booting.

> I look forward to discussing with you as below, if you like.
> Thanks.
> 
> You say I could do this:
> "So, if you want to do this (and yes, I'd also encourage it to be
> conditional on EDMA being built-in, as I2C is commonly used as a way
> to get at RTCs, which are read before kernel modules can be loaded)
> then you MUST move
> i2c_imx_dma_request() before
> i2c_add_numbered_adapter() to avoid the infinite loop."
> 
> Even if I do this, It's hard to avoid the infinite loop of i2c probe caused by EDMA(build-in) initialization failure.

It isn't clear what you mean here.

If EDMA fails to probe (because fsl_edma_probe() returns an error other
than EPROBE_DEFER) then of_dma_find_controller() will return NULL. That
will be propagated down through i2c_imx_dma_request(). This is no
different from the case where EDMA is built as a module. It is also no
different from the case where EDMA hasn't yet been probed.

If i2c_imx_dma_request() is placed after i2c_add_numbered_adapter(),
and EPROBE_DEFER is propagated out of i2c_imx_probe(), then _yes_, it
will cause an infinite loop, because you are replicating the exact
conditions that caused the attempt to propagate i2c_imx_dma_request()'s
return value to be reverted last time - which brought the kernel to a
grinding halt.

If i2c_imx_dma_request() is placed before i2c_add_numbered_adapter(),
then there is no infinite deferred probing loop - yes, i2c_imx_probe()
will be called as a result of other drivers successfully probing, and
each time it will return EPROBE_DEFER, but the _key_ point is that
the action of i2c_imx_probe() will not _self trigger_ the deferred
probing _and_ place itself onto the deferred probe list.

Please, rather than continuing to send emails arguing over this point,
investigate the stated issue with some practical tests:

1. Make i2c_imx_probe() propagate i2c_imx_dma_request()'s return value,
   as it did in the original patch.
2. Build i2c-imx into the kernel.
3. Build edma as a module.
4. Build and test boot the kernel and check what happens.
5. Move i2c_imx_dma_request() before i2c_add_numbered_adapter()
6. Build and test boot the resulting kernel and note any differences.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
