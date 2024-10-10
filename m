Return-Path: <linux-i2c+bounces-7324-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB9F998C3D
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2024 17:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16AEDB28DDD
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2024 15:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F641CCB3A;
	Thu, 10 Oct 2024 15:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AYdf3mSN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C708E1C2424;
	Thu, 10 Oct 2024 15:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728574194; cv=none; b=gi3NRZ4JvwGEHFho3tZEx82bIv9FqE+PDtYc39aHCXrmUGoJhP5As5GSR8dCM7r2tNChthi5NULZbCyy+OWjKBdGeASYKY4j83FbciXbB1qvHR10j5vUatC672AuZOy16TkwYIPM/KlpiSvjKHVboitXuSDgXJCZyVRdbDjgp7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728574194; c=relaxed/simple;
	bh=3Yh7DZRlIIUDk+aIqbJ40eQmrJ7arxkdSCZSAYEQQxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7Ew08LY2Q/tmvPqEYi3FVnb/dw+IGVAxjMDlLhyYPK+JyvIcm/9hVHowLPC5Hlc+7IPfux5u2bAvtxRYP+2gCPuI9Ig9IQaoGREhXEXKAdpskq4p3z8mGmTtCvhVyUoqDVsIIMmmB1NGUyvKBMY8UegqCF+zy6peh+gKu3tfUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AYdf3mSN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728574193; x=1760110193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Yh7DZRlIIUDk+aIqbJ40eQmrJ7arxkdSCZSAYEQQxo=;
  b=AYdf3mSNV7V+giE+pV+3K50uQDPabzPIj3bCHdHuHrCUw2l6lCm9lX6A
   gmCEVl9dDtZ3KVTRAH9dFx9JeWyaB331ULF1iWakLUbk1h7bci4N5peQL
   722D1TjcQXhFQdUYaqukhFjzUTglui4gVsPS+0Xl2l3fadZ3iBkIO+Uzr
   H9u6QMgxiacTuQiKOpQPx8ZmPQ7LDgzzScifgk31AY+VLF9PWkRWBq5+8
   ZiNRe/AVCOWnmJefUqHPKEDyAE+fKSf19NWFuQvKeJ5GIzEaGKkK3kt5H
   oF7l64SEc4BnEDSAfwFg/PU/ZKBb+WFSfm6BLtu+ho5T0GEnPnQppAzps
   g==;
X-CSE-ConnectionGUID: 57OpOhz8TuuRu4zqntEVCA==
X-CSE-MsgGUID: p+VTLes/T1aye+vhUE955Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27388507"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="27388507"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 08:29:52 -0700
X-CSE-ConnectionGUID: XrYEqfQKRwaX4NHaTCuDjw==
X-CSE-MsgGUID: IKQnyKw7TIOwS2prjh7F+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="81151289"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 08:29:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1syv6m-00000001Zuf-3h6N;
	Thu, 10 Oct 2024 18:29:44 +0300
Date: Thu, 10 Oct 2024 18:29:44 +0300
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
Subject: Re: [PATCH v8 7/8] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <Zwfy6ER6sbr_QxsY@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-8-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008073430.3992087-8-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:
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
> set to "fail-needs-probe". This makes it clear that some mechanism is
> needed to enable one of them, and also prevents the prober and device
> drivers running at the same time.

...

> +#include <linux/array_size.h>
> +#include <linux/errno.h>
> +#include <linux/i2c-of-prober.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>

> +static int chromeos_i2c_component_prober(struct device *dev, const void *_data)
> +{
> +	const struct chromeos_i2c_probe_data *data = _data;
> +	struct i2c_of_probe_simple_ctx ctx = {
> +		.opts = data->opts

Leave trailing comma in such cases (when it's not a terminator and
not on the same line with the variable definition).

> +	};
> +
> +	return i2c_of_probe_component(dev, data->cfg, &ctx);
> +}
> +
> +static const struct chromeos_i2c_probe_data chromeos_i2c_probe_dumb_touchscreen = {
> +	.cfg = &(const struct i2c_of_probe_cfg) {

Perhaps you can introduce something like

#define DEFINE_I2C_OF_PROBE_CFG(_type_, _ops_)		\
	(struct ...) {					\
		.ops = _ops_,				\
		.type = #_type_,			\
	}

and use it here as

	.cfg = DEFINE_I2C_OF_PROBE_CFG(touchscreen, NULL),

> +		.type = "touchscreen"

Ditto.

> +	}

Ditto.

> +};
> +
> +static const struct i2c_of_probe_cfg chromeos_i2c_probe_simple_trackpad_cfg = {
> +	.ops = &i2c_of_probe_simple_ops,
> +	.type = "trackpad"

Leave a comma.

> +};

...

> +static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
> +	.cfg = &chromeos_i2c_probe_simple_trackpad_cfg,

	.cfg = DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_simple_ops),

Or even

#define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)			\
	DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)

> +	.opts = &(const struct i2c_of_probe_simple_opts) {

Perhaps also DEFINE_xxx for this compound literal?

> +		.res_node_compatible = "elan,ekth3000",
> +		.supply_name = "vcc",
> +		/*
> +		 * ELAN trackpad needs 2 ms for H/W init and 100 ms for F/W init.
> +		 * Synaptics trackpad needs 100 ms.
> +		 * However, the regulator is set to "always-on", presumably to
> +		 * avoid this delay. The ELAN driver is also missing delays.
> +		 */
> +		.post_power_on_delay_ms = 0,
> +	}
> +};
> +
> +static const struct hw_prober_entry hw_prober_platforms[] = {
> +	{ .compatible = "google,hana", .prober = chromeos_i2c_component_prober, .data = &chromeos_i2c_probe_dumb_touchscreen },
> +	{ .compatible = "google,hana", .prober = chromeos_i2c_component_prober, .data = &chromeos_i2c_probe_hana_trackpad },

These strings are a bit long, perhaps wrap on one member per line?

> +};

-- 
With Best Regards,
Andy Shevchenko



