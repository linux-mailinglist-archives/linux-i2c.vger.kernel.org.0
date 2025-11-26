Return-Path: <linux-i2c+bounces-14297-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2304DC8C01B
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 22:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6A3D3ABEFD
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 21:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988BB29DB6C;
	Wed, 26 Nov 2025 21:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RK0+Q5yr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7375618CC13;
	Wed, 26 Nov 2025 21:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764192200; cv=none; b=tQPto4x5pZjsFdEA6eVJOsGgvCuxfxgdt4+OlVr2SAfXi30xVaq5K8Pau7qOlrwmU2UB0FlLDcD2RpDZYDYzxluNiWeF1Q1yKt3Wh20m2pGa+hGi79x6LttSWj8EnXT09ENQ0QHGOwb0TyJt07Pn9HNl47gmEqLCNc9JvS8+RiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764192200; c=relaxed/simple;
	bh=Knzj3wXNtFQFM0cMx31hCfEq52kta/w8NMBUhJVyL2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SfGd/i5hiEibqtdjS6OfoMGEHQJDP59h4sN2rhcbgYLM1Bmg6Xz3hbiUJ4S2Wj6HKNg2tn3TGz7Y5OkTEe5YQ8i1CaUA7Guz7eKJaqbWiuhA3UoUgdPBY7qkyN6quWexzfIoZa0KIABxzxybS3AtmDsh+WEh5k85JFzGZuTqZro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RK0+Q5yr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764192198; x=1795728198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Knzj3wXNtFQFM0cMx31hCfEq52kta/w8NMBUhJVyL2Y=;
  b=RK0+Q5yrFDc77WOk4MkDzQr5zpI/9NOKVNtH0ncYesfsRKTKkSwBJzsX
   Zz1UtIro3Fwg1p/hrStS7FkOCCK/BoDgPrNEyXlt/X48AP9CEzz0Ur1GA
   NzlMAvbk4Qigap5jWvqde0GYgpCuC2xlarbi5tr2KimceJ1oQq9cAix0D
   5XI6A3cLV5P0TtURC6bgV43zcv3nMPIw5Cg2lRr9010/tu6NvKyoqwzUX
   54zdZnCeeaHANup4FDged8oUnZrQdRjd92O7OUplGFhIPedZNurV1RRmB
   +VfOlA/ikHuu+eFVsIE9pu11wcKcW40XFluhGO1eLJgRYtiSjqAcRm6aO
   w==;
X-CSE-ConnectionGUID: 4U3xxnvoR9ClbZt6Pj4ccg==
X-CSE-MsgGUID: HjTRWnXmQ46F9+up41Utmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77602178"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="77602178"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:23:17 -0800
X-CSE-ConnectionGUID: ZO1+u+G/R3+SpUStUsLVnw==
X-CSE-MsgGUID: E9LQqKlyTGSa53XH3mVIGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192955741"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.89])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:23:14 -0800
Date: Wed, 26 Nov 2025 23:23:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Danny Kaehn <danny.kaehn@plexus.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Ethan Twardy <ethan.twardy@plexus.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Leo Huang <leohu@nvidia.com>,
	Arun D Patil <arundp@nvidia.com>, Willie Thai <wthai@nvidia.com>,
	Ting-Kai Chen <tingkaic@nvidia.com>
Subject: Re: [PATCH v12 2/3] HID: cp2112: Fwnode Support
Message-ID: <aSdvv3Qss5oz_o6P@smile.fi.intel.com>
References: <20251126-cp2112-dt-v12-0-2cdba6481db3@plexus.com>
 <20251126-cp2112-dt-v12-2-2cdba6481db3@plexus.com>
 <aSdGh3i_KYocE3L3@smile.fi.intel.com>
 <20251126193251.GA269764@LNDCL34533.neenah.na.plexus.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126193251.GA269764@LNDCL34533.neenah.na.plexus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 26, 2025 at 01:32:51PM -0600, Danny Kaehn wrote:
> On Wed, Nov 26, 2025 at 08:27:19PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 26, 2025 at 11:05:25AM -0600, Danny Kaehn wrote:

...

> > > For ACPI, the i2c_adapter will use the child with _ADR Zero and the
> > > gpio_chip will use the child with _ADR One. For DeviceTree, the
> > > i2c_adapter will use the child with name "i2c", but the gpio_chip
> > > will share a firmware node with the CP2112.
> > 
> > Hmm... Is there any explanation why DT decided to go that way?
> 
> I don't have an explanation, but Rob H. had directed that I make this
> change in [1].
> 
> In v11, I then removed that child node for both ACPI and DT, hoping to
> maintain unity, but you had directed that wouldn't be intuitive for ACPI
> in [2].
> 
> Thus, in this v12, I have just entirely split the two, as it seemed
> unlikely that any compromise to unify the schema between the two
> firmware languages would be possible for a change/driver this
> inconsquential to the overall kernel.

Even though, would be nice to try to get a rationale from Rob on this.
Then we can put it in the commit message to explain. Otherwise it will
confuse history diggers in the future.

> [1]:
> https://lore.kernel.org/all/20240213152825.GA1223720-robh@kernel.org/
> 
> [2]:
> https://lore.kernel.org/all/ZmISaEIGlxZVK_jf@smile.fi.intel.com/

...

> > > +			switch (addr) {
> > > +			case CP2112_I2C_ADR:
> > > +				device_set_node(&dev->adap.dev, child);
> > > +				break;
> > > +			case CP2112_GPIO_ADR:
> > > +				dev->gc.fwnode = child;
> > > +				break;
> > 
> > If by any chance we have malformed table and there are more devices with
> > the same address? Maybe we don't need to address this right now, just
> > asking... (I believe ACPI compiler won't allow that, but table can be
> > crafted directly in the binary format.)
> >
> 
> You're sugggesting perhaps that we explicitly keep track of which
> addresses have been encountered, and refuse to do any fwnode parsing
> if we detect the same address used twice? I believe the current behavior
> would be that the "last node wins"; not sure if it should be a "first node
> wins" or a full error scenario...

I'm suggesting to think about this, not acting right now. I don't believe in
such a case IRL.

> > > +			}

...

> > > +		device_set_node(&dev->adap.dev,
> > > +			device_get_named_child_node(&hdev->dev, "i2c"));
> > 
> > Here we bump the reference count, where is it going to be dropped?
> > 
> > Note, in the other branch (ACPI) the reference count is not bumped in
> > the current code.
> 
> Great point, forgot that I had dropped that handling in v9. The old
> behavior was that the CP2112 driver maintained a reference to each node
> during the lifetime of the device (and released during probe errors,
> etc..). I'm still a bit confused as to whether that is correct or not,
> or if the references should immediately be dropped once they're done
> being parsed during probe()... My understanding previously was that I
> should keep the reference count for the child fwnodes for the lifetime
> of the CP2112, since the pointers to those are stored in the child
> devices but would usually be managed by the parent bus-level code, does
> that seem correct?

While there is a (theoretical) possibility to have lifetime of fwnode shorter
than a device's, I don't think we have or ever will have such a practical
example. So, assumption is that, the fwnode that struct device holds has
the same or longer lifetime.

Note, I haven't investigated overlays (DT and ACPI) behaviour. IIRC you
experimented with ACPI SSDT on this device, perhaps you can try to see
what happens if there is a confirmed that the above is not only a theoretical
problem.

TL;DR: I would drop reference count just after we got a respective fwnode.

-- 
With Best Regards,
Andy Shevchenko



