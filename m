Return-Path: <linux-i2c+bounces-12584-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 814B4B4215B
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 15:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFDD13BC2AB
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 13:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70002302CB3;
	Wed,  3 Sep 2025 13:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fppeuxr2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF6930100A;
	Wed,  3 Sep 2025 13:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756905936; cv=none; b=sq0RyJsnf4UnvQ0aLJYjsYXBAyX528o20iI/lGIT3cdsO3NdzCtZKljP/MgQHr0JzFWONTnGFLpfYzIwEUktu9KhOPvZiJZM+LCWmZWCZwfSE981h4/+N6IRYrzREYvzu8XmTufG7CRnEydyKBG/j0iWdYlW5LGnEzK1UcpYwYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756905936; c=relaxed/simple;
	bh=LahPxxsFg6l59qbeOzrTE1d/6xGMndEUs1/iv+M2mpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G10cb2mxduVLZXnKmhl+zq9h38ke1qmSNbAB8HV4jRD0BDbrcVJhzxEDxgsxDPRWETDauguhZreKHeZO6u031I5vQa5KqUixhYnZk8AiSxApSXyFUYNrAO4uq9zO3SNydZ9T61F/NoUAhWQU0rjYq6+h7VTX1luj5WfF1UMkJkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fppeuxr2; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756905934; x=1788441934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LahPxxsFg6l59qbeOzrTE1d/6xGMndEUs1/iv+M2mpA=;
  b=Fppeuxr25Ur/Z86f2B3WugWG/a9vqhM6uvfRHXNCVETvWuj2c1PrxP/X
   FhRQZNigdx/JacuH5W0C1ScU2k7yDDjUwATX49Xv1S+kA8xT+GuDhqaMW
   h5iiHc3Vfwna6EmsDZ3UZQKUuGD+A0nZGi+j+bEZ8mnbcyga/New4VrPd
   yVqtFBY9xQ8yrerEfzXkl/RJ/37NNucRVBT0VCQJeImoveyiw7HIE8Znw
   Y87BM+BsLOMkUe/FbnijKWIgZx9ETFZV2K8HMMlriPqtkTv9ZtQx3nqyQ
   wwu6H7LOeiCE/kGnVDythBzTV4tMw66Vxx3n2stJ8V5eGgGsidkPGi/Oo
   g==;
X-CSE-ConnectionGUID: TJoSgmhTRq2o2hIPytUdiA==
X-CSE-MsgGUID: hsJDom0/TQ2YMiF43BhqsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="70647392"
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="70647392"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 06:25:33 -0700
X-CSE-ConnectionGUID: Ma4BX8/rSESlgghxFULMkw==
X-CSE-MsgGUID: QBju9m/qQcWUy7qJM1NEGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="195226899"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.22])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 06:25:20 -0700
Date: Wed, 3 Sep 2025 15:25:12 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
	Andi Shyti <andi.shyti@kernel.org>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Arec Kao <arec.kao@intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Bjorn Andersson <andersson@kernel.org>, 
	Bryan O'Donoghue <bod@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Scally <djrscally@gmail.com>, devicetree@vger.kernel.org, 
	Dongcheng Yan <dongcheng.yan@intel.com>, Dongchun Zhu <dongchun.zhu@mediatek.com>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, imx@lists.linux.dev, Jacopo Mondi <jacopo@jmondi.org>, 
	Jason Chen <jason.z.chen@intel.com>, Jimmy Su <jimmy.su@intel.com>, 
	Jingjing Xiong <jingjing.xiong@intel.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Leon Luo <leonl@leopardimaging.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mark Brown <broonie@kernel.org>, Matthew Majewski <mattwmajewski@gmail.com>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Pavel Machek <pavel@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Shunqian Zheng <zhengsq@rock-chips.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Tarang Raval <tarang.raval@siliconsignals.io>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Todor Tomov <todor.too@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Tony Lindgren <tony@atomide.com>, Zhi Mao <zhi.mao@mediatek.com>
Subject: Re: [PATCH v2 00/72] media: i2c: Reduce cargo-cult
Message-ID: <64alk4uwvdw6cejheukim7pfz7pabccuaqxlerr7mul6mqi5lf@feuimtlm4vxe>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>

Hello Laurent,

Thank you for the patches!

On Wed, Aug 13, 2025 at 12:45:08AM +0300, Laurent Pinchart wrote:

[..]

