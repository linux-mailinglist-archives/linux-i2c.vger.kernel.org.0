Return-Path: <linux-i2c+bounces-12459-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F10B39FAC
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 16:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D28021C27F47
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 14:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E303164DD;
	Thu, 28 Aug 2025 14:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="k7RQjP57";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ecNpHiOJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C02231829;
	Thu, 28 Aug 2025 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389706; cv=none; b=J9qZ4xQdkkfsTXl9BB9IiVeQPc1gGZ6p+J01GGO0aEZ2mjFkPQacwq+1vW9aWMEDbqm89EQnK/hoW2UWrq63MQewB7ONNgFuDp7iaCsHrhmQJhks3VEprSUa6cVaGrB3MVl9bUnUtVAygbixtsFCCTIDE9Jh0rf5nA2Y2s9WAcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389706; c=relaxed/simple;
	bh=yq7glzn7Xk7stq0Ga5tm8IIaOxITJdTMmHnmVJ7JmDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UVs6/tMYQ2Mri/fgmcOqggjl9kIVi8wR9xOymfJEZCmZ+aN/sjDwKvxMnLj04LaXrcz2Xv7bO2LOdrAtb7tV9/tQ6sIFhXN5MbaNYnl44lKphH8t8/kz5h54qYPBs0kDWgLsqYwnljQnr7NnAIBjiCasWYpLQLn+iqlc+A2Nd/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=k7RQjP57; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ecNpHiOJ; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 208B01380D34;
	Thu, 28 Aug 2025 10:01:43 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 28 Aug 2025 10:01:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1756389703;
	 x=1756396903; bh=Mt4m3pfDlm76iogjA68mWAJr20aYrwq7p+hGLF/PmIY=; b=
	k7RQjP57gX4TPn6CdP+8PvlAVgXpMfWfPTjiFaBefw3+DFy4oh3fi3ulwwSQ4I6A
	VWuIOa4DbWQ36BMsa68jN2NPfLoHkHHXUqEzDAJia1sDKNMydN/iGyWO2wuAh3qU
	w/YIi/ZpP1l6CLwletHQTEeuC7zJk8PzYfmo3dm2bRIyC94VOylLVZHd6ODMVYav
	XIjG3zDq8FeB7eWmwco9VzTGJX9Z5VrFO0KPSfEojZerpUa0Fa/nmjrwL6iPJiB4
	/b0l+TW6FVl8+zYH2Sd+kUJ82NPRGnlTLmdZOmkpKotjwlBlNN1uEaPWIF/eb/+j
	pGU1vv/0XfKggLIO0/8lLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389703; x=
	1756396903; bh=Mt4m3pfDlm76iogjA68mWAJr20aYrwq7p+hGLF/PmIY=; b=e
	cNpHiOJOiRQ6QwjaLYYCqkYdT01HhC/xF6oqpgN+HVyRdbDR6zEG3223HwR2EBtY
	qmUEM2zSG2wHhC9hYomyPGWnRqeW10D0zx9PXSyIjq5RuV5IS0TDWLm65DdEYg3d
	fVYtY5ppJ8Ceo8YLuw4QNoAomvbY9MZDi44Q8Fad3c734oua44U1LJ1yMsq4Avrw
	KkUWOXSO/1/9LHWO+v8sSVYmlYXZKRF6gv3hxCwX6J6tf28AwKyHpNZ1LNLH5VDG
	cMlQbyLCM0zOHAl8QTCzzcp/C0YeHSpkgGzuxbo9PEta8WuWedWfa3bQ1aJlMV4k
	t0CIDXaOznW7r6elZPpXw==
X-ME-Sender: <xms:RWGwaKc6JmhtZc_hTPd4J03enS3SMrCM0CWh4UsR0OGLlbk_5Z9Nbw>
    <xme:RWGwaLrmEMhCd7eTtrLEa5TMnXHziL3x7HxK27PJccLEFQrGum_pGLeR3vMz5hBdD
    PvdeHRKDkz7P_VS05g>
X-ME-Received: <xmr:RWGwaEdlvK8_6gBzXvJZtGplvbxMYwWIvmwL3qaXCgpWCi-59Z0uLT04HieGc5TwQI6yV2F-dgvcAusa5deG07wGHvXIEg6RTOtF4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeduvdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopeeigedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepjhhohhgrnhhnvghssehsihhpshholhhuthhiohhnshdrnhgvthdprhgtphhtthho
    pehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehvkhhouhhlsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdifrghttghhughoghesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehkvghtthgvnhhishesohhpvghnsghsugdrohhrgh
    dprhgtphhtthhopehksghushgthheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgr
    ghhisehgrhhimhgsvghrghdrmhgvpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:RWGwaC5knHKpYy1IdbaN628biPAd9wICqdpxWzFIC7ZitSS3ooRMBA>
    <xmx:RWGwaF9uWox5G9uxrh3QJ_VxCtj8mz0NduZGKyfB73HJna-LGc3TJw>
    <xmx:RWGwaAh0eoduk6E7P9AwtWUIgXuKofdmeA3Tci8Qhz-fxIcq7bgeKw>
    <xmx:RWGwaHQKLlAPOxW6T12O4DWdfGy5fT4e67VbSpLGldpRQFYCsXYijA>
    <xmx:R2GwaBpJ6W-Y-g-02-g9tT7j3k31vRYKOcA-Hq_4iswhH2qVfDF8iWU_>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:01:40 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:20 +0200
