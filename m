Return-Path: <linux-i2c+bounces-7032-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B5F98751E
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 16:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08E9C28560B
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 14:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F0F76034;
	Thu, 26 Sep 2024 14:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kaw2mplY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957CD22615;
	Thu, 26 Sep 2024 14:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727359750; cv=none; b=nRNKCNCTfzGGlDFcuABbq1KL2hzn3j5e8WPXzzk4P+1+bT/UrjiYlABGVxN0fYCngGqSoT1+Cjcmw+W+MPJp7A50zGBY+L0KOAzotL/VHNGJaL9F57FHVlR2fF6NyZ8TMZL1mb72EOEaHZzZSCYu7hJl6gEXHhQwJtC8TvHA6vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727359750; c=relaxed/simple;
	bh=hyVS+lQGdV/4N8uVaB5DEJBp3m4jXqo/Pwee7IS1it8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECdIIzFRpXjjmGRY0zWg607SECh0r46p+giy1q5P0zBVdlqCc3o1uKc+r3jxxeW6q9ohVXcnQtJPwcTd7Qr8vAN9cRUvQXNTM/3xRFe13ybAfZK3WRcdL1/6kPlnUCO3nKUsVFzqqOzr1cJNP87SFrYebOaggnON5v8f9LBcJXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kaw2mplY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727359749; x=1758895749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hyVS+lQGdV/4N8uVaB5DEJBp3m4jXqo/Pwee7IS1it8=;
  b=kaw2mplYn9NvAGkMTCQdxxB+sNJdkN1B7nGzthWm+yVgEpg3ZYeG5n9V
   /UCt3G7kfwesWU/GtI+zhq/+eRiTSPUNfrcZN2A2nJFfgsF5pVcjE91X3
   sSTbVduJiI58nlwH/QibND+++MeHeKyz6vBvZoFcqR9ce6xfNme0bPUeM
   emWJM5XASh8Fs7Sz3EM+q0mla/6nJY6pIMtMDd6/IAd81A5LsHo8xTroZ
   1KNFsLYUQfgYHAOZCR+KvqudYoNC/JXK7LHgxOaslTPOWkkbNkv/2WLdO
   q7xEbAh//qQPugf35qQ6fQATb1w8xcN/oxE2G2wLrMGE7jgZrj8i42ivc
   g==;
X-CSE-ConnectionGUID: /4a16L9PRoyw/KMwb4djtg==
X-CSE-MsgGUID: ISM3zT8mTfOrLW2dLkIIVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26549754"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="26549754"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 07:09:08 -0700
X-CSE-ConnectionGUID: nJS2D9F1RPCUWPBXkU2a4A==
X-CSE-MsgGUID: W3CjDEbtSxuPE69PJbv0/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="72314980"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 07:09:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1stpB0-0000000DDZe-1btC;
	Thu, 26 Sep 2024 17:09:02 +0300
Date: Thu, 26 Sep 2024 17:09:02 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Wu <Michael.Wu@kneron.us>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	morgan chang <morgan.chang@kneron.us>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: designware: determine HS tHIGH and tLOW based
 on HW paramters
Message-ID: <ZvVq_sBK3T5wHZd4@smile.fi.intel.com>
References: <20240925080432.186408-1-michael.wu@kneron.us>
 <20240925080432.186408-2-michael.wu@kneron.us>
 <ZvPU2ZEG_8UV3FzF@smile.fi.intel.com>
 <ZvPWEFWk_MG5SsCg@smile.fi.intel.com>
 <IA1PR14MB6224EAAD5566CC5288CDC0838A6A2@IA1PR14MB6224.namprd14.prod.outlook.com>
 <ZvVREcwQSKZb5IU2@smile.fi.intel.com>
 <ecfb3621-fb8e-4452-a83f-bfe5f0b03398@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecfb3621-fb8e-4452-a83f-bfe5f0b03398@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 26, 2024 at 03:50:07PM +0200, Krzysztof Kozlowski wrote:
> On 26/09/2024 14:18, Andy Shevchenko wrote:
> > On Thu, Sep 26, 2024 at 08:45:47AM +0000, Michael Wu wrote:
> >>> On Wed, Sep 25, 2024 at 12:16:10PM +0300, Andy Shevchenko wrote:
> >>>> On Wed, Sep 25, 2024 at 04:04:30PM +0800, Michael Wu wrote:

...

> >>>>> + * @bus_loading: for high speed mode, the bus loading affects the high
> >>> and low
> >>>>> + *	pulse width of SCL
> >>>>
> >>>> This is bad naming, better is bus_capacitance.
> >>>
> >>> Even more specific bus_capacitance_pf as we usually add physical units to the
> >>> variable names, so we immediately understand from the code the order of
> >>> numbers and their physical meanings. 
> >>
> >> Sounds good. However, I think the length of "bus_capacitance_pf" is a bit
> >> long, we may often encounter the limit of more than 80 characters in a
> >> line when coding. I'll rename it to "bus_cap_pf".
> > 
> > Limit had been relaxed to 100. I still think we may use temporary variables,
> 
> Just to be clear, because you encourage reformatting it to 100:
> 
> You mix coding style with checkpatch. Checkpatch does not define coding
> style. Coding style doc defines it. Limit is 80, unless growing to 100
> improves readability.

Somebody can still use land line rotary phones, while others are
on mobile ones, indeed. :-)

Jokes aside, the second part of my remark was in regard to how to make
the lines shorter in case somebody is so picky about 80 limit.

> > if needed, in order to make code neater. That said, I slightly prefer
> > bus_capacitance_pf over the shortened variant.

-- 
With Best Regards,
Andy Shevchenko



