Return-Path: <linux-i2c+bounces-15010-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8CCD0C776
	for <lists+linux-i2c@lfdr.de>; Fri, 09 Jan 2026 23:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 707A4301EFF3
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jan 2026 22:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390A134321A;
	Fri,  9 Jan 2026 22:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="meAzkYug"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25A7340D84
	for <linux-i2c@vger.kernel.org>; Fri,  9 Jan 2026 22:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767998201; cv=none; b=qLNMa0akQAiDvYn/4D3FZvB7lfk9Q6jSvXIr3FFinF/+D7TKio+1NiiYYLEi0acWCWtH9hkajmy61UGNQIO3dXcFuRHg6R8jr6q5zOzZhqkJlCb/sEm7SzfAWR1ozAfzDZbSiNjgf0rET44aOP+64TFRtGHpvRFTPRYaX8xGYUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767998201; c=relaxed/simple;
	bh=QBfNXn8j4pnxQ2N44nhuTFw/5zZmPYzA4I77X++t5pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7X/1IniTq87HEft/F/NEWuGtosm7Tfl8NdWeZt9HIT7kYXrhPial+mwctHkb2NpPP2jdj6z/vLQf8UjmMfvRz6zEovd0HU+zO9o8HyyRgohZ9AxG5X1j6OTsdbtQ4SFCDLqLOiEic+4+80J82FZVLE2P+eZV7u6zCvwnUqbow0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=meAzkYug; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8F3FBC1F6E8;
	Fri,  9 Jan 2026 22:36:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E8F9606C6;
	Fri,  9 Jan 2026 22:36:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0EEBF103C88CA;
	Fri,  9 Jan 2026 23:36:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767998192; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=wynFLlX6mYjoJcbTa5UiblB9kASfpYaIWVxoT0vaxKM=;
	b=meAzkYugKslZ0w5vH+Las8LuHo2L0EiP2Emip9GRfGdey1zHwFwpBC2e3mLCT+5H0uKHuE
	FQjRRMsJXMg3F4brKyo7rSFKhlHbtIKNIjsh/u45qm3jT/E6pP8MGESwxRtWKTRlOuTDUT
	1Rt06fXkg1EgXp22TD6ocBKoD20Dbk0bR4or8cz1CyAuEw7WyZsy+ENogaFyrfq2YirIK6
	xXcglKFQmF7EmDIosJZ7HnJGFr96kkadXkKctVQDd5uvwVHajVrXFMWmsa1HE8pCJNuDoy
	oNmI3OAVQJuRoqK6IIx+NOwm041E8S+gQWwDKxbxh690bNVekauCovDxa8yS+w==
Date: Fri, 9 Jan 2026 23:36:27 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alex Elder <elder@riscstar.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] rtc: spacemit: default module when
 MFD_SPACEMIT_P1 is enabled
Message-ID: <20260109223627b566d2b0@mail.local>
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
 <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
 <202512251653368b33c7e7@mail.local>
 <4c7c0f69-4732-4f62-970a-2a9273b3b5c7@riscstar.com>
 <20251230005142d1bfc6f7@mail.local>
 <6ca28183-1687-4ddc-8b3c-5e5be4255561@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ca28183-1687-4ddc-8b3c-5e5be4255561@riscstar.com>
X-Last-TLS-Session-Version: TLSv1.3

On 29/12/2025 19:46:59-0600, Alex Elder wrote:
> On 12/29/25 6:51 PM, Alexandre Belloni wrote:
> > On 29/12/2025 12:02:23-0600, Alex Elder wrote:
> > > On 12/25/25 10:53 AM, Alexandre Belloni wrote:
> > > > On 25/12/2025 15:46:33+0800, Troy Mitchell wrote:
> > > > > The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
> > > > > caused it to be built-in automatically whenever the PMIC support was
> > > > > set to y.
> > > > > 
> > > > > This is not always desirable, as the RTC function is not required on
> > > > > all platforms using the SpacemiT P1 PMIC.
> > > > 
> > > > But then, can't people simply change the config? I don't feel like
> > > > this is an improvement.
> > > 
> > > It's not an improvement for people who want to use the SpacemiT
> > > P1 PMIC, but it's an improvement for all the other RISC-V builds
> > > using "defconfig" that would rather have that support be modular
> > > to avoid needlessly consuming resources.
> > 
> > But then, wouldn't MFD_SPACEMIT_P1 be simply not set or set to m ? So
> > this doesn't have any impact on other RISC-V builds while it makes
> > people using the SpacemiT P1 PMIC jump through hoops to be able to use
> > the RTC as this is a very uncommon way to set default values.
> > 
> > My point is:
> >   - other RISC-V platforms would simply not select MFD_SPACEMIT_P1 or
> >     have MFD_SPACEMIT_P1 set to m
> >   - having RTC_DRV_SPACEMIT_P1 built-in by default when MFD_SPACEMIT_P1
> >     is built-in doesn't really hurt any SpacemiT P1 users but would be
> >     the expectation of those using the RTC.
> 
> The "hurt" isn't about P1 users, it's about everyone else.
> 
> >   - those wanting to optimise because they won't use the RTC, they can
> >     already simply unselect RTC_DRV_SPACEMIT_P1 or set it to m.
> 
> 
> The purpose is to make the driver a module (not built-in)
> when "defconfig" is used (without the need for any Kconfig
> fragments to unselect things).
> 
> 
> In arch/riscv/configs/defconfig, we have this:
>     CONFIG_ARCH_SPACEMIT=y
> 
> In drivers/mfd/Kconfig b/drivers/mfd/Kconfig, we have this
> (added by patch 2 in this series):
>     config MFD_SPACEMIT_P1
> 	default m if ARCH_SPACEMIT
> 
> So when using defconfig (alone), MFD_SPACEMIT_P1 is set to m,
> to benefit non-SpacemiT RISC-V platforms.
> 
> This patch is trying to do the same thing for the RTC,
> i.e. having RTC_DRV_SPACEMIT_P1 be defined as a module
> by default.
> 
> I think you understand.

I'm sorry, I must be dumb but I don't understand. The current behaviour
is that when MFD_SPACEMIT_P1 is m, then the default value for
RTC_DRV_SPACEMIT_P1 will be m. Since patch 2 makes it exactly that way
(MFD_SPACEMIT_P set to m), I don't get why it is necessary to mess with
the default of RTC_DRV_SPACEMIT_P1.

The current default behaviour of RTC_DRV_SPACEMIT_P1 seems to be the
correct one and the proper fix is then patch 2.

