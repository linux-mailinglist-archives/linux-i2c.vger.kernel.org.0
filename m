Return-Path: <linux-i2c+bounces-5382-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11071951C10
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 15:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43C141C24B3A
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 13:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87AA41B1431;
	Wed, 14 Aug 2024 13:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pxl3XOUD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4381AE031;
	Wed, 14 Aug 2024 13:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723642921; cv=none; b=n4rjTjV9RrR5HmgNJX6zDLEdb0IFVjWLEsQIIiO/p0e1zb5QO63hhEjAy5eEGwq+pehnWm8SYhZ9U6eCMx7pxi6UBYu4nO2/PPxNPpxefKm4NpbhRNBpEHm4IGF7ZszjVjIBJQwqVwXYXCXokIp4qLRpyN1rGvmdWaI+Tmegqjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723642921; c=relaxed/simple;
	bh=hqcfXdtGQKVWLTvbdhM5pBJQQzUtmGdgqcjPbawdyX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rgzvu+J6BRmJCUjkfAeh/N2JW77XiGM+beVGpS4OjI7D4GFsp028I5i65wKUDNj9HA39qm4imOPeHfytwte4GYXZGRoVsh021nd/h14gIiqcUp4VZCR+CeczYvhCneATXpG+4jUxXv0eDDilm1k0ZoJ/h0/dfVjE3iXuICBt5As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pxl3XOUD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723642919; x=1755178919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hqcfXdtGQKVWLTvbdhM5pBJQQzUtmGdgqcjPbawdyX8=;
  b=Pxl3XOUDS22IVqzJSo08IIR0BTJKICw+aJPTnxAlNShxm1Q8w1ph6zn1
   mDCTW9m/sqvRIkr9kgVN4EXRxjvXEN3LN0qt6ULSk6wZcWXAgS25h3JZK
   tC7/VJXePzu39tzSyErTJZxb6jx2NjQjUV1SWL344h+6iChd4eiAL0Sle
   CVUJwrEVotVCZkKJ0n5onaPTY1g8yn+IxfPmK1h9WgbiT0kIGibYelU1u
   EzR3KM7P7x6ES7w1h5xMn97hX03Z2e3d+2tCT0S0XKG21OMSQga8D91Zz
   HBhIghPSM684pIJTbE3PMux4hUV7uCVRctCVxIdQTh35k95nTQqA5CNPf
   g==;
X-CSE-ConnectionGUID: TkD7PT/iTpKIhQlvWc4m8w==
X-CSE-MsgGUID: oaKtEZmETkG/J5jQz+pGtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="32536637"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="32536637"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 06:41:58 -0700
X-CSE-ConnectionGUID: BVNQACSMRPqinWY3Kn6FPQ==
X-CSE-MsgGUID: /UK/S/1HTIe2pQFmOaearg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="89818646"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 06:41:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1seEG8-0000000FC4y-17jJ;
	Wed, 14 Aug 2024 16:41:52 +0300
Date: Wed, 14 Aug 2024 16:41:52 +0300
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
Subject: Re: [PATCH v4 5/6] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <Zry0ILkU4VrL3Mms@smile.fi.intel.com>
References: <20240808095931.2649657-1-wenst@chromium.org>
 <20240808095931.2649657-6-wenst@chromium.org>
 <ZrtHhcNMiyHmKbal@smile.fi.intel.com>
 <CAGXv+5EgqdziyheOt7wzkbe036fqPcw_UpSHiMsB3W_nTB3NWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5EgqdziyheOt7wzkbe036fqPcw_UpSHiMsB3W_nTB3NWQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Aug 14, 2024 at 06:10:03PM +0800, Chen-Yu Tsai wrote:
> On Tue, Aug 13, 2024 at 7:46 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Aug 08, 2024 at 05:59:28PM +0800, Chen-Yu Tsai wrote:

...

> > > +static void chromeos_of_hw_prober_driver_exit(void)
> > > +{
> > > +     if (!chromeos_of_hw_prober_pdev)
> > > +             return;
> >
> > First of all, this is dup for the next call, second, when may this conditional
> > be true?
> 
> When the module is loaded on a machine that doesn't match any entry,
> neither the driver nor the device are registered. Hence the check.
> 
> Or maybe the proper way to handle it is to return -ENODEV or something?
> I'll work towards that.

The rule of thumb is the _exit() is called when your _init() finished with
success. This conditional seems confusing and likely reveals the logic issue
in _init(). Yes, _init() needs to return an error when there is no devices are
registered or expected to be registered. If there are devices that may appear
later on, this should be split to pure device driver and board file that
instantiate device for the known cases.

> > > +     platform_device_unregister(chromeos_of_hw_prober_pdev);
> > > +     platform_driver_unregister(&chromeos_of_hw_prober_driver);
> > > +}

-- 
With Best Regards,
Andy Shevchenko



