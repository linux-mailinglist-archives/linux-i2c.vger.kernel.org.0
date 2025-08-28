Return-Path: <linux-i2c+bounces-12496-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DD5B3A337
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 17:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCD221883924
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 15:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD8531DDA6;
	Thu, 28 Aug 2025 14:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="GJDLjv0s";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ETi7pKqg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA4A31B13B;
	Thu, 28 Aug 2025 14:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756393044; cv=none; b=N8hkYBuMT/lLhB5JnZ4zf1K+loJ6wIeESCOOFEyLDD6eGfceAi+E9B8E/qVtLHSUdLTbFiGbzXy2AagTt/SgTwl8B+gvjIjrxFiAnTINDlHA67OCzy0Smx5kSx6JWaPrUdsl2g7vsjL3Uk6R9eeug6geA43eWOPI3fcUb3kq8Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756393044; c=relaxed/simple;
	bh=l7yL19aCh35taWDFH83CvyK57t6q3LJgsAEFMdKfBGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=esnqvx5zE827FOlAQSTav8Osh0LXmYo+kEX2Wkgq0Px/zK8CnHc3m8muKYG95dqQUp8rJLVfMz9w2qhx5IC2gAdi64pvCtFnFt2BnlioVXgWiEhsHRqizzr9vEbAygtfwRvn7QIDEbXLslzdMn7Z7cs8S/ZRORiPrJwCXIHZRX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=GJDLjv0s; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ETi7pKqg; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.phl.internal (Postfix) with ESMTP id 160D71380B4F;
	Thu, 28 Aug 2025 10:57:22 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 28 Aug 2025 10:57:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1756393042;
	 x=1756400242; bh=V64a73VvrKCoZvDCqGqV5W7rpDA2rSjjZ4pJF0rMEn8=; b=
	GJDLjv0snqHZCQp33LyEim27UE+YG68QgP9cZmyG90uXjzRCCfsH8F2i2F7qsUL+
	LA7GexjdWUD2v3ugHdxqQP4Lxoqlwqn4aTubpxUN+KHvuBwxeFZcAkZ2mQbHjOup
	ffUjn8rigcWZj2xyjCfDNYUSALtgu2TzC3VFLSjaguZV2AtAfWzvaPm7i+RzI+/I
	F2/fZxbskGq147LC2GXYA2t465qMPi+5ZXl00aE4GQ7ZUTi+qMEx28rVie69h4M5
	Aex2/yCeGOSDOVzq8qKVFdyXklrC71NFQBjKSzIx3Q1vYrlej+3SpxlQuukPAXvh
	Kcc+KNlIhXdSrJxswJBTvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756393042; x=
	1756400242; bh=V64a73VvrKCoZvDCqGqV5W7rpDA2rSjjZ4pJF0rMEn8=; b=E
	Ti7pKqgVIxqrugXdxQQTa+Eyw0oAt0wH5LzoJp+jBYwMjKA76F3Yaw/dmLRZarM9
	uVUtNd3jfNAduCfqZWt/nzViJ4HlddF79mXWh2XTkVZf5t6ej9c4AMPUMKj59yRS
	MooLT9dRPTqpGqXOcWs51jgRj1u/Dhjaf55SLh3zQoUAk/2OybghENGSAUJ1cJIw
	1TKnQAG8jyoka8PE2FKjV6mYU1MofZauBwuHIoVJU54OJF2His4fmZEjrUdnaj4C
	ZvnmA1WMFuOPvS8fsVGT/vJgThEUtwQzfzkcRFWCXPweHXq1V7wBBwCvrC0MA4mS
	e8VKPOBclDP/Vg5muWKew==
X-ME-Sender: <xms:UW6waK9egwF-PHQS4q33WmNUJ22fKbVVd0b-czvpz5DXFr0q5RrZSw>
    <xme:UW6waJiWGwnK9Ws1bk5jehHdHNDiYvcffskGuU1nDgjC8x3QYQTXkGCUdn32UJf9x
    Ne2yNr720NOeDTNd8w>
