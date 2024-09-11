Return-Path: <linux-i2c+bounces-6562-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F450975620
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 16:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C95DFB2BECB
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 14:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D08E1A3028;
	Wed, 11 Sep 2024 14:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SA/9qmwn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77674185954;
	Wed, 11 Sep 2024 14:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726065762; cv=none; b=VDFLSBEUAsPVN0ETI+yymMguDgOICc9RcvURlWKmF21lGBaxR/rdWdE6jCZtJgVHtUPfdSJaGi5j3zgj4UA1c2ipZAl0k8mxc+H4nW9aKjsY4wp26kHhGKJNDYwPaXNE1ptAv6WHXK3Cxf7XH3HTs3Bktvent62JJoyHOXyPQdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726065762; c=relaxed/simple;
	bh=ZfqsyIL3lvgghXYTcfTqeO83qP/QjCm5QokU8batbE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/+XfWT/fpUqSC7I1O0QrE3XIQJpAhxnT7w/moMhx5uxs5Ri7zs9KZWXRWTQDymlA9jheiG8tA2lpqeduyHr9S6nXb8+q/uDOQsqSi8M6XcoW2wxfX0SXweJ+3vc/RuH2kgL4UepI3ICxQ0D9zpwWPagjB78ezazcho1KQ3eRHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SA/9qmwn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726065760; x=1757601760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZfqsyIL3lvgghXYTcfTqeO83qP/QjCm5QokU8batbE0=;
  b=SA/9qmwnFHS7rzZOz9BX6mkiXS6vCeVw111AqHGfD4ez6d7yC7g5zopc
   A65/xBKbJRLi9nH+PvAdRFJOUBWi0BY6DfIaPVxWlWfFDfpLbFy7mJIdO
   eBpbWd2OUSIUjipi+i5n4MpDhrOB4QvJeITrZDzzuttYBoe3++VpaB21R
   OzYl+I1YXm99xYCh/lUKxhIPvO3af2tXB2Wa0KfzA135ZwHNfE3bExdUG
   cFngsPZUOg4+xZZNFKBeOE1C/Y1K9KhMDZ4C+fk+lGhHot7t9IjkNF2oY
   e6p7pt3WQorSMkb6aCafhtoPXQ43A0/1dAsNgnOHfNc0bj1aMupBnyjK0
   g==;
X-CSE-ConnectionGUID: 7gdsy9JrS5mXLR4logh+Fg==
X-CSE-MsgGUID: Yl+D8XD8QHaQ0H9RRoeQGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24365430"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="24365430"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:42:40 -0700
X-CSE-ConnectionGUID: U+ZMRXvnR3KzShp/gLW+0Q==
X-CSE-MsgGUID: Uk1tXgY/RNeiJy9tVvB2iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67010949"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:42:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1soOYF-00000007aWF-2Bt6;
	Wed, 11 Sep 2024 17:42:35 +0300
Date: Wed, 11 Sep 2024 17:42:35 +0300
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
Message-ID: <ZuGsW_G8w9HfkBpq@smile.fi.intel.com>
References: <9d181a45f3edf92364c9e6b729638f0b3f2e7baa.1725946886.git.kimriver.liu@siengine.com>
 <ZuALQVyTBFugG0Sw@smile.fi.intel.com>
 <743187d2fde54a9ebf86d42e29eadfb4@siengine.com>
 <ZuAjMmr7q4f8VJpA@smile.fi.intel.com>
 <36e6d80999cf493f8a866fb013710682@siengine.com>
 <ZuA0jMCfGdyPR-T5@smile.fi.intel.com>
 <981861a36edc4b759e20f9be45d243c7@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <981861a36edc4b759e20f9be45d243c7@siengine.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 11, 2024 at 01:37:43AM +0000, Liu Kimriver/刘金河 wrote:
> >From: Andy Shevchenko <andriy.shevchenko@linux.intel.com> 
> >Sent: 2024年9月10日 19:59
> >On Tue, Sep 10, 2024 at 11:43:34AM +0000, Liu Kimriver/刘金河 wrote:
> >> >-----Original Message-----
> >> >From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >> >Sent: 2024年9月10日 18:45
> >> >On Tue, Sep 10, 2024 at 09:38:53AM +0000, Liu Kimriver/刘金河 wrote:
> >> >> >From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >> >> >Sent: 2024年9月10日 17:03
> >> >> >at 02:13:09PM +0800, Kimriver Liu wrote:

