Return-Path: <linux-i2c+bounces-12133-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 743B9B1952D
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 22:40:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C306C1892C39
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 20:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A950720126A;
	Sun,  3 Aug 2025 20:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KKRVs//S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805151FCF7C
	for <linux-i2c@vger.kernel.org>; Sun,  3 Aug 2025 20:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754253609; cv=none; b=LjoETSkm45oJKq/wycOt7FxEoksjHL0QUP+IvPlcDeNVIVUgFwH+3lGK5hQedc6XmrqwhvCJG0DK5ayvZPleIvXTut87Kl51y5fz5SdmR6GR6LQwz3gNXgEiCGd2r1MiID1QHoxQ4toiw9EJ5n1PCtspW/wQ8Tt9aBSlAeGynHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754253609; c=relaxed/simple;
	bh=tzLH/YUExqTegN4sI56xlZ8maB8KzJUjpOhBuVYG1JA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doVWx8iDHsNZANK2gl8wZQgrYtepHEiOz4VOO62mon2shjM4elVF159V/lOnncve6K6CiQjWmI0g+hOaUS6OLkHVtPKQiF03ALEWDyzhXrcjBnq86QzLo15czdFEGO6VlB0++UxTm1J344u5jIVGmaA7Hli5UDyRSUf3Hh9pvoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KKRVs//S; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5vm0
	SxJu7Lne/9TVu7ssZXea18OLLC2K5dYsygJBt9M=; b=KKRVs//S+sQ92DcZ4KMq
	u8nsdEZ9MfJ8tF9+2mIEnMKa16OXkFhageH6Q3dusOQHzpClzDFxFhQ6DqxKIqyK
	Uf3NBHVB0NKgalwxkup9TG+R7v+ahB5EFSvjt8WEnHBdbEx3SmTO6JltOg3rUBQV
	kx30VnagDoDnl085prpZDQkQPhnx3BeetweZr9+itITcepP1ErvhOlEutMUVlCMu
	oG5ZgggbyNfeSyrs5j7AHZYstpvrNGAfHGIR7jUIcMYCfycsPBiiImpXM45eWsM9
	un0A3l69l+xmhVFCkT05XjGxeQNA+OXeTC4vAwJOBCeZl7ifxDL/zHPzY62FsRnj
	qA==
Received: (qmail 1644961 invoked from network); 3 Aug 2025 22:40:01 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Aug 2025 22:40:01 +0200
X-UD-Smtp-Session: l3s3148p1@0xPE/ns7QIoujntd
Date: Sun, 3 Aug 2025 22:40:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev, linux-input@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 05/11] i2c: apple: Drop default ARCH_APPLE in Kconfig
Message-ID: <aI_JIZhHGg9GcD-D@shikoro>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
 <20250612-apple-kconfig-defconfig-v1-5-0e6f9cb512c1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-5-0e6f9cb512c1@kernel.org>

On Thu, Jun 12, 2025 at 09:11:29PM +0000, Sven Peter wrote:
> When the first driver for Apple Silicon was upstreamed we accidentally
> included `default ARCH_APPLE` in its Kconfig which then spread to almost
> every subsequent driver. As soon as ARCH_APPLE is set to y this will
> pull in many drivers as built-ins which is not what we want.
> Thus, drop `default ARCH_APPLE` from Kconfig.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>

Applied to for-next (for 6.17 mergewindow), thanks!