X-ME-Received: <xmr:UW6waKspH7sZGKtVXiybMtv50dJcLXxTKK1BzGpxpR-LydaoJ0NnnhwFKPAcyi7LEA8y9nAncge_QMr0Xe_98f7S47VZ9ofu_AnZRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukedufeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopeeigedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhihshhsrgesrh
    hoshgvnhiifigvihhgrdhiohdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdp
    rhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkod
    gutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehmrghrtggrnhesmhgrrhgtrghnrdhsthdprhgtphhtth
    hopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhirhgvshhhrdhk
    uhhmrghrsehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:UW6waJjSsl7mlU6gVMdUICY_oaFEBZ_OnrJRLbY5o3N_hlS1GXTwhA>
    <xmx:UW6waE1WtFNbZRVx6MLIvqy4UILkDFqABKMw53mm6uFIRXUL8fYJDQ>
    <xmx:UW6waNVfubNi8mMPF4DPWOoq0D3SFqKuiPVaUXoW1o1_rOdkUCreTQ>
    <xmx:UW6waHCvTyfQ4TdxmaTRvbaeu4jvwtwJAPvz1y21055UQslQDLhtKA>
    <xmx:Um6waOgkPi77vIRnIPi4-Rakm1JTi-aGn3Z0GOY96MbASIsorhCS8JVZ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:57:20 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:52:14 +0200
Subject: [PATCH 36/37] arm64: dts: apple: Add J474s, J475c and J475d device
 trees
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-36-bb8e1b87edef@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7317; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=l7yL19aCh35taWDFH83CvyK57t6q3LJgsAEFMdKfBGw=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNuQxXXoSeZ7yawRQ4953rh6B1TTqpiy1D1B8fN5hye
 Y+XKdOMjlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABM5H8zIMEfQxLpx6ZnzLEts
 333LaFr96HBU6PRKVxedXLO8T6viIxkZZmfd3P1EYe32Y2aM0yZMYO+/sNZ1ZVv3G97gk22qbja
 WjAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Add device trees for the M2 Pro Mac mini and the M2 Max and Ultra
Mac Studio. These devices are very similar to the M1 Max and Ultra
Mac Studio so reuse the device template, include the .dtsi for the new
SocS and correct for the minimal differences.

Co-developed-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/Makefile             |  3 ++
 arch/arm64/boot/dts/apple/t6020-j474s.dts      | 47 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t6021-j475c.dts      | 37 ++++++++++++++++++++
 arch/arm64/boot/dts/apple/t6022-j475d.dts      | 42 +++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi     | 38 +++++++++++++++++++++
 arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi | 38 +++++++++++++++++++++
 6 files changed, 205 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