Subject: [PATCH 01/37] dt-bindings: arm: apple: Add t6020x compatibles
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-1-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3057; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=yq7glzn7Xk7stq0Ga5tm8IIaOxITJdTMmHnmVJ7JmDI=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNieZamgLG4T/LbzbVRXHm75V5Vv+XQdB3d8VGXp3mK
 ys+es3vKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMJF0BUaG7xdcTC6mR0ysE1+h
 tGfL2VPHGttshd3PsW2zWP7zLkfTO4b/ST3rpqlkC8ts+7Yx5byeAfdek6RrbmcvdzKe6J6cp+/
 DBQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

This adds the following apple,t6020/t6021/t6022 platforms:

- apple,j414s - MacBook Pro (14-inch, M2 Pro, 2023)
- apple,j414c - MacBook Pro (14-inch, M2 Nax, 2023)
- apple,j416s - MacBook Pro (16-inch, M2 Pro, 2023)
- apple,j416c - MacBook Pro (16-inch, M2 Max, 2023)
- apple,j474s - Mac mini (M2 Pro, 2023)
- apple,j475c - Mac Studio (M2 Max, 2023)
- apple,j475d - Mac Studio (M2 Ultra, 2023)
- apple,j475d - Mac Pro (M2 Ultra, 2023)

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 39 +++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 7073535b7c5b5ce885391699af56751241ddacb5..5c2629ec3d4cbcee49d3ff6a4db1cc8298e2a2e1 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -96,7 +96,7 @@ description: |
   - MacBook Pro (13-inch, M2, 2022)
   - Mac mini (M2, 2023)
 
-  And devices based on the "M1 Pro", "M1 Max" and "M1 Ultra" SoCs:
+  Devices based on the "M1 Pro", "M1 Max" and "M1 Ultra" SoCs:
 
   - MacBook Pro (14-inch, M1 Pro, 2021)
   - MacBook Pro (14-inch, M1 Max, 2021)
@@ -105,6 +105,17 @@ description: |
   - Mac Studio (M1 Max, 2022)
   - Mac Studio (M1 Ultra, 2022)
 
+  Devices based on the "M2 Pro", "M2 Max" and "M2 Ultra" SoCs:
+
+  - MacBook Pro (14-inch, M2 Pro, 2023)
+  - MacBook Pro (14-inch, M2 Max, 2023)
+  - MacBook Pro (16-inch, M2 Pro, 2023)
+  - MacBook Pro (16-inch, M2 Max, 2023)
+  - Mac mini (M2 Pro, 2023)
+  - Mac Studio (M2 Max, 2023)
+  - Mac Studio (M2 Ultra, 2023)
+  - Mac Pro (M2 Ultra, 2023)
+
   The compatible property should follow this format:
 
   compatible = "apple,<targettype>", "apple,<socid>", "apple,arm-platform";
@@ -310,6 +321,32 @@ properties:
           - const: apple,t6002
           - const: apple,arm-platform
 
+      - description: Apple M2 Pro SoC based platforms
+        items:
+          - enum:
+              - apple,j414s # MacBook Pro (14-inch, M2 Pro, 2023)
+              - apple,j416s # MacBook Pro (16-inch, M2 Pro, 2023)
+              - apple,j474s # Mac mini (M2 Pro, 2023)
+          - const: apple,t6020
+          - const: apple,arm-platform
+
+      - description: Apple M2 Max SoC based platforms
+        items:
+          - enum:
+              - apple,j414c # MacBook Pro (14-inch, M2 Max, 2023)
+              - apple,j416c # MacBook Pro (16-inch, M2 Max, 2023)
+              - apple,j475c # Mac Studio (M2 Max, 2023)
+          - const: apple,t6021
+          - const: apple,arm-platform
+
+      - description: Apple M2 Ultra SoC based platforms
+        items:
+          - enum:
+              - apple,j180d # Mac Pro (M2 Ultra, 2023)
+              - apple,j475d # Mac Studio (M2 Ultra, 2023)
+          - const: apple,t6022
+          - const: apple,arm-platform
+
 additionalProperties: true
 
 ...

-- 
2.51.0


