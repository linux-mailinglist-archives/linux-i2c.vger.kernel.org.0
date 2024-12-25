Return-Path: <linux-i2c+bounces-8707-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D649FC6AB
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Dec 2024 23:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C5461882DB9
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Dec 2024 22:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26FF146A60;
	Wed, 25 Dec 2024 22:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aznsHQOO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C738836;
	Wed, 25 Dec 2024 22:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735166562; cv=none; b=s25hEHSx08JOpeaRTWTq1u6V+k0QlumxgrwYtQP8QmAdSy1En7usqdmHDFlcEzJWhbShcaINdY0Mts+odVpO7XeZSVRIMEo46isY+2s1gE3rMZiOcfh63rgxn7weCaZqZJCDboGRpQ5Fb0YF8luNnk7iFX4YmcTMtpCh4bbwr2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735166562; c=relaxed/simple;
	bh=5xhMOfN6JmZsY8VJLgaVsuAnaodvP/oPFG7a++D5lRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4m+M39MfQ8frp3ENGLq50asdhdudjqRJnL0hz2UzKGqXCcM1ni4h6BX3H/jx2GC/BM5wK3U8oVxXiRgp8+MTTa1I9GRGbM181xzmqtW4Uq+afE7Xov8MhzmGB00XN7J4GS7HQsHB/ixtn5G1lNmqCa64I6fs2sokUEzqW6cmRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aznsHQOO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D71FC4CECD;
	Wed, 25 Dec 2024 22:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735166561;
	bh=5xhMOfN6JmZsY8VJLgaVsuAnaodvP/oPFG7a++D5lRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aznsHQOOjUX4nE5wfD/9Mg0RoVwnvNA+7kvv4EhqgxTlwQzFpF4ysOTgINbOCWvc5
	 1tcsiWbaAGYVuTkRk4cUAinfjujyFQn69fgXlS1ZGUEN4DdXxgTEBA8xKmnae6ACdW
	 aOGoY1q9ZFBawfu5Ot3kItNuIiERQEzy0QyAUCLbELGcI3ReVd55ul5BO6WP4yaOoj
	 DQyKZk+0MKtJaMneuG12dGBax9HnGowBXj04+DoZtDEE5RK7CwREDcuiSVyQckfNWy
	 DwyEMq3Zi+IBeqCfh5rCWq6eT1HxI86SbgaqhnMVLxITMo+pLRdyOGAbMYDzZhq6N1
	 ymV37MbuR1N2g==
Date: Wed, 25 Dec 2024 23:42:36 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Clark Wang <xiaoning.wang@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v6] i2c: imx: support DMA defer probing
Message-ID: <abyji6y7ytn7dhhdudslug6esglutwjausunl2nstvjxkveris@vz3jbu5iyhsb>
References: <20241223034416.544022-1-carlos.song@nxp.com>
 <gfjir4qyyptxjizkc2k5r2elwn74fndia644evv6acwyuj3fr5@3pl3xt7rqntw>
 <AM0PR0402MB3937905A3108833DD8F52982E8032@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <ltb3ywaz2req4yqdqmtq4ejbzh4esjszbx4x6ab3k5zmqxhdpg@qqjetty6fs3q>
 <AM0PR0402MB3937C3087A22A1DB8FAE91ECE80C2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR0402MB3937C3087A22A1DB8FAE91ECE80C2@AM0PR0402MB3937.eurprd04.prod.outlook.com>

Hi Carlos,

On Wed, Dec 25, 2024 at 10:56:34AM +0000, Carlos Song wrote:
> > > > > @@ -1802,6 +1803,18 @@ static int i2c_imx_probe(struct
> > > > > platform_device
> > > > *pdev)
> > > > >       if (ret == -EPROBE_DEFER)
> > > > >               goto clk_notifier_unregister;
> > > > >
> > > > > +     /* As we can always fall back to PIO, let's ignore the error
> > > > > + setting up
> > > > DMA. */
> > > > > +     ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> > > > > +     if (ret) {
> > > > > +             if (ret == -EPROBE_DEFER)
> > > > > +                     goto clk_notifier_unregister;
> > > > > +             else if (ret == -ENODEV)
> > > > > +                     dev_dbg(&pdev->dev, "Only use PIO mode\n");
> > > > > +             else
> > > > > +                     dev_err(&pdev->dev, "Failed to setup DMA
> > > > > + (%pe),
> > > > only use PIO mode\n",
> > > > > +                             ERR_PTR(ret));
> > > >
> > > > My question here is not just about the use of dev_err vs
> > > > dev_err_probe, but why don't we exit the probe if we get an error.
> > > >
> > > > We should use PIO only in case of ENODEV, in all the other cases I
> > > > think we should just leave. E.g. why don't we exit if we meet ret ==
> > -ENOMEM?
> > >
> > > Hi, Andi
> > >
> > > Thank you! From my point, I2C is critical bus so it should be available as much
> > as possible.
> > > -ENOMEM or other unknown errors all are from i2c_imx_dma_request(). So
> > error happened in enable DMA mode process.
> > 
> > OK, makes sense, it's the idea of "let things fail on their own, I'll move forward as
> > much as I can"; we need to be aware of the choice. Please add a comment
> > above.
> > 
> > But then it's not an error, but a warning. With errors we bail out, with warnings
> > we tell users that something went wrong.
> > 
> > Sorry for keeping you on this point for so long, but do you mind swapping this
> > dev_err in dev_warn, with a comment explaining the reason we decided not to
> > leave?
> > 
> 
> Hi, Andi
> 
> It doesn't matter! I am very happy to receive so many suggestions to help enhance the patch.
> I will do following things at V7:
> 1. Change dev_err to dev_warn
> 2. Use a more detailed comment to explain why we decided not to leave when meet DMA error.

Thank you! I appreciate your responsiveness!

Andi

