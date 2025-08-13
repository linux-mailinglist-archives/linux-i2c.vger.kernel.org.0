Return-Path: <linux-i2c+bounces-12266-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 101A7B24A2A
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 15:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1F17565A5E
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 13:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8192E6106;
	Wed, 13 Aug 2025 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9Hiyi55"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AF424DCE9;
	Wed, 13 Aug 2025 13:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755090399; cv=none; b=IgBWG1EYihSMyNSbTwTE+qKB2WLyzYG/bV4SI46vXHhG6meWzkGq745MzuvXdEWD+qxGuPsnatsta2a8JUD1lKlH++SsR7sqJkIk8f/e2otW2nMk4akNJOcoHTLDPUMllss8xc19RC+UsfayaxdHfLDMHmVqhvQ+q/rqEcAWfIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755090399; c=relaxed/simple;
	bh=cRZd5t149Cj/63+HodENGqLUU8711RdMcrqet0Uojk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQoJVK36AL2C/eBzbC+0jS/QQg33Dym2wTikqPujB7o29qvyzrSj1/XtuYEBKazQqpEr4cJG/KTd3N/6XiWRPwqy2WpPDc/qXllRlyVCA2XAw9Fj1f9qz89242q7UIWQXma896AFRCSYsjo9702DskkV720wefbbOBBXv2tx8ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9Hiyi55; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755090398; x=1786626398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cRZd5t149Cj/63+HodENGqLUU8711RdMcrqet0Uojk0=;
  b=L9Hiyi55cnI4KJACG4OPZvhN3g6ePubzLSGM/srSfjUwoLjM/Ru3xuSU
   NFcLQHObjcw7VUt20N78FqHBwHnomdLFTaMZY6VzcrDp0qci5TIqVfFGM
   +KUDjwrxezjuckz1tNZEOiEtzinelfaH/eZ+lBd7rYKDhIlF3DfEGf9Dn
   v7sGWg5vTRUm8GG5Mv7H4l+rvsr2DoWnI52V0V2L3C1ofsLwTUkB2gN9y
   Kh5XFmVibr/GIC94Gf4TpoTmAHlZn+wVyfiR3AaJsPs+Xe6rucwZzJM3w
   zG/M6szzp/CEBqUY3E22k3+Z3PjZqCR5eoeVyQXlE9zOnpUdSy/OoiEJs
   A==;
X-CSE-ConnectionGUID: sNC0acXGTQCBXF38srz1PA==
X-CSE-MsgGUID: 4FWw5nh/RjyL6eAYCdnTwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="74959653"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="74959653"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:06:37 -0700
X-CSE-ConnectionGUID: FWTQedAvQjCEPjDDCDuanQ==
X-CSE-MsgGUID: /zQqES/kR5idr7cSacS7sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="170673829"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:06:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1umBBX-00000005RN2-0SOW;
	Wed, 13 Aug 2025 16:06:31 +0300
Date: Wed, 13 Aug 2025 16:06:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>, Hanna Hawa <hhhawa@amazon.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i2c: add init_recovery() callback
Message-ID: <aJyN1uX60BJQYDHj@smile.fi.intel.com>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-1-ca42ea818dc9@gmail.com>
 <aJpP5eABTYnQRV82@smile.fi.intel.com>
 <27cc9ae5-1c13-4ec9-ab10-ae95d6339116@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27cc9ae5-1c13-4ec9-ab10-ae95d6339116@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 13, 2025 at 12:24:22PM +0200, Gabor Juhos wrote:
> 2025. 08. 11. 22:17 keltezéssel, Andy Shevchenko írta:
> > On Mon, Aug 11, 2025 at 09:49:55PM +0200, Gabor Juhos wrote:

...

> >> This is needed for the 'i2c-pxa' driver in order to be able to fix
> >> a long standing bug for which the fix will be implemented in a

The above left for some context for the below discussion.

...

> > The first traditional question is why the generic recovery is not working.
> 
> The details are in the driver specific patches. Should I write it all down here too?

Instead of the above paragraph, give a summary of your use case to answer 'why'
it can not be done differently.

...

> >> -	if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER)
> >> +	if (bri->init_recovery) {
> >> +		ret = bri->init_recovery(adap);
> >> +		if (ret)
> >> +			return ret;
> > 
> >> +	} else if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER) {
> >>  		return -EPROBE_DEFER;
> >> +	}
> > 
> > If the above stays, I think we would drop the last and always have
> > init_recovery to be assigned.
> 
> In that case we would have something like this:
> 
>     if (!bri->init_recovery)
>         bri->init_recovery = i2c_gpio_init_recovery;
> 
>     ret = bri->init_recovery(adap);
>     if (ret)
>         return ret;
> 
> Since the callback is used only once, and within the same fuction where it is
> assigned, I don't really see the advantage of the assignment. Although it
> definitely looks cleaner as far as error handling is concerned.
> 
> Originally, I have used the following solution:
> 
>     if (bri->init_recovery)
>         ret = bri->init_recovery(adap);
>     else
>         ret = i2c_gpio_init_recovery(adap);

> 

Without this blank line...

>     if (ret)
>         return ret;

...this looks like the best compromise among proposed implementations.

> However the existing code ignores errors from i2c_gpio_init_recovery() except
> EPROBE_DEFER, so I changed this to the code proposed in the patch in order to
> keep the existing behaviour.

-- 
With Best Regards,
Andy Shevchenko



