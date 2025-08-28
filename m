Return-Path: <linux-i2c+bounces-12479-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C77B3A0FB
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 16:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59230567950
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 14:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C6B3451BC;
	Thu, 28 Aug 2025 14:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="SuGn7NYh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FfuwlVmy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936AB3148B6;
	Thu, 28 Aug 2025 14:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389762; cv=none; b=N/Z3Q8sRqoPmkQY9MzWVhJOTBPvn4azD+hVF+kdryeU219Bp27VTNy1UK/Kx2Tqohg0/Fa7wSY7/d9eleTY0f1meRDrmcD2O85gyJjV+vsDsV364okfKbXZGrhCJAD9GKfTCxNSrauqin+SjSUhMCWGeMiSXbxEXoIVCPK3kP5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389762; c=relaxed/simple;
	bh=aO8Zd5On2fiIPyEmnZb81gCm0UyoBHSPiEjjfuybQOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FCMhMbmGBw3Vva5JLHzVakF0kZLJhhfZvTXftGyWQfQGF7DzXp/WfukoYXaM/FWDpA7M2bmlCBUrIujhsYHCqrxta+oUhLwB2jGqpMxBFebSWREFg5B1d5uJB4gxHFLK0MU4rugG+NS6QQEGBB3WHAzHjf11p6cryqR6exxmBSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=SuGn7NYh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FfuwlVmy; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id F01151380DDA;
	Thu, 28 Aug 2025 10:02:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Thu, 28 Aug 2025 10:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1756389759;
	 x=1756396959; bh=h9kk3UQVuhe0QchQqhupjbVTv41iYj+XrqLiQ4MV5FM=; b=
	SuGn7NYhMvuuPzbvlj812BjSauShq7hSEREWCgyEXuHhsc44VEAGWsMB86ks2Ll4
	ipw1ni6qKuE1e0iytRFrxpt6MPtKlrZr8K/ah/CU4PWpLBHQQnLpVA0PFYgzOkjC
	7d/whfZ6MHYbTg+AArLkK68xgrT4eN7Vs4/PhzxpyDPSpb1+cGa9MJwCLywWJJY+
	oglCV3icbifv3Mj45IYL0tVeKBtXcjhwFVKwz4gausZ2FZ7PKqJhRsEEne3Ntv5l
	7Ol7rnoFXtLpI7GppBcZZEpDp14FCYjYkStaMAK2g8197g1g9EPM1SO+R3IeXj/E
	KX83vlgvo6/H0gXlakoj2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389759; x=
	1756396959; bh=h9kk3UQVuhe0QchQqhupjbVTv41iYj+XrqLiQ4MV5FM=; b=F
	fuwlVmy0Hza7tm25HTMHuj9L44BVjxlNDlAChnS+qfxRZ8pFdjdLmm3Wa3AdL7i4
	Q7n+2L9Jn0AS8e7Pa2J9gjxtzMuGNDIxRpH33C/IuSVhkWuqYfkW2DqaDoX+E3En
	S15VOZWkfaSkqWo1YGgge0qvFXq1G9A0w4rsPUzvfKRl8nPVdzr2SJ5i3aSCVdz8
	g+7RyNtGTWuMP+i7hl3Xz+JDtN/+W89bf63BQb7OrLafwNa5o/9qZx3js+5QGRP0
	QKcBNJDJMNSNjlTveMfwd8gNIRjtMmK9g+JImlnbJ5P3mIvrw1vjn+r90U/cqafB
	WjJFIBbpueCVtu94aGkRg==
X-ME-Sender: <xms:f2GwaEuodKJ0pr-YQgIKgs54JEVwG71m7fj1Ts9djZTSdWFawjg5QA>
    <xme:f2GwaAQWynsuHAkMyEjug9BEqW94gvCUD6VU2o0sVAP6hraeh-6UohOWwHKiEarIM
    SmNw0GD1hv0NUqtHzQ>