> Laurent Pinchart (72):
>   dt-bindings: media: Deprecate clock-frequency property for camera
>     sensors
>   dt-bindings: media: et8ek8: Deprecate clock-frequency property
>   dt-bindings: media: imx258: Make clocks property required
>   dt-bindings: media: imx274: Make clocks property required
>   media: i2c: mt9v022: Drop unused mt9v022.h header
>   media: i2c: mt9v032: Replace client->dev usage
>   media: i2c: mt9v032: Drop support for platform data
>   media: i2c: mt9v111: Do not set clock rate manually
>   media: i2c: ov6650: Drop unused driver
>   media: i2c: hi556: Replace client->dev usage
>   media: i2c: hi556: Use V4L2 sensor clock helper
>   media: i2c: hi847: Replace client->dev usage
>   media: i2c: hi847: Use V4L2 sensor clock helper
>   media: i2c: imx208: Replace client->dev usage
>   media: i2c: imx208: Use V4L2 sensor clock helper
>   media: i2c: imx319: Replace client->dev usage
>   media: i2c: imx319: Use V4L2 sensor clock helper
>   media: i2c: imx355: Replace client->dev usage
>   media: i2c: imx335: Use V4L2 sensor clock helper
>   media: i2c: og01a1b: Replace client->dev usage
>   media: i2c: og01a1b: Use V4L2 sensor clock helper
>   media: i2c: ov02c10: Replace client->dev usage
>   media: i2c: ov02c10: Use V4L2 sensor clock helper
>   media: i2c: ov02e10: Replace client->dev usage
>   media: i2c: ov02e10: Use V4L2 sensor clock helper
>   media: i2c: ov08d10: Replace client->dev usage
>   media: i2c: ov08d10: Use V4L2 sensor clock helper
>   media: i2c: ov08x40: Replace client->dev usage
>   media: i2c: ov08x40: Use V4L2 sensor clock helper
>   media: i2c: ov13858: Replace client->dev usage
>   media: i2c: ov13858: Use V4L2 sensor clock helper
>   media: i2c: ov13b10: Replace client->dev usage
>   media: i2c: ov13b10: Use V4L2 sensor clock helper
>   media: i2c: ov2740: Replace client->dev usage
>   media: i2c: ov2740: Use V4L2 sensor clock helper
>   media: i2c: ov4689: Use V4L2 sensor clock helper
>   media: i2c: ov5670: Replace client->dev usage
>   media: i2c: ov5670: Use V4L2 sensor clock helper
>   media: i2c: ov5675: Replace client->dev usage
>   media: i2c: ov5675: Use V4L2 sensor clock helper
>   media: i2c: ov5693: Use V4L2 sensor clock helper
>   media: i2c: ov7251: Use V4L2 sensor clock helper
>   media: i2c: ov9734: Replace client->dev usage
>   media: i2c: ov9734: Use V4L2 sensor clock helper
>   media: v4l2-common: Add legacy camera sensor clock helper
>   media: i2c: et8ek8: Drop support for per-mode external clock frequency
>   media: i2c: et8ek8: Use V4L2 legacy sensor clock helper
>   media: i2c: gc05a2: Use V4L2 legacy sensor clock helper
>   media: i2c: gc08a3: Use V4L2 legacy sensor clock helper
>   media: i2c: imx258: Replace client->dev usage
>   media: i2c: imx258: Use V4L2 legacy sensor clock helper
>   media: i2c: imx290: Use V4L2 legacy sensor clock helper
>   media: i2c: ov02a10: Replace client->dev usage
>   media: i2c: ov02a10: Use V4L2 legacy sensor clock helper
>   media: i2c: ov2685: Use V4L2 legacy sensor clock helper
>   media: i2c: ov5645: Use V4L2 legacy sensor clock helper
>   media: i2c: ov5695: Use V4L2 legacy sensor clock helper
>   media: i2c: ov8856: Replace client->dev usage
>   media: i2c: ov8856: Use V4L2 legacy sensor clock helper
>   media: i2c: s5c73m3: Use V4L2 legacy sensor clock helper
>   media: i2c: s5k5baf: Use V4L2 legacy sensor clock helper
>   media: i2c: s5k6a3: Use V4L2 legacy sensor clock helper
>   ARM: dts: samsung: exynos4210-i9100: Replace clock-frequency in camera
>     sensor node
>   ARM: dts: samsung: exynos4412-midas: Replace clock-frequency in camera
>     sensor node
>   ARM: dts: ti: omap3-n950: Replace clock-frequency in camera sensor
>     node
>   ARM: dts: ti: omap3-n9: Replace clock-frequency in camera sensor node
>   ARM: dts: ti: omap3-n900: Replace clock-frequency in camera sensor
>     node
>   ARM: dts: nxp: imx6qdl-pico: Replace clock-frequency in camera sensor
>     node
>   ARM: dts: nxp: imx6qdl-wandboard: Replace clock-frequency in camera
>     sensor node
>   arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Replace
>     clock-frequency in camera sensor node
>   arm64: dts: renesas: aistarvision-mipi-adapter-2.1: Drop
>     clock-frequency from camera sensor node
>   arm64: dts: renesas: rzg2l-smarc: Drop clock-frequency from camera
>     sensor node

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards
Mehdi Djait

