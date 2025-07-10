Return-Path: <linux-i2c+bounces-11906-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94421B00D62
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 22:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58C613BDC29
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 20:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160392FD59F;
	Thu, 10 Jul 2025 20:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6fyEEN4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B003728C5D7;
	Thu, 10 Jul 2025 20:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752180594; cv=none; b=UZwyqbfmL+gy1wcHAlYxPnllWm+ZOl8JHX7La8oMonQh/fKxEi/aEhoJYSLdgJBOa//6FP9ZOnZouMZFUAGJ4/k1gMCqu3rR58I4gZEsPSslPemunAN/qS6+FYkiFdPINGq1/N9txCAz6RPCalgs5scaEtDn8EXctIE4u4H1c+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752180594; c=relaxed/simple;
	bh=R7alaaCPHt1AUC5EDQMaWx/LazeRtOK9h/LtGYLubzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWhSvfjZe2LrvpM3In6r2w5oMcKpJPPuwcAeOuouTN58eTMwDIVvjDz3Nlctgctj9gWARXzyCtVDHbSs51F25Zu1SqnyXzNQaD7yPhuh3MqPkEVIi0ODkwQBbl5WHjB64QQImJMHStm416QGv3Xr5pi0R3+NCPnl4xITfd9n9Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6fyEEN4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2068FC4CEF4;
	Thu, 10 Jul 2025 20:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752180594;
	bh=R7alaaCPHt1AUC5EDQMaWx/LazeRtOK9h/LtGYLubzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h6fyEEN4OVF3X4z4T6olPNkDshuKXL14P1ZPQgpydfMFcwR9gfB/GOgMD4XCHMsaT
	 imvTz7KUSeoR1/jaC3kgG9uR9g+XUykWN4fqfF0+nqa4G5qvdeRbBc9MnFG6JPwpxC
	 ox4Ky8S7mPhrBIne33gDYoUD0T/ERZI7PD7fw9WWgjzVEj37q6CWRlQMB9b2NLWezl
	 pJUcn55+qsWr3Y3mSb6HfxYvVxDKlTeiX2xva/VTcEnydxdor+JtVDcKnaLMw8YBlC
	 yvnIRSbvTfsVnfz3DHpgDKlZWNaOUzIt2YJhwLMQOWTEF/SJIDs2dY6X2jqzlqJK3p
	 Bvxnwb3KGLDBg==
Date: Thu, 10 Jul 2025 22:49:49 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Elie Morisse <syniurge@gmail.com>, 
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Michal Simek <michal.simek@amd.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, Jean Delvare <jdelvare@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, Ajay Gupta <ajayg@nvidia.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Vignesh R <vigneshr@ti.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, 
	Viken Dadhaniya <quic_vdadhani@quicinc.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 23/80] i2c: Remove redundant pm_runtime_mark_last_busy()
 calls
Message-ID: <sj24iciugqjrof6672tvlnxjfvgperdliftfa47cquyfe6g22c@s5e7twdtjhsj>
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

Hi Sakari,

On Fri, Jul 04, 2025 at 10:54:15AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

