Return-Path: <linux-i2c+bounces-2560-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7D888716F
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 18:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C6871F24B90
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 17:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C025F466;
	Fri, 22 Mar 2024 17:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkNsD6sn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7935D720;
	Fri, 22 Mar 2024 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711126825; cv=none; b=UVHCepI2fdHm1vQ4b4QqBTPBz0LvW/7djv4BlBerka+VF0bARaei0WzyQ64h+zbvsV+dW62trn+FAj2GY63atRK7qlsMg+2Dck7vYnTSq6s9paMCD2UbMh3wIli5n85FTBVh18yUqy5z+lOdTOo/VPABZbqdW4jahRRcdKPJrt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711126825; c=relaxed/simple;
	bh=eijYIPLIRnSAkyrL//Qucwww06P+qCR4wOCt19HryXE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Znjpi8UD18sVLby9N6kmWM8UAW8yzhWZhQbVvqGk+YYWUjQhRdf8ex8UgOW1VZIZMMLSSBYoR53JhO4djET04tzCYSKWCwJZP4/RDeZi/J4Vb+jiD9k3mp0Ad5KBYYkSh6Oeext2qSjtR6h6bkSeDhNbJMyq8EmQaIq/vedJObo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkNsD6sn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711126824; x=1742662824;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=eijYIPLIRnSAkyrL//Qucwww06P+qCR4wOCt19HryXE=;
  b=fkNsD6sn7kG3VNojJNPSX1zDG+ZAZtMGzgurDKheDFbMS5oVVeOPwHgQ
   rd1FphQ2pY5MSdjRuNXBfznlSghFWajWzp58dJWzuzNPnCjQlrremA7Uh
   r3BZF2l7ULmSKTjQfM/6KypHcikR8FLzJfiftTFeWhi2WEU2GFCrMghSZ
   MvjmhlaEJaXQCyWr5d7Wd3AkKEQUvY9gAr0wymIO+N67VEQlsi+ozyevL
   F9AqnLbYwZ360gtscpovMZl7kaHdTg7yJ3TKsi/HqqUelom+tH+lKWfSm
   VclEj15mYxlPBnZ6Ygz/vv+45+NtEXoZu6ZtiukPM2HFSuUzqkoz/JIQQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17619593"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="17619593"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 10:00:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="914749126"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="914749126"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 10:00:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rniFb-0000000FDED-2Q86;
	Fri, 22 Mar 2024 19:00:15 +0200
Date: Fri, 22 Mar 2024 19:00:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
Message-ID: <Zf25H-LlAFmfuyYT@smile.fi.intel.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
 <Zf2tSLJzujUHbJjp@smile.fi.intel.com>
 <Zf22dmwBpN7Ctk3v@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zf22dmwBpN7Ctk3v@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Mar 22, 2024 at 05:48:54PM +0100, Wolfram Sang wrote:
> 
> > >  static const struct i2c_algorithm at91_twi_algorithm = {
> > > -	.master_xfer	= at91_twi_xfer,
> > > +	.xfer	= at91_twi_xfer,
> > 
> > Seems you made this by a script, can you check the indentations afterwards?
> 
> Yes, I noticed as well. But other (not converted) drivers have issues
> there as well, so this will be a seperate patch.

The problem is that you add to a technical debt. We don't want that.
If you have not introduced a new indentation issue, it obviously is
not needed to be fixed in a separate patch. So, please consider this.

-- 
With Best Regards,
Andy Shevchenko



