Return-Path: <linux-i2c+bounces-12553-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC775B3F750
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 10:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EA8F1A82B54
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 08:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4872E88BD;
	Tue,  2 Sep 2025 07:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vJG3GOiE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF38A2E7F2C;
	Tue,  2 Sep 2025 07:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756799975; cv=none; b=dvbNhLG6MKEOUB6WPEVvyl8iFpyXFMT/z44fp9eUw1xkrXhaM7zjF8EwKnfIA+p8ofGu3qkXzyx/ykCJRtq6+brQYGVu+YDUkSVtP8szz/wl5FbzgH1ob1hys9jbQGNd6G8QuEUzJ8Ydt4J3R1mEpnL3QoL4Qhe5g8zEuqMy0Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756799975; c=relaxed/simple;
	bh=EF1op+eddct4pM3ZB2o0aAETXERusr9OmQud0x6jKd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8jLBox9bL4chOKTNuHuU+CinIqWf9lzULjF9kKODd++fra3MRP9euRLNDM+m/PIWA9lPmWosgZISR3szSkwRPhodmCu2QKxUR41Ckf/WU1oG26uyfL4AzlHVl/u04uppJqvtKRIuIF9HToc7+5bMMg/2thvkrz6id+TpTnKDow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vJG3GOiE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B101FC4CEF5;
	Tue,  2 Sep 2025 07:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756799974;
	bh=EF1op+eddct4pM3ZB2o0aAETXERusr9OmQud0x6jKd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vJG3GOiE51Copquw/et4yKR2MBNqyeTR1IAPc0P1wxza24c8Bq4Zc/8Q7eKkeJOJ8
	 pYWFTt1JmIPWALpvCaXjNsP99j/f0dLV/DYLcnsQ3vBiopJOhJLZBr6W/QP40TczLY
	 s4mj9mZjOSnLBdFU1bnx5nhOyDJcF93bwPlgmYGWl3pCuhraZsFOltCb77vP8GOf5t
	 12ryEquytxYXA5Le3xuYe8epm+vJQDqaCgoRv6HGXdjCf7BWZqERl7WQ97+WKzu8y8
	 +FrcNp9sY8CK3kbN/yxn0KKBCpQodqKbLOJCPqhdlq76MB+N2NhN1BGCu2b3GIzIWi
	 ewGqlCi6YaApQ==
Date: Tue, 2 Sep 2025 09:59:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, 
	van Spriel <arend@broadcom.com>, Lee Jones <lee@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Michael Turquette <mturquette@baylibre.com>, Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-bluetooth@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-clk@vger.kernel.org, dmaengine@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH 01/37] dt-bindings: arm: apple: Add t6020x compatibles
Message-ID: <20250902-optimal-copperhead-of-chemistry-ebd7fa@kuoka>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
 <20250828-dt-apple-t6020-v1-1-507ba4c4b98e@jannau.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828-dt-apple-t6020-v1-1-507ba4c4b98e@jannau.net>

On Thu, Aug 28, 2025 at 04:01:20PM +0200, Janne Grunau wrote:
> This adds the following apple,t6020/t6021/t6022 platforms:

"Add..."


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


