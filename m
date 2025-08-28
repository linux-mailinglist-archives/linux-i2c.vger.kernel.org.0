Return-Path: <linux-i2c+bounces-12476-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E45B3A0C2
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 16:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E6B61763AB
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 14:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2378D341654;
	Thu, 28 Aug 2025 14:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="un2sIUAA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QXTv8YlA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC65340D82;
	Thu, 28 Aug 2025 14:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389754; cv=none; b=SZHDbq5OMmfSbto8zcc4pRu7+pJwSQpeC8LK+659l85atUbjzp7WyQuJpJQLMK2tlGufQm3bV6W+/LeOyK7ikF1b+vfOfhbz689cxxU9M/6UJ0ma1tTTPjK85w0GaptQr/Ebik/Q8piEZKQtIxAtGA1cbTCgT+fyZvTfW8basYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389754; c=relaxed/simple;
	bh=JZREgLmmSZXb/74POdx9v3OPFBhLEyXfuef+3dzRKw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UCUPlR4Oe3QMWf8hWd2aKhVjcj7ItpLRbzix0pOZRSZWn7TE6hIZXv5rixzbXHwQpm5toLEYeSKN7Dxk6fzE7El2W/5fMeSt4m+oQ+VMxcRa57+o0Lagt4MT6LPrhcMiqG3r8ZhqFS1OxBRu/JFr7ClEcJRhtQXMTP+jCPd2vrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=un2sIUAA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QXTv8YlA; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 990081380DD0;
	Thu, 28 Aug 2025 10:02:32 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 28 Aug 2025 10:02:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1756389752;
	 x=1756396952; bh=N8tjYwR4BRFeQ1NF4HNhLgAH9ocOOPXM9IgYOCvBmMc=; b=
	un2sIUAAFzr0fy5gBHsaQXdKWZw8UlkLFpCt3hedlj+vVzIt6MoNjMefTWLbmwhE
	392qDm9sBPVzl/7fQQNoqHT+vhVifIsO/C6uzE+S7XKrD+7fnl/g+RO0Gb6QKvBQ
	h0fG77cqC9iuDCwtmPHmvG9gLMmM0WGGbV7rtV1SSruI3JCmcXl6sOsB38Xk2h6R
	M5cm8e8hboPvH7bNGyXdH8jMeL/sKQxdzEN1vHEFoiFrifiDhK+uQMu+Kort1635
	aP/iXVmuoPyXsJdw4lZxKPdpNM+wdLHuMjYQylEWwEn5VLYgZi4al/QDh800LU7p
	gmUnYHuSuLiDJcncFJl49Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389752; x=
	1756396952; bh=N8tjYwR4BRFeQ1NF4HNhLgAH9ocOOPXM9IgYOCvBmMc=; b=Q
	XTv8YlAQIUDUsewo08c8cFOIBgvg6TgSLe2zg9ejasUn/5bi4n5WMjajtEgaAC78
	hIPLspSU/oLVguHub34LuZxrV92xKmlR/r8KC6zi/NV490K04y3R8XW1+stFEwVg
	l8Ibc2wCvl0wB8MUNFORVh26Bm6uU1r6OvpexLs2eKVCP0G6NmDDn1h803Mzfmi4
	eyzUJI35JcnO5U+AC24WV1LDZUQtaAFg0XAND5NZG0RVGFTmEI/MsUOjtkNqlLbA
	V+fzH0Ne03+CIymZer5Ywc/M+ejc2jVZkMF22/p7TMUxGuFIW7czv31DeLYJuL0M
	hgOXzjr7PYEBzjHhoFpcA==
X-ME-Sender: <xms:eGGwaCTVknhN4-GV5rGJZp47EIH1MtTXopV5aMBkKVIhyCFDKAQP1w>
    <xme:eGGwaGkk-khscfyxX6I6MKc5R0_FZc-QAzcXeFKAsNonKb1hPOSDGpaBQ3xJjRJ33
    SJ0yhslyUxfGWAadfM>
X-ME-Received: <xmr:eGGwaKhR99rLr2l7Dvvpt6vg1AipZLSjP4sGEtKrOkyVqz86tQrfvjfZTblKM7L9q8K6e9rPpfKVkmMrlusG3qfN0jJFVNLs0_MeBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeduvdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepve
    ekkefgjeettdduueejgeeuteduffefteejudegieevuedvieffteeljeelgfeknecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedvnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohep
    ieegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhgphhiohesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhhrghnnhgvshesshhiphhs
    ohhluhhtihhonhhsrdhnvghtpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipd
    hrtghpthhtohepvhhkohhulheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqfigrthgthhguohhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkh
    gvthhtvghnihhssehophgvnhgsshgurdhorhhgpdhrtghpthhtohepkhgsuhhstghhsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehsrghgihesghhrihhmsggvrhhgrdhmvgdprh
    gtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:eGGwaFEn5WRYB9CcNHTSTBEFI72ZxcITPsL2H8pgQHqtSZgXsc7gwg>
    <xmx:eGGwaBKfzLdpoQjYPWlLafV_j7Ij75Oe7E4cHx1x4TIxJM9nOq1LLw>
    <xmx:eGGwaLZZDQ8UATmcMiZZtJsGfYQpH9UMRaGxnFXPr-mlwojqgDw50w>
    <xmx:eGGwaD06_fUX5Wp8x9rEwKEvWpZlc7nuM-Le1MftJkvrteSndD0VVg>
    <xmx:eGGwaFWaUBlHLiYAtt6xAyWvEqVeACpdG_ovHmz6ZzoWUAzkNq_L-Lbw>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:02:30 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:37 +0200
Subject: [PATCH 18/37] mfd: macsmc: Add "apple,t8103-smc" compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-18-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=j@jannau.net; s=yk2024;
 h=from:subject:message-id; bh=JZREgLmmSZXb/74POdx9v3OPFBhLEyXfuef+3dzRKw0=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNiZaK52uLlc+9N51eYqsh8zHgb6TiITeVz8k3Lzuel
 d1Zmjujo5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwEQSJzIyfORImvBr7nbxTbIm
 NXm+GvxdW7dz1P2dd+/jSoNjXrrtexj+GbGxOU8ot213K1jr+4FLyvXjr0iNd7emSvqXfA9JbDP
 nBQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,smc" anymore [1]. Use
"apple,t8103-smc" as base compatible as it is the SoC the driver and
bindings were written for.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 870c8b2028a8fc0e905c8934c2636824cbe5d527..a5e0b99484830800d7ea625233dfd44613f4bbbd 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -478,6 +478,7 @@ static int apple_smc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id apple_smc_of_match[] = {
+	{ .compatible = "apple,t8103-smc" },
 	{ .compatible = "apple,smc" },
 	{},
 };

-- 
2.51.0


