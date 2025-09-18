Return-Path: <linux-i2c+bounces-13056-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8F5B86B1D
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 21:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DED38B60748
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 19:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6B32D97AA;
	Thu, 18 Sep 2025 19:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlGWVZsw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE8621B9E7;
	Thu, 18 Sep 2025 19:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758223993; cv=none; b=qOD9q2ldcS0dBKvCKfAbGyrgHq9BMJQ9+SjwM05+f8DhrQCXEmCbNjIYaJP0xtUjwaD7fiSPnfYdUVZBpvrDh+UGTh4Qkc3PxBg97D7rNzcGJekrLf9a16bq4H2ix47vlhk/dvcSWhWwCCYPENCGXSJwZ7jjYwtN7XvLtZm5wWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758223993; c=relaxed/simple;
	bh=SiTsMJ0sXAvpCnRX8FDPv8MfV2YWSlcEA47DenlZULY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fGhViwm+q2NMeUEu8m7/lJLhrFTxPZKdVYccF8r4IdjBUh+DTeKFxa3tWjq6INQZSV1rJfpZkEYVG4TzvWXZWDR15GevwTUDVspB0r5gGWlUkSQ+nHJyykfswEBmUjQQkR6dm8lNsTQhH8VIV9x4HeCuGHXuh4QDdDLDKi+FwSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlGWVZsw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6849EC4CEE7;
	Thu, 18 Sep 2025 19:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758223993;
	bh=SiTsMJ0sXAvpCnRX8FDPv8MfV2YWSlcEA47DenlZULY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YlGWVZsw4RvC4JibN0EA6ibUfzsD04RlN5WeB4D1zYQJ9gFHptEmnMVPmNBfSr3bB
	 HH0XQZaLMzje1GGD7MwYt/JCmyf05k0dQ6elVo0kMqFC6RFQERQ2PASS0IlJFTGjkC
	 TM63BT3RirjMC9mwtoe83aVhq5IgPpoiCWPo3XrZAvth7Ae6b/S0KHw5UclcLM357T
	 vBP+w/K7TuYScKef3bSEN7M147yQI0P5i48fs3CaLS+hEszfe9jT4ZharfxIxLD6Rf
	 OBJrM7gKQOK0jhPAl/N8uNKTH4OqrvrxhtqD04A7yLGkDGjRLWIlXn6DNb0lwSs5lw
	 A4+l3vl0alafw==
From: Sven Peter <sven@kernel.org>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	van Spriel <arend@broadcom.com>,
	Lee Jones <lee@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Michael Turquette <mturquette@baylibre.com>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Vinod Koul <vkoul@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-bluetooth@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-nvme@lists.infradead.org
Subject: Re: (subset) [PATCH 00/37] arm64: Add initial device trees for Apple M2 Pro/Max/Ultra devices
Date: Thu, 18 Sep 2025 21:32:52 +0200
Message-Id: <175822390213.30186.12188566922096991002.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 28 Aug 2025 16:01:19 +0200, Janne Grunau wrote:
> This series adds device trees for Apple's M2 Pro, Max and Ultra based
> devices. The M2 Pro (t6020), M2 Max (t6021) and M2 Ultra (t6022) SoCs
> follow design of the t600x family so copy the structure of SoC *.dtsi
> files.
> 
> t6020 is a cut-down version of t6021, so the former just includes the
> latter and disables the missing bits.
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (apple-soc/drivers-6.18), thanks!

[03/37] pmdomain: apple: Add "apple,t8103-pmgr-pwrstate"
        https://github.com/AsahiLinux/linux/commit/442816f97a4f

Best regards,
-- 
Sven Peter <sven@kernel.org>


