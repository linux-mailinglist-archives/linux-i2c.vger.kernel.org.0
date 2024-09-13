Return-Path: <linux-i2c+bounces-6703-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 467FF977DD3
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD6CC1F20A9B
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9906F1D7998;
	Fri, 13 Sep 2024 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHnd8V4C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C0D1D6C7F;
	Fri, 13 Sep 2024 10:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223979; cv=none; b=b+vrFSelwRSBZqOtWUxEYham1IwXn0W/6aPOk4gqD5RgHWXn1v0etBYqbujbQDi5qNVTMyJgwNERVJVAAidiS7tHsQYswU9Fzx2e7HDK+/BvatkarFf8yfmN0+FTYEl1K6NUIOIQxgT7Opxlc9ORJw94P1FT4WpoIMTod8V+HOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223979; c=relaxed/simple;
	bh=6sF+wPKjn76Jsy/0GoNxE4UqYC466NE3LDyXXL2yCd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLhzmoGX4/bH6C+DT85XBbw3cT+curfsEGQVmX4cOH0VduvSp4LK/b1mDkGC5bsyFmVGDk8lW9njNL12SUeRRcJPyEEjvPjS/B0gHOWuOEWfuxbGIbzv/EI3v2kR57CbaXw43x01/+ExmFLCmOgkuHY90tuQ1GSoS7aOUZlsaGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHnd8V4C; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726223978; x=1757759978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6sF+wPKjn76Jsy/0GoNxE4UqYC466NE3LDyXXL2yCd4=;
  b=kHnd8V4CzDOxWjXTreNGteMGdiK50gCyReUQP8z/n1YtBUAXPrJc9wkl
   7ezsDNq0gEabzDPRbrpWastdjKqJxBDMY+xcamqG4XaMcEmO0KT9qEGXX
   bxdwWdquepgS0SrSP09Oe9Rt+K++/BT/rVuRVZMw4g3A4Wwq4ETxgBlfX
   7cjbcUKkFTpn35oLNVO61esA7G/4T+YwFANVZUl15AOCyM32bif1KKbBv
   XR37pXlSRWEwC4zXlsdfHtZIBnUhDGBteA8cKsgT/Sryw2JMZWfO3Px6k
   C0Bs3IsZ+ZQKL0LW6LVI6u4vMM/j3VjTn2iaOgE9p8xPhxNPGW0xMJvEu
   Q==;
X-CSE-ConnectionGUID: kjD7E8icReSlUuoH+cmAIw==
X-CSE-MsgGUID: fSnCVcBlT92slkv0uD6EKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35784900"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="35784900"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:39:37 -0700
X-CSE-ConnectionGUID: j4EqSQe+R3u8rz+7vbv3AQ==
X-CSE-MsgGUID: KNkvfoktRnmdiNOXEIoUsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="68781907"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:39:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sp3i5-00000008GRR-3LAw;
	Fri, 13 Sep 2024 13:39:29 +0300
Date: Fri, 13 Sep 2024 13:39:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: warp5tw@gmail.com
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	andi.shyti@kernel.org, wsa@kernel.org, rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] i2c: npcm: use i2c frequency table
Message-ID: <ZuQWYabomv_xyYyj@smile.fi.intel.com>
References: <20240913101445.16513-1-kfting@nuvoton.com>
 <20240913101445.16513-6-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913101445.16513-6-kfting@nuvoton.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 13, 2024 at 06:14:45PM +0800, warp5tw@gmail.com wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Modify i2c frequency from table parameters
> for NPCM i2c modules.
> 
> Supported frequencies are:
> 
> 1. 100KHz
> 2. 400KHz
> 3. 1MHz
> 
> The original equations were tested on a variety of chips and base clocks.
> Since we added devices that use higher frequencies of the module we
> saw that there is a mismatch between the equation and the actual
> results on the bus itself, measured on scope.
> 
> Meanwhile, the equations were not accurate to begin with.
> They are an approximation of the ideal value. The ideal value is
> calculated per frequency of the core module.
> 
> So instead of using the equations we did an optimization per module
> frequency, verified on a device.
> 
> Most of the work was focused on the rise time of the SCL and SDA,
> which depends on external load of the bus and PU.
> 
> Different PCB designs, or specifically to this case: the number
> and type of targets on the bus, impact the required values for
> the timing registers.
> 
> Users can recalculate the numbers for each bus and get an even better
> optimization, but our users chose not to.
> 
> We manually picked values per frequency that match the entire valid
> range of targets (from 1 to max number). Then we check against the
> AMR described in SMB spec and make sure that none of the values
> is exceeding.
> 
> This process was led by the chip architect and included a lot of testing.

...

> +	{.core_clk = 100000000, .hldt = 0x2A, .dbcnt = 0x4, .sclfrq = 0xFB, .scllt = 0x0,
> +	.sclht  = 0x0, .fast_mode = false },

It seems you have no leading space, while having trailing one. Also the split
seems a bit illogical to me, I would rather do like

	{
		.core_clk = 100000000, .hldt = 0x2A, .dbcnt = 0x4,
		.sclfrq = 0xFB, .scllt = 0x0, .sclht  = 0x0,
		.fast_mode = false,
	},

Yes, this takes more lines, but also more flexible to the updates in the
future. Also mind the trailing comma at the last member assignment.

...

> +	for (scl_table_cnt = 0 ; scl_table_cnt < table_size ; scl_table_cnt++)

Extra spaces...

> +		if (bus->apb_clk >= smb_timing[scl_table_cnt].core_clk)
> +			break;

...

>  	/* bits [8:7] are in I2CCTL3 reg */
> -	iowrite8(fast_mode | FIELD_PREP(I2CCTL3_SCLFRQ8_7, (sclfrq >> 7) & 0x3),
> +	iowrite8(fast_mode | FIELD_PREP(I2CCTL3_SCLFRQ8_7, (smb_timing[scl_table_cnt].sclfrq >> 7)
> +		 & 0x3),
>  		 bus->reg + NPCM_I2CCTL3);

This has broken (illogical) indentation. Consider

	iowrite8(FIELD_PREP(I2CCTL3_SCLFRQ8_7, (smb_timing[scl_table_cnt].sclfrq >> 7) & 0x3) |
		 fast_mode,
		 bus->reg + NPCM_I2CCTL3);

-- 
With Best Regards,
Andy Shevchenko



