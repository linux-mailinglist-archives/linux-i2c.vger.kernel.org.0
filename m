Return-Path: <linux-i2c+bounces-12488-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BAAB3A181
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 16:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 297985673FF
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 14:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBE93629A9;
	Thu, 28 Aug 2025 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="PIb7jeWZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="J7XgWANR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57C0362984;
	Thu, 28 Aug 2025 14:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389787; cv=none; b=fcIVZIPiO8R95XxXpdJddeFu32yNX9GpPcj5i7yl9+u4eIPyiHGO9UTak+fjrexPNV51tIHoTzMA1kcYhB8Je5CenFNLbunTs2VfaEikO1cl9S++mUIbcIVIoIhsBCqqcHwjYX6qqWXyxMmwf1dlAJ1uz0/7SF5IHl3S6ApnEaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389787; c=relaxed/simple;
	bh=r/vYHI/jq9Sso0CRVp/FKNTKugJ1a2+B1avGSp5ZbeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GgQsWLc8nikEw6EyZ1onFj3RERHovM+KZjKYGj47/iPluf+ijvNjlPP92zrqqxAbWdPW54FOxwEdZRf8Jc8IiGtnypq0OBSWlNnZfROoUZJxiytwfTRKrMI1SkVxVPAA8nmWETspIit4uJj588MMzRnp4xYI7u8j2yddkTA4xwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=PIb7jeWZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=J7XgWANR; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.phl.internal (Postfix) with ESMTP id 2695C1380E09;
	Thu, 28 Aug 2025 10:03:05 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 28 Aug 2025 10:03:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1756389785;
	 x=1756396985; bh=/iI3CACqqO3dObklXAYTGSw5hs2LBIumuu8VqVSZDgw=; b=
	PIb7jeWZbGZVNpw6JWdUWY+kHnkATMmrYEkODGGMDdrnXiCokHkay+POHtHwc2qF
	PFRoku4A4x4JIPJ8KYT830fqDorbM6s1zbR5rpevA2sVo+mY6dcBElQ/nZSTxNBC
	wD04PXPThz9svhD6DhaxR+3SfGOzyrwH5QsxEvAEXVhJa15mA0sRrB2FsAwL++xg
	r1TF3l7K9AK78cozR2/E61kGDco/UfmgVH7Q8zncjh5Q/ToUulUYkCn2Vnbdzb0J
	+PG1mAMg3cBKkusqC/L9o6Eff3X4Uk8IBzuVcrdJB46jqNssW99mTmSaHtaOmskt
	ywhcCwx2PU+3biPGE4q+Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389785; x=
	1756396985; bh=/iI3CACqqO3dObklXAYTGSw5hs2LBIumuu8VqVSZDgw=; b=J
	7XgWANRHeyfKEM3tjdrXvNW7uNYNWbXsKBS9TX4zFIsGoF3sxgqU8QxphnpXqS8Z
	quDtuM1gYOMAF5heF8d1hREHluZ7jp+U/7ykZLBXgfd73QCbzFo85k08qIhxgfmI
	+rMDbkpVQSA1on229a5Y5BL/dqnUeKfyKwyGkGHU9Granz2HTz5pVR6sb0UZAo5t
	Ufj4MxLtlxwvcxLRPw7BpmMylDHACJiCoS44kqSlogc8pU+N6N8BopqlnT99e0Ak
	WgpnYFu7W5uGb4ZRUY0V/01K9WicwuSOosaJR0m84NLATLFgb8Xjg3fD7O0+OPQt
	prWn8HqvEpfYulxmx6V3g==
X-ME-Sender: <xms:mGGwaH1kQV6PrylPve_VxVn6Czx67LvO6NZygY4OSVkhS97a6LdYpQ>
    <xme:mGGwaNj6fx7bFOR7e01WLMj4lh9ZOYt15aNd-uYgaGdbIGIFrM34oiIR3GsVmwEnd
    cWooTs7zjL9w8XIsSY>
X-ME-Received: <xmr:mGGwaA3qwtg9q-inm3HNikQjiRMeocnLfwq8jqDaio21lJBRTiPxU5mPPbnpXPWunwM9KffD57xgAAE4eh3mQQtV7qqxwqvrT8-z-g>
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
X-ME-Proxy: <xmx:mGGwaHzQNODu_lc6UKkzpIkT-W94QjdpAWX-jKdSJkE2FfMlYQFTtA>
    <xmx:mGGwaJWfdqN3EWG1nEOdzhV75KX0hJdNXmvAyoLPP9kdZzpzY04vtQ>
    <xmx:mGGwaAbseeSLfMdNYVle76ik9VPixg8vHLZ3m7HzIEcz1V5fgRoPsQ>
    <xmx:mGGwaJpV6lAo-KkmKJ3h8Vu0jW_-Bs8sENmBPVWYOIAdHcyRvqjSwA>
    <xmx:mWGwaHIo3kCHjNOJ2tFAqaX1aRY2zu1B86Xa84Hmsi2TM802cFRlb5ID>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:03:03 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:49 +0200
Subject: [PATCH 30/37] ASoC: dt-bindings: apple,mca: Add t6020-mca
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-30-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1599; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=r/vYHI/jq9Sso0CRVp/FKNTKugJ1a2+B1avGSp5ZbeM=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNidZLD7BHX1kwe8n0wjNXS6bt+R/yxrFSWzE3+Ebao
 Z3TIxZ/7ChlYRDjYpAVU2RJ0n7ZwbC6RjGm9kEYzBxWJpAhDFycAjARiQxGhld/+v25l5Y8lwm3
 W5C0mnHKg6v6Vrozd7jtWqDKsHTB2hpGhtnHzz+/t3iS0VXeyCnCu/p/ZO57trjULY3VwJNLL/x
 aGQsA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,mca" anymore [1]. Use
"apple,t8103-mca" as base compatible as it is the SoC the driver and
bindings were written for.

mca on Apple's M2 Pro/Max/Ultra SoCs is compatible with
"apple,t8103-mca" so add its per-SoC compatible with the former as
fallbeck used by the existing driver.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/sound/apple,mca.yaml | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/apple,mca.yaml b/Documentation/devicetree/bindings/sound/apple,mca.yaml
index 5c6ec08c7d247c88f0fcceb352a545f6a95f89fc..2beb725118ad80fba2c3d5b119f8735ac849737d 100644
--- a/Documentation/devicetree/bindings/sound/apple,mca.yaml
+++ b/Documentation/devicetree/bindings/sound/apple,mca.yaml
@@ -19,12 +19,17 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - apple,t6000-mca
-          - apple,t8103-mca
-          - apple,t8112-mca
-      - const: apple,mca
+    oneOf:
+      - items:
+          - const: apple,t6020-mca
+          - const: apple,t8103-mca
+      - items:
+          - enum:
+              # Do not add additional SoC to this list.
+              - apple,t6000-mca
+              - apple,t8103-mca
+              - apple,t8112-mca
+          - const: apple,mca
 
   reg:
     items:

-- 
2.51.0


