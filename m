Return-Path: <linux-i2c+bounces-12480-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 580A2B3A10E
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 16:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8B87466D93
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 14:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E08934DCDF;
	Thu, 28 Aug 2025 14:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="szKX1qxx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MrwCmOM2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8977B34572E;
	Thu, 28 Aug 2025 14:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389765; cv=none; b=kT2XIEO8B7/5gOvb51vCnVvuzGYOuzicexnHVtC0/5qz+JQ4CV6KMRBWMtVzP6Kq+psUlA2OukEoWqaQNMXR03pYdP/C5QIplzj3PsFYGoBO9RQtD9k8NTxX7czGX+7JBQUi2Fn8kz7B9f9TsDbXPrctFaqCilZ50Ik4i7AjGaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389765; c=relaxed/simple;
	bh=XExasvnZCa3lFPti+xqXVJeWRFBKJYtzynW+b1NYbpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RN8N9dNY5t3fYTk4uUCFzOwdce3x5+NanGr1NfZguXr1p6tiCBITjYJM425r6PYgBqZYWHE1ovgfFLHijlHanJQ1jB4FLdTPzh16035XApoEg0dUaJYPGbeKctbCzi4FYu4WVtqL8DtssjDGXIvgmOh8Cynj6h5i1a2UDvsXweY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=szKX1qxx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MrwCmOM2; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id CEBA81380DDE;
	Thu, 28 Aug 2025 10:02:42 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 28 Aug 2025 10:02:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1756389762;
	 x=1756396962; bh=XPKN2AhbPWJ6u+69uufLpsAZ4EFrmOAjn6EhxFa0aJI=; b=
	szKX1qxxYi8rnbaH5n2OqBStxIoLar8z1f7A2ojF7e4GSVIE01NUoqJroFofA1jp
	N+RiJvqpP7klvW9mYrsEgebwuiAEYCDVNs3vdRMeezvk++bI9BqBXkerNjpzAtv0
	H0l6K6Abk9xNdmc5mQUdxka0HGu5JynHb9qGT3Yao6sCU4orbvttav4/swjFwkiH
	vh54XFFHcInTm+glSAauR1Rd5DY8qBDqitajdLKXuVXYX4qDxZSPfTrI9xUFTCPk
	gbY34EInr8x99Q2pr1zcMd4xfV2XwDIjmPakAz4PU/jh/dlpx2lZSfWwW7+mjdge
	aIpeXs4uqZaxkI/LZsHr8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389762; x=
	1756396962; bh=XPKN2AhbPWJ6u+69uufLpsAZ4EFrmOAjn6EhxFa0aJI=; b=M
	rwCmOM2gTwSNNBNI5Pb672d6W90ThQJkFvhpx0zrhG5cGkZKDc+Qb6RL6d6+3X6j
	xX2rugjuOeO2dYoa21MLy2tG33KbhDFJ7ZJ0fDmMAGhMJFh76OO+w6xQ+q+yizbV
	19JPFPI4CWPjuRiamJWdaNgNgqKjXAtdCfnsB2KArvR0wQyMMAjvcD56Mpvo3wQG
	8RVT86jcSvtMq0rduGRsM7IbClra8LMeGKxw024AnbD81Q+QrDZIyhHBF4LK9p7P
	s0ajVgIldhujizQzWFTku7uJolB3unEFLF2jtBwpJ9yNEsFXeD6x+moDBEQG3ohV
	qSBZisSVqJpVQhxeXXAyg==
X-ME-Sender: <xms:gmGwaFW-wxhCwng1lvmyk6A3pT6dhAngYIN3gHZAQ5r9UxjgaGBmDQ>
    <xme:gmGwaNBL2MePem_vz2Wu8tZWyq2aB51lAId-KIqrceHlp8maUIlymkJDveshuw6kX
    rz1-Kq7Wfs06L1VwYE>
X-ME-Received: <xmr:gmGwaKUzvACPnJNAI2AROeqB6V6mm7k0qiRlu8zaGPeX2JFrJs3R5ScwDvBtTasfJBUNnj0OCH56-Uo56eF78bS0xp3_DndpOGxINQ>
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
X-ME-Proxy: <xmx:gmGwaDS2l4XcFY1k0orbxbbCaQEgI5jC8ZXEzkpR3LAwtNjSDjqALw>
    <xmx:gmGwaO2-lT6N6b6MNN4YSnW-g4Q3fLNCWg3yZX3pHl1mZydyZEYMBA>
    <xmx:gmGwaH5UAxy_2E2e1LkFPjD91FHSDYbx_NglYIB6V1xgrVNEkA23EA>
    <xmx:gmGwaLKg58g75BSDa74ZQThl3oCWZ4ZwYqeHCRmUAK_aN35iI9OAvQ>
    <xmx:gmGwaFBmEocC3BkeVZmKmv8FFpxSeUFxbcKTYxUGH40BFbdbgkrs9m0S>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:02:41 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:41 +0200
Subject: [PATCH 22/37] dt-bindings: spmi: apple,spmi: Add t6020-spmi
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-22-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=XExasvnZCa3lFPti+xqXVJeWRFBKJYtzynW+b1NYbpM=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNiVbRU1nb5Cz1zU4JJ33yD9c3fdd3Ksl+dfgXGdVvr
 r/+1nZ1lLIwiHExyIopsiRpv+xgWF2jGFP7IAxmDisTyBAGLk4BmIh2JMN/36tHKnPTGGR43/9b
 F3L/vcPv4lJZgaplG2ey2yz6s79OjeGv8Of5kjLvLFsXnCpP155zu7t/VUVaiEhAgpzszOcf/C7
 xAgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,spmi" anymore [1]. Use
"apple,t8103-spmi" as base compatible as it is the SoC the driver and
bindings were written for.

The SPMI controller on Apple M2 Pro/Max/Ultra is compatible to
"apple,t8103-spmi" so add its per-SoC compatible with the former as
fallback used by the existing driver.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index 16bd7eb2b7af2c0b176f0e5b1970f4670af691da..dbf09ad0ecdecab82074344aa6a840a820bc448a 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -16,12 +16,17 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - apple,t8103-spmi
-          - apple,t6000-spmi
-          - apple,t8112-spmi
-      - const: apple,spmi
+    oneOf:
+      - items:
+          - const: apple,t6020-spmi
+          - const: apple,t8103-spmi
+      - items:
+          - enum:
+              # Do not add additional SoC to this list.
+              - apple,t8103-spmi
+              - apple,t6000-spmi
+              - apple,t8112-spmi
+          - const: apple,spmi
 
   reg:
     maxItems: 1

-- 
2.51.0


