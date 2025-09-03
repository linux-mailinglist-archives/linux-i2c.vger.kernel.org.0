Return-Path: <linux-i2c+bounces-12585-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D33B421D1
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 15:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FA221730C2
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 13:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752F73090D7;
	Wed,  3 Sep 2025 13:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqEESknj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7071F4701;
	Wed,  3 Sep 2025 13:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906408; cv=none; b=DtDC744BbIvRDlpI82zSS4r5EGDY4qsRzy93HanBXWG6Wx8xCSLuHpCxCbwQgNvaddWtFmbTmjAw18OinaUuh3A7U25/CFPfmztP29N7yN0CG5WeHk+/fKv9AEVaqY+8GPSJcTNkgkxYIKBwXKmq6+bpOlIPCJ/PGDL04xDs4M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906408; c=relaxed/simple;
	bh=APA+IKhQAivDdhc8vaL3FsIWLj0FCAXAMDhHWsCuKXQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d8KTlxDE06rlcFqYjfah5n86MVNiBodWTFZxPn+mDftPeX46W6QL3rAoVtmCI9J6XfGnRuFwdEh59qrIg1gdUmanWxr3kvEm/KS9W+ID6RSOu3deVvINK/WhXQQQ6Z4h2qB92pqLvtc6VFIpilpxy8NvMxDKIqHoQenXSn4d9TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqEESknj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5133DC4CEF0;
	Wed,  3 Sep 2025 13:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756906407;
	bh=APA+IKhQAivDdhc8vaL3FsIWLj0FCAXAMDhHWsCuKXQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nqEESknjcE7bjyogwRRHk5Ac1+O6YIAgKS9ID41Agw+gj1ML6szAioiAxoEwVPU1l
	 Rs4O3IWVEyPaLUfn3ucjNCBdEM0jZ7qVEQOqFRZgHMl73bkop1oNdOjcBypQy/KDmY
	 +yYrKUeVnGvPHEmSDq3dlNGyxs3TiB55gqVP0Mkh3wHUhGzZrb8jzq1r/kzrzrgaSe
	 Sx8RFcBj5RwoYNnz8acrzmuqdg8YFFUkSOr1mbHeeboFs0QxqjRfdAq0hN2uLw03U3
	 gSabtOra4+cRiKIRuFdWa7WbmJf9NW9/jT2Hdq21Hbk8moSetyHxC9xSA2qgIufyi6
	 n4Ha+QYUx/PNg==
From: Lee Jones <lee@kernel.org>
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>, 
 Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Michael Turquette <mturquette@baylibre.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Keith Busch <kbusch@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-nvme@lists.infradead.org
In-Reply-To: <20250828-dt-apple-t6020-v1-18-507ba4c4b98e@jannau.net>
References: <20250828-dt-apple-t6020-v1-18-507ba4c4b98e@jannau.net>
Subject: Re: (subset) [PATCH 18/37] mfd: macsmc: Add "apple,t8103-smc"
 compatible
Message-Id: <175690639604.2768491.7365862081844880171.b4-ty@kernel.org>
Date: Wed, 03 Sep 2025 14:33:16 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Thu, 28 Aug 2025 16:01:37 +0200, Janne Grunau wrote:
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,smc" anymore [1]. Use
> "apple,t8103-smc" as base compatible as it is the SoC the driver and
> bindings were written for.
> 
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/
> 
> [...]

Applied, thanks!

[18/37] mfd: macsmc: Add "apple,t8103-smc" compatible
        commit: 667ec87a2cfa50a528aaece758271794a1932141

--
Lee Jones [李琼斯]


