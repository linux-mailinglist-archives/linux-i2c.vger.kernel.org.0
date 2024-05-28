Return-Path: <linux-i2c+bounces-3694-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F25F08D2324
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 20:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F8EC28299E
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 18:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE1D16C866;
	Tue, 28 May 2024 18:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="l/zCXUjp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907A2481A3;
	Tue, 28 May 2024 18:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716920062; cv=none; b=O1b9rOw4gVI55r59f2mgajxEo9bL4dw+IqvNBhdu9IIODR2q9sZcAR0r5SzFB9/1wu84FTgrZNXHyE6IGCdxgSwRKSkVcZmd4Z01xFF6eJWocIV/osVF6j2eE/UAI+Q/Di+sSdvTmKnSqKaHq5l1eF2z9z/S3/0Ox5/lQl0muRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716920062; c=relaxed/simple;
	bh=VMjF3tpqPP+iyXgY61yhP4sBKCOnsLB2r908kQBQQJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hENiViiQlhcs2atKJOgV6BXvlSEVGPrRMLUrxA659sAVf1rMJWeEAEgZ3aavYdoahTgv4rAlm8aDesK3QSrKA74mKSiKImITNW4JhikjCTTvag8YIovet3y9RW4CIouuZ8uJJFHJII4lDGOEqQvW/PV0IiUPo5fG/9RWKngqzWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=l/zCXUjp; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7Zzm0bJuyH51B7I7g2xqGeWwmr5hFPwnNOEhq85FSM8=; b=l/zCXUjp4tOisQWyaPQ9ctrAHJ
	FrrljttaQZLjSZh152ZzgMBs6e5HeIjTvMCNcWQ3s+LQ0orhMYTEpGnqA4rUjG/7xeJ66rxSHxu47
	XzLAmGxc59YFFPINcnDXA51neF+hbYZe3c9YuYC+slYG1UKx/8yn4TpYL1GHB0QATO8o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sC1Kj-00GBNi-JS; Tue, 28 May 2024 20:14:01 +0200
Date: Tue, 28 May 2024 20:14:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Alex Williams <alex.williams@ni.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	linux-i2c@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] SFP I2C timeout forces link down with PHY_ERROR
Message-ID: <1398a492-95aa-46d9-b52b-a374fd6e9e77@lunn.ch>
References: <ec7907f1-cb5a-41ab-824c-aa0b02440ada@linux.dev>
 <ZlYUNCRroM0up0xk@shell.armlinux.org.uk>
 <90873b78-13ba-445e-890a-0b90a653721b@linux.dev>
 <ebf93967-81d0-46bc-baf5-b20f9336cfa8@linux.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebf93967-81d0-46bc-baf5-b20f9336cfa8@linux.dev>

On Tue, May 28, 2024 at 01:52:56PM -0400, Sean Anderson wrote:
> (forgot to CC Alex)
> 
> On 5/28/24 13:50, Sean Anderson wrote:
> > On 5/28/24 13:28, Russell King (Oracle) wrote:
> >> First, note that phylib's policy is if it loses comms with the PHY,
> >> then the link will be forced down. This is out of control of the SFP
> >> or phylink code.
> >> 
> >> I've seen bugs with the I2C emulation on some modules resulting in
> >> problems with various I2C controllers.
> >> 
> >> Sometimes the problem is due to a bad I2C level shifter. Some I2C
> >> level shifter manufacturers will swear blind that their shifter
> >> doesn't lock up, but strangely, one can prove with an osciloscope
> >> that it _does_ lock up - and in a way that the only way to recover
> >> was to possibly unplug the module or poewr cycle the platform.
> > 
> > Well, I haven't seen any case where the bus locks up. I've been able to
> > recover just by doing
> > 
> > 	ip link set net0 down
> > 	ip link set net0 up
> > 
> > which suggests that this is just a transient problem.

If you look back over the history, i don't think you will find any
reports to transient problems with real MDIO busses. Hence any error
is considered fatal. Also, when you consider the design of MDIO, it is
actually very hard for an error to be detected. It is basically a
shift register, shifting out 64 bits for a write, or 48 bits for a
read, followed by receiving 16 bits for a read. There is no protocol
to indicate any sort of error. If there is no device at the address,
the pullup means you receive 1s. End of story.

With MDIO over I2C, it is I2C which has problems, not MDIO. Do you
expect transient problems with I2C?

I would also point out that MDIO is not idempotent. Reading an
interrupt status register often clears it. Reading the link status
clears the latched link status. If you need to retry the read of the
interrupt status register, you cannot, the interrupt has been cleared,
you have lost it, and probably your hardware no longer works because
you don't know what interrupt to handle.... If you need to re-read the
link status, you have lost the latched version, and you have missed a
up or down event.

> >> My advice would be to investigate the hardware in the first instance.

I agree with Russell. Figure out why I2C is flaky. Since this is an
SFP it maybe something as trivial as the contacts need cleaning. Or
the resistors are wrong, or you have a cheap module which is out of
spec.

	Andrew

