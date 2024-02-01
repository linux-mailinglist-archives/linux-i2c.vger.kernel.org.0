Return-Path: <linux-i2c+bounces-1591-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A495E8458B0
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 14:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6202B28ED41
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 13:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21395B671;
	Thu,  1 Feb 2024 13:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kG65wb4l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8F053389
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 13:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706793483; cv=none; b=tJaquZuuCbDWfm2pNMHZtM//CWbLeA9O19EuKFapTaD7wzIYeyAWPtZewnH46kzT/1IkwGlU1Rh7tErElclsLSdVtGhYpeUhFe8Dua8HMm4gtuH9KAIA8y8WrTHhbliC2gCIvRGkzEYSpwGeHWSpYXJKd5xIjMz2wMki483xoiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706793483; c=relaxed/simple;
	bh=hZOuj+A3SOUA5hgW0xZOaW3oDZ0BzGU4Gj1B+ulO0WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gpy6R8tkzyv3XChnKi/29mVR4AOaPXrT0HGps3jkNn6w48Xuu7Zeout6Wf9MfXGEk7I5U/ucUO7Y+wAF4KB0TaA9+Z5IBPlz37z1cxMWha/Ny04vNTrWV3qVHqBKHNI2gVRoVb4VoGLJ1p/H/zxRtMvkSWQuRrEo0gBhPPryFl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kG65wb4l; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706793482; x=1738329482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hZOuj+A3SOUA5hgW0xZOaW3oDZ0BzGU4Gj1B+ulO0WM=;
  b=kG65wb4leZuU+xrkFPrN5oBO2a4OSyPmN6budmKcUqQKDGsnqcs3yiyx
   9YSWZ+LW43cmsmxeMS4Rw+1cPkc7es4gF6vZxpHgSQsLHj8Hd74CYkdys
   mY2yJ+JXNhSkW/5XmNd7WYsp8EZvtJEA+FDVttU39Gfx+F/j3D2dLkmWz
   ATXj8vPKGYOkVGQSl+CY/Gxy7ue0cCCBfgv27OKOnvnZauqe89+QigTRs
   AwIZXbx13YMH28lMEdg7RQacujKOQ/RFtyE94SjX0Ad0Wg8VEgRSUhOA5
   g7x255Ck0phGnc/d/XZlK8qhYILUzOZJAgtL3GGMSy3ecuMNfeZDvZRA0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="25353519"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="25353519"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 05:18:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="879099391"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="879099391"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 05:17:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rVVq4-00000000pJP-3AcR;
	Thu, 01 Feb 2024 14:06:40 +0200
Date: Thu, 1 Feb 2024 14:06:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Ruhl@smile.fi.intel.com, Michael J <michael.j.ruhl@intel.com>
Subject: Re: [PATCH 5/5] i2c: designware: Implement generic polling mode code
 for Wangxun 10Gb NIC
Message-ID: <ZbuJUNQBzdwLFUZ3@smile.fi.intel.com>
References: <20240131141653.2689260-1-jarkko.nikula@linux.intel.com>
 <20240131141653.2689260-7-jarkko.nikula@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240131141653.2689260-7-jarkko.nikula@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jan 31, 2024 at 04:16:52PM +0200, Jarkko Nikula wrote:
> I got an idea the i2c-designware should not need duplicated state
> machines for the interrupt and polling modes. The IP is practically the
> same and state transitions happens in response to the events that can be
> observed from the DW_IC_RAW_INTR_STAT register. Either by interrupts or
> by polling.
> 
> Another reasons are the interrupt mode is the most tested, has handling
> for many exceptions as well as transmit abort handling and those are
> missing from two polling mode quirks.
> 
> Patch implements generic polling mode code which shares the same code
> with interrupt mode code. This is done by moving event handling from the
> i2c_dw_isr() into a new i2c_dw_process_transfer() that will be called
> both from the i2c_dw_isr() and polling loop.
> 
> Polling loop is implemented in a new i2c_dw_wait_transfer() that is
> shared between both modes. In interrupt mode it waits for the completion
> object as before. In polling mode both completion object and
> DW_IC_RAW_INTR_STAT are polled.
> 
> I decided to convert the txgbe_i2c_dw_xfer_quirk() straight to generic
> polling mode code in this patch. It doesn't have HW dependent quirks
> like the amd_i2c_dw_xfer_quirk() does have and without users this patch
> is needless.

...

> +	regmap_read(dev->map, DW_IC_ENABLE, &enabled);
> +	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &stat);
> +	if (!enabled || !(stat & ~DW_IC_INTR_ACTIVITY))
> +		return IRQ_NONE;
> +	if (pm_runtime_suspended(dev->dev) || stat == GENMASK(31, 0))
> +		return IRQ_NONE;

Hmm... This was in the original code, but to me checking for stat = ~0 is
logically to have done before checking for (set / cleared) bits in it.

...

> +{
> +	unsigned long timeout = dev->adapter.timeout;
> +	unsigned int stat;

> +	int ret = 0;

> +	if (!(dev->flags & ACCESS_POLLING)) {
> +		ret = wait_for_completion_timeout(&dev->cmd_complete,
> +						  timeout) ? 0 : -ETIMEDOUT;



> +	} else {

...this is redundant 'else' as redundant label below.

You can return earlier. But it might be done this way to have single point of
the (same) error code.

	if (...) {
		ret = ...;
		if (ret)
			return 0;
	} else {
		...
			if (try_wait_for_completion(&dev->cmd_complete))
				return 0;
		...
	}

	return ETIMEDOUT;


> +		timeout += jiffies;
> +		do {
> +			if (try_wait_for_completion(&dev->cmd_complete))
> +				goto out;
> +
> +			stat = i2c_dw_read_clear_intrbits(dev);
> +			if (stat)
> +				i2c_dw_process_transfer(dev, stat);
> +			else
> +				/* Try save some power */
> +				usleep_range(3, 25);
> +		} while (time_before(jiffies, timeout));
> +		ret = ETIMEDOUT;
> +	}
> +
> +out:
> +	return ret;
> +}

-- 
With Best Regards,
Andy Shevchenko



