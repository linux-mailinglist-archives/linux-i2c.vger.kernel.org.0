Return-Path: <linux-i2c+bounces-14869-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9762ECE8734
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 01:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1286E30022ED
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 00:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15BB2D978A;
	Tue, 30 Dec 2025 00:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1rO6y0Ff"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50758241696;
	Tue, 30 Dec 2025 00:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767055915; cv=none; b=G0/ev28t3mZcnyaB/t8M+BaotCdqPZicQP4aW4pxySoGpBiJCmfLh6v+jBwH35TwPRlQ/0sfs0KLxlTJYb4U6f9tbdIzoEq+6+y7IkXjhmNcD9Bmne4K4twKW8ey7v25IAotXF7w7s9A9Np/hHud+ieBPNi0fkmYSDbkZKghgAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767055915; c=relaxed/simple;
	bh=xQUcebZ74Rn2hytmFPKwsmC8Q8oX6l61OTLIv3KQC1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkgBDB5ER4WjAFctcFMuMPOdPLqAuOI1WI7UaZow9tVm6OQsv/iGFZ2inmem8ctVu9wj8veFdXrgV0tI8hNhJf086W5cQKVDGNkjru0OmRgSVDEic4Sf2o/dlGdUag0WtfUo8BdiC6kQlnX8wVeaOmWw8LS50NwIt/Ru6KMx08c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1rO6y0Ff; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5E9491A2507;
	Tue, 30 Dec 2025 00:51:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E73F6072C;
	Tue, 30 Dec 2025 00:51:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 484B4113B078F;
	Tue, 30 Dec 2025 01:51:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767055909; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=v2UYhRBgvuL5HQq2pRiflGWNydMQVG1+kD2bMSHnlZM=;
	b=1rO6y0FfOg210W/91ZG+QWem4y/7X0XYctHDlEzdbyLi+hI0vJFgLFfzCIG9N9ZN0Mi/xc
	kpqSv4BS+I3glLCn3eg7gYetiJbQ92j4CD7nnz9jsHXZYyoN6zX/vGArpTcYU2K7eFdVD1
	z9tV9Kt421vLFsXkpzg2lZU6M7MJ7HQl+pzvn8hax7tHpI+2Z7E26h9fza253RE+2heiGR
	1abrW+0FdDJweNk46k4tywtdTI19Vz05hA30CSKr68z9cxjf8VVECoxBwn8SO2hB7isv2Q
	S79dAEx/DtqdOrOtvftZEVTXBjJz9uIG9r32/8DKi2xZHSJlfvx4z7LAd9KusA==
Date: Tue, 30 Dec 2025 01:51:42 +0100
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
Message-ID: <20251230005142d1bfc6f7@mail.local>
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
 <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
 <202512251653368b33c7e7@mail.local>
 <4c7c0f69-4732-4f62-970a-2a9273b3b5c7@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c7c0f69-4732-4f62-970a-2a9273b3b5c7@riscstar.com>
X-Last-TLS-Session-Version: TLSv1.3

On 29/12/2025 12:02:23-0600, Alex Elder wrote:
> On 12/25/25 10:53 AM, Alexandre Belloni wrote:
> > On 25/12/2025 15:46:33+0800, Troy Mitchell wrote:
> > > The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
> > > caused it to be built-in automatically whenever the PMIC support was
> > > set to y.
> > > 
> > > This is not always desirable, as the RTC function is not required on
> > > all platforms using the SpacemiT P1 PMIC.
> > 
> > But then, can't people simply change the config? I don't feel like
> > this is an improvement.
> 
> It's not an improvement for people who want to use the SpacemiT
> P1 PMIC, but it's an improvement for all the other RISC-V builds
> using "defconfig" that would rather have that support be modular
> to avoid needlessly consuming resources.

But then, wouldn't MFD_SPACEMIT_P1 be simply not set or set to m ? So
this doesn't have any impact on other RISC-V builds while it makes
people using the SpacemiT P1 PMIC jump through hoops to be able to use
the RTC as this is a very uncommon way to set default values.

My point is:
 - other RISC-V platforms would simply not select MFD_SPACEMIT_P1 or
   have MFD_SPACEMIT_P1 set to m
 - having RTC_DRV_SPACEMIT_P1 built-in by default when MFD_SPACEMIT_P1
   is built-in doesn't really hurt any SpacemiT P1 users but would be
   the expectation of those using the RTC.
 - those wanting to optimise because they won't use the RTC, they can
   already simply unselect RTC_DRV_SPACEMIT_P1 or set it to m.

> 
> I haven't done any testing on this but it looks fine to me.
> 
> Acked-by: Alex Elder <elder@riscstar.com>
> 
> I think it's a small change worth merging.  I don't think
> doing so does any harm.  Your call or course, Alexandre.
> 
> 					-Alex
> 
> > > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > ---
> > >   drivers/rtc/Kconfig | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > > index 50dc779f7f983074df7882200c90f0df21d142f2..53866493e9bbaf35ff0de85cbfe43e8343eadc1e 100644
> > > --- a/drivers/rtc/Kconfig
> > > +++ b/drivers/rtc/Kconfig
> > > @@ -410,7 +410,7 @@ config RTC_DRV_SPACEMIT_P1
> > >   	tristate "SpacemiT P1 RTC"
> > >   	depends on ARCH_SPACEMIT || COMPILE_TEST
> > >   	depends on MFD_SPACEMIT_P1
> > > -	default MFD_SPACEMIT_P1
> > > +	default m if MFD_SPACEMIT_P1
> > >   	help
> > >   	  Enable support for the RTC function in the SpacemiT P1 PMIC.
> > >   	  This driver can also be built as a module, which will be called
> > > 
> > > -- 
> > > 2.52.0
> > > 
> > 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