index e97a6676387c6e4cbaf3b0834c4e59338d08d1b8..21c4e02a4429fa1db506dd85637a44000073590e 100644
--- a/arch/arm64/boot/dts/apple/Makefile
+++ b/arch/arm64/boot/dts/apple/Makefile
@@ -83,6 +83,9 @@ dtb-$(CONFIG_ARCH_APPLE) += t6020-j414s.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t6021-j414c.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t6020-j416s.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t6021-j416c.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t6020-j474s.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t6021-j475c.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t6022-j475d.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8112-j413.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8112-j415.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8112-j473.dtb
diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
new file mode 100644
index 0000000000000000000000000000000000000000..7c7ad5b8ad189e5d04d03189a07c82426185dd7d
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Mac mini (M2 Pro, 2023)
+ *
+ * target-type: J474s
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+/dts-v1/;
+
+#include "t6020.dtsi"
+
+/*
+ * This model is very similar to M1 and M2 Mac Studio models so base it on those
+ * and remove the missing SDHCI controller.
+ */
+
+#include "t602x-j474-j475.dtsi"
+
+/ {
+	compatible = "apple,j474s", "apple,t6020", "apple,arm-platform";
+	model = "Apple Mac mini (M2 Pro, 2023)";
+};
+
+/* PCIe devices */
+&wifi0 {
+	compatible = "pci14e4,4434";
+	brcm,board-type = "apple,tasmania";
+};
+
+&bluetooth0 {
+	compatible = "pci14e4,5f72";
+	brcm,board-type = "apple,tasmania";
+};
+
+/*
+ * port01 is unused, remove the PCIe sdhci0 node from t600x-j375.dtsi and adjust
+ * the iommu-map.
+ */
+/delete-node/ &sdhci0;
+
+&pcie0 {
+	iommu-map = <0x100 &pcie0_dart_0 1 1>,
+			<0x200 &pcie0_dart_2 1 1>,
+			<0x300 &pcie0_dart_3 1 1>;
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
new file mode 100644
index 0000000000000000000000000000000000000000..533e3577487469e868c05976013f0d89ff3faea0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Mac Studio (M2 Max, 2023)
+ *
+ * target-type: J475c
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+/dts-v1/;
+
+#include "t6021.dtsi"
+#include "t602x-j474-j475.dtsi"
+
+/ {
+	compatible = "apple,j475c", "apple,t6021", "apple,arm-platform";
+	model = "Apple Mac Studio (M2 Max, 2023)";
+};
+
+&wifi0 {
+	compatible = "pci14e4,4434";
+	brcm,board-type = "apple,canary";
+};
+
+&bluetooth0 {
+	compatible = "pci14e4,5f72";
+	brcm,board-type = "apple,canary";
+};
+
+/* enable PCIe port01 with SDHCI */
+&port01 {
+	status = "okay";
+};
+
+&pcie0_dart_1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
new file mode 100644
index 0000000000000000000000000000000000000000..736594544f79b5e45f6ea0c98e6c71d948ef7a43
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Mac Studio (M2 Ultra, 2023)
+ *
+ * target-type: J475d
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+/dts-v1/;
+
+#include "t6022.dtsi"
+#include "t602x-j474-j475.dtsi"
+#include "t6022-jxxxd.dtsi"
+
+/ {
+	compatible = "apple,j475d", "apple,t6022", "apple,arm-platform";
+	model = "Apple Mac Studio (M2 Ultra, 2023)";
+};
+
+&framebuffer0 {
+	power-domains = <&ps_dispext0_cpu0_die1>, <&ps_dptx_phy_ps_die1>;
+};
+
+/* enable PCIe port01 with SDHCI */
+&port01 {
+	status = "okay";
+};
+
+&pcie0_dart_1 {
+	status = "okay";
+};
+
+&wifi0 {
+	compatible = "pci14e4,4434";
+	brcm,board-type = "apple,canary";
+};
+
+&bluetooth0 {
+	compatible = "pci14e4,5f72";
+	brcm,board-type = "apple,canary";
+};
diff --git a/arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi b/arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..4f7bf2ebfe397dbde6451672d74ef76fe782bcd0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Mac Pro (M2 Ultra, 2023) and Mac Studio (M2 Ultra, 2023)
+ *
+ * This file contains the parts common to J180 and J475 devices with t6022.
+ *
+ * target-type: J180d / J475d
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+/* delete power-domains for missing disp0 / disp0_die1 */
+/delete-node/ &ps_disp0_cpu0;
+/delete-node/ &ps_disp0_fe;
+
+/delete-node/ &ps_disp0_cpu0_die1;
+/delete-node/ &ps_disp0_fe_die1;
+
+/* USB Type C */
+&i2c0 {
+	/* front-right */
+	hpm4: usb-pd@39 {
+		compatible = "apple,cd321x";
+		reg = <0x39>;
+		interrupt-parent = <&pinctrl_ap>;
+		interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "irq";
+	};
+
+	/* front-left */
+	hpm5: usb-pd@3a {
+		compatible = "apple,cd321x";
+		reg = <0x3a>;
+		interrupt-parent = <&pinctrl_ap>;
+		interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "irq";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..ee12fea5b12cb37f95d9cb531c9065403665e8ca
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Mac mini (M2 Pro, 2023) and Mac Studio (2023)
+ *
+ * This file contains the parts common to J474 and J475 devices with t6020,
+ * t6021 and t6022.
+ *
+ * target-type: J474s / J475c / J475d
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+/*
+ * These models are very similar to the previous generation Mac Studio, other
+ * than GPIO indices.
+ */
+
+#include "t600x-j375.dtsi"
+
+&framebuffer0 {
+	power-domains = <&ps_dispext0_cpu0>, <&ps_dptx_phy_ps>;
+};
+
+&hpm0 {
+	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&hpm1 {
+	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&hpm2 {
+	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&hpm3  {
+	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
+};

-- 
2.51.0


