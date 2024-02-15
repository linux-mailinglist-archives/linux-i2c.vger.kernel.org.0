Return-Path: <linux-i2c+bounces-1742-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9CF8567D6
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 16:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A9F4284650
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 15:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329EF1369AB;
	Thu, 15 Feb 2024 15:30:58 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9E8136995;
	Thu, 15 Feb 2024 15:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708011058; cv=none; b=nw8FN7YBtnPoI4BNWgDecZEA1N3TBryJ0LnKrnd9nIxgCrFMNQciKf+WaptbeL3jAuLAJfSh/1yzVwQZ8b0NBScJUiD3+6G6l3c1WCIOiKgT5Ahbv6NdIelCvEnrWFbdrgVSeQaF2GA5xnyHw7DT9O746NZsAKYLdm9YTLkvVGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708011058; c=relaxed/simple;
	bh=B0r36ErVVXrTrtr7W/g+NKVHw+xBL+tNCmApTVuv35A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIf1jHJKbRXij+w/SF3xU3zYB5RK7En4+i+4cs65QG/bRVR3pOR0wHhxs0vblOQK0B9s7ov4TvMGZP7y3erJE1zWzJ10SKuAV0NOjNTjhxVMw558iUJgNRQZI43zo3eIi9KxIWib+/qhguiKlIod2p/8zJU17wzgJfL10/YrSLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2229489"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="2229489"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 07:30:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="912180958"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="912180958"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 07:30:49 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1radhF-00000004pR2-0Whi;
	Thu, 15 Feb 2024 17:30:45 +0200
Date: Thu, 15 Feb 2024 17:30:44 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
	theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com,
	u-kumar1@ti.com
Subject: Re: [PATCH v3 04/18] i2c: omap: wakeup the controller during
 suspend() callback
Message-ID: <Zc4uJBUuBzpNgxDP@smile.fi.intel.com>
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-4-5c2e4a3fac1f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102-j7200-pcie-s2r-v3-4-5c2e4a3fac1f@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 15, 2024 at 04:17:49PM +0100, Thomas Richard wrote:
> A device may need the controller up during suspend_noirq() or
> resume_noirq().
> But if the controller is autosuspended, there is no way to wakeup it during
> suspend_noirq() or resume_noirq() because runtime pm is disabled at this
> time.
> 
> The suspend() callback wakes up the controller, so it is available until
> its suspend_noirq() callback (pm_runtime_force_suspend()).
> During the resume, it's restored by resume_noirq() callback
> (pm_runtime_force_resume()). Then resume() callback enables autosuspend.
> 
> So the controller is up during a little time slot in suspend and resume
> sequences even if it's not used.

...

> +	/*
> +	 * If the controller is autosuspended, there is no way to wakeup it once
> +	 * runtime pm is disabled (in suspend_late()).
> +	 * But a device may need the controller up during suspend_noirq() or
> +	 * resume_noirq().
> +	 * Wakeup the controller while runtime pm is enabled, so it is available until
> +	 * its suspend_noirq(), and from resume_noirq().
> +	 */

It's a bit random line lengths...
Can you repack this to be more condensed?

-- 
With Best Regards,
Andy Shevchenko



