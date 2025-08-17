Return-Path: <linux-i2c+bounces-12315-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D98FBB293ED
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Aug 2025 17:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A68D01B274F3
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Aug 2025 15:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974B72FE048;
	Sun, 17 Aug 2025 15:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="VaB9C6WJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0709772629;
	Sun, 17 Aug 2025 15:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755446044; cv=none; b=s4nOI1hUB8i8xaN+RLqvGxZKcCPeb68qkdX38yfOIszUUi9DDx+bfOt5hCja0c/R1hHCt6QPU4JtHe7+RHtguLts16NiWbZQ1fir/ncvNWzFrbkqiygH3+aN2GNpxJYDv57vLwfAI1P0AhMkJDTBelfhKtIyHdPzANdbTCQIab4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755446044; c=relaxed/simple;
	bh=hLaRNmAbO70c05wb20YtRVrYJpCnIdM9zpIVbI4zlNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNeCkgG9ESiXEfhZApN18WE4/TIjHyeBmBGRm/emSyvaGqovd8DnydcEr6F/N9IVWEW8zDw6l9+6iWNWN3Lb0nAcggXdlU5TPNqG5HPdghZp0CP0wYQXaS9m7+D7FQq/r7y+x7DNpNDO0ssNCUCQvt8v/GN5Jn4P/LHFw0cR9Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=VaB9C6WJ; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BgzYxtQckyjVZOGp9Y3h+oWyiWCJpkBXNVoZbUwFcSI=; b=VaB9C6WJd8F7rvrY612y75q5ZJ
	TCre80TCxTwuDT6dEzSBLMI++b3AYi1cSqIb49Jt/3UbXVREpuCcHj69G2gROjDodVXxKNej6llPX
	Z98rskyl6JDq3vqWOC/afvj5hhHEo+fy6Nl1pwm98/TXuRIA9/GVZYWhPqLvkSOH+YkxxBp5Rilyh
	fvQ/Ye/keplgadZz+pkADjwhedzC8mI1777gpk0dHQP6h8qSF5xtwlFrqlytKUKsJI5TmfKgiytja
	PDUf0yYAvKCpSJb1k9U+NXEfVQ2UenAjsj3ByXX5Mb7KANcio4Bt6gb2ziDl/tTNnvhFRtQ4WiNHu
	VuRoS0sg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44182)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1unfhT-0000nb-33;
	Sun, 17 Aug 2025 16:53:40 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1unfhP-0001YF-1M;
	Sun, 17 Aug 2025 16:53:35 +0100
Date: Sun, 17 Aug 2025 16:53:35 +0100
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
Message-ID: <aKH6_1MRqD24QTq5@shell.armlinux.org.uk>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-2-ca42ea818dc9@gmail.com>
 <aJpR96Kkj12BwW-M@smile.fi.intel.com>
 <8cb62eb9-9137-44b4-86f6-82f69813e83f@gmail.com>
 <aJyOu_GUlDPuJXO5@smile.fi.intel.com>
 <0bfcb570-dab3-4038-a1aa-8bc7fe2feee8@gmail.com>
 <aJyvHnLS-A3F2gN7@shell.armlinux.org.uk>
 <1261d3ed-e057-45b1-913e-f8bf1cd5d7bc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1261d3ed-e057-45b1-913e-f8bf1cd5d7bc@gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Sun, Aug 17, 2025 at 04:59:22PM +0200, Gabor Juhos wrote:
> 2025. 08. 13. 17:28 keltezéssel, Russell King (Oracle) írta:
> > On Wed, Aug 13, 2025 at 05:17:28PM +0200, Gabor Juhos wrote:
> >> 2025. 08. 13. 15:10 keltezéssel, Andy Shevchenko írta:
> >>> On Wed, Aug 13, 2025 at 12:36:45PM +0200, Gabor Juhos wrote:
> >>>> 2025. 08. 11. 22:26 keltezéssel, Andy Shevchenko írta:
> >>>>> On Mon, Aug 11, 2025 at 09:49:56PM +0200, Gabor Juhos wrote:
> >>>
> >>> ...
> >>>
> >>>>> TBH this sounds to me like trying to hack the solution and as you pointed out
> >>>>> the problem is in pinctrl state changes. I think it may affect not only I2C case.
> >>>>
> >>>> It is not an error in the pinctrl code. I have checked and even fixed a few bugs
> >>>> in that.
> >>>>
> >>>>> And I didn't get how recovery code affects the initialisation (enumeration).
> >>>>
> >>>> Without the fix, it is not possible to initiate a transaction on the bus, which
> >>>> in turn prevents enumeration.
> >>>
> >>> But why? As you said below the first pin control state is changed during the
> >>> probe, which is fine, and the culprit one happens on the recovery.
> >>
> >> Erm, no. Both happens during probe, before the I2C core tries to enumerate the
> >> devices on the bus.
> >>
> >>> Why is recovery involved in probe? This is quite confusing...
> >> Let me try to explain it differently. Here is the simplified call chain:
> >>
> >>   i2c_pxa_probe()
> >>      ...
> >>      i2c_pxa_init_recovery()
> >>         pinctrl_select_state()                  <- selects GPIO state
> >>         pinctrl_select_state()                  <- selects default (I2C) state
> >>      ...
> >>      i2c_add_numbered_adapter()
> >>          i2c_register_adapter()
> >>              ...
> >>              i2c_init_recovery()
> >>                  i2c_gpio_init_recovery()
> >>                      i2c_gpio_init_generic_recovery()
> >>                          pinctrl_select_state() <- selects GPIO state***
> >>                          ...
> >>                          pinctrl_select_state() <- selects default (I2C) state
> >>              ...
> >>              bus_for_each_drv()
> >>                  __process_new_adapter()
> >>                      i2c_do_add_adapter()
> >>                          i2c_detect()           <- enumerates the devices
> >>
> >> The culprit is the first pinctrl_select_state() call in
> >> i2c_gpio_init_generic_recovery() marked with '***'.
> >>
> >> That call causes the controller to go stuck, which makes it impossible to
> >> transfer anything on the bus.
> > 
> > Probably because when GPIO state is selected, the I2C bus pins end up
> > being set low, which the I2C controller sees, so it thinks there's
> > another device communicating on the bus.
> 
> Yes, it seems so.
> 
> When GPIO state is selected, the bits in the Bus Monitor register which are
> continuously reflecting the value of the SCL and SDA pins contains zeros.
> 
> Additionally, the Status register indicates an 'Early Bus Busy' condition, which
> means that 'The SCL or SDA line is low, without a Start condition'.
> 
> 
> > I could be wrong, as I don't have the hardware to hand to research
> > the issue again.
> > 
> > I have a vague memory that the GPIO state must _always_ reflect the
> > actual pin state before switching to it to avoid glitches and avoid
> > inadvertently changing the I2C controller state.
> 
> Unfortunately, it only helps to avoid glitches on the external lines. At least,
> in the current case the controller hungs no matter which value combination is
> being set on the GPIO pins before switching to GPIO state.

Note that my original i2c-pxa recovery implementation was proven
functional on the uDPU, both by myself and Telus.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

