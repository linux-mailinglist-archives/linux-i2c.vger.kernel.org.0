Return-Path: <linux-i2c+bounces-12495-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48955B3A30F
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 16:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A57467B448F
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 14:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C43231AF3D;
	Thu, 28 Aug 2025 14:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="DuyrylXL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Rb2RQvP9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A13317702;
	Thu, 28 Aug 2025 14:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756393036; cv=none; b=lXuM7juZjn6RK7Kn7evFKPtvUsf56gCO4RvWwq7ZJp+pWiL/TTjmscmqtjCdvd4hsMx7ERarUUwrfSQAgRNTk0Zv5964bllUkq9z+y2wt/j3oEWaMoucQ7IvlI6b8UNsZ67QU7Nhz1zC3kPupjKkSbRw415pZpC8g60VZPOMlj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756393036; c=relaxed/simple;
	bh=tMprUG4bxO3oHtb6bnQlMB/u6EM/yGOYJVmRqOFBp8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cW9yq/B5/fIINOBFy0Tes63+/+/RxgA/lJkBmqyesWGQijV+xYKHYxIx3hPBBnI5NbzfB4VwOEwzMO7U4JXCVv3biCvYreg8Njjd4JIBsRasG8/iipX6yBh4IveGvgKYgqfvJ+X7AqT6vyHFWtQUatYiMXqhWupf3ytfd1MFNos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=DuyrylXL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Rb2RQvP9; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailflow.phl.internal (Postfix) with ESMTP id 4AA791380B4E;
	Thu, 28 Aug 2025 10:57:14 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 28 Aug 2025 10:57:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1756393034;
	 x=1756400234; bh=zEovG5yBMLpYSq+qWeGt0QGGZjC21kOTenMNhOnZThg=; b=
	DuyrylXLe9QhFBHI9BIGa+e3gvbo7MnZrjVdhKr+c3ijIvi0SgrY8JwVGTbhN7Cr
	BMttxv00HnZ7+ik9Oa7Ls23hg4FggfVy1TuD9dVeCweJX6pbGiY2ytNvXNJ6Y3Ta
	NAwRGVEshq25KKscDBOmAIT0cuHMmqBGtQ9Ilc6sS3OKm1U7C9aW0gWLECb/ClMd
	s84FGQCAEsQn27DcDt2g6EbQ1pi4uEoPpSRWvNYopMTI1+BcRopgUVLZcbOnsC6z
	rpCmdFCA/JfagiFIQQHcGsLGswtLKA0PEXe+6QRTKN/NrpKMkYZIb/8WSgpxA92w
	FzuhIeJSQ3kwttyswIiJ2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756393034; x=
	1756400234; bh=zEovG5yBMLpYSq+qWeGt0QGGZjC21kOTenMNhOnZThg=; b=R
	b2RQvP9xkSpUMgYM27Z3XrWRZCX4l5+1GQ/AbgrQvHwKFZ1c7XPEUgkgtXf9AQ02
	gJcYD/D4j/LewZY5gtNXSX1PUZNioQjyXeFjsOLgtvF6t5cn8SK15j3HeeFNHl4/
	rSmBl7wxUFA9Dk49Jb3jDkvXncedHZa9cSqixlDWmD8b42qwU02DNuxH7FGRAirx
	0GCzzs5nrg/HWByrvY+NnjFV/hXP8kgXnkflI96h2iWgfLOKTH7Nutt951cnner0
	Ql4Qh4WjgFock1sLGFzXH9Tvy0ZlwTqOduQ+e11LU91ZbPLLfFwbLsqXjAChwnZ3
	Aa2TZJrXnqfv1AaWr+OJw==
X-ME-Sender: <xms:SW6waHFvopWAMcE0W6DfeUlFik-r_4eQIMjKeA2qrm3Akhl7pHVrtQ>
    <xme:SW6waLzcmJOtAnp2sXBYhCWJ3lQGqDGrIniZKuHY91U1uulpVbWTEMciUJ9uvXx5N
    F7NBLtKsMtmQQSPKVU>