X-ME-Received: <xmr:f2GwaKdydnV6X9cQWfTFCoVyIypqoOqE6S2pukKktUmep1hCsbiGIdoJbR9JdZPNgSBuIlSh02gH2qQasYETCUnHgfZLaKzjsRGvSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeduvdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepve
    ekkefgjeettdduueejgeeuteduffefteejudegieevuedvieffteeljeelgfeknecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohep
    ieegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhgphhiohesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhhrghnnhgvshesshhiphhs
    ohhluhhtihhonhhsrdhnvghtpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipd
    hrtghpthhtohepvhhkohhulheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqfigrthgthhguohhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkh
    gvthhtvghnihhssehophgvnhgsshgurdhorhhgpdhrtghpthhtohepkhgsuhhstghhsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehsrghgihesghhrihhmsggvrhhgrdhmvgdprh
    gtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:f2GwaORNv_H_9jU0Bpg2yzdbwiwMg6QNm99vW4yv35SCbV1vmLNzhg>
    <xmx:f2GwaKkd27iTLPU25YCtVC4LqzOKZuzTxW9HtW26JRsg3MtNm8MzUQ>
    <xmx:f2GwaAHqKC1FouaOqxgVybVnmqKZHWp_xFLZp1nCMHQpZd2BQDSarw>
    <xmx:f2GwaCwMgZoR5tkEACBabuSZTmaGlJYmrChJUoSgndV9OGveYHxigg>
    <xmx:f2GwaLn8DXk6GBmYMuQcN8bbjTC2M9RnAtjGPs1apY0aS4tXL1kW82zo>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:02:38 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:40 +0200
Subject: [PATCH 21/37] spmi: apple: Add "apple,t8103-spmi" compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-21-507ba4c4b98e@jannau.net>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
In-Reply-To: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
  Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
  "Rafael J. Wysocki" <rafael@kernel.org>,
  Viresh Kumar <viresh.kumar@linaro.org>,
  Thomas Gleixner <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>,
  Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
  Linus Walleij <linus.walleij@linaro.org>,
  Mark Kettenis <kettenis@openbsd.org>,
 Andi Shyti <andi.shyti@kernel.org>,
  Jassi Brar <jassisinghbrar@gmail.com>,
  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
  David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
  Sasha Finkelstein <fnkl.kernel@gmail.com>,
  Marcel Holtmann <marcel@holtmann.org>,
  Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
  Johannes Berg <johannes@sipsolutions.net>,
 van Spriel <arend@broadcom.com>,  Lee Jones <lee@kernel.org>,
  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
  Stephen Boyd <sboyd@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
  Guenter Roeck <linux@roeck-us.net>,
  Michael Turquette <mturquette@baylibre.com>,
  =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
  Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
  Ulf Hansson <ulf.hansson@linaro.org>, Keith Busch <kbusch@kernel.org>,
  Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
  Sagi Grimberg <sagi@grimberg.me>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-nvme@lists.infradead.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=985; i=j@jannau.net; s=yk2024;
 h=from:subject:message-id; bh=aO8Zd5On2fiIPyEmnZb81gCm0UyoBHSPiEjjfuybQOs=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNiVabjIIL/9jxcsUoGk8+PUvQeG28jf8Ebf4cac03N
 baONUs6SlkYxLgYZMUUWZK0X3YwrK5RjKl9EAYzh5UJZAgDF6cATITzISPD6ecTp5syCbYa35WM
 OmbvVrXbgOOwivDhTxrL/3ceqBHrYfhf7zHn/8LFXS137SW9mvdrKP57d20r0/nZ8YfCrgveT97
 NBAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,spmi" anymore [1]. Use
"apple,t8103-spmi" as base compatible as it is the SoC the driver and
bindings were written for.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/spmi/spmi-apple-controller.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 697b3e8bb023566f17911fc222666d84f5e14c91..87e3ee9d4f2aa5517808827f5dd365055c08446a 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -149,6 +149,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id apple_spmi_match_table[] = {
+	{ .compatible = "apple,t8103-spmi", },
 	{ .compatible = "apple,spmi", },
 	{}
 };

-- 
2.51.0


