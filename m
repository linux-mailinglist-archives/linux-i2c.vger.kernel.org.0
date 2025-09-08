Return-Path: <linux-i2c+bounces-12778-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C507B49112
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 16:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5373F1766B4
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 14:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0EEC309F1E;
	Mon,  8 Sep 2025 14:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmPa1gkq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD787082A;
	Mon,  8 Sep 2025 14:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757341001; cv=none; b=PpO9mNCdfkO6kNoNmbPzZN7ykgp5Yhr4k4fR3yMdS4vnfr67Av0s0QGA68J+SIYKwIwdMhuKTtRA8EwA+Kjub166b+EJkZvxznu/T35ucskpRXH+f9bVoU3YXqy2/Q9mflGXP0Ib7w4Uwuqi4OQJ9kGTF5WfwZ++stf0iaCdq4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757341001; c=relaxed/simple;
	bh=CBI4suASODhHBC14sipB186eMW1r9Bxk7k0WFgqClrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OufGSy2yjhyiRfREbVACUZjryM1S1om7wIWWchsemGJLkuAXzejd70CNqvnETDEv7wkGeNoN5OYcISAXTTnLqHssi902h0nM1QtI2bzipHZutIYGZai4nQXNimJaNKejdBeO148s3Rkj4qetSr3MnjU/A6ZmStBptvTzN5QHPmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmPa1gkq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB51C4CEF7;
	Mon,  8 Sep 2025 14:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757341001;
	bh=CBI4suASODhHBC14sipB186eMW1r9Bxk7k0WFgqClrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tmPa1gkqzuRx5RyBxCqHbzAfV5G4d4nmjTy6s6i+bt8myOEAOvu9tsR0PlDNaoEHs
	 sST9fnnK7DNwNwUqjeW5R0YMOuZQPBrj7IDVOInuWfqw122jHn7oe+ryNfpvECbpT8
	 QGOooXhdorgU/mWM3v6eZG5p0MbFRl7IM4VZVzmhwtupIt/tVZYx/y6bFRkpsf5kLb
	 jNyXLVEg3krWoHqiJAJeueQguSgXgV502xPIwfMKDsJBq5oTKUw644aWNHdDZ4c4Ui
	 edKOg88t//Hhs8IVxDpQPqbLQlkysNMXo9z37pCYTNLvn+zGjV6Vip71Pe++vy/BIc
	 A5EjILmOauKQQ==
Date: Mon, 8 Sep 2025 15:16:33 +0100
From: Lee Jones <lee@kernel.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Robert Marko <robert.marko@sartura.hr>, linux@armlinux.org.uk,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andi.shyti@kernel.org, broonie@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de, daniel.machon@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v9 4/9] mfd: at91-usart: Make it selectable for
 ARCH_MICROCHIP
Message-ID: <20250908141633.GB9224@google.com>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
 <20250813174720.540015-5-robert.marko@sartura.hr>
 <20250902100254.GD2163762@google.com>
 <769c8dc4-4db6-4d2e-aa2f-f86aa7ccaf78@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <769c8dc4-4db6-4d2e-aa2f-f86aa7ccaf78@microchip.com>

On Thu, 04 Sep 2025, Nicolas Ferre wrote:

> On 02/09/2025 at 12:02, Lee Jones wrote:
> > On Wed, 13 Aug 2025, Robert Marko wrote:
> > 
> > > LAN969x uses the Atmel USART, so make it selectable for ARCH_MICROCHIP to
> > > avoid needing to update depends in future if other Microchip SoC-s use it
> > > as well.
> > > 
> > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > ---
> > >   drivers/mfd/Kconfig | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > > index 425c5fba6cb1..8f11b2df1470 100644
> > > --- a/drivers/mfd/Kconfig
> > > +++ b/drivers/mfd/Kconfig
> > > @@ -138,7 +138,7 @@ config MFD_AAT2870_CORE
> > >   config MFD_AT91_USART
> > >        tristate "AT91 USART Driver"
> > >        select MFD_CORE
> > > -     depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
> > > +     depends on ARCH_MICROCHIP || COMPILE_TEST
> > >        help
> > >          Select this to get support for AT91 USART IP. This is a wrapper
> > >          over at91-usart-serial driver and usart-spi-driver. Only one function
> > 
> > Let me know when the deps are in Mainline.
> 
> Hi Lee,
> 
> I have tags from other maintainers, how about you give us your and we make

My?  AB?

> this patch travel through arm-soc like the other ones?

Sure.

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]

