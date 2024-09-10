Return-Path: <linux-i2c+bounces-6475-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F41FB973536
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 12:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B52D1289A5E
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 10:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6307191466;
	Tue, 10 Sep 2024 10:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXpnqWih"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF041552FD;
	Tue, 10 Sep 2024 10:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725965114; cv=none; b=DunUyI4kKMUyJMpk1GASTT6kWWpjIR+YIljYVml7UigZ3gM48bxHkjerljQ3ycqMWUyPDhyXKfmFTabgQSJuQTTjUedDnC0fZmwxY5kf9zAb1RNN5q7uRuM1QzZXimVaBFsYxRLha/5d9C/Pf1/rYAh1ymThWQh0/wd0ZO5D1wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725965114; c=relaxed/simple;
	bh=/mmHqklSPEhEgo8V06sQ63fRm4Mg6nIuO6VmxgWugTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KtMbpwDkPWeDEATYnPcUw4ULucLYGLwiuplrLFEY7f9eFH+Zh7n7aNubNQoXf5YD4y3rewkzOWbJ0yksoqERUsRY+kJr1cn4XdYnp1264+5pF9ZjjT0ULwlAZWVHIe63/VQ3KSpQVKI3UH3lbAlwpVXK/q+ecwS1lQdAYayc+gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXpnqWih; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725965112; x=1757501112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/mmHqklSPEhEgo8V06sQ63fRm4Mg6nIuO6VmxgWugTk=;
  b=MXpnqWih2au1XH4tAWMTJHW4gjB/zWYBTYENzikj9PJKRsjrpTzAt7Qc
   EUdJ4lghyFrDgzwE2VnzATDkf34VlA0ngwnY++bYIjMkuxnMxbeAm17LQ
   DkUvR9WWb8f/xnxqRSkd7Gv8XrCEEdxGb7eEKHaLi35PgagaxTFgbNXjC
   BtZRCF3uCXHjqN5c9uUDf/6TW7mhrGFmeUPC2t/cG+8X3q04LC+01j6mu
   MUPQ6s3q7JXW8UnMQzd5Xe1pAj/wk0zF1UQaxBMoeRVLPF1cDsgD0BW7k
   pNG3DrnS5cuoLXwpE25McdrPLqxt6IVjpAZBSthLe6R8TQdZAskdBPUW5
   A==;
X-CSE-ConnectionGUID: qBzOEBEwSwqIqf4FFJo/XQ==
X-CSE-MsgGUID: 7UJfrNVyQ2SCus3pxyoQ8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="36083839"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="36083839"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 03:45:12 -0700
X-CSE-ConnectionGUID: +YyFryRrSWCFm4lMklyLmA==
X-CSE-MsgGUID: b3bscvFuT6CP92JifYEtiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="66609199"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 03:45:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1snyMt-000000079pd-0m3T;
	Tue, 10 Sep 2024 13:45:07 +0300
Date: Tue, 10 Sep 2024 13:45:06 +0300
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
Message-ID: <ZuAjMmr7q4f8VJpA@smile.fi.intel.com>
References: <9d181a45f3edf92364c9e6b729638f0b3f2e7baa.1725946886.git.kimriver.liu@siengine.com>
 <ZuALQVyTBFugG0Sw@smile.fi.intel.com>
 <743187d2fde54a9ebf86d42e29eadfb4@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <743187d2fde54a9ebf86d42e29eadfb4@siengine.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 10, 2024 at 09:38:53AM +0000, Liu Kimriver/刘金河 wrote:
> >From: Andy Shevchenko <andriy.shevchenko@linux.intel.com> 
> >Sent: 2024年9月10日 17:03
> >To: Liu Kimriver/刘金河 <kimriver.liu@siengine.com>
> >On Tue, Sep 10, 2024 at 02:13:09PM +0800, Kimriver Liu wrote:

...

> >master --> controller
> 
>  Update it in V9

Also in the Subject.

...

> >> holding SCL low. If ENABLE bit is disabled, the software need
> >> enable it before trying to issue ABORT bit. otherwise,
> >> the controller ignores any write to ABORT bit.
> 
> >Fixes tag?
> 
>  Patch rebase:  on Linux v6.11.0-rc6 (89f5e14d05b)

No, this one is done by understanding where the problem appear first.
What you mentioned above may be achieved by using --base option when
format the patch.

...

> >> +static bool i2c_dw_is_master_idling(struct dw_i2c_dev *dev)
> 
> >Sorry if I made a mistake, but again, looking at the usage you have again
> >negation here and there...
> 
> >	i2c_dw_is_controller_active
> 
> > (note new terminology, dunno if it makes sense start using it in function
> > names, as we have more of them following old style)
> 
>  Last week , You suggested that I used this i2c_dw_is_master_idling(dev)

Yes, sorry about that. I did maybe not clearly get how it is going to
look like.

> >> +{
> >> +	u32 status;
> >> +
> >> +	regmap_read(dev->map, DW_IC_STATUS, &status);
> >> +	if (!(status & DW_IC_STATUS_MASTER_ACTIVITY))
> >> +		return true;
> 
> 		return false;
> 
> >> +	return !regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
> >> +			!(status & DW_IC_STATUS_MASTER_ACTIVITY),
> >> +			1100, 20000);
> 
> >...and drop !.
> 
>  We reproduce this issue in RTL simulation(About(~1:500) in our soc). It is necessary
>  to add waiting DW_IC_STATUS_MASTER_ACTIVITY idling before disabling I2C when 
>  I2C transfer completed.  as described in the DesignWare
>  I2C databook(Flowchart for DW_apb_i2c Controller)

Cool, but here I'm talking purely about inverting the logic (with renaming),
nothing more.

> >> +}

...

> >> +	/*
> >> +	 * This happens rarely and is hard to reproduce. Debug trace
> 
> >Rarely how? Perhaps put a ration in the parentheses, like
> 
> >"...rarely (~1:100)..."
>  About(~1:500) in our soc

Yes, what I showed was just an example, put the real numbers into the comment.

> >> +	 * showed that IC_STATUS had value of 0x23 when STOP_DET occurred,
> >> +	 * if disable IC_ENABLE.ENABLE immediately that can result in
> >> +	 * IC_RAW_INTR_STAT.MASTER_ON_HOLD holding SCL low.
> >> +	 */
> >> +	if (!i2c_dw_is_master_idling(dev))
> 
> >...and here
> 
> >	if (i2c_dw_is_controller_active(dev))
> 
> >But please double check that I haven't made any mistakes in all this logic.
> 
>  Last week , You suggested that I used this i2c_dw_is_master_idling(dev)
>  keep using i2c_dw_is_master_idling(dev) , Ok?

See above.

> >> +		dev_err(dev->dev, "I2C master not idling\n");

-- 
With Best Regards,
Andy Shevchenko



