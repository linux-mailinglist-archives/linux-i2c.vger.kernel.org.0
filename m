Return-Path: <linux-i2c+bounces-11766-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8D5AF5C58
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 17:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D6277A98A3
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 15:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22EF92D374D;
	Wed,  2 Jul 2025 15:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ay4raOHI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AC22D372E;
	Wed,  2 Jul 2025 15:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469105; cv=none; b=HI9HY8Bm43cCTYAVKlXVafZKo7KHeE8UqfOUGUzFIJQXxiNCeXqetm+0sjd9OZpMXM45vPFNq6qB4C99QF/C1bNfY1FB5nKsh88+0xKJ3v04NuYb6mHtpRNLDA8yF0aI1km4oe+w7K5P4eUEdW5FXIj8eFBNWdjuUzQeWkCMioQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469105; c=relaxed/simple;
	bh=KCqLE/wRYsVMzqwg3Wkn1fl5tpd3/S+Ubh3A4qMr6zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5/dv5pZTTKW8fjUq41oIv/e1oPpZ070YFy9JIqy0bX+HyyX7WlvvnSWFhsl5VQXNzQGrYIyfCZIM3S+5sHjrFNUUxTDSp0Sx6QkV49WpWTwzgiz014BLMAhgRZ3614v4wgIgASNIY4qtxDfyF5cBGB/XA34U0UaZOeXT4xiwX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ay4raOHI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751469104; x=1783005104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KCqLE/wRYsVMzqwg3Wkn1fl5tpd3/S+Ubh3A4qMr6zo=;
  b=Ay4raOHIfWlN9uGajkh2GR+3XJxhqmVIJ++RiIp805U/NN6Rz/DftJFT
   42+/1+spXOJCrtyFa5V77xa7MHvJVMuWT/IibZLw28o8jrJNoTZ5OLbek
   f3YJ3O48N3RFYCHE/rCvlhjrPnBnff4y1MJGHczkCCd0zogV8ZdymVKYO
   jRWodrI0Zrpy8URC4QLJ9Kdmh7mRdLufsXSVk+UiuADRXXEr3KD3Gw5xO
   +iZ09y/OtsBlT66qB67dGPaJOCFMPjZpBsWNVvz2kGb2W8gVCyBWJQ/tV
   mlUl0xaKc0VhWBqgYluXAGj81hD9BtL5lz+es6d6Ejb3k3kHtYMC26ck0
   Q==;
X-CSE-ConnectionGUID: KwYRvsMVRjamzsdEgG4TmA==
X-CSE-MsgGUID: NTgC7K0vTIWxJoR780DTLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53915009"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53915009"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:11:40 -0700
X-CSE-ConnectionGUID: 0lyey7JLR9GLWWXjy4ylEA==
X-CSE-MsgGUID: t+dxjrH9QeC0MJ43c/0dPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154663466"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 08:11:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWz7W-0000000Bx0u-1pKJ;
	Wed, 02 Jul 2025 18:11:34 +0300
Date: Wed, 2 Jul 2025 18:11:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, p.zabel@pengutronix.de,
	thierry.reding@gmail.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	ldewangan@nvidia.com, robh@kernel.org
Subject: Re: [PATCH v5 2/3] i2c: tegra: make reset an optional property
Message-ID: <aGVMJab9-G_bOqQh@smile.fi.intel.com>
References: <20250702133450.64257-1-akhilrajeev@nvidia.com>
 <20250702133450.64257-2-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702133450.64257-2-akhilrajeev@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 02, 2025 at 07:04:48PM +0530, Akhil R wrote:
> For controllers that has an internal software reset, make the reset
> property optional. This provides an option to use Tegra I2C in systems
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

> +static int tegra_i2c_master_reset(struct tegra_i2c_dev *i2c_dev)
> +{
> +	if (!i2c_dev->hw->has_mst_reset)
> +		return -EOPNOTSUPP;
> +
> +	i2c_writel(i2c_dev, 0x1, I2C_MASTER_RESET_CNTRL);

> +	udelay(2);

fsleep()
and perhaps explain why this is needed.

> +	i2c_writel(i2c_dev, 0x0, I2C_MASTER_RESET_CNTRL);

> +	udelay(2);

Ditto.

> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



