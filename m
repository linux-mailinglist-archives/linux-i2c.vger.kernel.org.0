Return-Path: <linux-i2c+bounces-7246-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2609993A2B
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 00:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E7A51F24518
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Oct 2024 22:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA42518E029;
	Mon,  7 Oct 2024 22:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vt/jQpsJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D888D3FB9F;
	Mon,  7 Oct 2024 22:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728339912; cv=none; b=axG+L3OO+DBVyR87CBXsj3A92NhlVABgHOwelzzYUporYk9NwCwb99xsikY9Jka9FvFtO9av4O6/a7sz9hzQl1rkz4LQ/poSeMUHT2CIf4g9kWwADF7U6CzqCG72cI6e5CzoPpbUuKojT6OWRfQ+VPpaUfQXXbNuB1kL/KDLfXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728339912; c=relaxed/simple;
	bh=dP+7pB+yKyOf0NQhF4Ey5QlbknqrHAfw9DP+SkAi1ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlrpIROybiHt4wDp3Kfxbs1b65qf2s5nlwQoWP6D+JhseLEPMfuJ7j+oIsf5TXB4upLO0EUCAbhZbpiD3Jip5eQPCrojzmdbhmzInElVd5I7cMZmmnoqdyLp91AbKpkchYLHd0pV3bGcmQUv2SG6fNmP6d4VSrxRpmXR68ZVij8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Vt/jQpsJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [132.205.230.14])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BF2C2E0;
	Tue,  8 Oct 2024 00:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728339812;
	bh=dP+7pB+yKyOf0NQhF4Ey5QlbknqrHAfw9DP+SkAi1ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vt/jQpsJvHUxjmrGDOx6XdDb5/eYcmNOZ+fqGvfgmsCX/Gb8xh5L8MF7/XiaHHs5d
	 yKwoK1M07KNVU8k6VzBH5mlVNl0fsdfcm8rX4+3gQCvlKP9vNnMhm8hVpFB58jMlbq
	 3JlQ6yo4ObX+z3BTaIVDayxCEaIiiFVwmh4Cxqis=
Date: Tue, 8 Oct 2024 01:25:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-gpio@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org, patches@opensource.cirrus.com,
	iommu@lists.linux.dev, imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org,
	asahi@lists.linux.dev, rafael@kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
Message-ID: <20241007222502.GG30699@pendragon.ideasonboard.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com>
 <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>

Hi Ulf,

On Tue, Oct 08, 2024 at 12:08:24AM +0200, Ulf Hansson wrote:
> On Mon, 7 Oct 2024 at 20:49, Laurent Pinchart wrote:
> > On Fri, Oct 04, 2024 at 04:38:36PM +0200, Ulf Hansson wrote:
> > > On Fri, 4 Oct 2024 at 11:41, Sakari Ailus wrote:
> > > >
> > > > Hello everyone,
> > > >
> > > > This set will switch the users of pm_runtime_put_autosuspend() to
> > > > __pm_runtime_put_autosuspend() while the former will soon be re-purposed
> > > > to include a call to pm_runtime_mark_last_busy(). The two are almost
> > > > always used together, apart from bugs which are likely common. Going
> > > > forward, most new users should be using pm_runtime_put_autosuspend().
> > > >
> > > > Once this conversion is done and pm_runtime_put_autosuspend() re-purposed,
> > > > I'll post another set to merge the calls to __pm_runtime_put_autosuspend()
> > > > and pm_runtime_mark_last_busy().
> > >
> > > That sounds like it could cause a lot of churns.
> > >
> > > Why not add a new helper function that does the
> > > pm_runtime_put_autosuspend() and the pm_runtime_mark_last_busy()
> > > things? Then we can start moving users over to this new interface,
> > > rather than having this intermediate step?
> >
> > I think the API would be nicer if we used the shortest and simplest
> > function names for the most common use cases. Following
> > pm_runtime_put_autosuspend() with pm_runtime_mark_last_busy() is that
> > most common use case. That's why I like Sakari's approach of repurposing
> > pm_runtime_put_autosuspend(), and introducing
> > __pm_runtime_put_autosuspend() for the odd cases where
> > pm_runtime_mark_last_busy() shouldn't be called.
> 
> Okay, so the reason for this approach is because we couldn't find a
> short and descriptive name that could be used in favor of
> pm_runtime_put_autosuspend(). Let me throw some ideas at it and maybe
> you like it - or not. :-)

I like the idea at least :-)

> I don't know what options you guys discussed, but to me the entire
> "autosuspend"-suffix isn't really that necessary in my opinion. There
> are more ways than calling pm_runtime_put_autosuspend() that triggers
> us to use the RPM_AUTO flag for rpm_suspend(). For example, just
> calling pm_runtime_put() has the similar effect.

To be honest, I'm lost there. pm_runtime_put() calls
__pm_runtime_idle(RPM_GET_PUT | RPM_ASYNC), while
pm_runtime_put_autosuspend() calls __pm_runtime_suspend(RPM_GET_PUT |
RPM_ASYNC | RPM_AUTO).

> 
> Moreover, it's similar for pm_runtime_mark_last_busy(), it's called
> during rpm_resume() too, for example. So why bother about having
> "mark_last_busy" in the new name too.
> 
> That said, my suggestion is simply "pm_runtime_put_suspend".

Can we do even better, and make pm_runtime_put() to handle autosuspend
automatically when autosuspend is enabled ?

> If you don't like it, I will certainly not object to your current
> approach, even if I think it leads to unnecessary churns.
> 
> [...]
> 
> Kind regards
> Uffe

-- 
Regards,

Laurent Pinchart

