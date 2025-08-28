Return-Path: <linux-i2c+bounces-12481-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C84B3A11E
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 16:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67E84580976
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 14:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FC835334A;
	Thu, 28 Aug 2025 14:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="gfanxDxb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VYP4sxqC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8521B345752;
	Thu, 28 Aug 2025 14:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389768; cv=none; b=MjFqK8pSu60lc6Q0q+iU7R+VKrtXad/3c5BKC4C5NH2dL0W7hXe4MKlEmJetmO7CDfGLvELjAg83bkLDc4UfGxnpTGk/vXcphVwYwZtHKanqL28d9Zve2Qh+0Sa47Ht4cgiku6/F/S305YA24HBL104k3WMU6Lectgf0wWZPjkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389768; c=relaxed/simple;
	bh=YGKS3mKYAcISaOfskU3sqPmhhvCKjQCzRxdtP/EUPQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BgXYK4nbiGNth2Cmq79czSMOcLMqPd2A63cqK0pkpdmReFgWjgdxXDhI+VJ20sQWOxt3YjrLVxe0SrNOi8b8qtZqQw7kO+coy/MKx9xl/ZEPNpNF7l4lkpijy6wb6uhGiQa+QPR+NBTq+ZMu4vlBBJKfnC1KN9FQOORMfIhkQXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=gfanxDxb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VYP4sxqC; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 97B141380DE2;
	Thu, 28 Aug 2025 10:02:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 28 Aug 2025 10:02:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1756389765;
	 x=1756396965; bh=Z6xTizaTsfsqo/Q+BqnHLLOa8m9i73v69vmCPcWcOHg=; b=
	gfanxDxbNSSSkcTbnYAh5g+KxbaeNfYi3Jf45YOxQvFAipXzk8w5FD1rL1Ou3exo
	no0F7HC+YIOQOCouEZ9ueQfBtxU0kC2lHEr0iFbWbb9jEVAjriox5q1hf8Mjky14
	a6dcCutjbIX4gxV/EmIU/DmevQowo+V0fvyLjWPR/qxB3h+EV87scGan3yFuWDhm
	j0PRqKxcTjudG3N4jusYh2EFACRxg6Z0/vALFgwPfsdZw2eMt8scDqa4TLcDoHZW
	lf1q3J/wLIT/jMV+KOlJdqO1GZIYPrazPQDSD/fIN0xe3YULIRQuPUWVbSh+RJMY
	rK0Rl7A2WI++aI0tAcYKog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389765; x=
	1756396965; bh=Z6xTizaTsfsqo/Q+BqnHLLOa8m9i73v69vmCPcWcOHg=; b=V
	YP4sxqCzKdgcpu6R35LlEX6J1mUpm+JYod8gu9W9W8jmtDaEcwbcqVkKC73So7H3
	NC8/aDHAD5DD39Pj6XJlhsCUT8sIrdRQUPxPZqANjv+Yh6JOJlaz8sjvIiovKIb4
	v/19zHIsXX+Xh3n0iiHo0OOf0LM+zSlQ+qpjSt/N5BQPeTJkLIMZa8Lqo887Ita6
	6Uzg3DP9SEHzYQEya2Kkk3MQrLtcsQ4G3dvhF2Hqsl0d7DV8r7KWvkLzjNfOuDdl
	Tz1a1J+D7S3D0dBgLxWnLiD9fEvUvJeXxcdG561owosFluXGprUBaVP7OxbsxCaV
	wmO80EFSJVZX2sHXbmXIQ==
X-ME-Sender: <xms:hGGwaBgV9PRsXn23RaJCQasQokyczLwLyRHANeLhRJm3MicyQtoSjQ>
    <xme:hGGwaE2XxyoMqymDnQjV5ORnawSVh09A7cPbJyce3rV1AGIDV27PYbyxJo_6-TrvX
    T28wMugfH1ELc0bR9s>
X-ME-Received: <xmr:hGGwaLwU2jaO7rFsjlP11hSTqVPRClY1yYdsi23z7O_0MbTMpOY5hT227WnfkQY6MyC_Nmmu8wCFMQM_wzf2Or3z5k-qhnvDiSB80A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeduvddvucetufdoteggodetrf
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
X-ME-Proxy: <xmx:hGGwaNUuJm642dubAzVbeoBpZ5yne4m8wyfmEThDgQZw6SXq5dOHoQ>
    <xmx:hGGwaEZq7Xqw7kDM_xO72DgZmvMhXdIAS49w4FfoJfsqfCiJc2yIKg>
    <xmx:hGGwaNqWhAalsWH8bYAmItm9zp4IEpel8eDQwTNSHf2F4gGRJdRtZQ>
    <xmx:hGGwaJGa4AkbyF-dpHwK6ADvpraqNzUeH0ljUcXaQqKS5o8lfDSRmg>
    <xmx:hWGwaCnpAXOD3at92TU-jGaaHs-DTJ5yyb0lbNfH-jigymArRw8iT0Ii>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:02:43 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:42 +0200
Subject: [PATCH 23/37] watchdog: apple: Add "apple,t8103-wdt" compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-23-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=YGKS3mKYAcISaOfskU3sqPmhhvCKjQCzRxdtP/EUPQs=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNiVYbBQ/1vRKK1L60aPbbkMgubr7GzfsiKiwfBPxds
 aKqKmBXRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIlEpjIyPLov6Cn4/FveKrNl
 WUwKQnc1Nt/uVIpM8I/YbZ7wz/HZXIb/YSdThHqvF8362a7x3UA2bv61A0vvqRz8HTXb+OBxGxk
 WPgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,wdt" anymore [1]. Use
"apple,t8103-wdt" as base compatible as it is the SoC the driver and
bindings were written for.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/watchdog/apple_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
index 66a158f67a712bbed394d660071e02140e66c2e5..6b9b0f9b05cedfd7fc5d0d79ba19ab356dc2a080 100644
--- a/drivers/watchdog/apple_wdt.c
+++ b/drivers/watchdog/apple_wdt.c
@@ -218,6 +218,7 @@ static int apple_wdt_suspend(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(apple_wdt_pm_ops, apple_wdt_suspend, apple_wdt_resume);
 
 static const struct of_device_id apple_wdt_of_match[] = {
+	{ .compatible = "apple,t8103-wdt" },
 	{ .compatible = "apple,wdt" },
 	{},
 };

-- 
2.51.0


