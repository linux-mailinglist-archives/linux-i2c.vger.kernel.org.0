Return-Path: <linux-i2c+bounces-6171-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECE296BD42
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 14:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7175D1C2457C
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E1B1DA2F3;
	Wed,  4 Sep 2024 12:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJIu32n/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3271DA0E5;
	Wed,  4 Sep 2024 12:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725454536; cv=none; b=tOMOryyfAD2Ct3KcY8CmiUSPtq7JmO8opVtagA2jHYDjaF3lwV+PIY6wixOp+ccPqNRBE61LSp129dbi70tvDnQhbEzDaNRt+qi7Q62Oa/N90GQ/XiVRrABevFo4QAA4glRqDDAYWeCIFt88LQ17ducNVkC+WUlqb5fFEsbT9jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725454536; c=relaxed/simple;
	bh=YM1p2wAwDQn4XY/AvOaGNjciJYOkqpckq7xEmlNJajA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdQf4Am3Np5lhSKiE/sDmdb2GLWKWBBpg6kGWNpbPzELoS1QWxBIA+lzs3gmogg0dTV6MptcANCRa65NN3BZv4FRI3BdTdRxzmk6p1ZQT76LeFaYYl/1IKZnoCvSIiwo3mPBpyPRq+BfSNbyFs9eGPrUy+TyyEzGyc/9IlGlhG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJIu32n/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725454535; x=1756990535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=YM1p2wAwDQn4XY/AvOaGNjciJYOkqpckq7xEmlNJajA=;
  b=DJIu32n/4ZZv0lD4hVKhWFhJyfcPH4k6SMxJIPtP6zbaCOYJWsmNDJG2
   QgKCIYvn/LSeyxqncLLm6pHxDZb3T4omXXpfhXxjMD9vRKdUhuRpDzmYB
   QOttQSAKUkmoJas8Ga4O9RSNcKQFMBGjJQLEaGLnSFp/4eUQnV91fRTME
   7YSFfmvpb0TVjUVW4TsKaj6H3AImWpxzzZqVbv7mHcnM+MIi+VMuizx6m
   CTe+318eZ/Db42VSnrc2Ea7x2JoeSmYTliQFz2gXyXhm4Yk2yOLp6sZuk
   4RL3zDsGNYdOzOeodueE46f+1VDQBX22RFQtydZODRmrv0MHReGrYENPk
   g==;
X-CSE-ConnectionGUID: 249NBb+IR1uvjiIBr1xnuA==
X-CSE-MsgGUID: r4YDOpJcSt28IfF2EPWchQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23675144"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="23675144"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 05:55:34 -0700
X-CSE-ConnectionGUID: 0o1/MsxiRnO1J7hnxnpHOQ==
X-CSE-MsgGUID: HcM9ft6WSFGTu/kKS2gFAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="95994397"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 05:55:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slpXl-0000000547O-2U2G;
	Wed, 04 Sep 2024 15:55:29 +0300
Date: Wed, 4 Sep 2024 15:55:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kimriver liu <kimriver.liu@siengine.com>
Cc: jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Message-ID: <ZthYwQfj3Vy6dU-S@smile.fi.intel.com>
References: <20240904064224.2394-1-kimriver.liu@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240904064224.2394-1-kimriver.liu@siengine.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 04, 2024 at 02:42:24PM +0800, kimriver liu wrote:
> From: "kimriver.liu" <kimriver.liu@siengine.com>
> 
> Failure in normal Stop operational path
> 
> This failure happens rarely and is hard to reproduce. Debug
> trace showed that IC_STATUS had value of 0x23 when STOP_DET
> occurred, immediately disable ENABLE bit that can result in
> IC_RAW_INTR_STAT.MASTER_ON_HOLD holding SCL low.
> 
> Failure in ENABLE bit is disabled path
> 
> It was observed that master is holding SCL low and the
> IC_ENABLE is already disabled, Enable ABORT bit and
> ENABLE bit simultaneously cannot take effect.
> 
> Check if the master is holding SCL low after ENABLE bit is
> already disabled. If SCL is held low, The software can set
> this ABORT bit only when ENABLE is already set，otherwise,
> the controller ignores any write to ABORT bit. When the
> abort is done, then proceed with disabling the controller.
> 
> These kernel logs show up whenever an I2C transaction is
> attempted after this failure.
> i2c_designware e95e0000.i2c: timeout in disabling adapter
> i2c_designware e95e0000.i2c: timeout waiting for bus ready
> 
> The patch can be fix the controller cannot be disabled while
> SCL is held low in ENABLE bit is already disabled.

...

>  	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
>  	if (abort_needed) {
> +		if (!enable) {
> +			regmap_write(dev->map, DW_IC_ENABLE, DW_IC_ENABLE_ENABLE);
> +			enable |= DW_IC_ENABLE_ENABLE;

> +			usleep_range(25, 100);

fsleep()

And add a short comment to explain the chosen value.

> +		}

...

> +static int i2c_dw_check_mst_activity(struct dw_i2c_dev *dev)
> +{
> +	u32 status = 0;
> +	int ret = 0;
> +
> +	regmap_read(dev->map, DW_IC_STATUS, &status);
> +	if (status & DW_IC_STATUS_MASTER_ACTIVITY) {
> +		ret = regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
> +				!(status & DW_IC_STATUS_MASTER_ACTIVITY),
> +				1100, 20000);
> +		if (ret)
> +			dev_err(dev->dev, "i2c mst activity not idle %d\n", ret);
> +	}
> +
> +	return ret;

This can be rewritten as

	u32 status = 0;
	int ret;

	regmap_read(dev->map, DW_IC_STATUS, &status);
	if (!status & DW_IC_STATUS_MASTER_ACTIVITY))
		return 0;

	ret = regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
			!(status & DW_IC_STATUS_MASTER_ACTIVITY),
			1100, 20000);
	if (ret)
		dev_err(dev->dev, "i2c mst activity not idle %d\n", ret);

	return ret;

> +}

...

> +	ret = i2c_dw_check_mst_activity(dev);
> +	if (!ret)
> +		__i2c_dw_disable_nowait(dev);

...but looking at the usage, I think the proper is to have the above to return
boolean. And also update the name to follow the usual pattern for boolean helpers.

static bool i2c_dw_is_mst_idling(struct dw_i2c_dev *dev)
...
	if (i2c_dw_is_mst_idling(dev))
		__i2c_dw_disable_nowait(dev);

...

Also what does the heck "mst" stand for? Please, use decrypted words in
function names and error messages..

-- 
With Best Regards,
Andy Shevchenko



