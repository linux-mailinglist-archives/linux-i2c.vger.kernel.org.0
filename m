Return-Path: <linux-i2c+bounces-12483-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B02B3A10F
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 16:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6DA93B98B5
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 14:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0427535A2BC;
	Thu, 28 Aug 2025 14:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="aotlmlBn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OvqpcMB5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06FA35A282;
	Thu, 28 Aug 2025 14:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389773; cv=none; b=r0KMuqea4WiMQkE5qInEFTQw+h7zk3MqvaccBMJvFemp9P4Ur7VD6yhe83GwCKxpgV3gmVUX5H2u3qzno7g/2VTWOaYENoXow2wowuJDlXcKY6OLpVd9E2eDnS5hqyX9hk2IlvvBXCzZoROjcuXnDWVD6ErBlVO6eaJytFOoQT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389773; c=relaxed/simple;
	bh=jcJtYPSKpG1I/YyWi+Q4doEt+hWLBjAswfRHUAO81VU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EuReQ1OTH4cMPXhfdbTYiC+ecVD+FvsY+jFds8qjWpoAm+CqL4XYB4GYZ0OZy2Nsgb0oEzRUVZ69dMAaZeroykdLJa0cF/UM3VXj7gLtvhwXmEyMr7Ui/mXUn972BRZctnvXNqMhRUDyFMc1JHFt8r9EWqj7uDOHQ5SOK+7fOac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=aotlmlBn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OvqpcMB5; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailflow.phl.internal (Postfix) with ESMTP id 56DF01380DE8;
	Thu, 28 Aug 2025 10:02:51 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 28 Aug 2025 10:02:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1756389771;
	 x=1756396971; bh=9HExCj4N7N9aCY12n6+mCffOhzLVaGrLIRy2IV0TicI=; b=
	aotlmlBnYn18OSm3dOWIkWvxo4EMR4XpW7FNjTgmAOuokUSxs/3PvUKjlho0SqbS
	G9ZH4Fh7nTmcnaaoxHNwJfzDwVGcVmvbaSFCXkZs35MRUDFQxM8PFlObOSn/iwpA
	XZSsQNi/fCHlXjkR9TFPxA4kCY+w9/dqRNS/nI+gVdN0jE0zxk0CacPb52d26Aat
	v5lT2FW7RTpYLqMUV2MqFWLpEU1q25b3C5wGrojqmwQMta+y50cj1X5r4KBpjRy+
	PiPyI3d8iV/SVo8OMnQltOPU2zXmqMmynnlsBlE2kHdZegKIla8h/Lg+N2dxJ3Us
	br1NTkEg4hqDah0sM0TyBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389771; x=
	1756396971; bh=9HExCj4N7N9aCY12n6+mCffOhzLVaGrLIRy2IV0TicI=; b=O
	vqpcMB5CqSTnTHujgJ19lJ24UIUgfPwHWG/j0snA+zCqy99zevshZqC/17m3fd9b
	g1El+Myks9GXUdxph0rfSLq0qAOEnG5Cgp5uqwJVv7sZvsog2DNGe1Jmy1nYqnE2
	mKfcQpuNawMSmTvYt4Ys9uTR+lkI1lH3OONnZNuSoltMJqyJalAB1O00wphovG58
	euT3vraiBNBBMJZo0AlmcZlvE23uzMv9VyyDETC/vJcMQ2bAE/h7HZtdCg+wh/vg
	FmpCbX+whGH/UhKBdiHg8ECBVbMTpLgGjYdZ9oeryJ/X6sPSKlMIWuObKA+XEtZv
	BnAEuAz3JeVXWxM1ROsyQ==
X-ME-Sender: <xms:imGwaJdaWWt49Ljswkr6e-T22V6pVyibbD94LuX86cF8znC8seFfCA>
    <xme:imGwaGBIasOnqBC5-TsckU1JgDlkuDngTMT8zH5ojURT6pRtL0P5-xHd_V_QxeKKR
    4y5H5k7zt7P4dpqgJQ>
X-ME-Received: <xmr:imGwaNOLuhajKhXN5f1kTUmMDZUppoWFn0K72y7fFpbMcicW6UfFC12JVQ0MqsVWlW61aXwu1ij9puOnOjjsoizp1IyxM_3DVsLexg>
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
X-ME-Proxy: <xmx:imGwaKCN6yZbB8wiZn_r1oROJTs2F9Rh1PNrRaEexAJH9_ZojPhRXw>
    <xmx:imGwaLUoRed0qCNycRD1W479Fzh3YSaX2oG6Ut5HPTzCUya4FZXI5Q>
    <xmx:imGwaB1mTM2Muwbh54cQIAxPq0qzrgpzFPE97eII0ZCWPXrSclmYXA>
    <xmx:imGwaBgM7lznyE8paYUuoH_yXmYE2st4YJG2EfbK89BxPMYQJ90MtQ>
    <xmx:i2GwaJDeN6MaRf7NVI7BvP1SkCoBblSvYeBlmiuzJpI0PD0R04V5eqrO>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:02:49 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:44 +0200
Subject: [PATCH 25/37] clk: clk-apple-nco: Add "apple,t8103-nco" compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-25-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=921; i=j@jannau.net; s=yk2024;
 h=from:subject:message-id; bh=jcJtYPSKpG1I/YyWi+Q4doEt+hWLBjAswfRHUAO81VU=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNiVb33E7um9BjsD5xIlfT3uMhpxX2lm/6/3F6/NGe3
 6be4aV/OkpZGMS4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAEzkcwsjwwHbFTGOyt0Ky6Ok
 jwm57L8afea7yF5j1+UlxxSzCqOl1Bn+p3z13LJbVCu9vuPURbFfT4u5fc/1/lu+Ipl1XXnZ7K1
 s3AA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,nco" anymore [1]. Use
"apple,t8103-nco" as base compatible as it is the SoC the driver and
bindings were written for.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/clk/clk-apple-nco.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-apple-nco.c b/drivers/clk/clk-apple-nco.c
index 457a48d4894128fff24d50eb7c9a3cbd7d35f245..c205b7f1dadeb837b76cfd30b6009db6c1f9a79f 100644
--- a/drivers/clk/clk-apple-nco.c
+++ b/drivers/clk/clk-apple-nco.c
@@ -318,6 +318,7 @@ static int applnco_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id applnco_ids[] = {
+	{ .compatible = "apple,t8103-nco" },
 	{ .compatible = "apple,nco" },
 	{ }
 };

-- 
2.51.0


