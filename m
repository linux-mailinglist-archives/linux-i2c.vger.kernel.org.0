Return-Path: <linux-i2c+bounces-3292-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D61F28B5557
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 12:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 775511F22D17
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 10:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012FC39AC3;
	Mon, 29 Apr 2024 10:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YxQVr7V4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950C237719;
	Mon, 29 Apr 2024 10:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386518; cv=none; b=rUIU5gOShcvSbIpPKRVtkgl3AjAuMXmQYIxELEPKgNThGJKplUJJ6RAU695VZTVpb6/YnMue8EDYRFZa5QMrQJClPLepjesqib2Dza6i5N0NmtDFkwm/tRsI3Rjr8W5WJcI4ouoDdrrJ2SW3admNAr87KipkhL0l8JqbmpuL43k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386518; c=relaxed/simple;
	bh=OFNiBQJBXqxnaxJp8Nrh3y4ZV1pJrBCQPTfNCADbwVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4q/hadZ09KjLlOdwyQ4XEq/RVaohAFkPgUc+TVqlxK1yqpQ5Od8RkA9aGBm2a+x5Mf7HZzAWOMglC9MujRC7jMA2n8QSyD0qJkblMsfmw3MY6jbSg8nyeYrCK9H8SdSNt+wX1JULyDYrXCZQGD0DbxA/a951WHlEk8AP12eXtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YxQVr7V4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714386517; x=1745922517;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OFNiBQJBXqxnaxJp8Nrh3y4ZV1pJrBCQPTfNCADbwVg=;
  b=YxQVr7V4JU+0eu7N+nHkFT3FRyhmi6JqH9dCnPNUnN40U3Evq90BJcpv
   6K0gFrF6rJZLw8tX1kJg/Ojo7eVZ4ugWwdCI+IT437dCQdEutUK7OCxPH
   7JK0CFgFmbUCoMyVNBhnEUUwhOcWcSxjcfPQg5PGOpGlHyS2tBtf5WaEc
   VmOWe29xwqdx2za7044fuiouF/pyaRAVHc+SH9Qh9+ZOT4B2ssVqQ7Q5n
   I4DKjKINcoR9ipNYSqKqPzJinD55o5AaGVmYh+7zC76et/baKc3uQJxeg
   uuOlVKBxT43MbSt/Xmj8Ef1pWRRZlvVKw5/SOH/g2R0vSswqtqmn25W5a
   Q==;
X-CSE-ConnectionGUID: 0jqB35mKRe2K42Bbkj0VJg==
X-CSE-MsgGUID: OuIeb1A6SGqaNCz7HouSBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10150704"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="10150704"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 03:28:37 -0700
X-CSE-ConnectionGUID: EMaThyTEQoO+YZhlN+F56A==
X-CSE-MsgGUID: UsQujk3XQLmXxuxcXPUMnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26141366"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 03:28:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s1OFM-00000002INO-1dNa;
	Mon, 29 Apr 2024 13:28:32 +0300
Date: Mon, 29 Apr 2024 13:28:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH RFC] i2c: Add a void pointer to i2c_device_id
Message-ID: <Zi92UCnZa90DXAI9@smile.fi.intel.com>
References: <20240426213832.915485-2-u.kleine-koenig@pengutronix.de>
 <Zi9gRVVw7qbKSL5k@smile.fi.intel.com>
 <youkuwbynndjpcoux2zaxwjp5gquj647leub3bat37a4wtho6p@ypir6ay3vhaw>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <youkuwbynndjpcoux2zaxwjp5gquj647leub3bat37a4wtho6p@ypir6ay3vhaw>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 29, 2024 at 12:21:05PM +0200, Uwe Kleine-König wrote:
> On Mon, Apr 29, 2024 at 11:54:29AM +0300, Andy Shevchenko wrote:
> > On Fri, Apr 26, 2024 at 11:38:33PM +0200, Uwe Kleine-König wrote:

...

> > >  static const struct i2c_device_id wlf_gf_module_id[] = {
> > > -	{ "wlf-gf-module", 0 },
> > > +	{ "wlf-gf-module", },
> > 
> > In such cases the inner comma is redundant as well.
> 
> I would tend to keep the comma, but no strong opinion on my side.

It's just a confusing leftover in my opinion.

> If another member init is added later, the line has to be touched
> anyhow, but in the layout:
> 
> 	... = {
> 		{
> 			"wlf-gf-module",
> 		},
> 		{ }
> 	}
> 
> I'd keep it for sure.

That's not what I object. Here I am 100% with you.

> > >  	{ }
> > >  };

...

> > In general idea might be okay, but I always have the same Q (do we have it
> > being clarified in the documentation, btw): is an ID table the ABI or not?
> > In another word, how should we treat the changes there, because ID tables
> > are being used by the user space tools.
> 
> Note that the layout doesn't change and the traditional interpretation
> of the data still works fine. Or do you see something that I miss?

Do we have any configurations / architectures / etc when
sizeof(kernel_ulong_t) != sizeof(void *) ? If not, we are fine.

(Different endianess seems impossible.)

-- 
With Best Regards,
Andy Shevchenko



