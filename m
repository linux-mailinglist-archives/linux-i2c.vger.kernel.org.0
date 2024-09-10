Return-Path: <linux-i2c+bounces-6479-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 462069736A4
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 14:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF91A28A88C
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 12:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60354194C96;
	Tue, 10 Sep 2024 11:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="meqtgCd8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8815619007F;
	Tue, 10 Sep 2024 11:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725969556; cv=none; b=g0pj//Equmm233EfZTvqvjI7o+sZ9bDMbFdJ5H6NLhuq31dbW3dRXxhxKnSMOCBlzUjK4+Ibc/i6F18QzPTNwK9JTAfpS8b4Mw+h5ug7sXeqWK6wccxt3euP7mRAgLiJKxhuUb21AcUT74gN/2tQ/GzbXCZcdXWIiYcab6vbHCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725969556; c=relaxed/simple;
	bh=h4ChVf/sIAKwdyEF+eNO9Uwa4wM3FfIPgFRZrrTl8J4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCieoy9TxiGaUteO4rJUSJdMAwQkUOw0MF0Skb4FtFPeZdZ+xt11YMr32yi7gUIIs1hcrQcEj02n4bl8xLRUqmWhLfooarqfH0PGvgQqVDup5ml+QZ+FN+G92MejrgiSOsmyeb0mlZaioDMk7jDfiOkuo2pQ901E/Vm2JXxTpe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=meqtgCd8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725969555; x=1757505555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=h4ChVf/sIAKwdyEF+eNO9Uwa4wM3FfIPgFRZrrTl8J4=;
  b=meqtgCd89blcS79lKa+B8wbTwz5h//AvTNgk210bfZ0scxVFkPfYa9GZ
   ZlhuQxluu0cnjhsUGwXrHJ5yo4SpD+96ghYVhrHCAKRULrz30DnC/cPnW
   q7j6zTXm9vaTFzRvqrREO4n+0NHlvi/8+Wdf0D38fEfvH1jJRol5fLZMv
   U0JPUgHN4jW0NPZxjnh7KTWSTb4tvtnpJk8CXkrZWS4VNlD4xnhf/DaLJ
   1MSbqzdbHL+15TLVNhzq54bCqXdH9wASV1eFfdkznmIxmVunZfBKXfSQc
   dWhIZMjPvSTByt1pHLvee9GoNUzCIfzZmOzT4DZjKyeKl8o4bzu1QQMAY
   Q==;
X-CSE-ConnectionGUID: YhhLmhOLQcGIDtcBf5ET1w==
X-CSE-MsgGUID: 2pV/xoGrSTez8A4RIrf5AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24853797"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="24853797"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 04:59:14 -0700
X-CSE-ConnectionGUID: s55Ld9X/So6BSlosQS6LZA==
X-CSE-MsgGUID: l3h2D2F8RpeilQjq28C/WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="71783276"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 04:59:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1snzWW-00000007BYR-45g2;
	Tue, 10 Sep 2024 14:59:08 +0300
Date: Tue, 10 Sep 2024 14:59:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Liu =?utf-8?B?S2ltcml2ZXIv5YiY6YeR5rKz?= <kimriver.liu@siengine.com>
Cc: "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
	"mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
	"jsd@semihalf.com" <jsd@semihalf.com>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Message-ID: <ZuA0jMCfGdyPR-T5@smile.fi.intel.com>
References: <9d181a45f3edf92364c9e6b729638f0b3f2e7baa.1725946886.git.kimriver.liu@siengine.com>
 <ZuALQVyTBFugG0Sw@smile.fi.intel.com>
 <743187d2fde54a9ebf86d42e29eadfb4@siengine.com>
 <ZuAjMmr7q4f8VJpA@smile.fi.intel.com>
 <36e6d80999cf493f8a866fb013710682@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36e6d80999cf493f8a866fb013710682@siengine.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 10, 2024 at 11:43:34AM +0000, Liu Kimriver/刘金河 wrote:
> >-----Original Message-----
> >From: Andy Shevchenko <andriy.shevchenko@linux.intel.com> 
> >Sent: 2024年9月10日 18:45
> >On Tue, Sep 10, 2024 at 09:38:53AM +0000, Liu Kimriver/刘金河 wrote:
> >> >From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >> >Sent: 2024年9月10日 17:03
> >> >at 02:13:09PM +0800, Kimriver Liu wrote:

...

> > >> +static bool i2c_dw_is_master_idling(struct dw_i2c_dev *dev)
> >> 
> >> >Sorry if I made a mistake, but again, looking at the usage you have 
> >> >again negation here and there...
> > 
> >> >	i2c_dw_is_controller_active
> >> 
> >> > (note new terminology, dunno if it makes sense start using it in 
> >> > function names, as we have more of them following old style)
> >> 
> >>  Last week , You suggested that I used this 
> >> i2c_dw_is_master_idling(dev)
> 
> >Yes, sorry about that. I did maybe not clearly get how it is going to look like.
> 
> >> >> +{
> >> >> +	u32 status;
> >> >> +
> >> >> +	regmap_read(dev->map, DW_IC_STATUS, &status);
> >> >> +	if (!(status & DW_IC_STATUS_MASTER_ACTIVITY))
> >> >> +		return true;
> >> 
> >> 		return false;
> >> 
> >> >> +	return !regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
> >> >> +			!(status & DW_IC_STATUS_MASTER_ACTIVITY),
> >> >> +			1100, 20000);
> >> 
> >> >...and drop !.
> >> 
> >>  We reproduce this issue in RTL simulation(About(~1:500) in our soc). 
> >> It is necessary  to add waiting DW_IC_STATUS_MASTER_ACTIVITY idling 
> >> before disabling I2C when  I2C transfer completed.  as described in 
> >> the DesignWare  I2C databook(Flowchart for DW_apb_i2c Controller)
> 
> >Cool, but here I'm talking purely about inverting the logic (with renaming), nothing more.
> 
>  as described in the DesignWare I2C databook:
>  DW_IC_STATUS[5].MST_ACTIVITY Description as follows:
>  Controller FSM Activity Status. When the Controller Finite
>  State Machine (FSM) is not in the IDLE state, this bit is set.
>  Note: IC_STATUS[0]-that is, ACTIVITY bit-is the OR of
>  SLV_ACTIVITY and MST_ACTIVITY bits.
>  Values:
>  ■ 0x1 (ACTIVE): Controller not idle
>  ■ 0x0 (IDLE): Controller is idle
> 
> We need waiting DW_IC_STATUS.MST_ACTIVITY idling,
> If Controller not idle, Wait for a while.
> Return value: 
>   false(0): Controller is idle
>   timeout(-110): Controller activity
> 
> Ok, change the function name i2c_dw_is_master_idling(dev) to i2c_dw_is_controller_active(dev)
> it seems more reasonable
> 
> static int i2c_dw_is_controller_ active(struct dw_i2c_dev *dev)
> {
> 	u32 status;
> 
> 	regmap_read(dev->map, DW_IC_STATUS, &status);
> 	if (!(status & DW_IC_STATUS_MASTER_ACTIVITY))
> 		return false;
> 
> 	return regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
> 			!(status & DW_IC_STATUS_MASTER_ACTIVITY),
> 			1100, 20000);
> }

Yes, thank you. This is pure readability wise, you may actually leave the above
text as a comment on top of that helper. It will add a value of understanding
what's behind the scenes.

> >> >> +}

...

> I will be off work, If there are still emails that I have not been replied
> to, I will reply to your email immediately after going to work tomorrow.

No problem. Just keep your time, proof-read and test the v9 before sending and
I believe it will be the last iteration. Thank you for your patience and energy
to push this change forward!

...

> Thanks you for your suggestion!

You are welcome!

-- 
With Best Regards,
Andy Shevchenko



