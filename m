Return-Path: <linux-i2c+bounces-12251-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08688B2165A
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 22:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2D8B3B0D94
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 20:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D532D9EE4;
	Mon, 11 Aug 2025 20:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrW0l8yJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8341F9A89;
	Mon, 11 Aug 2025 20:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754943471; cv=none; b=qFoH1p18wX+rRcMeWQ7qf5C8pQOXLCjJEl+uAiLEWcnbP5CT8vphUqGDxxDucHrvdYl7SYlZYenbnX8yJENn41j4FjdWgGQ0vrODJpG/DccySqIPE5h1FOUVb45wLLGTEzHDl5IGSJAnnCPDAdyP8QQVzfnacKwMFHhRmQtbg8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754943471; c=relaxed/simple;
	bh=yyBb39BiqDIpv9A/xIVgde9Qlx9RcFbByzIMcGrSgwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBxOB2NK8fLE01LrmCqsR2fkTbzCs4LKUnFrlYf4VbHsI03At/NdWCUHv2W+brJ0Q1kOP6VQlyQaMlfkBatG9I9nSQ6AOhmRa1N66GKkwgfZZrXnz7eV+cxwWIlO5v8pf3Tz8DNuDtK7a8InyyPkrEcIkX/qw5hoFocsEJwKFzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrW0l8yJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754943470; x=1786479470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yyBb39BiqDIpv9A/xIVgde9Qlx9RcFbByzIMcGrSgwA=;
  b=mrW0l8yJh8PqlHhYVlO+/tNdCckxZF5XYlIGnOsBHdEmfdX7kiOMoq/A
   8HaVRh5boKJCvHUVgafs2GtzzVjoDREW4xEindMvPLBSCjmDaRj5QYOgg
   tkxfVIZAF0Z5ry4ImX9+9g5GxIhhXzYC4TDLA6MPqK7+n3MFCpO2+1WKv
   QwLfGH5A6Qzbnh0LLiuzNVjGhfSNOGjT5B6j/cEBCwud17fTl66Zr5ljG
   AH60FV3VXuOhEa9GJGZ0Rc5ajfWe+EE8ngXIeudII9vHAUfvLXMWpfWQa
   cUhFXGdCMvPGFMqi25yD0Ps6+sxTH2BRcBRZxwbKq7FSxGhZQpuBThsdE
   A==;
X-CSE-ConnectionGUID: YNMnpkcJTwiCrBo1tXEPcg==
X-CSE-MsgGUID: luUoTGULQqizoEq965c5QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56233923"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="56233923"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:17:49 -0700
X-CSE-ConnectionGUID: LDqZ9GQDTkKUBXBPFE1LGg==
X-CSE-MsgGUID: 1PNPdKRCT/qmTAf2kwLvSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165630085"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 13:17:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ulYxh-000000056aH-48oB;
	Mon, 11 Aug 2025 23:17:41 +0300
Date: Mon, 11 Aug 2025 23:17:41 +0300
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
Message-ID: <aJpP5eABTYnQRV82@smile.fi.intel.com>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
 <20250811-i2c-pxa-fix-i2c-communication-v2-1-ca42ea818dc9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-i2c-pxa-fix-i2c-communication-v2-1-ca42ea818dc9@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 11, 2025 at 09:49:55PM +0200, Gabor Juhos wrote:
> Add a new init_recovery() callback to struct 'i2c_bus_recovery_info'
> and modify the i2c_init_recovery() function to call that if specified
> instead of the generic i2c_gpio_init_recovery() function.
> 
> This allows controller drivers to skip calling the generic code by
> implementing a dummy callback function, or alternatively to run a
> fine tuned custom implementation.
> 
> This is needed for the 'i2c-pxa' driver in order to be able to fix
> a long standing bug for which the fix will be implemented in a

> followup patch.

"...next change."

...

The first traditional question is why the generic recovery is not working.

...

> -	if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER)
> +	if (bri->init_recovery) {
> +		ret = bri->init_recovery(adap);
> +		if (ret)
> +			return ret;

> +	} else if (i2c_gpio_init_recovery(adap) == -EPROBE_DEFER) {
>  		return -EPROBE_DEFER;
> +	}

If the above stays, I think we would drop the last and always have
init_recovery to be assigned.

-- 
With Best Regards,
Andy Shevchenko



