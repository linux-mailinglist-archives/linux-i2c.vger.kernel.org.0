Return-Path: <linux-i2c+bounces-11405-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1047CAD844D
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 09:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A1923A922F
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 07:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A80E2E6D3F;
	Fri, 13 Jun 2025 07:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="B67nTcCn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="obGdjANf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2C02D6636;
	Fri, 13 Jun 2025 07:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749800103; cv=none; b=gM8r+dj81dzDwcOCpkJIUYJWl78JDcaxuqhCURjdTGbN9W5ro9tBe9zV9WmVVjy1SjlHagOcBIVDzejxxKvJHuLChRZwC5ThT4IG1tSIwBM7SX+Nv96l7fmhYQMsy5CkMXLUdhW60BxmjBJxl24vw3mC9wOLU2e+VyG1W+KkHC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749800103; c=relaxed/simple;
	bh=fQ+Zm3/XGK+10ZRvK+XFYpZHWx6PqU9jm94xEvpjMQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MSiQ08osfeOh+qYDxXcAZAtiSQBc+BeUBSmSYbl+MripyxteYMu4tGRFs0UuKgM/Q4bLBC/0PHMqFly9zoo+2hJU+GmMt2n7CbQNG0+ZMnFdtf0RO+RgoxQjm9N27zYLIYUOv+ECdWgQ8xGijOIR9b2eD8KEjxK5tPI8Ob7dcJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=B67nTcCn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=obGdjANf; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 78C582540150;
	Fri, 13 Jun 2025 03:34:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 13 Jun 2025 03:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1749800099; x=1749886499; bh=heYYdoDlXF
	OciX8bAT8IXpBAQStR+kpfE0iWQ6XRFa8=; b=B67nTcCnNzwgqqw5e9km6I+xvo
	aP4x12BY0eqNXQd/5WAzuvx3iqVg+FZbcVKP5FKPEGSxxMuGAH3L/rfj418xIg70
	/PvX1cbyeDwUVpAcivjtmOGjtx3ml0nmwCKa17nScrb2s5Q527q2h1/y4XBROHia
	8nvdqwn17kBjrn8qoIQKRvcai0qtqKY6UiU2s0gziN05KRSAFQ4f9o6h6pNVDNwf
	xVf1VeIBpzeymw1P0k9OGmTImtr8zQJULdyC5yrqJcK6g4oaNCLeMYXfXeMRE0RW
	RFEC3RnE8yyU3OKG/xjyzlzvwyXSaM02E/VbYozacysEWXVmlLCujDx88tdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749800099; x=1749886499; bh=heYYdoDlXFOciX8bAT8IXpBAQStR+kpfE0i
	WQ6XRFa8=; b=obGdjANf3TY83z9E4pcTsihvUy/NhNuL3IyPMSupSohNWxVy02l
	DIhu0O7mPdBhG6LALj7QpvkuBLRqxCqUTe/FY4Lgl4LKVkszfBgYA8yw0VMo+P2L
	IwQnsy9s2JORNu4cgB5/Ez7MBDt83hyhqL/wYquBx1at4LCZ2I+NQNwPDOr9FMkE
	AyQ0zW/vRNT1xbbp1Z9aPEaYPnF9b5y3tP9zv1nlBYffAsC0pAWd1uHkLY0OEjuz
	9fsO6TrlrTHGWtQ2xMgouIieOSKT87OUFxo4gbsF49Z8qiAQCflR1cgxccfM+ex0
	aWWyY/hUGVsazvF765v54qnsr8ZcE2eWA8w==
X-ME-Sender: <xms:odRLaLh6zoBCwTVNx3mvfgXtLKR5nE8PQpNCvoZQTZ4Yl_CbLvnwdw>
    <xme:odRLaICswVPjz4ogeEyOqVrKMv3h2K0ju_EfqS7zm4Gl6Uf-UjFh8gN6posrOHBmL
    iOC5OcwHsAR-lM2c_8>
