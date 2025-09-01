Return-Path: <linux-i2c+bounces-12537-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64341B3DE77
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 11:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93A71201613
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 09:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654AC30E822;
	Mon,  1 Sep 2025 09:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ys8RH9Jg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BECB30C354;
	Mon,  1 Sep 2025 09:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756718645; cv=none; b=iDo4Ipkcf6i4rwoj/z1GfUbr2FMYgcsGItEqLYnLHsgZSSs4USwV/BrjS/UIJ704sCOFuD55dA89SyW2fNMX8FJ8czrPat/NfiuwgAB1Gcr8UrsvLcWBC08H7rX+UEPcOE8yidpfRnKerBRGQ8Mq+aprDqWBw+yNgJGg5r5wKNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756718645; c=relaxed/simple;
	bh=T+Xj0rZyysLavFO/ivCHNXIvOAG2SlkbSMufW+nOfw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=REpUFgSWDefvjYeULUY6yTnKKcS22ZuOkJFdXiEsFKAeV5AOfWo5I03/iwraOOPLBsQ5KcCbc23GmAD8Lip5RgyrXM/ZrPzEWSl0CDo1G0SzAjLxcmFU/JGi3jeGLcNdAccTaVcGPjZ6OpSwq6Fqtzq/db+kMQhxJNCNBeX6hck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ys8RH9Jg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756718644; x=1788254644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T+Xj0rZyysLavFO/ivCHNXIvOAG2SlkbSMufW+nOfw8=;
  b=Ys8RH9JgAxyZEYP5grd7PPyuldLK41yvSkSMYXIv/6uLw/A6c38BO3FU
   zgvKjUGcO3mWwwKOJiO1y2Gnueuz4gYsaBIYG6zdCVchanoe88BM/VI71
   CVHa+Y3EklKXZ4f940d8KHdCA8e6+7jwUa+9NyDvbO51T6XhxgQ5EPOx8
   SoCfq6Lrr+RsL1BDXl7mdtQr395rnIFSIa0D18e0/CUoLfElct4rzAW7U
   t1YUIuoFHX6HNJeZM6wEeHLgYiOe7GXJRYKRuvzKcqnxOoBm+rY6T7a60
   Fah9QoYxi/6aaqRtaMQaX4S+Xwk9LtJswaOJMNXshjI1LZHg+Ir/lOR5x
   Q==;
X-CSE-ConnectionGUID: 5kQZBovsQDCgdtreqDdTjA==
X-CSE-MsgGUID: Hd8y/l1oRKm0BsONTvquHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="58904236"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58904236"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 02:24:01 -0700
X-CSE-ConnectionGUID: KnieA+JKSEuAmMEdyCnOEg==
X-CSE-MsgGUID: 1RoFlB6oTXagl4Ix4oEuLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="171823134"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 02:23:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ut0lW-0000000AN9U-3oYK;
	Mon, 01 Sep 2025 12:23:54 +0300
Date: Mon, 1 Sep 2025 12:23:54 +0300
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
	stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH v3 0/2] i2c: pxa: fix I2C communication on Armada 3700
Message-ID: <aLVmKrxEzYgbMUQU@smile.fi.intel.com>
References: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 27, 2025 at 07:13:57PM +0200, Gabor Juhos wrote:
> There is a long standing bug which causes I2C communication not to
> work on the Armada 3700 based boards. The first patch in the series
> fixes that regression. The second patch improves recovery to make it
> more robust which helps to avoid communication problems with certain
> SFP modules.

...

>   - remove Imre's tag from the cover letter, and replace his SoB tag to
>     Reviewed-by in the individual patches

Note, this can be automated with `b4`.

	# Start a new branch of the same base
	git checkout -b v3 ...
	# Apply last version from the mailing list
	b4 am $MESSAGE_ID_OF_v2
	# Do actual development of v3
	...

Also you can do more with `b4 relay`, but I haven't tried it, so I don't know
if it makes it possible or better.

-- 
With Best Regards,
Andy Shevchenko



