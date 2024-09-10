Return-Path: <linux-i2c+bounces-6461-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E31972CD3
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 11:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C5C51F21D7C
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 09:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09CE188002;
	Tue, 10 Sep 2024 09:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aK2/8Tm/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EC018C030;
	Tue, 10 Sep 2024 09:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725958984; cv=none; b=PKSrpdAp+yLZFWsAQO8QlyyhWPXSBrO4Gogp6i95EtJcOty/O8PL7hHlvYHbSaUKdqKX+SettLZVP3t2eWaeNYio7Xykugj+ivBJxG+xFAScEwds6gOn8V0sm8frBxB6c/EtemIi6gYY9e4MAnWpxGql+UqIeyVnRLkdI5NbflI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725958984; c=relaxed/simple;
	bh=s8PXXMiB50wCVxSWN4FCor+0lXveR5YTRcOXwyboojg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k30uE11llSfJ3C/FYuxEdTyhM7lhKqGed7D0rkL74HU8OofMGD9GZ+lmBKgfMEsmRvp2PK/kdajCeRf6OrLT0DAk9tJlkteCy1KjWYcn7tpS8ocX8PlTsyLkvud7hijWlrABCjs6zbR53JSFuaRnnTBdTAQNl0pHSoteu6RJBkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aK2/8Tm/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725958983; x=1757494983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s8PXXMiB50wCVxSWN4FCor+0lXveR5YTRcOXwyboojg=;
  b=aK2/8Tm/4wU69zKlvXfS38hyzvvjubIhUmHKh1kp4t8DrDnwH2xqdWCd
   VYhTxw2yO0pN3uKL4OSbm6+xa6zYegpVjhckcBbuLmOpNVAMPimfoiWt4
   Q0aFXuur9p9U8g2fPONaiNwgiR90ERuV2hlWgNGJTo4hYN2O/bht8wtM8
   UK8WgYtqyEMgxTIFxnte6U4rVncJceLwfvxrMwxqOqWuNqXe5o0P8rIQJ
   r5fd176O6ced6dhH7RrBocNOL8kY9VSyu8i0VBt/Fpj0rSvbzEzAtjUFB
   +iiH8RpbOACZeiYyECNfHtAnP9jXVakKIGIhGTCmMN9Q1Zh61X4GHKacS
   Q==;
X-CSE-ConnectionGUID: Ujr2bvugQUeIDQ7xDvWkVw==
X-CSE-MsgGUID: 9ytsDAWsTh6GgTctMQdD0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35264798"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="35264798"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 02:03:03 -0700
X-CSE-ConnectionGUID: jGOjqHVPSp2e/HbDdV9saA==
X-CSE-MsgGUID: DH3wm5BDRga9Sl9ZR82o3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="71365475"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 02:03:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1snwm2-000000078Ir-0vTa;
	Tue, 10 Sep 2024 12:02:58 +0300
Date: Tue, 10 Sep 2024 12:02:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kimriver Liu <kimriver.liu@siengine.com>
Cc: jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Message-ID: <ZuALQVyTBFugG0Sw@smile.fi.intel.com>
References: <9d181a45f3edf92364c9e6b729638f0b3f2e7baa.1725946886.git.kimriver.liu@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d181a45f3edf92364c9e6b729638f0b3f2e7baa.1725946886.git.kimriver.liu@siengine.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 10, 2024 at 02:13:09PM +0800, Kimriver Liu wrote:
> It was observed issuing ABORT bit(IC_ENABLE[1]) will not work when

"...observed that issuing..."
...bit (..."


> IC_ENABLE is already disabled.
> 
> Check if ENABLE bit(IC_ENABLE[0]) is disabled when the master is

"...bit (..."
master --> controller

> holding SCL low. If ENABLE bit is disabled, the software need
> enable it before trying to issue ABORT bit. otherwise,
> the controller ignores any write to ABORT bit.

Fixes tag?

...

>  	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
>  	if (abort_needed) {
> +		if (!(enable & DW_IC_ENABLE_ENABLE)) {

> +			regmap_write(dev->map, DW_IC_ENABLE, DW_IC_ENABLE_ENABLE);

This call might also need a one line comment.

> +			enable |= DW_IC_ENABLE_ENABLE;

More natural is to put this after the fsleep() call. The rationale is that it
will be easier to see what exactly is going to be written back to the
register.

> +			/*
> +			 * Wait 10 times the signaling period of the highest I2C
> +			 * transfer supported by the driver (for 400KHz this is
> +			 * 25us) to ensure the I2C ENABLE bit is already set
> +			 * as described in the DesignWare I2C databook.
> +			 */
> +			fsleep(DIV_ROUND_CLOSEST_ULL(10 * MICRO, t->bus_freq_hz));

...somewhere here...

> +		}
> +
>  		regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);

...

> +static bool i2c_dw_is_master_idling(struct dw_i2c_dev *dev)

Sorry if I made a mistake, but again, looking at the usage you have again
negation here and there...

	i2c_dw_is_controller_active

(note new terminology, dunno if it makes sense start using it in function
 names, as we have more of them following old style)

> +{
> +	u32 status;
> +
> +	regmap_read(dev->map, DW_IC_STATUS, &status);
> +	if (!(status & DW_IC_STATUS_MASTER_ACTIVITY))
> +		return true;

		return false;

.,,

> +	return !regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
> +			!(status & DW_IC_STATUS_MASTER_ACTIVITY),
> +			1100, 20000);

...and drop !.

> +}

...

> +	/*
> +	 * This happens rarely and is hard to reproduce. Debug trace

Rarely how? Perhaps put a ration in the parentheses, like

"...rarely (~1:100)..."

> +	 * showed that IC_STATUS had value of 0x23 when STOP_DET occurred,
> +	 * if disable IC_ENABLE.ENABLE immediately that can result in
> +	 * IC_RAW_INTR_STAT.MASTER_ON_HOLD holding SCL low.
> +	 */
> +	if (!i2c_dw_is_master_idling(dev))

...and here

	if (i2c_dw_is_controller_active(dev))

But please double check that I haven't made any mistakes in all this logic.

> +		dev_err(dev->dev, "I2C master not idling\n");

-- 
With Best Regards,
Andy Shevchenko



