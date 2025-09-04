Return-Path: <linux-i2c+bounces-12671-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82669B449F9
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 00:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DA883BF805
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 22:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2492F546C;
	Thu,  4 Sep 2025 22:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="roBVwgBQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADCD2F069E;
	Thu,  4 Sep 2025 22:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757026344; cv=none; b=HwnpQdFMa6uwdnByciT+z5gj5LRtMI29EK+I4Co0bymv6byeg24B7SrraC92Od8vitgVNpZK0nH7wxvrPK9Pt0DrBCMqG6PubtatQFr7nwZ0nrUfYmGu1XKtqytCWorz4zdLUmPGu4ab3VxeDdHhMEjNDTLyfe7dDveTyJxuRq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757026344; c=relaxed/simple;
	bh=2MViS1nqSpyNjI/P7K/k2Spz+R3IZ3I4vxgoMymb5Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifBDuZ7HlphKbl5jCsc8FsUSMkx8CAk/E3X2KkU4Y3Vcsl2TWBQIG26gKvd0wz11CLF2tWlM/0+D0pA3qBgqONiSTf4z/0KiHxX2URaEyGUYelac4kp2lBsXZdLVkBys/L7FsYM0rJ8QWk7xbQJlvcJqxFRbXwsqQhs/3wkUnlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=roBVwgBQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DDFC4CEF0;
	Thu,  4 Sep 2025 22:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757026343;
	bh=2MViS1nqSpyNjI/P7K/k2Spz+R3IZ3I4vxgoMymb5Uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=roBVwgBQdHjRYDAC6Yyl8gcjTa1sebepK19RtdZM5Kr+BJYNj5zWJeB02etY8KIyI
	 b+RcIMOwSoGmpxXqnXcfjEYxksz+RXpt+pf2VjEB1VgJcIRHBceav+UIWYbNx2fE3K
	 7+WEHceX9Cz41lRwl8VloRIumOdI4m0IKDa6VphbPJDeULrt3x0bJuAUukQ6/WKuL0
	 REQt3WpNlSm3UUve2h7bV157b/yJ+NQBKzl9CGFniIjjyb7AShIWGiI11Zck6rcSys
	 VyQI9wmTi+B2BLN4VmdvCQSrI8EEXTLBevvUrwyGOOOrG/WVf+G3vDakrZ7qQCvomP
	 m3ZuahDyWvLeg==
Date: Fri, 5 Sep 2025 00:52:20 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Kettenis <kettenis@openbsd.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>, Lee Jones <lee@kernel.org>, 
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
Subject: Re: [PATCH 10/37] dt-bindings: i2c: apple,i2c: Add apple,t6020-i2c
 compatible
Message-ID: <f5o23zrqe2ei3bmwlxokhtkgfpeki6ctoq3ahd4f66utfu5hdk@6q55hvy4hvq4>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
 <20250828-dt-apple-t6020-v1-10-507ba4c4b98e@jannau.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-dt-apple-t6020-v1-10-507ba4c4b98e@jannau.net>

Hi Janne,

On Thu, Aug 28, 2025 at 04:01:29PM +0200, Janne Grunau wrote:
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,i2c" anymore [1]. Use
> "apple,t8103-i2c" as fallback compatible as it is the SoC the driver
> and bindings were written for.
> 
> This block is compatible with t8103, so just add the new per-SoC
> compatible using apple,t8103-i2c as base.
> 
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/
> 
> Signed-off-by: Janne Grunau <j@jannau.net>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Andi

> ---
>  .../devicetree/bindings/i2c/apple,i2c.yaml         | 27 +++++++++++++---------
>  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> index fed3e1b8c43f67b8f5a19e5c1e046b0e17ab8017..500a965bdb7a84e4997b52e8c19dcc1a7ee0cff7 100644
> --- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> @@ -20,17 +20,22 @@ allOf:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - apple,s5l8960x-i2c
> -          - apple,t7000-i2c
> -          - apple,s8000-i2c
> -          - apple,t8010-i2c
> -          - apple,t8015-i2c
> -          - apple,t8103-i2c
> -          - apple,t8112-i2c
> -          - apple,t6000-i2c
> -      - const: apple,i2c
> +    oneOf:
> +      - items:
> +          - const: apple,t6020-i2c
> +          - const: apple,t8103-i2c
> +      - items:
> +          - enum:
> +              # Do not add additional SoC to this list.
> +              - apple,s5l8960x-i2c
> +              - apple,t7000-i2c
> +              - apple,s8000-i2c
> +              - apple,t8010-i2c
> +              - apple,t8015-i2c
> +              - apple,t8103-i2c
> +              - apple,t8112-i2c
> +              - apple,t6000-i2c
> +          - const: apple,i2c
>  
>    reg:
>      maxItems: 1
> 
> -- 
> 2.51.0
> 

