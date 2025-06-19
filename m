Return-Path: <linux-i2c+bounces-11533-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2DFAE0E3B
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 21:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 017C63B198F
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 19:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52662246792;
	Thu, 19 Jun 2025 19:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+LvtMM2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D272B30E826;
	Thu, 19 Jun 2025 19:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750362673; cv=none; b=LHJHkh03P54ONnwZLIVP0m5VeqA23pUckW9wTRL0/B5+7gyppDJlvHFlAQsRxl6EVPT+Cjr9dru3WsbHzH5HFQ/Iynj9McKr/hQ3cFZxUH5xAp8Vij//r4nGgMkr1PL/sirrbz2HZ2Y78mLaDbSL66FqPKLNwuu1f/b2S7ySSow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750362673; c=relaxed/simple;
	bh=anb81OEG4hgZhk30oTpxHvHdm1Zaf844E/3J8ziG24M=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=rBszlvuSlp3JuBQiIpraRhsY2x/8cbVjkhqB+2dGNNiIDtn8oeyfm5LjY4Zy746VclcBtU+KoSnDpsppvz15LJ+HhacDALZEOEIvKEF5eBrFUz3W91NMDVrQ+E9wkeEcpkIqsRe52F7DiXwvCnuQne9fq+9MNJ1xadb6IOaSNY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+LvtMM2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA69C4CEEA;
	Thu, 19 Jun 2025 19:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750362672;
	bh=anb81OEG4hgZhk30oTpxHvHdm1Zaf844E/3J8ziG24M=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=K+LvtMM2sTUk0ihGb949GgfIiwtJROqxy/0GvXgajl3JH2BYSrI125gfojR4BeQty
	 TSYaMsKuj7A9dAq8Px2oWBMpuPTs+iVCQgSILCBtHoUUhUTaIK3xukTT3mPJurGD9L
	 63W2AWBlQMNZjQ1BVF/VbGHlDlj/kBg9X3/a9HyKRckncEqm+XIVff0w7fN1T+xUEN
	 WZZjvSIMYUPb+Fdq4Z6BbNfSYQHx16TkVrNsIyKiKvv+UlUoLvcD1wAgpJhHCaenzf
	 stjgnTopwpI8eEVKLVQJEsalaRJNfAoEfklsG9EqdfaAc7LCfg9hyHOrayO+bARk5U
	 nIaA4oxs78Mzw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-3-0e6f9cb512c1@kernel.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org> <20250612-apple-kconfig-defconfig-v1-3-0e6f9cb512c1@kernel.org>
Subject: Re: [PATCH 03/11] clk: apple-nco: Drop default ARCH_APPLE in Kconfig
From: Stephen Boyd <sboyd@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, linux-input@vger.kernel.org, dmaengine@vger.kernel.org, linux-sound@vger.kernel.org, Sven Peter <sven@kernel.org>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andi Shyti <andi.shyti@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Janne Grunau <j@jannau.net>, Jaroslav Kysela <perex@perex.cz>, Joerg Roedel <joro@8bytes.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Martin =?utf-8?q?Povi=C5=A1er?= <povik+lin@cutebit.org>, Michael Turquette <mturquette@baylibre.com>, Neal Gompa <neal@gompa.dev>, Rafael J. Wysocki <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Srinivas Kandagatla <srini@kernel.org>, Sven Peter <sven@kernel.org>, Takashi Iwai <tiwai@suse.com>, Ulf Hansson <ulf.hansson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Will Deacon <will@kernel.org>
Date: Thu, 19 Jun 2025 12:51:11 -0700
Message-ID: <175036267134.4372.17303378707831060122@lazor>
User-Agent: alot/0.11

Quoting Sven Peter (2025-06-12 14:11:27)
> When the first driver for Apple Silicon was upstreamed we accidentally
> included `default ARCH_APPLE` in its Kconfig which then spread to almost
> every subsequent driver. As soon as ARCH_APPLE is set to y this will
> pull in many drivers as built-ins which is not what we want.
> Thus, drop `default ARCH_APPLE` from Kconfig.
>=20
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---

Applied to clk-next

