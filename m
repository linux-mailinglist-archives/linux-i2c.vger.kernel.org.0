Return-Path: <linux-i2c+bounces-7457-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 724039A1F11
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 11:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99FF21C26554
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 09:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3961D9677;
	Thu, 17 Oct 2024 09:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oKzyx59z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D93165F08;
	Thu, 17 Oct 2024 09:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729158730; cv=none; b=rmB/hGvZ5QSTY86h7a8hboUw79CqPOskz17/Qp06zDv5PJB1kfkyDBY+XKENlDFZK+MGD9RpqmfqRiCHGQ0Q91u1yOoM/sXMKH8veCKngWnvzHVgkENG2nHTszVOiMBwbcC3Fm8R5klZaKnyLY3NcSKKhC7bJDt5b5oVi8MgMX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729158730; c=relaxed/simple;
	bh=qOkRZ7dA9PBpum+aq1ZRnwF90KyGgZL2XumS6gLtwOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BriFxHnhuxnVF+pk1z/xlGErBJWGXKgsp7opbopMsYGgvHBAdRDHd/rdVcbEfNsnZQ+P9w5LkjxgQMBRicEt0TmuaQUiYqL9h4gN1o8T2Z85j0FkDsvQIxQ4yR3LH6o+utB97bJxI3qt/4ElLWTtgIKTWvC/oV8OnUu0EiTSD7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oKzyx59z; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729158729; x=1760694729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qOkRZ7dA9PBpum+aq1ZRnwF90KyGgZL2XumS6gLtwOI=;
  b=oKzyx59zjxLRimDT1NUjNmATowc81BP6hxtIaVmVLbKgT7B1BxlCvSkv
   ANzN+IVd3ncKyTGizNn8IO+u+ifUhdh61OZ/xYt0s9bq3KZoNehnWVRZj
   jyIm+g9x63u/VJCV8+klt4eG3ec1RqryxgtrjI3kr5ebJo8RLUJLyjc6i
   YIirX+ivb7LRFFJ50tqZL2Y8NxHYmtJxfIg4ltvfrAglT430Q1Swszr6t
   RIChZBuQ6xx+jkwaH4KwcZtWKkZjwcMMMM0mTgs7aXgpoVW3uqvCrop3B
   cSphtAp9MxeWTp2CCvU3wzqoPvfG5aM2w15R9m9zRmkSvrlL9JL50/o9s
   A==;
X-CSE-ConnectionGUID: Ef/UW/ykQ7SlewZj/URRhA==
X-CSE-MsgGUID: KLgITmJ5QbOiSY5c9YIrLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="16254562"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="16254562"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 02:52:08 -0700
X-CSE-ConnectionGUID: PFFFUSpWQdyCQtOZxuGdoA==
X-CSE-MsgGUID: 2P9XLtXyRTCx1SyNHhTWHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="83567930"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 02:52:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t1NAn-000000044du-1N8X;
	Thu, 17 Oct 2024 12:52:01 +0300
Date: Thu, 17 Oct 2024 12:52:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v9 3/7] i2c: Introduce OF component probe function
Message-ID: <ZxDeQcLVR1LK24Zr@smile.fi.intel.com>
References: <20241017094222.1014936-1-wenst@chromium.org>
 <20241017094222.1014936-4-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017094222.1014936-4-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 17, 2024 at 05:34:38PM +0800, Chen-Yu Tsai wrote:
> Some devices are designed and manufactured with some components having
> multiple drop-in replacement options. These components are often
> connected to the mainboard via ribbon cables, having the same signals
> and pin assignments across all options. These may include the display
> panel and touchscreen on laptops and tablets, and the trackpad on
> laptops. Sometimes which component option is used in a particular device
> can be detected by some firmware provided identifier, other times that
> information is not available, and the kernel has to try to probe each
> device.
> 
> This change attempts to make the "probe each device" case cleaner. The
> current approach is to have all options added and enabled in the device
> tree. The kernel would then bind each device and run each driver's probe
> function. This works, but has been broken before due to the introduction
> of asynchronous probing, causing multiple instances requesting "shared"
> resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> time, with only one instance succeeding. Work arounds for these include
> moving the pinmux to the parent I2C controller, using GPIO hogs or
> pinmux settings to keep the GPIO pins in some fixed configuration, and
> requesting the interrupt line very late. Such configurations can be seen
> on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> Lenovo Thinkpad 13S.
> 
> Instead of this delicate dance between drivers and device tree quirks,
> this change introduces a simple I2C component probe function. For a
> given class of devices on the same I2C bus, it will go through all of
> them, doing a simple I2C read transfer and see which one of them responds.
> It will then enable the device that responds.
> 
> This requires some minor modifications in the existing device tree. The
> status for all the device nodes for the component options must be set
> to "fail-needs-probe". This makes it clear that some mechanism is
> needed to enable one of them, and also prevents the prober and device
> drivers running at the same time.

...

> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/i2c-of-prober.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>

In case you need a new version, also add stddef.h for NULL definition.

-- 
With Best Regards,
Andy Shevchenko