X-ME-Received: <xmr:SW6waCHwfQWj8iZNGnb8mW4aIIQOMNBCXBofz2oKHhVmn_JeYibr7bxTCBtJjlG6brqj6v2OJNA6KjkQ_n3rAr41bT1_VQEgTF5-0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukedufeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopeeigedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhihshhsrgesrh
    hoshgvnhiifigvihhgrdhiohdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdp
    rhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkod
    gutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehmrghrtggrnhesmhgrrhgtrghnrdhsthdprhgtphhtth
    hopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhirhgvshhhrdhk
    uhhmrghrsehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:SW6waABfvOVJ06FjHISZYejQtoBS2deSvc3_G6shMPMqIbXWZqOb6w>
    <xmx:SW6waMnl6KFMaXd86cN-NC_mA_Ztk0INE3GgkQZ0gyvm3naAiaxe-A>
    <xmx:SW6waCqIJLYpSXtbl2wWCcf7e2ek-UORujekCdBHTY0szoOQQUPs1w>
    <xmx:SW6waO4oBwgE444EjWWiwlhywiziIswDZoHWmgSSFS4EtJOZ7BmimA>
    <xmx:Sm6waHwrHGdZnquLhHDz0eRDYPpM4OvVXRJ8dy-tGpZqmo7mVEVuETrv>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:57:12 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:52:13 +0200
Subject: [PATCH 35/37] arm64: dts: apple: Add J414 and J416 Macbook Pro
 device trees
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-35-bb8e1b87edef@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6033; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=S07EP1T9a+F21XDmFw4P0kSjcpho1ok3SAFpALIIyfg=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNuQw7Ky5tl+c/6yp62HWa6+57wVctdVK2P1F6EbyyY
 MnV9MbTHSUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACZyoonhn9Hl5C/u20IXzlHf
 tVVXqadauGy5ZM6OuwoM+z45Hu3qbmT4MdVEY//O9/MOPpoRq3CaRWDC/wWSZVtt5HpCJW7dfdP
 BBAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

From: Hector Martin <marcan@marcan.st>

Add device trees for the T6020 and T6021 based Macbook Pros (M2 Pro/Max,
14/16-inch). The devices are very similar to the T6000/T6001 based ones
so reuse the device templates, include the new SoCs and correct for the
minimal differences.

Signed-off-by: Hector Martin <marcan@marcan.st>
Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/Makefile             |  4 +++
 arch/arm64/boot/dts/apple/t6020-j414s.dts      | 26 +++++++++++++++
 arch/arm64/boot/dts/apple/t6020-j416s.dts      | 26 +++++++++++++++
 arch/arm64/boot/dts/apple/t6021-j414c.dts      | 26 +++++++++++++++
 arch/arm64/boot/dts/apple/t6021-j416c.dts      | 26 +++++++++++++++
 arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi | 45 ++++++++++++++++++++++++++
 6 files changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
index df4ba8ef6213c9f7e4ef02a50d7250008977cc71..e97a6676387c6e4cbaf3b0834c4e59338d08d1b8 100644
--- a/arch/arm64/boot/dts/apple/Makefile
+++ b/arch/arm64/boot/dts/apple/Makefile
@@ -79,6 +79,10 @@ dtb-$(CONFIG_ARCH_APPLE) += t6000-j316s.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t6001-j316c.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t6001-j375c.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t6002-j375d.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t6020-j414s.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t6021-j414c.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t6020-j416s.dtb
+dtb-$(CONFIG_ARCH_APPLE) += t6021-j416c.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8112-j413.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8112-j415.dtb
 dtb-$(CONFIG_ARCH_APPLE) += t8112-j473.dtb
