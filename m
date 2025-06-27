Return-Path: <linux-i2c+bounces-11656-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A037AEB558
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 12:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 688DE567368
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 10:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECAE29ACCC;
	Fri, 27 Jun 2025 10:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jjT5UI7V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AB1298CB1;
	Fri, 27 Jun 2025 10:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751021376; cv=none; b=R6NWo0LtJW4Esp5aegnmQXlG6pBEzOif+2xDDHPLIs+U39RnNGe6z2EhgLObp2HrJhBTpaxz/2D5fkUpKvW75NFxjn7WYqFTXSrgbjPNbFwH0HB7KYo0PX0Dm6jcQFyFhJiYxE0OXp4nUitj/dQBKH/R7BLPCj/iXRrFQ0P2FSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751021376; c=relaxed/simple;
	bh=OrBU5eBwBcoKQHllVdPOQ7ABzGCI1+juFwHu/MwINgI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BlJqKqHb6QdLMTvpsluWF0H4u3L95Qld6Js6MMdfEfg/dtw0M8DyrTaVfeH3p3xcF6DLJQNjEsSIv2OtHsIKOuKE5RERKIM+K5X27jp0Yve6k/JDcf4fHmoqDOa8OO8nl7IsfAgr7t1m5fO3x5q+wjfmURUsx5rciYn6IWcDNTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jjT5UI7V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E951C4CEE3;
	Fri, 27 Jun 2025 10:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751021375;
	bh=OrBU5eBwBcoKQHllVdPOQ7ABzGCI1+juFwHu/MwINgI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jjT5UI7V0MN8cv7Kxou/19uR4bMLbukpmBDE6+Hvnj7C6DXS6KP8eb87VWD61mA/Y
	 uF5D5Ct5K/Z/Mrf7cosGn/ZaRH55vKh9pgV0l27CFC1BjAimugSNJsYHaP6HKn38mj
	 HcNcKd0L98nVNcQZyc43Vbx/6LTEUKSGNFfmkWyI3vay2c7yWc3aLakfmJD35TcU2H
	 g5ZxBVSZ6JvEKZyRuGYVVLMhPvjBDALsYaTGrxu0d478gSF10PT/3nwtqyQQTzEOYl
	 ieUPrTo4t1AujfFjdwRMS/egGfRxIozKJ30XKuvFCpr4zie36/nJDbhthJ8GcD5eN7
	 3RnEyk3A+6UBA==
From: Srinivas Kandagatla <srini@kernel.org>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
Subject: Re: (subset) [PATCH 00/11] Drop default ARCH_APPLE from Kconfig
 and use defconfig instead
Message-Id: <175102136780.6245.11489454367138517610.b4-ty@kernel.org>
Date: Fri, 27 Jun 2025 11:49:27 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 12 Jun 2025 21:11:24 +0000, Sven Peter wrote:
> When support for Apple Silicon was originally upstreamed we somehow
> started using `default ARCH_APPLE` for most drivers. arm64 defconfig
> also contains ARCH_APPLE=y such that this will turn into `default y`
> there by default which is neither what we want nor how this is usually
> done.
> Let's fix all that by dropping the default everywhere and adding the
> drivers to defconfig as modules instead of built-ins.
> None of these patches depend on each other so we can just take them all
> independently through the respective subsystem trees.
> 
> [...]

Applied, thanks!

[04/11] nvmem: apple: drop default ARCH_APPLE in Kconfig
        commit: e426953c193a2b51c8adcd3922fb8eef15790219

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


