Return-Path: <linux-i2c+bounces-5742-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 236B995CEA6
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 16:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46F491C21F32
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 14:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E832A189522;
	Fri, 23 Aug 2024 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kfw37oXP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB157188900;
	Fri, 23 Aug 2024 14:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724421703; cv=none; b=kXPp4pfXYj71ijgkaLNK6YGDXehjTKAJ/D8AldABbptRocFBW/xJkcpUxtLag9yu+2dhvFQIXSQOrIOz3K1JnCEjJPGSi+T15t6v4eWqECw0cItv5tltzqNCmSVr5thxBppHfrQLt44NdPJQTlycQW925N0qZnI6LyHHywMEuq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724421703; c=relaxed/simple;
	bh=3yHP9wBn0SJcAbqYl8E8vpjlCd39wZV+iP+REGMWKgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1iO6FT7NesuGde+Kw5pHSjPUmFW51XMjEuCZsflxo+wCh2lWKtYwRfCmSvOCKDi/awrer7VBZzRJu4hOhd5nBZKrbebDxgaPS3MVyL2XSGn+l/w8TSEBPJayhEMnwBUYD3BmhevaCP3xHfeFBy9EMeWN2W6MXmyTbWDFv4Pqec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kfw37oXP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724421702; x=1755957702;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3yHP9wBn0SJcAbqYl8E8vpjlCd39wZV+iP+REGMWKgE=;
  b=Kfw37oXPUywYLPIzQ53EfH1++vjO4jqaH3MpjrWgDhzz0UHaoWlQDrna
   Zgb7hdYtsI2jpljtZHk6nf7xeR7Y6xcD+lZVRSCsw+buZYNi81UHHI3AR
   YNuwYMhFgEBJw1636TM1+mAWO9ArLTGjM/1KznHsvPqNBp5Pxd2gxHzNV
   181odqVXf69L6NBnHmdh1Iv4cGhV6DnNpzSCusZv9NJptHyglCBvQR5zW
   JvX3em/GAUjksXIwEg0IA+h9xViy54iopQlTzGz8VI2miG51fRuqrioCF
   mefUYzuYPivXTjRs8jL86UchOqYmgUDft+UbYgQBcL+hkPJ73toiW+CzP
   w==;
X-CSE-ConnectionGUID: Fcx9II/fTHm2l61ghHPvrw==
X-CSE-MsgGUID: nz8NJHZGTbacXoxNmiwkTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22412167"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="22412167"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:01:41 -0700
X-CSE-ConnectionGUID: gY6ksg/lRlC/GHXXERowJA==
X-CSE-MsgGUID: DSzI+E0EQtK7ef5AaKdSkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="66726448"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 07:01:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shUqs-00000000oRR-3UOF;
	Fri, 23 Aug 2024 17:01:18 +0300
Date: Fri, 23 Aug 2024 17:00:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 08/10] i2c: of-prober: Add GPIO support
Message-ID: <ZsiWALpt1IpTHsKg@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-9-wenst@chromium.org>
 <ZsdJOUe44hiGur-s@smile.fi.intel.com>
 <CAGXv+5G7h08Pvd24_6LoUB_8w_Cd0RntRSjNdn_FjrRH1ZF5oQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5G7h08Pvd24_6LoUB_8w_Cd0RntRSjNdn_FjrRH1ZF5oQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 06:32:16PM +0800, Chen-Yu Tsai wrote:
> On Thu, Aug 22, 2024 at 10:20 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Aug 22, 2024 at 05:20:01PM +0800, Chen-Yu Tsai wrote:

...

> > > +     if (!data->gpiods)
> > > +             return 0;
> >
> > If it comes a new code (something else besides GPIOs and regulators) this
> > will be a (small) impediment. Better to have a helper for each case and do
> >
> >         ret = ..._gpiods();
> >         if (ret)
> >                 ...
> >
> > Same for regulators and anything else in the future, if any.
> 
> I'm not sure I follow. Do you mean wrap each individual type in a wrapper
> and call those here, like the following?
> 
>     i2c_of_probe_enable_res(...)
>     {
>         ret = i2c_of_probe_enable_regulators(...)
>         if (ret)
>               return ret;
> 
>         ret = i2c_of_probe_enable_gpios(...)
>         if (ret)
>               goto error_disable_regulators;
> 
>         ...
>     }

Yes.

...

> > > +             /*
> > > +              * reset GPIOs normally have opposite polarity compared to
> >
> > "reset"
> >
> > > +              * enable GPIOs. Instead of parsing the flags again, simply
> >
> > "enable"
> >
> > > +              * set the raw value to high.
> >
> > This is quite a fragile assumption. Yes, it would work in 98% cases, but will
> > break if it's not true somewhere else.
> 
> Well, this seems to be the de facto standard. Or it would have to remember
> what each GPIO descriptor's name is, and try to classify those into either
> "enable" or "reset", and set their respective logical values to 1 or 0.
> And then you run into a peripheral with a broken binding that has its
> "reset" GPIO inverted, i.e. it's driver behavior needs to follow the
> "enable" GPIO style. The class of devices this prober targets are
> consumer electronics (laptops, tablets, phones) that at least have gone
> through some component selection where the options won't have conflicting
> requirements.

I'm talking from real life example(s) :-)

Recently I looked at the OV7251 sensor driver that expects "enable" GPIO while
all users supply "reset"-as-"enable" with the exact trouble I described.
Yet it's pure software / ABI issue in that case, but who knows what PCB
engineers may come up with.

> And if the polarities of the possible components don't line up, then this
> probe structure can't really do anything. One would need something that
> power sequences each component separately and probes it. I would really
> like to avoid that if possible, as it makes the boot time (to peripheral
> available) dependent on which component you have and how far down the
> list it is. We have Chromebooks that have 4 touchscreen components
> introduced over the years. In that case something more like Doug's
> original proposal would work better: something that forces mutual
> exclusivity among a class of devices.

Maybe. I just pointed out the potential problem.

> > > +              */

-- 
With Best Regards,
Andy Shevchenko



