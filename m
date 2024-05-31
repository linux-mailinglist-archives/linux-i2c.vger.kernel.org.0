Return-Path: <linux-i2c+bounces-3731-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8381A8D64BD
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 16:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B48691C2358B
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 14:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3CDD5337C;
	Fri, 31 May 2024 14:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gIgfamOO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BFA2E859;
	Fri, 31 May 2024 14:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717166720; cv=none; b=PVjeTurLoYS50vRnWOfXSqdTfMfnsOO55b+MuBsyi/8lKkX/pu3IfZi+ygw14Rri90+MLpv6QsxuN20NhXmXk683HihBaM8TfGuF91WFNUv/LSrEchz/2aqMnmZvKhiewTDhAdFBmTw9Up/sx9bvkbDKHUttRSWomG7Ez9Ox7zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717166720; c=relaxed/simple;
	bh=EIrwrMgP84onPe3hHLgvihCbppR9nSwhvh1a+A539DY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPaawZlAt/un4UkTd4hrKgd4O5ide/XdHP5hIlP77VPlztlmxrsgNpK8osS0bhNMsMierlIPoHjcJzglLf12qNPmZKLuMSycyX/4wPl3vmTjLPERoeCZnliOpSQU41wtcuS1tSMLeoaBkm2BXU/qS5WDVplGDjtjhL4A2RhvWh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gIgfamOO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717166719; x=1748702719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EIrwrMgP84onPe3hHLgvihCbppR9nSwhvh1a+A539DY=;
  b=gIgfamOOAheaM2zBu2lQ4GMOSELo/ZqSOsYGTom12B+TgfDIbkMNTTuQ
   asIFUfdMBPLNvCdG6GEaf863ROjyNVYjM2AH/x1ebhV9KKOXJhcBwQxaH
   Mwah1iAolf0hKn/LjwRsLTruQw8/UF+zP3/nh3juJERcJuNnESna9+8Gi
   C7e7gWi6LKbQU0rnvth01ZqRD7A41AwuZI6YT9Wgt295R+63w27si6mvq
   Vgs+zo2bThGn4MpdwGIYwbrYy5NwDG5enIT9fTFMya18nCR8QTDGYvpg5
   +HplbfP2lJYpvzwQUeGfVn65auDiL/bNT+lHCrmkrig2fjTPvasX9gXnz
   A==;
X-CSE-ConnectionGUID: xOAAyloVQK6zyP39xzGL+Q==
X-CSE-MsgGUID: QJQeq4zxQIWPexzpDikVQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13939047"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="13939047"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 07:45:19 -0700
X-CSE-ConnectionGUID: AF/eqOPGQtC4ibKbWQSFkQ==
X-CSE-MsgGUID: OrRQBb5xQYCHfCfMLf2tzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="67030268"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 07:45:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sD3VG-0000000CUn1-45IS;
	Fri, 31 May 2024 17:45:10 +0300
Date: Fri, 31 May 2024 17:45:10 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	jic23@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
	u.kleine-koenig@pengutronix.de, marcelo.schmitt@analog.com,
	gnstark@salutedevices.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [RFC PATCH] i2c: imx: avoid rescheduling when waiting for bus
 not busy
Message-ID: <Zlnidi62gEWwdQ3U@smile.fi.intel.com>
References: <20240531142437.74831-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531142437.74831-1-eichest@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 31, 2024 at 04:24:37PM +0200, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> On our i.MX8M Mini based module we have an ADS1015 I2C ADC connected to
> the I2C bus. The ADS1015 I2C ADC will timeout after 25ms when the I2C
> bus is idle. The imx i2c driver will call schedule when waiting for the
> bus to become idle after switching to master mode. When the i2c
> controller switches to master mode it pulls SCL and SDA low, if the
> ADS1015 I2C ADC sees this for more than 25 ms without seeing SCL
> clocking, it will timeout and ignore all signals until the next start
> condition occurs (SCL and SDA low). This can occur when the system load
> is high and schedule returns after more than 25 ms.
> 
> This rfc tries to solve the problem by using a udelay for the first 10
> ms before calling schedule. This reduces the chance that we will
> reschedule. However, it is still theoretically possible for the problem
> to occur. To properly solve the problem, we would also need to disable
> interrupts during the transfer.
> 
> After some internal discussion, we see three possible solutions:
> 1. Use udelay as shown in this rfc and also disable the interrupts
>    during the transfer. This would solve the problem but disable the
>    interrupts. Also, we would have to re-enable the interrupts if the
>    timeout is longer than 1ms (TBD).
> 2. We use a retry mechanism in the ti-ads1015 driver. When we see a
>    timeout, we try again.
> 3. We use the suggested solution and accept that there is an edge case
>    where the timeout can happen.
> 
> There may be a better way to do this, which is why this is an RFC.

...

> +			/*
> +			 * Avoid rescheduling in the first 10 ms to avoid
> +			 * timeouts for SMBus like devices
> +			 */
> +			if (time_before(jiffies, orig_jiffies + msecs_to_jiffies(10)))
> +				udelay(10);
> +			else
> +				schedule();

Isn't there cond_resched() or so for such things?
More info here: 494e46d08d35 ("airo: Replace in_atomic() usage.")

-- 
With Best Regards,
Andy Shevchenko



