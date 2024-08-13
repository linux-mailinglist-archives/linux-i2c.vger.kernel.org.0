Return-Path: <linux-i2c+bounces-5336-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D18E9503FC
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 13:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 626451C20E40
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 11:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0B51991AD;
	Tue, 13 Aug 2024 11:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SIUmahaX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFD0170A2B;
	Tue, 13 Aug 2024 11:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723549582; cv=none; b=oNclDQS8R9JQFu4VehXDyBVC349RUNOyJuj3/Gh8lzu6/LcbXBrB+oCikptAl2uK0aZxjNHWkUvP23zxnr2aar6xnPL/j7jECH8z9IboDuIsXUDsjHRyJaqeJpQ3Qr2IzQS+JVKKAWDbYTxBBiETjG6Cq4//V1mIcfUFz++V1MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723549582; c=relaxed/simple;
	bh=PEn3XtRW5tjHG4xl8Hpy2BfiNBLyF2Xe3sCNrstiv8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+IrYzl8RmJwvq44x+jQ/f6B3sCat5H9ogFMDvSEfeql18QckHEvpMw1o8uJVq9PWd9yjcxAgzmVVlN4aDxFNA/Qa5yPlq4FkkptLwQS9HU+M0suu8iIFgxtwKQiKimFDJiiGVC9Bu6AEzcXhSTgFUoYavcoAHwSvxcdKvmwAL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SIUmahaX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723549581; x=1755085581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PEn3XtRW5tjHG4xl8Hpy2BfiNBLyF2Xe3sCNrstiv8Y=;
  b=SIUmahaXxiR98Fc0tIM0nTtJqsKgfVOaiHlhBEWYTiLruyM5PTjlwLFN
   JmMm3ASDlRW2SXqvXZW7f7AAQ2oLjRBiOU9wZ4vLI49WVfqS8sH2Iiuu5
   KBFgEgWJuLjrhMhSI7w5YH+ioO1Wjcd0/lgPyOOL9GbtJBWehwzTBklxt
   ibgUe4WYp14MqSYEUxOTzGv2bKiRv8j7m/RDB+kPZJdAj353eRE0QjgUP
   vya4LzYR35C8irQnxOtj0SMwcgPxz2XtiL5TWQYh0571U4g0ZqgcePXQY
   Un8qEBfZtBJyHkRvrT8UYa42bwX4Bs5c4UmK0fattNSU4vftZZuoD9lXo
   w==;
X-CSE-ConnectionGUID: tfhQFx/VT42AZTsejq4kTA==
X-CSE-MsgGUID: HvAJJ3y5SU6+4e2gy2J69A==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21523248"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21523248"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:46:20 -0700
X-CSE-ConnectionGUID: PSIpAqcSTxuZeWGvCSvo1g==
X-CSE-MsgGUID: P3hRk+ueTcOZ3cw0Qi3PVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="63037742"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:46:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdpyf-0000000EiFk-1s3a;
	Tue, 13 Aug 2024 14:46:13 +0300
Date: Tue, 13 Aug 2024 14:46:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 5/6] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <ZrtHhcNMiyHmKbal@smile.fi.intel.com>
References: <20240808095931.2649657-1-wenst@chromium.org>
 <20240808095931.2649657-6-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808095931.2649657-6-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 08, 2024 at 05:59:28PM +0800, Chen-Yu Tsai wrote:
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
> this change introduces a simple I2C component prober. For any given
> class of devices on the same I2C bus, it will go through all of them,
> doing a simple I2C read transfer and see which one of them responds.
> It will then enable the device that responds.
> 
> This requires some minor modifications in the existing device tree.
> The status for all the device nodes for the component options must be
> set to "failed-needs-probe". This makes it clear that some mechanism is
> needed to enable one of them, and also prevents the prober and device
> drivers running at the same time.

...

> + * Copyright (c) 2023 Google LLC

At bare minimum we are in 2024 now.

...

> +#include <linux/array_size.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>

> +#include <linux/of.h>

Why?

> +#include <linux/platform_device.h>

...

> +	for (size_t i = 0; i < ARRAY_SIZE(hw_prober_platforms); i++) {
> +		if (!of_machine_is_compatible(hw_prober_platforms[i].compatible))
> +			continue;

> +		int ret;

I didn't know we allow this kind of definition mix besides for-loop and
__free()... Can you point me out where this style change was discussed?

> +		ret = hw_prober_platforms[i].prober(&pdev->dev, hw_prober_platforms[i].data);
> +		/* Ignore unrecoverable errors and keep going through other probers */
> +		if (ret == -EPROBE_DEFER)
> +			return ret;
> +	}

...

> +static void chromeos_of_hw_prober_driver_exit(void)
> +{
> +	if (!chromeos_of_hw_prober_pdev)
> +		return;

First of all, this is dup for the next call, second, when may this conditional
be true?

> +	platform_device_unregister(chromeos_of_hw_prober_pdev);
> +	platform_driver_unregister(&chromeos_of_hw_prober_driver);
> +}
> +module_exit(chromeos_of_hw_prober_driver_exit);

-- 
With Best Regards,
Andy Shevchenko



