Return-Path: <linux-i2c+bounces-12474-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2B5B3A0D8
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 16:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 585D17BC82E
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 14:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E510233CEA9;
	Thu, 28 Aug 2025 14:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="qHykJs00";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PcDgvXgp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15EB33A025;
	Thu, 28 Aug 2025 14:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389749; cv=none; b=o1BzNVu1jj2QTawPbyUeyLRpmRnm95kJhBJDhp4LwsmZejBpzLHzxw54+rDKAqCZtwf7cO8o1/o9KpAGIaLQANFk0WR1QBbXJ5YTupuQZ2FslICcxjPGr2AIdikWC1mSafVPzHxzwRKTrrra2/Cu5Q+pHPsYbllMeYqI4aKK6Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389749; c=relaxed/simple;
	bh=ddO5Sz1yaQAcZP+8YaMvdulxeT9cwTHGXC2rjTPO9Tw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CAfXg4CGkYN7WTmc4QjkuuwbB3lQK4OLW7JIibl31TbibN25stMOFXlC0g5Hn1ehopE55vdkZd9xHMPbXPqXeriydIiKN+F6Bln4uVwl4eEjJYbNstAWEeVuUyenmq1TZ/rQK5xMHAIo3wiuElTDFGbDhLXiGVDKhyG6cq0D5fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=qHykJs00; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PcDgvXgp; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 4C4E01380DC3;
	Thu, 28 Aug 2025 10:02:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 28 Aug 2025 10:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1756389747;
	 x=1756396947; bh=aBPK39cxn1cJgh1hMBoN5i+0RtyjeRUQKGTJJtQw22o=; b=
	qHykJs00jvity9zETrMFuoC8mPdRrnTLEo/iITcRGFhQZvCV4K2czLpK7I+dk7bW
	Zg7ueMud2CTItGIQ+iDCKq1VdRHPmpOMApXS3O+yHRK45yrPoFk4jT0+kDFVuAvJ
	qXVv+P5MMObHBIJf+hpJ1Klvk2ndWxkRZ8dlNV2U83ANnyUWfJ1ZJxQLOvYQdAEg
	4QjxFNPq6mEUqVSCF/oExIeDjAo3L4YfwjwdeSIsIHmXc+GGkeivNijhW0qBPnYX
	8vA6X18R5ltK/7ltnIe9z7STPslSBMhk/UeAvA8twaRH0YXpMgUXy/4AtdmQHW3b
	txdGYgs0XsX9XLBeGcz23w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389747; x=
	1756396947; bh=aBPK39cxn1cJgh1hMBoN5i+0RtyjeRUQKGTJJtQw22o=; b=P
	cDgvXgp7X4cKwKIJmp5SQlZb/jhc5riFs+pz9lfsx8jAiBD+a+iuNfE3bw4jps4b
	8mi1Pftj1F6a0oT61rEc4v7f4CEbmebpBSA0tAi+EIl4KEOSBqJokfDIuR4HautB
	5V3cfto3yR8BqGgciN/OsSDYmDZDpJ8kci71nBiBZ9WSD49/B3ryu1RDARrYAYuj
	0z7XZT+3tjMYMTLJ2JXguquBgpRGfLW4rzdPqUqLiW0hKQ+/BS5rMA1Pv5W3YOue
	Y9bMFJjCrSJyGKPLNTQ3tr9vLqPZEepwOKReItosXvt3BcnFbTI/5IAws3cbPvPP
	9T4IHoc/nwoGYg/zMCzMQ==
X-ME-Sender: <xms:cmGwaNjq-yTaQqQ5uUkpcjSu0mPY1brSy0AtxWN_EtSyPjkLCtrz_w>
    <xme:cmGwaJfxhBaTK_cSrmpKTUFjK3Q50BurnHQq2mnzTLzZ5S3fxxeYjd1JIgHka8gDb
    sl6P-9YDuNbDFqiXkw>
X-ME-Received: <xmr:cmGwaGCTowKBhLC1P5ew2hEepWbiB3FgozY4INzIZTn1sBYUcw3vnMLA1nTbdYD32JpJB9Vmcim4HZCoFiYfClE0kTqLl4SDeOsnbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeduvdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepve
    ekkefgjeettdduueejgeeuteduffefteejudegieevuedvieffteeljeelgfeknecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedunecurfgrrh
    grmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohep
    ieegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhgphhiohesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhhrghnnhgvshesshhiphhs
    ohhluhhtihhonhhsrdhnvghtpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipd
    hrtghpthhtohepvhhkohhulheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqfigrthgthhguohhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkh
    gvthhtvghnihhssehophgvnhgsshgurdhorhhgpdhrtghpthhtohepkhgsuhhstghhsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehsrghgihesghhrihhmsggvrhhgrdhmvgdprh
    gtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:cmGwaNN6gZ8xZiMKoI9DS7ZqMMssxNWPRrqyC9xWIGTKHjh4__-81g>
    <xmx:cmGwaKBQWXIR28sgD4TAfqRJ4uXBtCcyxwZIm8AGB8cJOjDXLOkEQA>
    <xmx:cmGwaLUvM2b0OQz5JX5EznuJmJy3-RCLQIOcUGlZoZJuSvozhF0Nrg>
    <xmx:cmGwaB1h7yYGUmSIA5QbzwhC-oRmApSrM7qlISfe4tHvKdVTi8b31g>
    <xmx:c2GwaGdrtzxo-xTcpTkXByvll3B7j5kp2IIsQRss36yOyMiRZztltent>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:02:25 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:35 +0200
Subject: [PATCH 16/37] dt-bindings: net: bcm4377-bluetooth: Add BCM4388
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-16-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=ddO5Sz1yaQAcZP+8YaMvdulxeT9cwTHGXC2rjTPO9Tw=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNiZbMy0zvlT9gCRdQjnN52GQ152rkr1+93xfv1j84f
 UbNqsMzO0pZGMS4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAExk7VSG/yHFt/ottdb4R11l
 NncUzZm21y/ULnPiqWRFnUNzhCJ/LmBkmLDvjCLfIW/9jXmP/XfwvuJyLpu/LvOs898HrwyzOFx
 38QMA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Add BCM4388 PCI vendor/product ID as compatible. The BCM4388 WiFi/BT
module is found on Apple silicon devices with M2 Pro/Max/Ultra and
later. Support for this variant was added in 2024 without amending the
dt-bindings.

Link: https://lore.kernel.org/asahi/20240602-btbcm4388-v1-1-210e4b4eeb3b@svenpeter.dev/
Signed-off-by: Janne Grunau <j@jannau.net>
---
 .../devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
index 37cb39a3a62e6b477f0c9e5a3abba730353cc270..fd78258d71b4dfd80870130874a727e6f544ceff 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
@@ -23,6 +23,7 @@ properties:
       - pci14e4,5fa0 # BCM4377
       - pci14e4,5f69 # BCM4378
       - pci14e4,5f71 # BCM4387
+      - pci14e4,5f72 # BCM4388
 
   reg:
     maxItems: 1

-- 
2.51.0


