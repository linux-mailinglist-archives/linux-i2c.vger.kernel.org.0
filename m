Return-Path: <linux-i2c+bounces-6560-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABD69755BE
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 16:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D848728B0B4
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 14:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378561A3AB3;
	Wed, 11 Sep 2024 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RGIRZf7F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7756319F126;
	Wed, 11 Sep 2024 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726065513; cv=none; b=EWv7we2gjT0nTncLYyHi+Ii5S/Edq4hC+aJ6OIb0mCdywXoHjhg1Zec58HhoJYcv2MK7cs7903nCxFbRpxJAdFkiRiuLS6PA2p9eP2qCRchCYX3W+R4UfxGTbPWXfS7OchlZtP/o3PI1jRQWLPla/F1U60tMGCrxoEikfJA7Gj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726065513; c=relaxed/simple;
	bh=Ldou9neFantEFPxbcntEHkUQuwTXsLxrT82B9jmiQRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qr4uDn76WhpWzTbuSbRu6+e6Lzbb3Kmb4bfwadngylcN2SCsNQOuG3KceB1EtAO8qruddDnN1Pcw6jPWXDoHquX079IdrvFI246qKVfA5sdUD1fS9MXSKCddOXxyb7aeteZ+YA/u80biXfHKDA/7H07hnUuWGbxVQWwzbva5Ws0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RGIRZf7F; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726065511; x=1757601511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Ldou9neFantEFPxbcntEHkUQuwTXsLxrT82B9jmiQRQ=;
  b=RGIRZf7FPJsRGYt8y7hEW1mAzCejgfu2O1gpp0gmBZBul8JWGkyy+4mo
   uzUkWTtiymrn409vxKXhXXxBcdtbHoHB2OL9IliGyAu9W3gvA7yq1AbyL
   7MLghI9dFlduivQ5uQMJsZtI0cWZuiNwxbmzLPe7Tn50I7o1hqCstNikR
   8RlqULT/Bu8hUgJ8bVAWJQYLMurM5zLYjg/eUBMKzFn9cp0K0o1HuDz9x
   EDdSd1CkYTJXec6nku8qt1XqLndpecx6ZJpLXxrYHcMv5xEFIBQfzV+gG
   Sn8e+OhGn8GdPhPFV51dTtJhm3B8oTNGDTmqjA4YCyWQgRM11YpTNFYGU
   A==;
X-CSE-ConnectionGUID: b/rtNYkoSWmNcJWfh2wRrg==
X-CSE-MsgGUID: zYsPhbyvScq57/IJsLAtOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="13471813"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="13471813"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:38:31 -0700
X-CSE-ConnectionGUID: 7GtiYkmyQSWRX5R/5DaXQg==
X-CSE-MsgGUID: 163BAyl5TAGhVuMw3BSEKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67230388"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:38:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1soOUB-00000007aR0-3IeT;
	Wed, 11 Sep 2024 17:38:23 +0300
Date: Wed, 11 Sep 2024 17:38:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 09/12] i2c: of-prober: Add regulator support
Message-ID: <ZuGrX67LzMe9S6ce@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-10-wenst@chromium.org>
 <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
 <CAGXv+5F27K76t=ht5v75jKsNF-J+C0r5+m=czHz6PtV3t5DxcQ@mail.gmail.com>
 <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com>
 <CAGXv+5HO=POHNL_tQHCsy+8=a0gPLMDVHcWMguferahVU+BnZA@mail.gmail.com>
 <CAD=FV=U2yDGv74GQWRQuHN9sjdY5iThqpH-br-jYXMkV1cujEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=U2yDGv74GQWRQuHN9sjdY5iThqpH-br-jYXMkV1cujEg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 10, 2024 at 05:30:07PM -0700, Doug Anderson wrote:
> On Thu, Sep 5, 2024 at 8:45 PM Chen-Yu Tsai <wenst@chromium.org> wrote:

...

> > At least for the stuff that we have (touchscreens and trackpads) such
> > registers typically don't exist, unless it's an HID-over-I2C device,
> > in which case there's the standard HID descriptor at some address.
> > But, yeah, reading the HID descriptor was the use case I had in mind.
> >
> > At least for one Chromebooks it's a bit more tricky because that one
> > HID-over-I2C component shares the same address as a non-HID one. We
> > currently have different SKU IDs and thus different device trees for
> > them, but we could make the prober work with this. It just has be able
> > to tell if the component it's currently probing needs the special
> > prober and is it responding correctly. This bit I need to think about.
> 
> I guess Mark Brown also thought that there wouldn't be some magic
> register, but my gut still tells me that most i2c devices have some
> way to confirm that they are what you expect even if it's not an
> official "vendor" or "version" register. Some type of predictable
> register at a predictable location that you could use, at least if you
> knew all of the options that someone might stuff.

"most" is way too optimistic to say, I believe that not even close to majority
of I²C target devices they are not reliably discoverable.

That's the downside of non-discoverable busses like I²C. Maybe I³C has
a mechanism for that, but I am not an expert, just wondering.

> For instance, in elan trackpads you can see elan_i2c_get_product_id().
> That just reads a location (ETP_I2C_UNIQUEID_CMD = 0x0101) that could
> theoretically be used to figure out (maybe in conjunction with other
> registers) that it's an elan trackpad instead of an i2c-hid one. You'd
> have to (of course) confirm that an i2c-hid device wouldn't somehow
> return back data from this read that made it look like an elan
> trackpad, but it feels like there ought to be some way to figure it
> out with a few i2c register reads.
> 
> ...that being said, I guess my original assertion that you might be
> able to figure out with a simple register read was naive and you'd
> actually need a function (maybe as a callback) to figure this out.

-- 
With Best Regards,
Andy Shevchenko



