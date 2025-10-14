Return-Path: <linux-i2c+bounces-13478-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 150BFBD91F8
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 13:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FC3718A53BB
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 11:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192A13101CE;
	Tue, 14 Oct 2025 11:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lHlc4Mk/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF723101B6
	for <linux-i2c@vger.kernel.org>; Tue, 14 Oct 2025 11:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760442758; cv=none; b=aQ8DzSNvgzJtlNCI4/V7RA40CP2yrNJsbbLNp3Pxs5j6IjMoeKXGwE3A3WRY4Yo9ja+PV3ItLJKIkX/RKGCgEZood3MvFOZE/Ygi/NsMpK9sutaMv8fHzk04nVyYXqEKetb83Ezl1aeerVSYTKANU6t0O0GzdZmEXcxVwIoIQMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760442758; c=relaxed/simple;
	bh=x1brUYGY3NW2WQ2EAUXI9/nXmf4kZlLdpbpO/yh7tw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oAiafymS3x3La5jECFzz9szU/7fT+fpLf9u6QKDzv+VzFWlrCwDpUeL97AbSlz9X9V879Sex4MrFC7uUfQMp6cQKaCA4saK+yTcKsUOhOssRR/TpyspRH3tA5UCXVgTpwsuw3B0T7tNv/AFn+x8/3ubb2XaSRTxU5SicnH/x7qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lHlc4Mk/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=vZpO
	rc8jIqdudWaU55WhDn+MoeYiJWe7gJ48hDY+d1M=; b=lHlc4Mk/T4KsX8seSNJQ
	vvL90nUOyuUxzJ/sq5J3piw1hVW61or4bFrdau3nnoyj3BFHrxN3871raQO/I1my
	Bz2hxNc6FqCtd7PgKMnKFKb4zz5l0ZkRZrRwumRqR9BKuI1SJ2ADJNcz2IFKsFdU
	7nuBCXwtqXb1hDr3WwWQTUQ9u509yeoTAuKhGd6ojJX525GWTZA+l2Y1cCCedxki
	RoGYmMz1ynzbjCONDddHsTpxmDfBZnv+OBHrb9nSx93bzg7mxVHuiXUmbzunV9v2
	qfLQ147EJ76zXvWtGcSHT5C/ArHdi6hIp1iJlb+s0EIXecC51hGviWUiT95BVFMO
	+g==
Received: (qmail 2951131 invoked from network); 14 Oct 2025 13:52:28 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Oct 2025 13:52:28 +0200
X-UD-Smtp-Session: l3s3148p1@0cGqBB1B1OIgAwDPXwQHAL/S9V79e5yL
Date: Tue, 14 Oct 2025 13:52:28 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Michal Simek <michal.simek@amd.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Jean Delvare <jdelvare@suse.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Ajay Gupta <ajayg@nvidia.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Vignesh R <vigneshr@ti.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 23/80] i2c: Remove redundant pm_runtime_mark_last_busy()
 calls
Message-ID: <aO45fBIEqFyRq3_k@shikoro>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075415.3218608-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704075415.3218608-1-sakari.ailus@linux.intel.com>

On Fri, Jul 04, 2025 at 10:54:15AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Andi Shyti <andi.shyti@kernel.org>

With the dependencies being upstream now, applied to for-current,
thanks!