diff --git a/arch/arm64/boot/dts/apple/t6020-j414s.dts b/arch/arm64/boot/dts/apple/t6020-j414s.dts
new file mode 100644
index 0000000000000000000000000000000000000000..631c54c5f03dee9e7d37a7811f87f939e5187b10
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t6020-j414s.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * MacBook Pro (14-inch, M2 Pro, 2023)
+ *
+ * target-type: J414s
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+/dts-v1/;
+
+#include "t6020.dtsi"
+#include "t602x-j414-j416.dtsi"
+
+/ {
+	compatible = "apple,j414s", "apple,t6020", "apple,arm-platform";
+	model = "Apple MacBook Pro (14-inch, M2 Pro, 2023)";
+};
+
+&wifi0 {
+	brcm,board-type = "apple,tokara";
+};
+
+&bluetooth0 {
+	brcm,board-type = "apple,tokara";
+};
diff --git a/arch/arm64/boot/dts/apple/t6020-j416s.dts b/arch/arm64/boot/dts/apple/t6020-j416s.dts
new file mode 100644
index 0000000000000000000000000000000000000000..c277ed5889a2145a4043b7f3230dbd49971d3068
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t6020-j416s.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * MacBook Pro (16-inch, M2 Pro, 2023)
+ *
+ * target-type: J416s
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+/dts-v1/;
+
+#include "t6020.dtsi"
+#include "t602x-j414-j416.dtsi"
+
+/ {
+	compatible = "apple,j416s", "apple,t6020", "apple,arm-platform";
+	model = "Apple MacBook Pro (16-inch, M2 Pro, 2023)";
+};
+
+&wifi0 {
+	brcm,board-type = "apple,amami";
+};
+
+&bluetooth0 {
+	brcm,board-type = "apple,amami";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j414c.dts b/arch/arm64/boot/dts/apple/t6021-j414c.dts
new file mode 100644
index 0000000000000000000000000000000000000000..cdcf0740714dcf71e8d0cead879bce8f27431ccf
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t6021-j414c.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * MacBook Pro (14-inch, M2 Max, 2023)
+ *
+ * target-type: J414c
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+/dts-v1/;
+
+#include "t6021.dtsi"
+#include "t602x-j414-j416.dtsi"
+
+/ {
+	compatible = "apple,j414c", "apple,t6021", "apple,arm-platform";
+	model = "Apple MacBook Pro (14-inch, M2 Max, 2023)";
+};
+
+&wifi0 {
+	brcm,board-type = "apple,tokara";
+};
+
+&bluetooth0 {
+	brcm,board-type = "apple,tokara";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j416c.dts b/arch/arm64/boot/dts/apple/t6021-j416c.dts
new file mode 100644
index 0000000000000000000000000000000000000000..6d8146b941703692a0cd92508add1784e0fc211b
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t6021-j416c.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * MacBook Pro (16-inch, M2 Max, 2022)
+ *
+ * target-type: J416c
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+/dts-v1/;
+
+#include "t6021.dtsi"
+#include "t602x-j414-j416.dtsi"
+
+/ {
+	compatible = "apple,j416c", "apple,t6021", "apple,arm-platform";
+	model = "Apple MacBook Pro (16-inch, M2 Max, 2023)";
+};
+
+&wifi0 {
+	brcm,board-type = "apple,amami";
+};
+
+&bluetooth0 {
+	brcm,board-type = "apple,amami";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..0e806d8ddf81b1073bfced964fa64c4e75a9e998
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * MacBook Pro (14/16-inch, 2022)
+ *
+ * This file contains the parts common to J414 and J416 devices with both t6020 and t6021.
+ *
+ * target-type: J414s / J414c / J416s / J416c
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+/*
+ * These models are essentially identical to the previous generation, other than
+ * the GPIO indices.
+ */
+
+#include "t600x-j314-j316.dtsi"
+
+&framebuffer0 {
+	power-domains = <&ps_disp0_cpu0>, <&ps_dptx_phy_ps>;
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
+&hpm5 {
+	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&wifi0 {
+	compatible = "pci14e4,4434";
+};
+
+&bluetooth0 {
+	compatible = "pci14e4,5f72";
+};

-- 
2.51.0


