Return-Path: <linux-i2c+bounces-8647-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F519F8BE0
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 06:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3EFE1654CE
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 05:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7BB86334;
	Fri, 20 Dec 2024 05:33:00 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255072594AC
	for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 05:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734672780; cv=none; b=Bz95XLGmhJxVxa1ulP9iXbwtiua1iXkVphHv9YCVUY15QoEvB2+n0oe0x7TvLRC7S6e/Xmb6NgF7FryPynhEb8LX2frv/58IaDgWwAyibj65/QVCBf99ZexDvp9wBrLtcQXgrpZ694ligSZQhGQERBBIXW9pKk4hg3s8eRu1WtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734672780; c=relaxed/simple;
	bh=CYzK+YHTueOUXe5bmj9mYRlA1EYg4KwTwwRjYq1oY68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1u7w0xNdtcHUumrS33nCTA24WguxOHfDHa9ky/V1Mu+08rYrdiVGPF+lKTISRkAMAjdapeiVbxA/agn4+3NOXOFn0Bqqwev+s0ifEZ4UT8u5IN2JwyEHXwMDZpB+Fe2q6ZrTvusdp+/zt/+db0HBJqQbsTaijei80FMqOe5xvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tOVcz-0004FO-Sr; Fri, 20 Dec 2024 06:32:45 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tOVcy-004K8x-2S;
	Fri, 20 Dec 2024 06:32:45 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tOVcz-00AMOy-1O;
	Fri, 20 Dec 2024 06:32:45 +0100
Date: Fri, 20 Dec 2024 06:32:45 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Frank Li <frank.li@nxp.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v5] i2c: imx: support DMA defer probing
Message-ID: <Z2UBfcq6pE-JMUrb@pengutronix.de>
References: <20241218043541.143194-1-carlos.song@nxp.com>
 <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
 <Z2QQI2gJNLjI-fam@pengutronix.de>
 <AM0PR0402MB3937C9A79C55BF4C279F8099E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AM0PR0402MB3937C9A79C55BF4C279F8099E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Fri, Dec 20, 2024 at 02:45:09AM +0000, Carlos Song wrote:
> 
> 
> > -----Original Message-----
> > From: Oleksij Rempel <o.rempel@pengutronix.de>
> > Sent: Thursday, December 19, 2024 8:23 PM
> > To: Andi Shyti <andi.shyti@kernel.org>
> > Cc: Carlos Song <carlos.song@nxp.com>; Frank Li <frank.li@nxp.com>;
> > kernel@pengutronix.de; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > festevam@gmail.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Clark Wang
> > <xiaoning.wang@nxp.com>; Ahmad Fatoum <a.fatoum@pengutronix.de>
> > Subject: [EXT] Re: [PATCH v5] i2c: imx: support DMA defer probing
> >
> > Caution: This is an external email. Please take care when clicking links or
> > opening attachments. When in doubt, report the message using the 'Report this
> > email' button
> >
> >
> > On Thu, Dec 19, 2024 at 01:02:29PM +0100, Andi Shyti wrote:
> > > Hi Carlos,
> > >
> > > > +   /*
> > > > +    * Init DMA config if supported, -ENODEV means DMA not enabled at
> > > > +    * this platform, that is not a real error, so just remind "only
> > > > +    * PIO mode is used". If DMA is enabled, but meet error when request
> > > > +    * DMA channel, error should be showed in probe error log. PIO mode
> > > > +    * should be available regardless of DMA.
> > > > +    */
> > > > +   ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> > > > +   if (ret) {
> > > > +           if (ret == -EPROBE_DEFER)
> > > > +                   goto clk_notifier_unregister;
> > > > +           else if (ret == -ENODEV)
> > > > +                   dev_dbg(&pdev->dev, "Only use PIO mode\n");
> > > > +           else
> > > > +                   dev_err_probe(&pdev->dev, ret, "Failed to setup
> > > > + DMA, only use PIO mode\n");
> > >
> > > Just for understanding, should we quit in this last case, as well?
> > >
> > > Before we were ignoring ENODEV and EPROBE_DEFER, but now you are
> > > making it clear that other failures like ENOMEM might happen.
> >
> > Good point, dev_err_probe() would not print an error in case of EPROBE_DEFER,
> > but in this case we should only print error and continue with PIO.
> >
> Hi,
> 
> Thank you all very much! As I comment at previous mail:
> DMA mode should be optional for i2c-imx, because i2c-imx can accept DMA mode not enabled, because it still can work in CPU mode.[1]
> [1]https://lore.kernel.org/imx/AM0PR0402MB39374E34FD6133B5E3D414D7E82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com/
> 
> Also we don't want to annoy current user without DMA[2]
> [2] https://lore.kernel.org/imx/20241127-analytic-azure-hamster-727fd8-mkl@pengutronix.de/
> 
> So we make this logic. Anyway we let the I2C controller registered whether DMA is available or not(except defer probe).
> Ignoring ENODEV and EPROBE_DEFER makes it looks like nothing happened if DMA is defer probed or not enabled(This is an expected).
> However we still need i2c DMA status is known when meet an unexpected error, so we use dev_err_probe() to print error.

Why dev_err_probe() instead of dev_err()?

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

