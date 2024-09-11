Return-Path: <linux-i2c+bounces-6566-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 884F4975613
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 16:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5037E282B6C
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 14:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E24E192B88;
	Wed, 11 Sep 2024 14:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QqcMikW9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629688F6C;
	Wed, 11 Sep 2024 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726066377; cv=none; b=dCIxWYh5aPLJW4e7OlFeLHD0OdYA4V0M4hmFFeCIdIJvqxOmGK+De3kWbLxjsdZwO958LRzOWHZY3ZWBSXGsdFX/X0E9F0l/20S3cuxe7VnqqaqF2crKtCvX/VOVSyQoEvnspqjDMnF4ri4lfuP9WxiRMM546JB106wRI38fdQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726066377; c=relaxed/simple;
	bh=pGvRDu9tVAtIezTnxDZhjZRVXxL/d3ZOuwiCCUXkEWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NdXPyGjrphDAW4/SguzfMHeDNoerNXWGbLvB8VrF1TxcyySwck1qjmdLxVJ2cOH53ZKWtu2f1FQo29jIS2MGoXA+hHl4fppPRJiQBaZcpVwNN0Y5E7Oi98DA8dCDhkujX1Sm6JZ8sm61QcIPM3XuAVtLq2fFV507ngZtqnp+lYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QqcMikW9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726066376; x=1757602376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pGvRDu9tVAtIezTnxDZhjZRVXxL/d3ZOuwiCCUXkEWE=;
  b=QqcMikW9zZIsIvr7kdtAss861TcIH1Zo6K8KkFHgd145LxrlZXTY3Oy/
   jT6aK4hIgG2fcQSx+pjilgWOyMEq4SUqMDEAq5PaZco4QvKtp4iuLNPS8
   uuTBHYbGPXesaqjmRwzPpaDDsMXxQJYyA2VSJlnW3SJgJby0S8L3Q2YTt
   9rho5dayNo8q0wJvXE5k5CSOa0GC3fOD01QG2MklhhNr6M54Rp5lbWAd3
   5L1i7Jjtum5+BB0wVpaDeouo3yWwduNmf4pDzcMz0Gm7KWvveFodWzxxc
   55XOtdRQAB8J3jI+0rlSZsl8ZZFM+sDknqGcShwQ9HbZtzkex7xBDCoor
   g==;
X-CSE-ConnectionGUID: CqMAARp8Qd+LNhkhwfkrRA==
X-CSE-MsgGUID: 92T0UVE1Sxm3VvWu7KvFaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24367091"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="24367091"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:52:55 -0700
X-CSE-ConnectionGUID: aN53bOAnRBypmu3ibwILhg==
X-CSE-MsgGUID: bkLledLHTZuBmYRWJDuxQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67012319"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:52:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1soOiA-00000007aiP-1hax;
	Wed, 11 Sep 2024 17:52:50 +0300
Date: Wed, 11 Sep 2024 17:52:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kimriver Liu <kimriver.liu@siengine.com>
Cc: jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9] i2c: designware: fix controller is holding SCL low
 while ENABLE bit is disabled
Message-ID: <ZuGuwhPvxbY5OqNg@smile.fi.intel.com>
References: <69401183add8f79ee98b84c91983204df753a3e6.1726043461.git.kimriver.liu@siengine.com>
 <ZuGs8Vbd9zYuNo_U@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuGs8Vbd9zYuNo_U@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 11, 2024 at 05:45:05PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 11, 2024 at 04:39:45PM +0800, Kimriver Liu wrote:

FWIW, below are the fixes

...

> > +/*
> > + * This functions waits controller idling before disabling I2C
> > + * When the controller is not in the IDLE state,
> > + * MST_ACTIVITY bit (IC_STATUS[5]) is set.
> > + * Values:
> > + * 0x1 (ACTIVE): Controller not idle
> > + * 0x0 (IDLE): Controller is idle
> > + * The function is called after returning the end of the current transfer
> > + * Returns:
> 
> > + * Return 0 as controller IDLE
> > + * Return a negative errno as controller ACTIVE

 * False when controller is in IDLE state.
 * True when controller is in ACTIVE state.

> But why non-boolean again?
> 
> > + */
> > +static int i2c_dw_is_controller_active(struct dw_i2c_dev *dev)

static bool i2c_dw_is_controller_active(struct dw_i2c_dev *dev)

> > +{
> > +	u32 status;
> > +
> > +	regmap_read(dev->map, DW_IC_STATUS, &status);
> > +	if (!(status & DW_IC_STATUS_MASTER_ACTIVITY))
> > +		return 0;

		return false;

> > +	return regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
> > +			!(status & DW_IC_STATUS_MASTER_ACTIVITY),
> > +			1100, 20000);

			1100, 20000) != 0;

Alternatively

	int ret;
	...

	ret = regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
				       !(status & DW_IC_STATUS_MASTER_ACTIVITY),
				       1100, 20000);
	if (ret)
		return true;

	return false;

(Also mind indentation in _read_poll_timeout() lines.)

> > +}


-- 
With Best Regards,
Andy Shevchenko



