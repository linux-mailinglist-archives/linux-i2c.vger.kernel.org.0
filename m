Return-Path: <linux-i2c+bounces-12554-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DBCB3F760
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 10:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B44F8207BDE
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Sep 2025 08:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E6B2E889C;
	Tue,  2 Sep 2025 08:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBASvnqp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB672E0B77;
	Tue,  2 Sep 2025 08:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756800047; cv=none; b=fLKnLNow0mBpUVVtK/A+VxI2pOd9gDW+zAJwZjX65Q/YCY3YzDwa8kdLn/UyX1cq9LUAOsMV2pxSU5BhcOzcQZne5d52aPwFLAseX5jy9zEkDgoJnUIa7+pvYRpWj7BWTtcBcKcj+cdf15QTBt5X5TOxrk2bPsPpFWyeyJGQPiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756800047; c=relaxed/simple;
	bh=XlVsb0W3gvnjnn4kOm0HH95XP5h++83OeqUtirs+pRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fs712x4B1eC1hy6/jap91JiIHTUaFZZbdHsynELVZX38TuMMsaqX7RYRopj5CmUbnpQxqpScJfZpM4XBCKgqmcJOmqrdHkT7SElTzz7t6t6IMaxoeGzb/OiTijZApryR7iUl2Vy8knWIg3AUfQf4Z1hZ9rz/OJ9FxasoWVdsCUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBASvnqp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F7AC4CEED;
	Tue,  2 Sep 2025 08:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756800047;
	bh=XlVsb0W3gvnjnn4kOm0HH95XP5h++83OeqUtirs+pRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HBASvnqpvbq6OOzulRPWaHHEQaAIa/2/uu+zbCRwmuIliU6WKxKIvK8kOp/CQTQHb
	 BIzkYZeaT1Trt+xO9apuCJ5q0vK7nkFdtijGZIwOnYPAbs9PbgEVQiYaSIS6zn9HvH
	 5ZFEXTcD5tmVDPhPY9rwGKOKKAKks+tA+VpuWCap6z0CV0QmpCZltNT71tun9A/MbV
	 5WZwgoxhJzIFjVFY88pxITO4WNkHsKrYu4FiZeoe+isUrfIdxa+9gx5b+JSRI5wfDT
	 t7ZHF/6wz4f5MYnmQZtcpXmWseqmrNF2SG5K4ZZWx+a3rXQzHbRyCkl9ItnKqkG375
	 qRva0wy1l5/7g==
Date: Tue, 2 Sep 2025 10:00:44 +0200
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
Subject: Re: [PATCH 02/37] dt-bindings: arm: apple: apple,pmgr: Add
 t6020-pmgr compatible
Message-ID: <20250902-falcon-of-awesome-wholeness-b3cbde@kuoka>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
 <20250828-dt-apple-t6020-v1-2-507ba4c4b98e@jannau.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828-dt-apple-t6020-v1-2-507ba4c4b98e@jannau.net>

On Thu, Aug 28, 2025 at 04:01:21PM +0200, Janne Grunau wrote:
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,pmgr" anymore [1]. Use
> "apple,t8103-pmgr" as base compatible as it is the SoC the bindings were
> written for.
> 
> The block on Apple M2 Pro/Max/Ultra SoCs is compatible with
> "apple,t8103-pmgr" so use it as fallback compatible and add t6020 as
> per-SoC compatible.
> 
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/
> 
> Signed-off-by: Janne Grunau <j@jannau.net>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


