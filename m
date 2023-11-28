Return-Path: <linux-i2c+bounces-510-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 330667FBF2A
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 17:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE0BCB213C7
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 16:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE9B35279;
	Tue, 28 Nov 2023 16:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSPbZ9c5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD3898;
	Tue, 28 Nov 2023 08:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701188761; x=1732724761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WQHZ+PbGGa3aDyciuChblMvLCm0dgXzHSZ5ktHj28m0=;
  b=bSPbZ9c5azkxLWG50D9N/FTbgfbLDO07LBiAGTDa9/q5ZQX9xKXE7g08
   CGrq06Ltpnq4h+T3siVS8D361QlVFX9QZIvUDJ0N6EY+ZcdRCKxVkTV5r
   GJMfCEZPHGxfbiIsRSwOwtz9OAAAVeMem9eDeI6bfTEEqBC2Yn2onzcmB
   Tcy7S/bUTqrf++B5w0hoT+yxndYZf4G8SnYmSB4tlP2jHO3Og3NvNIzTf
   Fj8tLMqr7Td0LrNao3A8p84X5egw1ioTiAKUAnKdHbcBYkQJA6R+LxpRW
   QzXLJiiRt39+skzrwcxFdnT25Lk7eULZtGJCL+xT6oElKVFnX7+b1Auk6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="424106462"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="424106462"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 08:26:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="768577278"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="768577278"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 08:25:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r80uB-00000000CyG-1z99;
	Tue, 28 Nov 2023 18:25:47 +0200
Date: Tue, 28 Nov 2023 18:25:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>, linus.walleij@linaro.org,
	broonie@kernel.org, gregkh@linuxfoundation.org, hdegoede@redhat.com,
	james.clark@arm.com, james@equiv.tech, keescook@chromium.org,
	rafael@kernel.org, tglx@linutronix.de,
	Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH v3 3/5] platform/chrome: Introduce device tree
 hardware prober
Message-ID: <ZWYUi3Q5ptQXR0uQ@smile.fi.intel.com>
References: <20231128084236.157152-1-wenst@chromium.org>
 <20231128084236.157152-4-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128084236.157152-4-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 28, 2023 at 04:42:32PM +0800, Chen-Yu Tsai wrote:
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

> +#include <linux/array_size.h>
> +#include <linux/i2c.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>

init.h for init calls.


> +static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
> +{
> +	for (size_t i = 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
> +		if (of_machine_is_compatible(hw_prober_platforms[i].compatible)) {
> +			int ret;

Perhaps

		if (!of_machine_is_compatible(hw_prober_platforms[i].compatible))
			continue;

?

> +			ret = hw_prober_platforms[i].prober(&pdev->dev,
> +							    hw_prober_platforms[i].data);
> +			if (ret)
> +				return ret;
> +		}
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



