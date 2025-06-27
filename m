Return-Path: <linux-i2c+bounces-11667-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2236AEB987
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 16:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6FC21C615D5
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 14:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F752E11CE;
	Fri, 27 Jun 2025 14:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0OeCbOx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819F5298CAE;
	Fri, 27 Jun 2025 14:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751033627; cv=none; b=qmlRy81sO5Lrx7uuRPegtN0XTlfTffI9eh1y0Err8FZ8Jpb1o//5RIOTy4CWIF+9xPn/zTtl/hesT0sRHg64ZfEJiWghoeq7KZiC4yLYYf7pW7pUzy3QC7QdPh+vPg+PSoDQGM45VUaDHb+Gl1leo8wNYFVvZMfrMjpQry0lj2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751033627; c=relaxed/simple;
	bh=32FONBh62JeuahpO4SNalmBjx2BSgd3T8J+Zdzf/Kbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pk7Kk+5ASDLbvZ5OOasbeYjSUIuhMoUgq7dQz3WLT1/dhtKDaipMIWIUqvRwFTLNIeiSx+5iaJspBsdEclfA1QUw5BoaGtbp/C6VWA/4r4X85Q6U2T8Glw+ar1O3OfZh+7G5Cnm/5hsAC8WwPXDE47kBoxqYCEL/DNOHaPFP3u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i0OeCbOx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751033626; x=1782569626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=32FONBh62JeuahpO4SNalmBjx2BSgd3T8J+Zdzf/Kbs=;
  b=i0OeCbOxM++2olJ9Gf/3SFPZFpXVngaojPU/1xuH7iT953+zH/j1unT+
   Q1miMlJnwmMYPw3CNcU6hUC7D1/yAB0ac+uHiCZcI6Y7nalk0JWljU8/P
   WwRTzxPLLf4NwHTkAT5cFjiRbq7Xlimtp3ZyJPdiXGj1NUo5p72YElM9J
   Qa0uW/PyAucn+BQ7kG6zapWH7kV+wRLopPHcT4jQVfJvfmoGX+OYotNXe
   R+FJqPGxQxJhAK69XlVdbEUmJqatzA4gM09syGezfV4iV+KLWaqHRFxXv
   /o/MxY2WzBPw1lBz7qeaECNwGOknylKChKutEbEkCjdcDgykn22ejKpmy
   Q==;
X-CSE-ConnectionGUID: 0xiYKZwoSKmxEoStiJc37Q==
X-CSE-MsgGUID: 46Jov5FAQo6t2c7+jSPwHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53431116"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53431116"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 07:13:44 -0700
X-CSE-ConnectionGUID: gszeNA2iR2uE3ieEJVDy/w==
X-CSE-MsgGUID: usucIBTtQGqZWoiNmz2b9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="183713491"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 07:13:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uV9pg-0000000AV7n-3zOe;
	Fri, 27 Jun 2025 17:13:36 +0300
Date: Fri, 27 Jun 2025 17:13:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Raag Jadav <raag.jadav@intel.com>,
	"Tauro, Riana" <riana.tauro@intel.com>,
	"Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] i2c: designware: Add quirk for Intel Xe
Message-ID: <aF6nEOVhLURyf616@smile.fi.intel.com>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 27, 2025 at 04:53:11PM +0300, Heikki Krogerus wrote:
> The regmap is coming from the parent also in case of Xe
> GPUs. Reusing the Wangxun quirk for that.

...

>  static int dw_i2c_plat_probe(struct platform_device *pdev)
>  {
> +	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);

> -	dev->flags = (uintptr_t)device_get_match_data(device);
>  	if (device_property_present(device, "wx,i2c-snps-model"))
> -		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> +		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
>  
>  	dev->dev = device;
>  	dev->irq = irq;
> +	dev->flags = flags;

Maybe I'm missing something, but why do we need these (above) changes?


-- 
With Best Regards,
Andy Shevchenko



