Return-Path: <linux-i2c+bounces-12466-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D307B3A035
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 16:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5328216F172
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 14:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA127322556;
	Thu, 28 Aug 2025 14:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="tvV5dAWj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JGMUV8KR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA40B3218C5;
	Thu, 28 Aug 2025 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389726; cv=none; b=h0M5znT2rhkmW3YQ8nJYCUdQnpbidrmOaXKJb4AzoGcCPESo8fm3L915a5crGcatqXOE+RGjun7UGhIa3xlaLxA140HBbNJvAehT+/F8Y75HHovxtxE8hF3Ay2hgWIWFh8X64PHC4dLv0dCxCBT8NPjBX7k68eBbfauGcFhBwxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389726; c=relaxed/simple;
	bh=7CTtpNAPBXSxf5wYqI5MYZp+cM2c/daeJcpAkBHmBdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u/6UMJA3VxG2oxGRK/aGhj8+ffEvTBSALIICxGoV86I7i3nyjIZTUZV8yduOVNY4cjwsBtRvJTkFc50El/An+Gz9Gs0FHcE5bYMVSyWMpetig2IynN5/nwcch+ZsMt03ESc6h2jwDKDRZKNFsQ/+ec+roZUY4ct91rD2/Y3guG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=tvV5dAWj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JGMUV8KR; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id E1C191380D73;
	Thu, 28 Aug 2025 10:02:03 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 28 Aug 2025 10:02:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1756389723;
	 x=1756396923; bh=GyDxZTcKVr/3D7WIDxndytpKvgxn9OdMxxkTZrcwEvQ=; b=
	tvV5dAWj2hfGHTwRZoWqpeJpOABGQ/BoZPlc72yY3kP5A9z7lG12j8TBNgvLmYHm
	RtJHUA9ZdHAVVkBv06F+sdDgd7aMZ/KdMSeBFta2zxoHi6683GzTjQ9AsZF19SZk
	J1FA6BWGM00+7YKs1ALZWRRM8o921twQ9f5WQIdmnCnoPcz5ctzPtvalxHJD90tG
	pb8EN+F+dHTUEwbagsi0fcUMD1LNSxS+PmNNbhLK4Sd8Jbq3kw7rIgJX0YaDBDsi
	gLMkaEQyNvIDma6dLgjq0BZsr9lfdtntLLF+XpWdd9hyKViA4yndr/ieiQc60chq
	1XrFA344S3fSPGaWE+v4dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389723; x=
	1756396923; bh=GyDxZTcKVr/3D7WIDxndytpKvgxn9OdMxxkTZrcwEvQ=; b=J
	GMUV8KRVFOEnHu0jJmvumTMXp7wGn07fqQQDO2CFInt3kqn+VtYHqxDSdfc94Po7
	KJYHNvTojTEfpHkAtFr5EveADwpvCM3WetdDnBPfjdZfgOzVIT+iT6iRhPS6J9fg
	mEDdbYAUM+rZySTVQ+lNnjl7X3P6Pi4S1uSmZBL2ae0pIwhX02X0viCx0WLZHRq/
	sLeyGaPlNVxUDGwAdF+xI0lOxeCZdGUqdAymdJRtBH1DysxOSHj6j3DitBodrJGK
	qGC8h3fFmlNaWEH8ISRntdzVqXpsF9XvbC8kC8/Pxj3/XGLrqdUInuSUlK5LOAvj
	Y+MewnmRpRQ1vYJRwOtzA==
X-ME-Sender: <xms:W2GwaBmssRBskQdSDqc-JdC1Bt1qDxDs6bGKg9Eb-1zU9SQ9VQZTlw>
    <xme:W2GwaESgdEThN_3_3P4VKOyV-9U_i_gp5ts20aXdojr2dMg7Pg2gldygfxdzN7ou9
    Jhu-cTb7scLb4yO6P0>
X-ME-Received: <xmr:W2GwaAlhHPY1bGqcSEhDzspk-oYu6alrESrXwDIBqgGOBZWsI3jqRsRuKF1HeijTex2M709fs8mZCpAfjsvGAF4cq-OT1-yu8wOnjg>
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
X-ME-Proxy: <xmx:W2GwaMjhgvjjCiy6FjTaSiRY4uPgj4XcH27aM_QLMDYYVOCOPFgbiQ>
    <xmx:W2GwaPFETvrUkjdOMekYVSwPq_oHiwH8_5Mb-oWqZb-bfWx1Z7ZnJw>
    <xmx:W2GwaDL8q9VPcy2Yx6-wCn4Q5kQPY8rXEy8ImKLW9iaBg2RZOQWWVA>
    <xmx:W2GwaFbAUg5L6wqgn2XoJVNLESb4OuGWrYL8q5AbKiu_ewQWd10fQQ>
    <xmx:W2GwaITItA-hBo9By4xyjRaDAljoZrvvjCekXcKaLvBRhejKfCStGpxh>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:02:02 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:27 +0200
Subject: [PATCH 08/37] pinctrl: apple: Add "apple,t8103-pinctrl" as
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-8-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=7CTtpNAPBXSxf5wYqI5MYZp+cM2c/daeJcpAkBHmBdU=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNiRZLWqrXNJ1kKTjJZcIe/vXNlPBNn1Y3KbIFzwuy7
 jjGZtPQUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCKXehn+GSTsNGSZ+0u+UjNv
 w4FvM86c8+jm2/M0peL5sWP9dg8i8hgZti/4Ni1SIfjpaz+dlz5XXi8zuseX4Oujtk3Up+Zk649
 p3AA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,pinctrl" anymore [1]. Use
"apple,t8103-pinctrl" as fallback compatible as it is the SoC the driver
and bindings were written for.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index a09daa72bfe49191fa6691b21a7f4eb66da8a540..e1a7bc8cf7652ce5e6701bd054ab989364c75a82 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -515,6 +515,7 @@ static int apple_gpio_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id apple_gpio_pinctrl_of_match[] = {
+	{ .compatible = "apple,t8103-pinctrl", },
 	{ .compatible = "apple,pinctrl", },
 	{ }
 };

-- 
2.51.0


