Return-Path: <linux-i2c+bounces-5794-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA2495EE88
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 12:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 161F11F22A8B
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 10:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330EC149DFA;
	Mon, 26 Aug 2024 10:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4QwAu7i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B94C2CCC2;
	Mon, 26 Aug 2024 10:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724668485; cv=none; b=fXWB0LeawGBjlFqD1mKNReME8QAp/XSkuXN6GNVjO8GuzOJC4SeH//qRx4roVW0XVYWpIgd8iR5OqiMtthWWiPCsxbpzKZMfeXCXSbsNr4AmHnI33e0tQJdr22T32eBt29x7XZJodcwGcUxcuXi+/d/cQ++fUiZpJM7r81PGv4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724668485; c=relaxed/simple;
	bh=6PORPmAGlNbwepnSLT6lqvnkoiVLauE7Wc1rIk2whys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttE56NUpaSALBm4nz40MJVb3OgOODr19OJWgFElGXRClT2zseRQ+2qc3CchHK211W2QIK7BVOi4aGP5umylCLgmuI1gBGhLQSv8rbc6uh+y2z7vHt3EWZj+4BnqcAK8tTlmCBDvXXCyjm+AOfytqrqcioIjfUgo/hkhSjdcJQ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4QwAu7i; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724668484; x=1756204484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6PORPmAGlNbwepnSLT6lqvnkoiVLauE7Wc1rIk2whys=;
  b=M4QwAu7i9AjhDI9T6QLlWTICrzLgG6i1oj1u7Yg8wGhk9t3CdEYYB1lx
   zKUSGmSqvfjLBrSrBD53m+64kF+4Ye/Bx5ww/H525bxwo3PcPhbEyZfWd
   Oq+qIzlAUE1rsOunxmaBSpi7zGG6G8NlylIc3L91GUpwQ54x61qr9/HRC
   5lL46HnLBc3eSerNMLOLenjSSiCQ+2XHMuTLJlvIabYUQKBADv3Hk1f63
   JWS0hRU+F80dWF9QTBW2JORoWUrwvcjUQBDFSDMvwtOcVycJysZcSHJ/1
   cAPdnoe/Y5Tv2a3Cf7a3Cjl+a8PTzs5vhFvyU3nhPrvscX7ZV50eVmyoG
   w==;
X-CSE-ConnectionGUID: G5vRcbARS2KlRbzKui0wZw==
X-CSE-MsgGUID: RjsHa86qSV2rE0T3Qjk+NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="33703505"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="33703505"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 03:34:43 -0700
X-CSE-ConnectionGUID: wILUtalWSE2hC5I6fSgsXQ==
X-CSE-MsgGUID: Lmikvv6GTdWpa5VxiE5pIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="66643024"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 03:34:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1siX2p-00000001pkf-0wGP;
	Mon, 26 Aug 2024 13:33:55 +0300
Date: Mon, 26 Aug 2024 13:33:54 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rong Qianfeng <11065417@vivo.com>
Cc: Rong Qianfeng <rongqianfeng@vivo.com>, biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	opensource.kernel@vivo.com
Subject: Re: [PATCH v3 3/4] i2c: jz4780: Use devm_clk_get_enabled() helpers
Message-ID: <ZsxaEtWEMWeoVusv@smile.fi.intel.com>
References: <20240823035116.21590-1-rongqianfeng@vivo.com>
 <20240823035116.21590-4-rongqianfeng@vivo.com>
 <Zsir2Lo5TM8YKKrY@black.fi.intel.com>
 <b625df1f-9ddf-4eb1-8b51-6c63fac36530@vivo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b625df1f-9ddf-4eb1-8b51-6c63fac36530@vivo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Aug 26, 2024 at 11:03:20AM +0800, Rong Qianfeng wrote:
> 在 2024/8/23 23:33, Andy Shevchenko 写道:
> > On Fri, Aug 23, 2024 at 11:51:15AM +0800, Rong Qianfeng wrote:

...

> > >        ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
> > >                                   &clk_freq);
> > (side note: this driver should use i2c_timings and respective I2C core
> > APIs instead of this)
> Sorry, I didn't fully understand what you meant, it's my problem. I guess
> you are suggesting to use an API like i2c_parse_fw_timings() to get the
> clock-frequency?

Yes.

-- 
With Best Regards,
Andy Shevchenko



