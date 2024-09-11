Return-Path: <linux-i2c+bounces-6563-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F649755D8
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 16:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94F12289A3F
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 14:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCC719F11E;
	Wed, 11 Sep 2024 14:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kq3rJPOW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256971A3053;
	Wed, 11 Sep 2024 14:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726065911; cv=none; b=MO0+9+OZ87/COUAcFwUC0PAcac2L2zR1gs7A39vd1k6FgwXYuFDSxINL2R+2TRGGiVVTDhIq9lZhUR9xHZ00TMz/U5oLfikknIfdb/BezIRqW2FMYf5YUhRbV85J89mUp8R/WuKl1TUIcfV4t0t+q+4E8KnKpQ6+yjn/wvwqv/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726065911; c=relaxed/simple;
	bh=jqNxTzMz4Z3qCpVlcxRhkuEOkHSxJRuyKZgnduF8C5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7eL5wUnx12AflrOygYNxiUB3cjgR4aZHj4RVjmOlyclZzyzJADf/49y59G7c1gk7ytdoXMEoFwry1H8BWmy2QcQUl3En/BHvVl1ifQq9bd+vU8LCwzwhnYzg7GY2hKLGTPVxJ1vf5SAsx9c+W8eNxn6bgBYY0JXE6hJ/QDF54I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kq3rJPOW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726065910; x=1757601910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jqNxTzMz4Z3qCpVlcxRhkuEOkHSxJRuyKZgnduF8C5Q=;
  b=Kq3rJPOWmLjluK8EYcA2XfOM3VDQxmT/p1i56/Z/oK/Cd72v+k518Csb
   mzP3PUyB7CERfYNOxEZRTUecmpja6WntGzh6403/UE5CCOYj6Vr3dnrqd
   2q0h1WOXGK48rdVImb8yLnYKgdoe3B+Z4qoTw9y1ub6axYTywDQ6bS39S
   dk1+d2JUiXeuvsxzP6C5J4F9mEHrsXWL1Ri44JcIqKDzF3WwhwB23HY/+
   fIOlQod46h8gq7axhQbVDwDuGrInfZfjnAAE+koRYWefHYpZiFR+lkCdC
   DntJfu1WShzXdRr26sDOWwF10JHOwuMLRfKbcG6V46/Vzl+eqEbaR8VeI
   g==;
X-CSE-ConnectionGUID: QPB+eOtTRR6b1RmO4Ja9dQ==
X-CSE-MsgGUID: 9n/RRvIgS0CTd7SxzAZXlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25026419"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="25026419"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:45:10 -0700
X-CSE-ConnectionGUID: vt+rUVppS0+ITLMYGxsYGg==
X-CSE-MsgGUID: 8u0i2ioaSQSwBNytgNzJPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="98226910"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:45:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1soOaf-00000007aYQ-17GJ;
	Wed, 11 Sep 2024 17:45:05 +0300
Date: Wed, 11 Sep 2024 17:45:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kimriver Liu <kimriver.liu@siengine.com>
Cc: jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9] i2c: designware: fix controller is holding SCL low
 while ENABLE bit is disabled
Message-ID: <ZuGs8Vbd9zYuNo_U@smile.fi.intel.com>
References: <69401183add8f79ee98b84c91983204df753a3e6.1726043461.git.kimriver.liu@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69401183add8f79ee98b84c91983204df753a3e6.1726043461.git.kimriver.liu@siengine.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 11, 2024 at 04:39:45PM +0800, Kimriver Liu wrote:
> It was observed that issuing ABORT bit (IC_ENABLE[1]) will not
> work when IC_ENABLE is already disabled.
> 
> Check if ENABLE bit (IC_ENABLE[0]) is disabled when the controller
> is holding SCL low. If ENABLE bit is disabled, the software need
> to enable it before trying to issue ABORT bit. otherwise,
> the controller ignores any write to ABORT bit.
> 
> These kernel logs show up whenever an I2C transaction is
> attempted after this failure.
> i2c_designware e95e0000.i2c: timeout waiting for bus ready
> i2c_designware e95e0000.i2c: timeout in disabling adapter
> 
> The patch can be fix the controller cannot be disabled while
> SCL is held low in ENABLE bit is already disabled.

...

> +/*
> + * This functions waits controller idling before disabling I2C
> + * When the controller is not in the IDLE state,
> + * MST_ACTIVITY bit (IC_STATUS[5]) is set.
> + * Values:
> + * 0x1 (ACTIVE): Controller not idle
> + * 0x0 (IDLE): Controller is idle
> + * The function is called after returning the end of the current transfer
> + * Returns:

> + * Return 0 as controller IDLE
> + * Return a negative errno as controller ACTIVE

But why non-boolean again?

> + */
> +static int i2c_dw_is_controller_active(struct dw_i2c_dev *dev)
> +{
> +	u32 status;
> +
> +	regmap_read(dev->map, DW_IC_STATUS, &status);
> +	if (!(status & DW_IC_STATUS_MASTER_ACTIVITY))
> +		return 0;
> +
> +	return regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
> +			!(status & DW_IC_STATUS_MASTER_ACTIVITY),
> +			1100, 20000);
> +}

...

> +	/*
> +	 * This happens rarely (~1:500) and is hard to reproduce. Debug trace
> +	 * showed that IC_STATUS had value of 0x23 when STOP_DET occurred,
> +	 * if disable IC_ENABLE.ENABLE immediately that can result in
> +	 * IC_RAW_INTR_STAT.MASTER_ON_HOLD holding SCL low. Check if
> +	 * controller is still ACTIVE before disabling I2C.
> +	 */

> +	if (i2c_dw_is_controller_active(dev))
> +		dev_err(dev->dev, "controller active\n");

No, this is rarely we skip the error code returned. Either you find the
meaningful use of the returned error code, or change to boolean.

Personally I think the latter is what we need for now.

>  	/*
>  	 * We must disable the adapter before returning and signaling the end
>  	 * of the current transfer. Otherwise the hardware might continue

-- 
With Best Regards,
Andy Shevchenko



