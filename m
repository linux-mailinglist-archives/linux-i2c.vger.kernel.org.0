Return-Path: <linux-i2c+bounces-8345-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 656E89E4F9B
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 09:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DE9E2822B0
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2024 08:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449FC1C4A13;
	Thu,  5 Dec 2024 08:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c6rpZfgS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AC5239195;
	Thu,  5 Dec 2024 08:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733387048; cv=none; b=j57C5SlmEDuP1uD4mav4LTavzIsAVDlMpDf+1rP3zqj/Mbgt9CJYJCmHcsIhkRDEZ3S9w9ykgSa/3m8O+xN9uWQ3wtx1oUtotMTzBpfwnvaUSboRdxqsWl36nhUkmB6ITrPJpUJLhXou69QpXrd0Dbyg8E8NRw0XBtO3XbxzVZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733387048; c=relaxed/simple;
	bh=O1PeN31ljyItZ5xk6+LqRE8ohSPjF1LWvw9qqaYkZzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HkmlrPuqUcBJWlYxI23TKs1+1qWwBOuixTWGy8XgEUPofUmNNMpDONg2P9PL7kzan5AyKtNf5mzYHD5Vo+KJZRxxSTWICI5ZJwzzjoAaDefbkVXpVetHpkcQqEpPBsPFLY84Cwsegs87dY0wBXHOdCiwAl4n54vY7ff+AroZ/Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c6rpZfgS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733387047; x=1764923047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=O1PeN31ljyItZ5xk6+LqRE8ohSPjF1LWvw9qqaYkZzE=;
  b=c6rpZfgSHo98OmV0ZBnCxgw8n3KXzvAYYwnzHOtllxBkK0y8H/tiwGHm
   isqQq9vJeUOi5xbIs86qDZ1noGHMqEYQ5JceJaK2Rq8ZQgqJl/gpT/02Y
   7fID9PEfi3TFiCsY9k4lW2F1FHbzdBvdbHytcbIiy9dolQ6mWZVdWy8BK
   fQeRpmKtoEi2QYkt+IHtBFAPJJD5vL2YfHvbUcxMczB0NVHPMPYp2eroO
   tN988KD6hsNPPuTzOEN+t1k86NaGxxNeO17rGSbn+hsm0JGGAPgVpdrsP
   cv+IytbBmPE0gqvhrvzzecROsK3aYeNNRTPoTfGTtqJCq5bqbYo9zpN3g
   A==;
X-CSE-ConnectionGUID: ypWnnFVURHqT2gHe1odI8g==
X-CSE-MsgGUID: EKuHEn5GSi+7wNafu4pY7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37465637"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="37465637"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 00:24:06 -0800
X-CSE-ConnectionGUID: RU7AJT52R72/6oxLC6Wpng==
X-CSE-MsgGUID: L8ueUMDhSbOQTXudwnQojA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="93711195"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 00:24:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tJ79W-000000041em-0AUi;
	Thu, 05 Dec 2024 10:24:02 +0200
Date: Thu, 5 Dec 2024 10:24:01 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Jonathan Cameron <jic23@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] iio: Initialize i2c_device_id structures by name
Message-ID: <Z1FjIQuluXtBeZuc@smile.fi.intel.com>
References: <20241204150036.1695824-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241204150036.1695824-2-u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Dec 04, 2024 at 04:00:36PM +0100, Uwe Kleine-König wrote:
> I intend to change the definition of struct i2c_device_id to look as
> follows:
> 
> 	struct i2c_device_id {
> 	       char name[I2C_NAME_SIZE];
> 	       /* Data private to the driver */
> 	       union {
> 	               kernel_ulong_t driver_data;
> 	               const void *driver_data_ptr;
> 	       };
> 	};
> 
> That the initializers for these structures also work with this new
> definition, they must use named members.
> 
> The motivation for that change is to be able to drop many casts from
> pointer to kernel_ulong_t. So once the definition is updated,
> initializers that today use:
> 
> 	{ "fxls8471", (kernel_ulong_t)&mma_chip_info_table[fxls8471], },
> 
> or
> 
> 	{ .name = "fxls8471", .driver_data = (kernel_ulong_t)&mma_chip_info_table[fxls8471], },
> 
> can be changed to
> 
> 	{ .name = "fxls8471", .driver_data_ptr = &mma_chip_info_table[fxls8471], }
> 
> and some more casts when the driver data is used can be dropped, too.

...

>  static const struct i2c_device_id adxl345_i2c_id[] = {
> -	{ "adxl345", (kernel_ulong_t)&adxl345_i2c_info },
> -	{ "adxl375", (kernel_ulong_t)&adxl375_i2c_info },
> +	{ .name = "adxl345", .driver_data = (kernel_ulong_t)&adxl345_i2c_info, },
> +	{ .name = "adxl375", .driver_data = (kernel_ulong_t)&adxl375_i2c_info, },

Redundant inner trailing commas. And they were absent in the original code.
And I find that better style as usually we leave commas (or add them) only in
multi-line cases.

>  	{ }
>  };

-- 
With Best Regards,
Andy Shevchenko



