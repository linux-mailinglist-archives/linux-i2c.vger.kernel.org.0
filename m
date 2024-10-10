Return-Path: <linux-i2c+bounces-7325-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B16D3998C4A
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2024 17:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF81EB2F294
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2024 15:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D8D1CCB28;
	Thu, 10 Oct 2024 15:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hdlIpHYg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822131CC89F;
	Thu, 10 Oct 2024 15:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728574352; cv=none; b=UmhjaEjRA9jwksCgxQaPDVbjd9s22kz+JJltsdb0q1M8jd6LqUhyvTFWdPFixohFIB8thFZu+kOCx82Vj0cUxphg0Tpby7kCZWoC8G9eig1wMrShlSgmPHZxCql/xLzFEwa9JICryAJxHpW9nlYeUkv4+YFGv91hTe8VRM/X+X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728574352; c=relaxed/simple;
	bh=MP15bS4w3vSqH5JjlnyEj+lJuyt5Y2WkrfBOlfGovZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uERW7ymBYAR8nYsS/M12IgcmfYvDIglfT3yeItYEES/QPNfcspBoTNbYYrhFwAEdn/6w6CiW8bdFJOAeG/iPI1Nuy6OhdKU+XfMxNP+1z3IEeGz1dlhLmJaPTZIkOd9PlzbRyclHI+Ubpie4fXBmZ594m3mGVEjkdcX7Uky/GB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hdlIpHYg; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728574351; x=1760110351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MP15bS4w3vSqH5JjlnyEj+lJuyt5Y2WkrfBOlfGovZ8=;
  b=hdlIpHYgrQ5JkCQACO2Ob6IQdjxn8egWXqagEB4ep1hdTH/modk9ua6z
   8q8Ffoq3tzp0rWyXhTF2RJUewYxdSVBOBJP8aWI4YD6ktgViumHnJNA2w
   m/632BPozGF7kh0P4/NjzUQdbIXX7gqmlrk9/8iBjv+PKsewEXTkZXkLO
   DlR6NJHDZ8Y2jpvDhsIaqFYkDwANFYxP0XR35TTh3oWFN5xN/ylSxGwra
   0Rg559p0uCUHmbtmA3/nkv63lBDI6VLwM8tRNLKZy/NpUthmHRQdoq+WD
   vUB7fi4u5VmrURzWB8dVJL34I9SCHzo+XRJfLssM9+IXhyKtQK4i50tvW
   Q==;
X-CSE-ConnectionGUID: EYRAZESpQ5CXqn3EW0rFgw==
X-CSE-MsgGUID: JptM8s08StyxFOj1vOPBsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="45456275"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="45456275"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 08:32:30 -0700
X-CSE-ConnectionGUID: 8qbP8zovS+qEoDxs1TzEVw==
X-CSE-MsgGUID: BDJjDco/TJayOTFrgGJreA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="76828992"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 08:32:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1syv9K-00000001Zwx-1c2G;
	Thu, 10 Oct 2024 18:32:22 +0300
Date: Thu, 10 Oct 2024 18:32:22 +0300
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
Subject: Re: [PATCH v8 7/8] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <ZwfzhsvlPrxMi61j@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-8-wenst@chromium.org>
 <Zwfy6ER6sbr_QxsY@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zwfy6ER6sbr_QxsY@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 10, 2024 at 06:29:44PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:

...

> > +static const struct chromeos_i2c_probe_data chromeos_i2c_probe_dumb_touchscreen = {
> > +	.cfg = &(const struct i2c_of_probe_cfg) {
> 
> Perhaps you can introduce something like
> 
> #define DEFINE_I2C_OF_PROBE_CFG(_type_, _ops_)		\
> 	(struct ...) {					\
> 		.ops = _ops_,				\
> 		.type = #_type_,			\
> 	}
> 
> and use it here as
> 
> 	.cfg = DEFINE_I2C_OF_PROBE_CFG(touchscreen, NULL),
> 
> > +		.type = "touchscreen"
> 
> Ditto.

This was for leaving trailing comma.

> > +	}
> 
> Ditto.
> 
> > +};
> > +
> > +static const struct i2c_of_probe_cfg chromeos_i2c_probe_simple_trackpad_cfg = {
> > +	.ops = &i2c_of_probe_simple_ops,
> > +	.type = "trackpad"
> 
> Leave a comma.
> 
> > +};

...

> > +	.cfg = &chromeos_i2c_probe_simple_trackpad_cfg,
> 
> 	.cfg = DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_simple_ops),
> 
> Or even
> 
> #define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)			\
> 	DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)

With that also looking at the above

#define DEFINE_I2C_OF_PROBE_CFG_NONE(_type_)				\
	DEFINE_I2C_OF_PROBE_CFG(type, NULL)

-- 
With Best Regards,
Andy Shevchenko



