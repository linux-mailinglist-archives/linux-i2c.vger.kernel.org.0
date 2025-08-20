Return-Path: <linux-i2c+bounces-12362-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C37B2E2C8
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 19:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D35B167B93
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 17:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E165221F2F;
	Wed, 20 Aug 2025 17:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBOmepMk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD36C36CDFA;
	Wed, 20 Aug 2025 17:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755709256; cv=none; b=BOIx5dig/QocP3+MXWzKDTnCjlp46pK4x0RH0ku0oe/EygI2EJHuY7oThxlOiDT5kHg0ZVT7T/SznkeTMAcxtWFR1itj/e9WGhzTMVCTOGJ6R0CpXK8YefRMjaly/yMS9BQCdV/dIcbGP5VXuZk0pCnV/y747yksNjedYZnWcN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755709256; c=relaxed/simple;
	bh=w2+v/zgYO2P6qqQQjWZg0Z1GPgZwU3f5IIywEy7xtfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jeH5qjLNMNxUzfDkNXTfW/SiG2bG+S9w9qtPoCzUDODvVByn6/IrfBnOtyTiuqn6hcpbtdnRzvFyjJ5LIpJl+9ToRkAVRfxlHIFpjU9V15PA8Dy5SHmtN24CMB0Gf0ikJSFIPpOL1MqTU+jLKkCgZyPbMmFpQ7jddNZP6dT1X/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBOmepMk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755709254; x=1787245254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w2+v/zgYO2P6qqQQjWZg0Z1GPgZwU3f5IIywEy7xtfI=;
  b=GBOmepMkWpFoY8cs99kVRBTldPQamIlyx7ENucqtGduwQqMRBfSYPhLJ
   YrwUiIXbPoECctECu5r+xbkjEsEYoDgP3B2M29gubJoOU/tgvH2/B8OyK
   EYgSBDQXxb0HG4cNuqEEblqPXKgC8HDJUfYuzznKO3176sscrfK0LakS9
   d+fsfx/xozHdjmeaone1ozey91WQs3moQu+ilhL9wkRM1yxlBv+UlxZ3Y
   deWNDzYY6LzaXB2qLjycfHmJSnMQlsRnH9+LsQtZ2hT9eNP52RTiThatM
   QScNcbhmtJtTQijvOxMksPrD1EO001nFbYsB9HZA9c+HqGFsRflL7oclD
   A==;
X-CSE-ConnectionGUID: cVSgBEPCTJyauA4TKTpNfw==
X-CSE-MsgGUID: 74sW78+4TNq0LVrARjAiww==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57185991"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="57185991"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 10:00:52 -0700
X-CSE-ConnectionGUID: xKe0lnXwSueVsVcV+g0axg==
X-CSE-MsgGUID: sBm/ebDGSB682VPoFi2sAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="168975933"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 10:00:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uomB5-00000006zwy-3VKJ;
	Wed, 20 Aug 2025 20:00:47 +0300
Date: Wed, 20 Aug 2025 20:00:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: designware: Implement atomic transfer suppot
Message-ID: <aKX_PwQWoe9S0QjP@smile.fi.intel.com>
References: <20250820153125.22002-1-jszhang@kernel.org>
 <20250820153125.22002-3-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820153125.22002-3-jszhang@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 20, 2025 at 11:31:25PM +0800, Jisheng Zhang wrote:
> Rework the read and write code paths in the driver to support operation
> in atomic contexts. To achieve this, the driver must not rely on IRQs
> or perform any scheduling, e.g., via a sleep or schedule routine.
> 
> Implement atomic, sleep-free, and IRQ-less operation. This increases
> complexity but is necessary for atomic I2C transfers required by some
> hardware configurations, e.g., to trigger reboots on an external PMIC chip.

...

> -		usleep_range(25, 250);
> +		if (dev->atomic)
> +			udelay(25);
> +		else
> +			usleep_range(25, 250);

Wondering why this delay is not being properly calculated. Why in atomic case
is okay to use the shortest one?

...

> -	if (!dev->acquire_lock)
> +	if (dev->atomic || !dev->acquire_lock)

I think basically we should no allow atomic transfers at all when the lock is
in use. Otherwise it will be interesting case if HW (FW) wants to have an
exclusive access while OS wants to perform an atomic transfer.

...

> +	if (dev->atomic)
> +		return regmap_read_poll_timeout_atomic(dev->map, DW_IC_STATUS, status,
> +						       !(status & DW_IC_STATUS_MASTER_ACTIVITY),
> +						       1100, 20000) != 0;
> +	else
> +		return regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
> +					       !(status & DW_IC_STATUS_MASTER_ACTIVITY),
> +					       1100, 20000) != 0;

Please, drop ' != 0' parts at the same time, they are redundant.

...

> +static int i2c_dw_wait_transfer_atomic(struct dw_i2c_dev *dev)
> +{
> +	ktime_t timeout = ktime_add_us(ktime_get(), jiffies_to_usecs(dev->adapter.timeout));
> +	unsigned int stat;
> +	int ret;
> +
> +	do {
> +		ret = try_wait_for_completion(&dev->cmd_complete);
> +		if (ret)
> +			break;
> +
> +		stat = i2c_dw_read_clear_intrbits(dev);
> +		if (stat)
> +			i2c_dw_process_transfer(dev, stat);
> +		else
> +			udelay(15);

No explanation about this value.

> +	} while (ktime_compare(ktime_get(), timeout) < 0);

Whe have _before() and _after() APIs, use them.

> +	return ret ? 0 : -ETIMEDOUT;
> +}

...

>  	switch (dev->flags & MODEL_MASK) {
>  	case MODEL_AMD_NAVI_GPU:
> +		if (dev->atomic) {
> +			ret = -EOPNOTSUPP;
> +			goto done_nolock;
> +		}

Why only AMD case?

>  		ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
>  		goto done_nolock;
>  	default:
>  		break;
>  	}

-- 
With Best Regards,
Andy Shevchenko



