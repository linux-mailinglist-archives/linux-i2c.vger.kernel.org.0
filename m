Return-Path: <linux-i2c+bounces-12274-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 642BFB24D77
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 17:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB7ED2A74BA
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 15:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C7F23D7EC;
	Wed, 13 Aug 2025 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="iD/vDSU9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAE823BCE2;
	Wed, 13 Aug 2025 15:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755098927; cv=none; b=IHzQkhPUn/XfUH6LzQGLCQn/GrlV6SRQeTShrABIUn58regT2J57Cn6RxX/EAJ1qYHnzyQQzL1KypCqMdZxYcLbk6ZW4+4eWn6xU8BLlKDEwsOLxWVEUZo8r4IVr9MHynMou0l7PiAGg/XB6J+IPG+pLdrTaW6og1xXls+e6S+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755098927; c=relaxed/simple;
	bh=d4tIsS38EDYbVPrOHCTVdpAJiejvoXsr6isPmsDzQaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQRT7ty6UolrHErdgeTnGkirB3wCy/Djio4skGOij6CsjTbREpYppok48uldJ47feepzv54wX8RT7ySLuH3K5huD+540LW6phKTeXODhuAOwdE1MD2Vsk3d2qVGHGFdhGy87WETw9jy/B63U6Np1Q47JJGtQMOYTUB2aAYc63jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=iD/vDSU9; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=99/b1Zz+WjCB1f6WwTNHvQByBXsYpqmstCtToqVhvHk=; b=iD/vDSU9sI7iSXH2vti3YhW/l7
	WBPlbuoCL0mDmgYtM3Nfy/FT8JngWib2nu/AXoE4dwnSrJbvJDFFh5F0f+3jTcX2b8rg4Zs0olMJ9
	vq0ycg35wvXZZUAV8lJSs/ElrsVBCH6zzjy290B3/xxTgq2wghkkqv7OPCj27HG/Nbr8JkKqvCLk2
	sPp/oy/7DWQNTGO8F0xf9daAfQBDD5norhMHYNHlSHMtOpQ1y0qluWuKXzlJ4fHlNuQV9VJ11WFy0
	HSpYqY3f+mJnalam52JvTJ0k7Wd5+SqqXGzgG70Z7TMb7C0e2M0JTIDhQl7JBya50FYGPgphn5HLu
	SN8TCSLQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56374)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1umDOz-0006w9-15;
	Wed, 13 Aug 2025 16:28:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1umDOx-0005rk-0D;
	Wed, 13 Aug 2025 16:28:31 +0100
Date: Wed, 13 Aug 2025 16:28:30 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Hanna Hawa <hhhawa@amazon.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i2c: pxa: prevent calling of the generic recovery
 init code
Message-ID: <aJyvHnLS-A3F2gN7@shell.armlinux.org.uk>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-2-ca42ea818dc9@gmail.com>
 <aJpR96Kkj12BwW-M@smile.fi.intel.com>
 <8cb62eb9-9137-44b4-86f6-82f69813e83f@gmail.com>
 <aJyOu_GUlDPuJXO5@smile.fi.intel.com>
 <0bfcb570-dab3-4038-a1aa-8bc7fe2feee8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0bfcb570-dab3-4038-a1aa-8bc7fe2feee8@gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Aug 13, 2025 at 05:17:28PM +0200, Gabor Juhos wrote:
> 2025. 08. 13. 15:10 keltezéssel, Andy Shevchenko írta:
> > On Wed, Aug 13, 2025 at 12:36:45PM +0200, Gabor Juhos wrote:
> >> 2025. 08. 11. 22:26 keltezéssel, Andy Shevchenko írta:
> >>> On Mon, Aug 11, 2025 at 09:49:56PM +0200, Gabor Juhos wrote:
> > 
> > ...
> > 
> >>> TBH this sounds to me like trying to hack the solution and as you pointed out
> >>> the problem is in pinctrl state changes. I think it may affect not only I2C case.
> >>
> >> It is not an error in the pinctrl code. I have checked and even fixed a few bugs
> >> in that.
> >>
> >>> And I didn't get how recovery code affects the initialisation (enumeration).
> >>
> >> Without the fix, it is not possible to initiate a transaction on the bus, which
> >> in turn prevents enumeration.
> > 
> > But why? As you said below the first pin control state is changed during the
> > probe, which is fine, and the culprit one happens on the recovery.
> 
> Erm, no. Both happens during probe, before the I2C core tries to enumerate the
> devices on the bus.
> 
> > Why is recovery involved in probe? This is quite confusing...
> Let me try to explain it differently. Here is the simplified call chain:
> 
>   i2c_pxa_probe()
>      ...
>      i2c_pxa_init_recovery()
>         pinctrl_select_state()                  <- selects GPIO state
>         pinctrl_select_state()                  <- selects default (I2C) state
>      ...
>      i2c_add_numbered_adapter()
>          i2c_register_adapter()
>              ...
>              i2c_init_recovery()
>                  i2c_gpio_init_recovery()
>                      i2c_gpio_init_generic_recovery()
>                          pinctrl_select_state() <- selects GPIO state***
>                          ...
>                          pinctrl_select_state() <- selects default (I2C) state
>              ...
>              bus_for_each_drv()
>                  __process_new_adapter()
>                      i2c_do_add_adapter()
>                          i2c_detect()           <- enumerates the devices
> 
> The culprit is the first pinctrl_select_state() call in
> i2c_gpio_init_generic_recovery() marked with '***'.
> 
> That call causes the controller to go stuck, which makes it impossible to
> transfer anything on the bus.

Probably because when GPIO state is selected, the I2C bus pins end up
being set low, which the I2C controller sees, so it thinks there's
another device communicating on the bus. I could be wrong, as I
don't have the hardware to hand to research the issue again.

I have a vague memory that the GPIO state must _always_ reflect the
actual pin state before switching to it to avoid glitches and avoid
inadvertently changing the I2C controller state.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

