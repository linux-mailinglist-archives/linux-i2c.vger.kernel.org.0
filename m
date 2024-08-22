Return-Path: <linux-i2c+bounces-5673-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A32CE95B7DB
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 16:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3221B1F25E69
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 14:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5A31CB319;
	Thu, 22 Aug 2024 14:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZ718OJ8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD31A1C9EBB;
	Thu, 22 Aug 2024 14:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724335322; cv=none; b=LW9xSaufWVLNu+r+ABe4HVB8fM5xRXGvsHBoRQJQl+qhAQx6gKed1IZ0DhiDimzXEgUuQ702JFLKugSjB/v5p63tRqZR82TAJn1JVmLnYdMDdY1zvYejbl/JAVCZkcR5/BRJ3zq/dFE33Edap99xV4Sd4apabiFf+SjxQN98RHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724335322; c=relaxed/simple;
	bh=DYajc8AW19c7b03Ic4Cd1e/BodGn5ZQSh80teMscdVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQBPGPzfnorsTnnbtnZf8fgkdFYnGidzW0UsyOv7D3Vua+An6g3upo63P1HK7VSJ1DbB8SH4iI/wLAdOK56J8qF48M6xOF0pZjXy3pthe/cKbVecuW6w8DTyjEQAW/+wKAzwR/P/gacpVPc0lk8fZigBUXtF1Ev+fqjzctLw4gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZ718OJ8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724335321; x=1755871321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DYajc8AW19c7b03Ic4Cd1e/BodGn5ZQSh80teMscdVc=;
  b=VZ718OJ8/Pse7EFzTr6bPXuAk0V1B/R+4zLcoBcpmy7c0OTfhFJixnXo
   Tag914afA/hA4ABnpitfY5nrpkKxPMvjlkEMsAcguizX4bLssi/Jiaahl
   hvJiD+UUTAw6WMXuMA/kKnFaBgVcxd9Yq69MxRrIYWe4RjVvaMCXYLd8D
   +N4WeuDg47IeJeONxd+b07q0s89RNDXnvlZwiE+qyojD8pbBKxjmTRZ6i
   9DST6Td7i3fCo9X/8ZzhcYY0auWnpa9fk7HomR3FaeBAVB/Orw7eG0cid
   5JIuEdq09Q2NfnOW3XYCBCqmrDBpzunuQ3kz7Tv/BGiJzvPUEv1YxVPZP
   w==;
X-CSE-ConnectionGUID: rjyWNdc+SO+SgC4jVQBXIg==
X-CSE-MsgGUID: P+HZ8MKhTcmdmuxwo1NS5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22619639"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22619639"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 07:02:00 -0700
X-CSE-ConnectionGUID: wtMnhjT5Q7OY5YzBoCs16Q==
X-CSE-MsgGUID: GpBRurRkQOykwsj44mUesQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="66347601"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 07:01:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sh8Nt-00000000TMP-0QuL;
	Thu, 22 Aug 2024 17:01:53 +0300
Date: Thu, 22 Aug 2024 17:01:52 +0300
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
Subject: Re: [PATCH v5 06/10] i2c: Introduce OF component probe function
Message-ID: <ZsdE0PxKnGRjzChl@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-7-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822092006.3134096-7-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 22, 2024 at 05:19:59PM +0800, Chen-Yu Tsai wrote:
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
> this change introduces a simple I2C component probe. function For a
> given class of devices on the same I2C bus, it will go through all of
> them, doing a simple I2C read transfer and see which one of them responds.
> It will then enable the device that responds.
> 
> This requires some minor modifications in the existing device tree. The
> status for all the device nodes for the component options must be set
> to "failed-needs-probe". This makes it clear that some mechanism is
> needed to enable one of them, and also prevents the prober and device
> drivers running at the same time.

...

> --- a/drivers/i2c/Makefile
> +++ b/drivers/i2c/Makefile
> @@ -9,6 +9,7 @@ i2c-core-objs 			:= i2c-core-base.o i2c-core-smbus.o
>  i2c-core-$(CONFIG_ACPI)		+= i2c-core-acpi.o
>  i2c-core-$(CONFIG_I2C_SLAVE) 	+= i2c-core-slave.o
>  i2c-core-$(CONFIG_OF) 		+= i2c-core-of.o
> +i2c-core-$(CONFIG_OF_DYNAMIC) 	+= i2c-core-of-prober.o

Seems like all the above (except ACPI) have the same issue, i.e. TABs/spaces
mixture.

...

> +	ret = of_changeset_apply(ocs);
> +	if (!ret) {

Why not positive conditional?

> +		/*
> +		 * ocs is intentionally kept around as it needs to
> +		 * exist as long as the change is applied.
> +		 */
> +		void *ptr __always_unused = no_free_ptr(ocs);
> +	} else {
> +		/* ocs needs to be explicitly cleaned up before being freed. */
> +		of_changeset_destroy(ocs);
> +	}

-- 
With Best Regards,
Andy Shevchenko