X-ME-Received: <xmr:odRLaLHK0aeEIyi6snr3y6ADuhS7i5ZXVIhpnmTkXcZQGxVBcNZK22osXdbJ_qmFKeLZKXiAXT60ogZi27I6ELmpNqrr_diVC9k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeefiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdej
    necuhfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqne
    cuggftrfgrthhtvghrnhepgfdvffevleegudejfeefheehkeehleehfefgjefffeetudeg
    tefhuedufeehfeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopeefuddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhiohdprhgtphhtthhopehnvggr
    lhesghhomhhprgdruggvvhdprhgtphhtthhopehulhhfrdhhrghnshhsohhnsehlihhnrg
    hrohdrohhrghdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgt
    ohhmpdhrtghpthhtohepshgsohihugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsh
    hrihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughirdhshhihthhisehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:odRLaIS_fY6doz4TXul-16ldYhjIlpniGV2a8g4n6ltibGDTV-_mOQ>
    <xmx:odRLaIznjucvvyZgRzf35RgUzJyDfO3OetS3EdETiVvnX76AZ8CLtw>
    <xmx:odRLaO761ll-OM5SIk4RJpRBEoWwgMAB-KKWrDFl6U7GyN_JjqAY0g>
    <xmx:odRLaNw8AJBTxtqIaToqpW5WlxojAdlTnU6UprMcyicXZwTH4PyLwQ>
    <xmx:o9RLaB0Xg6U_mH9QzF5X9ggXCjEz7dkLBSNqyZGrq3Q-npIGYGL9kSgl>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 03:34:57 -0400 (EDT)
Date: Fri, 13 Jun 2025 09:34:55 +0200
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,	Srinivas Kandagatla <srini@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,	Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>,	Robin Murphy <robin.murphy@arm.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,	Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,
 Arnd Bergmann <arnd@arndb.de>,	asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,	linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,	linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org,	iommu@lists.linux.dev,
 linux-input@vger.kernel.org,	dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/11] Drop default ARCH_APPLE from Kconfig and use
 defconfig instead
Message-ID: <20250613073455.GF3141695@robin.jannau.net>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>

Hej,

On Thu, Jun 12, 2025 at 09:11:24PM +0000, Sven Peter wrote:
> 
> When support for Apple Silicon was originally upstreamed we somehow
> started using `default ARCH_APPLE` for most drivers. arm64 defconfig
> also contains ARCH_APPLE=y such that this will turn into `default y`
> there by default which is neither what we want nor how this is usually
> done.

It's not such an uncommon pattern. `git grep 'default ARCH_' --
'*Kconfig'` has over 250 matches (not counting ARCH_APPLE) and from a
cursory look not all CONFIG_* look essential for booting.
I agree that the drivers covered here should not be built-in by default.
An alternative would be using `default m if ARCH_APPLE` instead but that
pattern is not common in the kernel. So just moving this to defconfig is
fine by me.

> Let's fix all that by dropping the default everywhere and adding the
> drivers to defconfig as modules instead of built-ins.
> None of these patches depend on each other so we can just take them all
> independently through the respective subsystem trees.
> 
> Best,
> 
> Sven
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
> Sven Peter (11):
>       pmdomain: apple: Drop default ARCH_APPLE in Kconfig
>       soc: apple: Drop default ARCH_APPLE in Kconfig
>       clk: apple-nco: Drop default ARCH_APPLE in Kconfig
>       nvmem: apple: drop default ARCH_APPLE in Kconfig
>       i2c: apple: Drop default ARCH_APPLE in Kconfig
>       cpufreq: apple: drop default ARCH_APPLE in Kconfig
>       iommu/apple-dart: Drop default ARCH_APPLE in Kconfig
>       Input: apple_z2: Drop default ARCH_APPLE in Kconfig
>       dmaengine: apple-admac: Drop default ARCH_APPLE in Kconfig
>       ASoC: apple: mca: Drop default ARCH_APPLE in Kconfig
>       arm64: defconfig: Enable Apple Silicon drivers
> 
>  arch/arm64/configs/defconfig      | 19 +++++++++++++++++++
>  drivers/clk/Kconfig               |  1 -
>  drivers/cpufreq/Kconfig.arm       |  1 -
>  drivers/dma/Kconfig               |  1 -
>  drivers/i2c/busses/Kconfig        |  1 -
>  drivers/input/touchscreen/Kconfig |  1 -
>  drivers/iommu/Kconfig             |  1 -
>  drivers/nvmem/Kconfig             |  1 -
>  drivers/pmdomain/apple/Kconfig    |  1 -
>  drivers/soc/apple/Kconfig         |  3 ---
>  sound/soc/apple/Kconfig           |  1 -
>  11 files changed, 19 insertions(+), 12 deletions(-)

whole series

Reviewed-by: Janne Grunau <j@jannau.net>

