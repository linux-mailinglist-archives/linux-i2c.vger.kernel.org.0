Return-Path: <linux-i2c+bounces-12492-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B5FB3A2F7
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 16:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA0CF1C84C6B
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 14:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D1C314A69;
	Thu, 28 Aug 2025 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="nm7vaZY4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GBpgFmzA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E4E30F523;
	Thu, 28 Aug 2025 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756392981; cv=none; b=gj+TGZn8sQS5rR3oDPb6ITVVUmK3pSWDq9kdI3tT0eSM1OO8XkRWNSRWPQ+YY/LdAKBdUzlsp2iN4oAWSe+dxzcArd/Ihze2lLbhm2UJOykiApSb72nfQXE8RcU4ZSiohT8PqN9smGlS2/SnUh804WmYJavxsLwRGMamATqnYVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756392981; c=relaxed/simple;
	bh=aOIdfL2KtNDKig2eMgY1l3lILPVxi94X3F987b0LLkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AocOaxUwkSz577L/c3S0r7+BjCTfufIgdeQBedWZAsslB0VJ4NLaIYMl3VOsqW7pYA0azyGK1090JEPDAiS3bCStdQ5uhw/Lx7XK9qDloyda1i5e4P9Oq6m1VdMQvPo/0WckQe1dv1vb8LF7ZG4dzyUoaPljMsK+hZ11VmHMjzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=nm7vaZY4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GBpgFmzA; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.phl.internal (Postfix) with ESMTP id B42641380B20;
	Thu, 28 Aug 2025 10:56:18 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 28 Aug 2025 10:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1756392978;
	 x=1756400178; bh=u5CVr2NcgT7xckzOKjHg0EURu0XTcpDJoOgyGA0GsFU=; b=
	nm7vaZY4PVQjfjVcBpS00VpUSSBfZUHuJHtJ746cLg2eGdCeNTmkpygLoADAsjBL
	3AHYxHKX+oq5ty/eFvLXhYzebb4uOGACJXjhWiqN+J7BXbNqp7qvohYs7YS76suH
	/kGgvPLv7WOt6V5W7sYktBIQBESpNajFIjjVXPRUAY5G8WL82GELquGpI+2GNXl4
	j6vQi3txO5krXRafC43qi5vdQ48v+rCvOoAKeIIECAeUMtQJsXK0xbLidbaBEc4u
	6XVy/QSOAQ1r7aibCMRvJPp80zdN8wzWERlB1aGCtv1QVmm7aIS90FmzuWiM23Lo
	qVvlYg1p8SQ4R9uWahHEQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756392978; x=
	1756400178; bh=u5CVr2NcgT7xckzOKjHg0EURu0XTcpDJoOgyGA0GsFU=; b=G
	BpgFmzAc5fwbmcLXMlaX0ht6dlVM1NYgJQ6xA7DGM0oiGW+5fi5ltZsBvAM/9FH6
	xPZg4zZeqHWdBstM6vn8nFETgIh17JFwpNVmFASxVyrUlFg8Lu8wGaRCSHD1M8On
	q9dBorqHki/4sZ0mpGbQVf+o6CBoidJKHvo3jQucBaMwacL45f4lCCsQKrY+JQVd
	nZLVUvs/eu/wI0nSiZDoS+SMKSJbR6gAp6ttI3vok43MHRMn8P3gGRo26RC1qXLI
	2RZTjat9fJEikfaNTQe9MY0+WrRTOy8QnNfRjijW62n89C6ZgNIg5L5EMjSqtKUc
	cezyBc9I1Kz+meGq6gczQ==
X-ME-Sender: <xms:EW6waLLVP5vZahn4uDiqaS462SY7nnEhlim5IG25eOYKVGUX-33BTA>
    <xme:EW6waL1jNz0JngMBQRXdBHapXwc2MmzPKRhHRvrJm6IkhWczoXv3MqFEB8S4plc7A
    fc9SA1PbZt8-vH5h5I>
X-ME-Received: <xmr:EW6waEK4x6uYGcTroYP_a1M7KqPpvK8bUOk4UPNeEB4jD34XWLueydrTiGpHg52K2FaPuoFwxlrjcWbsbocyO1jaJQy83jvmtNlnzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukedufeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepve
    ekkefgjeettdduueejgeeuteduffefteejudegieevuedvieffteeljeelgfeknecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohep
    ieegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiifvghighdrihhopdhrtghp
    thhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtoheprhhosghhsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrh
    gtrghnsehmrghrtggrnhdrshhtpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehvihhrvghshhdrkhhumhgrrheslhhinhgrrhhordhorhhg
X-ME-Proxy: <xmx:EW6waK_bqBAEMJwvnPliPaOa3iwodF-2r1QbRbAr8_gCYmBBzCWfJA>
    <xmx:EW6waI82BMpBF-cXaAbuBJKfQjUFZwxPk0meaIjh7UcazTISYQv2uA>
    <xmx:EW6waKI4kCFkBiUJqmSaCDnVsTYbnj3pmqKFb564WKqVGebLyxyyKw>
    <xmx:EW6waO0DhF7YvAXJuC7mtx3izlnPlfgPMksI48JtMCi7v126hxDW-Q>
    <xmx:Em6waFf5dL3e_8jaZLa0xaHsdkTcrslRBCA6eRxrNq-MFCtgQQco17gQ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:56:16 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:52:10 +0200
Subject: [PATCH 32/37] spi: dt-bindings: apple,spi: Add t6020-spi
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-32-bb8e1b87edef@jannau.net>
References: <20250828-dt-apple-t6020-v1-0-bb8e1b87edef@jannau.net>
In-Reply-To: <20250828-dt-apple-t6020-v1-0-bb8e1b87edef@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1554; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=aOIdfL2KtNDKig2eMgY1l3lILPVxi94X3F987b0LLkk=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNOf9fd7552xPWmj8heOp217w3a3vqLJ4/nWupO3vlW
 qbIw0f0OkpZGMS4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAExkaTQjw/Gwar45/24/OWWr
 PHXD4rcrt0sm98a2CTxUDZvY+6xdcAXD/+Lt/44f/bppTub7eQZ6k5p7be1vyHyLi94ZOMNGau/
 SK/wA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,spi" anymore [1]. Use
"apple,t8103-spi" as base compatible as it is the SoC the driver and
bindings were written for.

The SPI controller on Apple M2 Pro/Max/Ultra SoCs is compatible with
"apple,t8103-spi" so add its per-SoC compatible with the former as
fallback used by the existing driver.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/spi/apple,spi.yaml | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/apple,spi.yaml b/Documentation/devicetree/bindings/spi/apple,spi.yaml
index 7bef605a296353a62252282af4ba45a71b20b7b6..9356b9c337c8cfabe56944da25915391a9c31cee 100644
--- a/Documentation/devicetree/bindings/spi/apple,spi.yaml
+++ b/Documentation/devicetree/bindings/spi/apple,spi.yaml
@@ -14,12 +14,16 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - apple,t8103-spi
-          - apple,t8112-spi
-          - apple,t6000-spi
-      - const: apple,spi
+    oneOf:
+      - items:
+          - const: apple,t6020-spi
+          - const: apple,t8103-spi
+      - items:
+          - enum:
+              - apple,t8103-spi
+              - apple,t8112-spi
+              - apple,t6000-spi
+          - const: apple,spi
 
   reg:
     maxItems: 1

-- 
2.51.0


