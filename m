Return-Path: <linux-i2c+bounces-5609-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 689D895906F
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 00:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB52F1F22777
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 22:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BFC51C8223;
	Tue, 20 Aug 2024 22:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="TB4lQ46Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8386E1C7B84;
	Tue, 20 Aug 2024 22:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724192548; cv=none; b=X5KI70IvYSkjmuqHRq0cCENwgxO3L6RVy90hv7ZMgHxS8UlkqEvurwqujtURGp+tAGZflXCoYb/0sBb/4ZEhlVCeUo2NDewYfyDiFe78OxAiPLRjN1JNvp1KOTXPPY+Ea4WJyo0Dw7HwatJEyksPy5Pq4s0Hl798kSwvtuN4ZME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724192548; c=relaxed/simple;
	bh=cY0arytASqw9MJmbVROI28Y/jFkWgZxEf5DWq846QoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5VtV+Le1Gz2QoKmELUOz+WR6LpVoawXpgql3cW1MgbcFngogj98UaHK1CS8iQxd3yLZ/BjDQWCLgw08nQ0FYMCgeC58NPWLdgQFEF8cpBjWHnRfBSOESD2u7gXnZtO6dN6VEjPCf6jb9+vXCmElnTMgbT5Kyj8Wz42+DTAWWBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=TB4lQ46Q; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hjj+87QLKsVWqELEQdJDTGF+PvapcE9EyP48EXBCor0=; b=TB4lQ46QX6aaKrdK28q4j3020o
	0cMq2m6AQ/3bRIQBrVf7KnpcYB83d4LKpwTNWHYHa/V0FOPkBNGYh/vagysqQNJR0VdqpXvcssmL1
	k1dIcmEHzpmklbbOZeoT0JGxLp4x/HW5DrkwWB4EU5516QxNQwCl/vWewjkDipyMRKI/7GIm04LRl
	eLeC6kqnXEk0eIi66LRd9jHhJZpPuP7hVpSHdDdWLtgtVPrzlNa3fTYnI+JQFb81ULt/GEs9iYm/G
	X3LnQ6NuubAEzh/gfoR//3Uno1WKQIgOGm3tOPF740LdjMvQLLYLICunxIe3dxEOwDHMq8f2ysbkE
	0nfLTAkw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47054)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sgXEt-0004d3-2J;
	Tue, 20 Aug 2024 23:22:14 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sgXEx-0000UW-4E; Tue, 20 Aug 2024 23:22:11 +0100
Date: Tue, 20 Aug 2024 23:22:10 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	Oleksij Rempel <o.rempel@pengutronix.de>, andi.shyti@kernel.org,
	linux-i2c <linux-i2c@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: pca953x: Probing too early
Message-ID: <ZsUXEkc5A5IBLpJv@shell.armlinux.org.uk>
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
 <CAOMZO5DiSvAG225poAoj9hHKioq9XSg_Y7kJ8PG66HEVo-SjMA@mail.gmail.com>
 <d3c5d73f-a756-4f35-97f1-9301529cce34@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3c5d73f-a756-4f35-97f1-9301529cce34@lunn.ch>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Aug 20, 2024 at 11:29:07PM +0200, Andrew Lunn wrote:
> On Tue, Aug 20, 2024 at 05:47:27PM -0300, Fabio Estevam wrote:
> > Adding the i2c-folks on Cc.
> > 
> > On Tue, Aug 20, 2024 at 5:02 PM Fabio Estevam <festevam@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > I am seeing an issue with the PCA935X driver in 6.6.41 and
> > > 6.11.0-rc4-next-20240820.
> > >
> > > The pca953x is getting probed before its I2C parent (i2c-2):
> > >
> > > [    1.872917] pca953x 2-0020: supply vcc not found, using dummy regulator
> > > [    1.889195] pca953x 2-0020: using no AI
> > > [    1.893260] pca953x 2-0020: failed writing register
> > > [    1.898258] pca953x 2-0020: probe with driver pca953x failed with error -11
> 
> -11 is EAGAIN, which is a bit odd. Given your description, i would of
> expected ENODEV. My guess is, it needs another resource, a GPIO,
> regulator, or interrupt controller. That resources might not of probed
> yet. If that is true, you want the pca953x_probe() to return
> -EPROBE_DEFER. The driver core will then try the probe again sometime
> later, hopefully when all the needed resources are available.
> 
> Track down where the EAGAIN is coming from.

This is where:

        ret = regmap_bulk_write(chip->regmap, regaddr, value, NBANK(chip));
        if (ret < 0) {
                dev_err(&chip->client->dev, "failed writing register\n");

printing the error code in error messages would really help debugging.
Sadly, people don't do this. I don't know why we don't bulk replace
all error messages with just "Error!\n" to make them even more cryptic
and undebuggable!

It's likely that EAGAIN is coming from this - the probe function calls
one of the init functions, and propagates the error up, and as that
message is being printed... Tracing down, the I2C transfer function
returns -EAGAIN if it fails the transfer, and __i2c_smbus_xfer() will
itself retry it a number of times before propagating that -EAGAIN up.

EAGAIN is supposed to only be generated on arbitration loss - I'm
guessing that the I2C bus is in some kind of locked state, meaning
that devices on this bus are not accessible. Maybe the I2C bus
pull-ups aren't powered? Maybe there's a bad device on the bus
pulling the bus down?

Someone mentioned i2c-imx, maybe try enabling debug in that driver
to see why it's failing to access the device?

-- 
*** please note that I probably will only be occasionally responsive
*** for an unknown period of time due to recent eye surgery making
*** reading quite difficult.

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

