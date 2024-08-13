Return-Path: <linux-i2c+bounces-5334-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC97C950392
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 13:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBD471C21F35
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 11:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B21D1991B2;
	Tue, 13 Aug 2024 11:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KhWDA781"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80281990C8;
	Tue, 13 Aug 2024 11:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723548395; cv=none; b=ql3v9SAEdUiwVfofm8l0jz2ZSBYS69IJXoS3HiPV6JP/wfqHzqVU1DPbmQaQJ3Lc2NcwE+vRDGOi74FMU/+Z3I2JV1mlJO00gDSa2xoAL5WUOWMIpMGBRxf/bISbqmavzryUIA8jqHzqt2G2a/z7KCbdTTfSDV3Mgd2KVCJiTb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723548395; c=relaxed/simple;
	bh=mCsx0QXngc1tRJLyEc7vROSqNAJTKyqG25u/E86hHu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtYtwL2NbkQGHOGL+92Jxh6RllbPwU9SzVdPgFrfz9YtySvevWuXoWhTCxVUIjztBqZbL5EWfm/2MKrvNrLVBEYDevnIjCjYIRq4Bw6utGypHnGtvWVYfWDICKbrIw3Ws8xoNdawTH2fSBfEQPnFbRTzOjLBKf0nSrXz1vxqVsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KhWDA781; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723548394; x=1755084394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mCsx0QXngc1tRJLyEc7vROSqNAJTKyqG25u/E86hHu8=;
  b=KhWDA781LalIdQcKgrcJNYf5BQTecH1r2DfUNZjEf6P8jkDQgXb/JOfd
   vujeFhBStj8RFqfzQm3CBMek34bnVVADU5LSu93t8F8/FPiwRTiDbmDvJ
   OsN3e4YYk/DBa1sr/75XLzwO8MVAfIk799IPz5IYO8lvrlgQjOf17WBKT
   EXrPunAoMtdXKQf3g2WzCQ6vVGQ68/nI0AexqwCKR4w1mSM9X4DCYSIQf
   5ixiT46GygaWcsn/dSCgViGNa/9zwymtxyJKmf5v/BlCsv26cvzrIe59b
   5mvoGllJrUlB8yRvJ+4c76i5x8YKS6Rkrcx0F1Dar6PCG7xSKPXyXUcP0
   w==;
X-CSE-ConnectionGUID: ER8qnFbSSgi/xBcqSgmwHg==
X-CSE-MsgGUID: qrhCEb81SiG13vA5vNuedg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32278827"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="32278827"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:26:33 -0700
X-CSE-ConnectionGUID: zbbaIvIxQReJCsjUmDVR/Q==
X-CSE-MsgGUID: Wra6aVTQRlm5QHzdFegvsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="63319144"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:26:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdpfW-0000000EhwO-00u9;
	Tue, 13 Aug 2024 14:26:26 +0300
Date: Tue, 13 Aug 2024 14:26:25 +0300
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
Subject: Re: [PATCH v4 3/6] i2c: Introduce OF component probe function
Message-ID: <ZrtC4Q4N_3x2KTNb@smile.fi.intel.com>
References: <20240808095931.2649657-1-wenst@chromium.org>
 <20240808095931.2649657-4-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808095931.2649657-4-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Aug 08, 2024 at 05:59:26PM +0800, Chen-Yu Tsai wrote:
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

> +int i2c_of_probe_component(struct device *dev, const char *type)

Use respective scoped variants and remove the related of_node_put() calls.

...

> +		ocs = kzalloc(sizeof(*ocs), GFP_KERNEL);

Use __free()

> +		if (!ocs) {
> +			ret = -ENOMEM;
> +			goto err_put_node;
> +		}

> +err_free_ocs:
> +	kfree(ocs);

-- 
With Best Regards,
Andy Shevchenko



