Return-Path: <linux-i2c+bounces-5384-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B836951C47
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 15:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A030E1C22BBD
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 13:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1766186A;
	Wed, 14 Aug 2024 13:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBXZavRu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CC11E4B2;
	Wed, 14 Aug 2024 13:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723643591; cv=none; b=Ib19euFR30TJb1HvnJil0ZEmJ0pd9MPUXrjn2iPuznizXU7GdMKnJZW1l1KJY5EKKNIxUhbpvYSaBiWfMVnyl1KJeQexKZO+6QbmAIAjMQKzEWQvpvIGPE9EucKGhKFRZnHMokp0XH9INbjjw9nWpRBalnvErtiKDd0dc+0JR7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723643591; c=relaxed/simple;
	bh=sXDg6SJ866AaNtAk2Tp+FQv+cJ3dVaRfO0uMyWTSizM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JlQidZRuOHr4WrrCFVj4FjQ0VOpv0bQncbvjjEqRKzkFEEkyvDkACA+DeW2OQHMpWbA78TxL7Qdtzcti24pDyzQBEjCZYZ5us+S+w24ABLukzpxNjn2/e3/sL5ujE2l8Dw2ai+Id2p6RtgjDldK6hopCD2bjbUcvq5Tg/qRVYdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBXZavRu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723643590; x=1755179590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=sXDg6SJ866AaNtAk2Tp+FQv+cJ3dVaRfO0uMyWTSizM=;
  b=LBXZavRuN/Clknov31BXS/vhDRnJkwoQYV6YME382TaXupz4JSLilSsb
   XzQwqqZnud5P9O+cxFgmPxw3pRdRIxExnNA2TZ9/XShjlcLV2fj6aLbOO
   y5RjtKMaw494WPrWtUpam8Nu2SU3rtf1yGJu4gut8kCgwgaxiuXtAPYtf
   dV+5yKxi6nGTlDW3F74VTYHGBLCX/IWzJ+BvD643bvmzLoKgEGt5J+vnA
   xzrfAjEZR19YJvYWK+/+2UKXI1siDRi6HgaR1Gnwwb/J34HPjA/64ONmZ
   ipaShrqrCAYrrZhBRxFfUYcJxfp1lf8kxRo6C4VNuc8q/+mwPOzxQ5AGV
   w==;
X-CSE-ConnectionGUID: miOM+WX5Tl+HOOiJ3IN7YQ==
X-CSE-MsgGUID: i+6bE4NbTimBIZ7JswGNfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22028617"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="22028617"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 06:53:09 -0700
X-CSE-ConnectionGUID: GZjAjcOBS/2tvWYCAMukvQ==
X-CSE-MsgGUID: DprzkeJOTT65SAJzcEe9iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="58898765"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 06:53:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1seEQv-0000000FCFz-3dM9;
	Wed, 14 Aug 2024 16:53:01 +0300
Date: Wed, 14 Aug 2024 16:53:01 +0300
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
Subject: Re: [PATCH v4 4/6] i2c: of-prober: Add GPIO and regulator support
Message-ID: <Zry2vbJ-BT4mI0eO@smile.fi.intel.com>
References: <20240808095931.2649657-1-wenst@chromium.org>
 <20240808095931.2649657-5-wenst@chromium.org>
 <ZrtGXfKE6BwupPPA@smile.fi.intel.com>
 <CAGXv+5E+D8oXr7nh67HEPermJYoRp+Xf+oqSefOiUoCpyoKYUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5E+D8oXr7nh67HEPermJYoRp+Xf+oqSefOiUoCpyoKYUQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Aug 14, 2024 at 07:34:00PM +0800, Chen-Yu Tsai wrote:
> On Tue, Aug 13, 2024 at 7:41 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Aug 08, 2024 at 05:59:27PM +0800, Chen-Yu Tsai wrote:

...

> > > This adds GPIO and regulator management to the I2C OF component prober.