...

> >> > >> +static bool i2c_dw_is_master_idling(struct dw_i2c_dev *dev)
> >> >> 
> >> >> >Sorry if I made a mistake, but again, looking at the usage you 
> >> >> >have again negation here and there...
> >> > 
> >> >> >	i2c_dw_is_controller_active
> >> >> 
> >> >> > (note new terminology, dunno if it makes sense start using it in 
> >> >> > function names, as we have more of them following old style)
> >> >> 
> >> >>  Last week , You suggested that I used this
> >> >> i2c_dw_is_master_idling(dev)
> >> 
> >> >Yes, sorry about that. I did maybe not clearly get how it is going to look like.
> >> 
> >> >> >> +{
> >> >> >> +	u32 status;
> >> >> >> +
> >> >> >> +	regmap_read(dev->map, DW_IC_STATUS, &status);
> >> >> >> +	if (!(status & DW_IC_STATUS_MASTER_ACTIVITY))
> >> >> >> +		return true;
> >> >> 
> >> >> 		return false;
> >> >> 
> >> >> >> +	return !regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
> >> >> >> +			!(status & DW_IC_STATUS_MASTER_ACTIVITY),
> >> >> >> +			1100, 20000);
> >> >> 
> >> >> >...and drop !.
> >> >> 
> >> >>  We reproduce this issue in RTL simulation(About(~1:500) in our soc). 
> >> >> It is necessary  to add waiting DW_IC_STATUS_MASTER_ACTIVITY idling 
> >> >> before disabling I2C when  I2C transfer completed.  as described in 
> >> >> the DesignWare  I2C databook(Flowchart for DW_apb_i2c Controller)
> >> 
> >> >Cool, but here I'm talking purely about inverting the logic (with renaming), nothing more.
> >> 
> >>  as described in the DesignWare I2C databook:
> >>  DW_IC_STATUS[5].MST_ACTIVITY Description as follows:
> >>  Controller FSM Activity Status. When the Controller Finite  State 
> >> Machine (FSM) is not in the IDLE state, this bit is set.
> >>  Note: IC_STATUS[0]-that is, ACTIVITY bit-is the OR of  SLV_ACTIVITY 
> >> and MST_ACTIVITY bits.
> >>  Values:
> >>  ■ 0x1 (ACTIVE): Controller not idle
> >>  ■ 0x0 (IDLE): Controller is idle
> >> 
> >> We need waiting DW_IC_STATUS.MST_ACTIVITY idling, If Controller not 
> >> idle, Wait for a while.
> >> Return value: 
> >>   false(0): Controller is idle
> >>   timeout(-110): Controller activity
> >> 
> >> Ok, change the function name i2c_dw_is_master_idling(dev) to 
> >> i2c_dw_is_controller_active(dev) it seems more reasonable
> 
>  Change above text as a comment:
> 
> /*
>  * This functions waits controller idling before disabling I2C
>  * When the controller is not in the IDLE state, 
>  * MST_ACTIVITY bit (IC_STATUS[5]) is set:
>  * 0x1 (ACTIVE): Controller not idle
>  * 0x0 (IDLE): Controller is idle
>  * The function is called after returning the end of the current transfer
>  * Returns:

>  * Return 0 as controller IDLE,
>  * Return a negative errno as controller ACTIVE

Why does it return a non-boolean value again?

>  */ 
> 
> >> static int i2c_dw_is_controller_active(struct dw_i2c_dev *dev) {
> >> 	u32 status;
> >> 
> >> 	regmap_read(dev->map, DW_IC_STATUS, &status);
> >> 	if (!(status & DW_IC_STATUS_MASTER_ACTIVITY))
> >> 		return 0;
> >> 
> >> 	return regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
> >> 			!(status & DW_IC_STATUS_MASTER_ACTIVITY),
> >> 			1100, 20000);
> >> }
> 
> >Yes, thank you. This is pure readability wise, you may actually leave the
> >above text as a comment on top of that helper. It will add a value of
> >understanding what's behind the scenes.
> 
> > >> >> +}

-- 
With Best Regards,
Andy Shevchenko



