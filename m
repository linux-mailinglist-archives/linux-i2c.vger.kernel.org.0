Return-Path: <linux-i2c+bounces-7383-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC1A99E56D
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 13:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 748A11F21C38
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 11:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CDE1ADFFD;
	Tue, 15 Oct 2024 11:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UN9vmwAr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2121A76CE;
	Tue, 15 Oct 2024 11:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728991182; cv=none; b=tGZbyNpQVmXr20UIsMh0Qb2lC3obPvGGMoLD1OF3ISuax/8UpsjZF23+StXlMDypdPcdJs7nf728ieTK0idvm96MOLlHjaEzYgV+b+1A+kyqvhwwawI78VU7li1VoCMlFK8sC9wo1sb9KItPnzmVtubO6C900J5+i4TKfBtuzB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728991182; c=relaxed/simple;
	bh=nHnbY3Qf1d9Iv/MtYL8kyklNX27QMs4I/0vg9sFyQ/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EArpjX87H50K0z1vyTC7cucbOrPO3bIk1jbyxs0yB6zgk6RL+agIkzW1exm/MDxbatXXh/TxbO90xEGRvdctrC05adBXNL0jj7pdLNydIP6sEQOIVWVVNNEzuqcsmvsMZdVJyfJzyitZ1k6/GjWOxqbqh0MHBijJHsI4u1EcJ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UN9vmwAr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728991180; x=1760527180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nHnbY3Qf1d9Iv/MtYL8kyklNX27QMs4I/0vg9sFyQ/k=;
  b=UN9vmwAra4mwmNqKvFOfezL812wJ0753XK0SrYLwjXg7z5Yd9t0CKNjy
   P3mItgc8EAQVLtC3K2vqfW6q8jKB1xgOy3vln+iCbQHw18swH/MU4hBGu
   LpnKY0gBibiIAwucp8N9W/7wggsZy+a3XUJMIovrvvieXbLwGoQj5pLNU
   GftyP6a6Wz/dTP1cTp2MLWrajoiemcFwbv6LhwZUdMx7+lgvuyMFi8FVU
   CmGSaAVOeCSYIZY9o2zCEB+dBYm4t7dTuOfcj6WS38fb/0xr720IzRgGc
   HU9Fk+qaBLvOyjQySoXrMe9wbSbXgJcSjFA6+a9ZP58LaQq7sVgyNRsIF
   Q==;
X-CSE-ConnectionGUID: Xd8Bk5xKT82CQUX5e4uCxQ==
X-CSE-MsgGUID: ZUuvhse5Qxyfcv8kol+Hhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32297430"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="32297430"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:19:39 -0700
X-CSE-ConnectionGUID: R9uydBfYRYeW71Emay4xrQ==
X-CSE-MsgGUID: UZheSprSSyqQfzcSvzXGnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="78047063"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:19:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0faO-00000003FMY-2Ug5;
	Tue, 15 Oct 2024 14:19:32 +0300
Date: Tue, 15 Oct 2024 14:19:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 6/8] i2c: of-prober: Add GPIO support to simple helpers
Message-ID: <Zw5PxMOrF8Ape3if@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-7-wenst@chromium.org>
 <Zwfwv-O9ln-PVMdc@smile.fi.intel.com>
 <CAGXv+5F=5f4R5AExANxOwgTL6_VbpHdNKKhHnzy_PDcxtcFoEQ@mail.gmail.com>
 <Zwz-benEP4PHbRb2@smile.fi.intel.com>
 <CAGXv+5EwSZFoE-Uzb5x1QfknkVfd64Z_uzR0YcvZ_pR9ktGUBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5EwSZFoE-Uzb5x1QfknkVfd64Z_uzR0YcvZ_pR9ktGUBA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 15, 2024 at 01:31:40PM +0800, Chen-Yu Tsai wrote:
> On Mon, Oct 14, 2024 at 7:20 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Oct 14, 2024 at 12:06:16PM +0800, Chen-Yu Tsai wrote:
> > > On Thu, Oct 10, 2024 at 11:20 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Tue, Oct 08, 2024 at 03:34:25PM +0800, Chen-Yu Tsai wrote:

...

> > > > > +static void i2c_of_probe_simple_disable_gpio(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
> > > > > +{
> > > > > +     if (!ctx->gpiod)
> > > > > +             return;
> > > >
> > > > Do you need this check for the future patches?
> > >
> > > Not sure I follow. The check is needed because this function is called
> > > in i2c_of_probe_simple_cleanup(), but the GPIO could have been released
> > > earlier in i2c_of_probe_simple_cleanup_early(), and that makes this
> > > function a no-op.
> >
> > Do you have a known race condition then? This is bad. You shouldn't rely on
> > the sequence of events here, or the serialisation has to be added.
> 
> No there isn't. Explanation below.
> 
> > > The helpers for the release side are quite short, but the ones on the
> > > request side wrap some conditional and error handling. I think it's
> > > better to keep it symmetric?
> >
> > Yes, but why do you need the above check, I didn't still get...
> > I.o.w. you think that there is a gap in time that (if no check) the GPIO
> > descriptor might be changed? But then how does it affect anyway the possibility
> > that it becomes not NULL even with the current code.
> 
> There are two codes paths, either
> 
>     a) successfully finding a device and enabling it, or
>     b) exhausting all options and not finding a device, because it was
>        optional or it is malfunctioning.
> 
> After either code path, this cleanup function is called.
> 
> In path (a), the GPIO descriptor is released prior to enabling the device,
> because the descriptor is an exclusive resource, and as soon as the device
> is enabled, its corresponding driver may probe and request the same GPIO,
> and would fail if it was not released.
> 
> In path (b), nothing was enabled, and the GPIO descriptor was not released
> early.
> 
> The cleanup function here accounts for both cases, hence the check.

Yes, but the very same check is inside gpiod_set_value(). I'm still puzzled
about the duplication. Maybe I'm missing something...

> A step-by-step description might be clearer:
> 
> 1. i2c_of_probe_simple_enable()
>    ...
>    1a. i2c_of_probe_simple_get_supply()
>    1b. i2c_of_probe_simple_get_gpiod()
>    1c. i2c_of_probe_simple_enable_regulator()
>    1d. i2c_of_probe_simple_set_gpio()
> 
> 2. Loop through potential component options and probe; if one is found:
>    2a. i2c_of_probe_simple_cleanup_early()
>        2a-i. i2c_of_probe_simple_put_gpiod
>    2b. Enable device and driver's probe() gets called
> 
> 3. i2c_of_probe_simple_cleanup()
>    3a. i2c_of_probe_simple_disable_gpio()
>    3b. i2c_of_probe_simple_put_gpiod()
>    3c. i2c_of_probe_simple_disable_regulator()
>    3d. i2c_of_probe_simple_put_supply()
> 
> > > > > +     /* Ignore error if GPIO is not in output direction */
> > > > > +     gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable);
> > > > > +}

-- 
With Best Regards,
Andy Shevchenko