> > Can this be two patches?
> 
> You mean one for GPIOs and one for regulators right? Sure.

Yes.

...

> > > +#define RESOURCE_MAX 8
> >
> > Badly (broadly) named constant. Is it not the same that defines arguments in
> > the OF phandle lookup? Can you use that instead?
> 
> I'm not sure what you are referring to. This is how many unique instances
> of a given resource (GPIOs or regulators) the prober will track.
> 
> MAX_TRACKED_RESOURCES maybe?

Better, but still ambiguous. We have a namespace approach, something like
I2C_PROBER_... I have checked the existing constant and it's not what you
want, so forget about that part, only name of the definition is questionable.

...

> > > +#define REGULATOR_SUFFIX "-supply"
> >
> > Name is bad, also move '-' to the code, it's not part of the suffix, it's a
> > separator AFAICT.
> 
> OF_REGULATOR_SUPPLY_SUFFIX then?
> 
> Also, "supply" is not a valid property. It is always "X-supply".
> Having the '-' directly in the string makes things simpler, albeit
> making the name slightly off.

Let's use proper SUFFIX and separator separately.

#define I2C_PROBER_..._SUFFIX "supply"

(or alike)

...

> > > +     p = strstr(prop->name, REGULATOR_SUFFIX);
> >
> > strstr()?! Are you sure it will have no side effects on some interesting names?
> >
> > > +     if (!p)
> > > +             return 0;
> >
> > > +     if (strcmp(p, REGULATOR_SUFFIX))
> > > +             return 0;
> >
> > Ah, you do it this way...
> >
> > What about
> 
> About? (feels like an unfinished comment)

Yes, sorry for that. Since you found a better alternative, no need to finish
this part :-)

> Looking around, it seems I could just rename and export "is_supply_name()"
> from drivers/regulator/of_regulator.c .

Even better!

Something similar most likely can be done with GPIO (if not, we are always open
to the ideas how to deduplicate the code).

...

> > > +#define GPIO_SUFFIX "-gpio"
> >
> > Bad define name, and why not "gpios"?
> 
> "-gpio" in strstr() would match against both "foo-gpio" and "foo-gpios".
> More like laziness.

And opens can of worms with whatever ending of the property name.
Again, let's have something that GPIO library provides for everybody.

...

> > > +     ret = of_parse_phandle_with_args_map(node, prop->name, "gpio", 0, &phargs);
> > > +     if (ret)
> > > +             return ret;

(1)

> > > +     gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0, GPIOD_ASIS, "i2c-of-prober");
> > > +     if (IS_ERR(gpiod)) {
> > > +             of_node_put(phargs.np);
> > > +             return PTR_ERR(gpiod);
> > > +     }
> >
> > Try not to mix fwnode and OF specifics. You may rely on fwnode for GPIO completely.
> 
> Well, fwnode doesn't give a way to identify GPIOs without requesting them.
> 
> Instead I think I could first request GPIOs exclusively, and if that fails
> try non-exclusive and see if that GPIO descriptor matches any known one.
> If not then something in the DT is broken and it should error out. Then
> the phandle parsing code could be dropped.

What I meant, the, e.g., (1) can be rewritten using fwnode API, but if you know
better way of doing things, then go for it.

> > > +     if (data->gpiods_num == ARRAY_SIZE(data->gpiods)) {
> > > +             of_node_put(phargs.np);
> > > +             gpiod_put(gpiod);
> > > +             return -ENOMEM;
> > > +     }

...

> > > +     for (int i = data->regulators_num; i >= 0; i--)
> > > +             regulator_put(data->regulators[i]);
> >
> > Bulk regulators?
> 
> Bulk regulators API uses its own data structure which is not just an
> array. So unlike gpiod_*_array() it can't be used in this case.

But it sounds like a bulk regulator case...
Whatever, it's Mark's area and he might suggest something better.

-- 
With Best Regards,
Andy Shevchenko



