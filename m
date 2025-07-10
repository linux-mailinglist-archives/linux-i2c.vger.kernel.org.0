Return-Path: <linux-i2c+bounces-11900-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A55B0047B
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 15:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 561B1B45A3E
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 13:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7177D275B14;
	Thu, 10 Jul 2025 13:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dprSP3bJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B32E2741D5;
	Thu, 10 Jul 2025 13:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752155592; cv=none; b=Bt2+BgxjBD98gWWiEfsDYmp/UDlItrqCi5V3NXTasMSuW2zNAfIs/jumSHXzIJ266WpQ47Ta4BWic1fpmyabWzVw7DVvkBS2VncvyEy5LTWMzsLKQ82z3u9FZ+quh4J6mDMiNaRumUJ4hYXSzt/kreMSuzBFBnl1Ksjo2AQUKZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752155592; c=relaxed/simple;
	bh=U9guwqJci8NP6a0yfqpBMd5Vn2SbFy+CrvHcPob9HAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUXwoGto4RO1q0V5ylBgF3OiE7UUe1YQqjIFhLMVWvpZ9k3J8MhCcnTjvIitZulRQkwpCSyjXyz6YQfgZ1bcrhEfawomwBG8t/+cNeGIKBeah8YufnvvBVJ7COMEjFcq4ygVV2hDIEeXJ4dF2HC1de07ITeGXgGAm0C/LLvnFcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dprSP3bJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752155591; x=1783691591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U9guwqJci8NP6a0yfqpBMd5Vn2SbFy+CrvHcPob9HAg=;
  b=dprSP3bJgcHsWfIGPLN4PT5bKRxJpkg3oA5SOOk5p4CoTcwJXxK1HSWI
   Xi+NrZOxlDifx/8khontUX2O08g9z9fnRRdjxVvvFnPamiT3gYzA8dmDb
   GhWHtdBGnCyZC0BuZk64M1j9bSeaTqCxeRA/iylzaXKRJ1va6rZSeSDWh
   s0e60r/h12LXxK9Em3EaM+PQHJdBE+Vv+j6+dvugTOHsZxrYiqTHRcRrw
   pVV1R9ZVmZVjAKdQUET1t5UBiXfIZQcxs4prC+Dl+hZwHzot7P7tC26FU
   p6pWvwmOWzMlIGqOpV2PcO8o8WUbiy2kVSR8u7yTvza7X2bKdSlpjYZ1G
   g==;
X-CSE-ConnectionGUID: 4/qqkiL0QyKdPr7R48KKcg==
X-CSE-MsgGUID: DSFARMWqRCm2YpKoFT5jLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="58243504"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="58243504"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 06:53:09 -0700
X-CSE-ConnectionGUID: 3G5UpA1+RWGAI3qLJGBvRw==
X-CSE-MsgGUID: 5LPmWD7vQ06paQ6dFGhjXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="193300156"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 06:53:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uZrhu-0000000EDXo-0n5v;
	Thu, 10 Jul 2025 16:53:02 +0300
Date: Thu, 10 Jul 2025 16:53:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com,
	ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	p.zabel@pengutronix.de, thierry.reding@gmail.com,
	conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v6 2/3] i2c: tegra: Use internal reset when reset
 property is not available
Message-ID: <aG_FvfN6xXuULolK@smile.fi.intel.com>
References: <20250710131206.2316-1-akhilrajeev@nvidia.com>
 <20250710131206.2316-3-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710131206.2316-3-akhilrajeev@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 10, 2025 at 06:42:05PM +0530, Akhil R wrote:
> For controllers that has an internal software reset, make the reset
> property optional. This provides and option to use I2C in systems
> that choose to restrict reset control from Linux or not to implement
> the ACPI _RST method.
> 
> Internal reset was not required when the reset control was mandatory.
> But on platforms where the resets are outside the control of Linux,
> this had to be implemented by just returning success from BPMP or with
> an empty _RST method in the ACPI table, basically ignoring the reset.
> 
> While the internal reset is not identical to the hard reset of the
> controller, this will reset all the internal state of the controller
> including FIFOs. This may slightly alter the behaviour in systems
> which were ignoring the reset but it should not cause any functional
> difference since all the required I2C registers are configured after
> this reset, just as in boot. Considering that this sequence is hit
> during the boot or during the I2C recovery path from an error, the
> internal reset provides a better alternative than just ignoring the
> reset.

...

I would perhaps expand the comment here to explain ENOENT check and what do we
do in this case. (Note, no rewriting of the existing, just adding a paragraph)

	*
	* In case ... we compare with -ENOENT ...
	* ...
	*/

>  	err = device_reset(i2c_dev->dev);
> +	if (err == -ENOENT)
> +		err = tegra_i2c_master_reset(i2c_dev);

>  	WARN_ON_ONCE(err);

Other that that, LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



