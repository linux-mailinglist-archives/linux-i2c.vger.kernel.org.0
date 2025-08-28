Return-Path: <linux-i2c+bounces-12462-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9DDB39FFB
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 16:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F455566630
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 14:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7664031B11C;
	Thu, 28 Aug 2025 14:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="Ch+1xb9u";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PahjE7Y5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACDA3128B6;
	Thu, 28 Aug 2025 14:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389717; cv=none; b=GfPAxkHnezd6BzeNXL58sqypJAybbz096ueN7Difmh3IvBNjfNHLlDNYdhGC6liGOg1250aTJJ7IuWdFSU4HnH/ksp2R6C2ecf3cGd5ezdPibWqKuWx4rpyD4e3taP2XVCbK8ClEnjHfyjIdzinXN8CzaEXcdoAuIPxjug/jC5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389717; c=relaxed/simple;
	bh=jAclxDOOO5QTwB+zyryPKm3IP9bxbELatdxnsVTr35w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cGg4dgPZHeAbG22a6bQbJWmYzOBF2PuAXe1UcOMibi3ZVY4Zcnrt10pRt08Nk1wdEMKbe6SEnCEI1oru5+QDeM9wjtX/OQKPup/mepTyB70EFAyojWcvKGz96rhGjzfuGSpog6fRFNQm989wLbFgssfjvwpOtlnW2QtDP0g82ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=Ch+1xb9u; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PahjE7Y5; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailflow.phl.internal (Postfix) with ESMTP id 86FA41380D42;
	Thu, 28 Aug 2025 10:01:52 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 28 Aug 2025 10:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1756389712;
	 x=1756396912; bh=S+YP+UHmrj+bao/k3AUHzq3PVqoZrEV0aIDnoE4/Vic=; b=
	Ch+1xb9uJMK30xIWcYbYJ4eTa+hLTIxYHCgKXrgliX7BRlYbtmyxkUe2SqR7rMag
	14iscLQ9TgmLResOCRMpi04i6H07Naydy8fqOXzkBRX7WtNGUP8CGFeuUslH3KVj
	t0VhEgTr45RB0Vw78g8YrWAQxxDk8EOEFbIFCRZ+WjsPJCV4QY0VFQGqkk8PozBI
	WjcpF53/qevWZV0LCY6gvGN11KACRmW62Utj59BnTWiir6BEpxJ+DKrp103CWL/e
	4K3iaFzhsd891RYBPMPOf8ae/bXt1k08VcyBZz8ew4T7N2GWla7K041q19YXt4GV
	HrVaSs5DwE2gd4vF16Oo7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389712; x=
	1756396912; bh=S+YP+UHmrj+bao/k3AUHzq3PVqoZrEV0aIDnoE4/Vic=; b=P
	ahjE7Y5XzC1qpEFHNz+Kl7QqJ5+SeKZN5SveSzkA+IqvLan1hQAgMH5F569fubuC
	DHyG42t0kBapV8C3rzXiPvhY/1srt5OH3rqkDRzHc/wMG3oAPC7ITFpxWieK2YJb
	UMYac71u+/gYAdf8ioRulAsItPT6OyZpYHZP7OXcfeWfRBR1C4TlhPbnvPRBDWEp
	uVt+ZIDDwn/gGPHuSG2QH5fKVUdZbiigRxw3oNgtXIMwJDrtZ/6mTMieyy3zx7gL
	AR6G0CFgGLLGLJtUw8TyENs2xEASuBZ7yow27Pq3G34N81EIjB2luQV3EzOxlC8s
	Am6RFTmx6qeogUkgiOxsw==
X-ME-Sender: <xms:T2GwaONYYjJQTR5f-XSyENgLA9KJBFjJt5630688wO_wwRQew1u_Zw>
    <xme:T2GwaHA9Wpp4f-GLvtbU4zG_WnREGPfWrbuLJPj0GnXe6D1sXvMBVAxjildKUkzL2
    tecaFxU7XdwP77iEdI>
X-ME-Received: <xmr:T2GwaEXkGvNYpYCYwbQyv726hI4KMlJEAC0N_3mjbvZvkq7WbumxoG655rk8wp6Zhf6TyZttSwK_AXEIl68uMFEYv1u2bmklXOQQRg>
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
X-ME-Proxy: <xmx:T2GwaG2ikKaETgswOcL2pM6Tah72xTc_J8utFEMTg37RpyYiHIG23A>
    <xmx:T2GwaCia6yZL2oRYin4cb_73ApIHMrYXEMUHRxzY2frF6gOk9twfjA>
    <xmx:T2GwaPvtktsoz9878Pzhq7J3RqXPAWXmH9YlrR88_lTW9VzlBJTEMA>
    <xmx:T2GwaDIrLulAq4_gBgDBxzDmZLAFciTbbqV_Tu6mhXG7neSt7vY9Mg>
    <xmx:UGGwaHOyoGsaj4_HLxhdx_6hkYPI0qfvaQMCYdxn9S-n4A1Pwf9RZas9>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:01:50 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:23 +0200
Subject: [PATCH 04/37] dt-bindings: power: apple,pmgr-pwrstate: Add t6020
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-4-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2151; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=jAclxDOOO5QTwB+zyryPKm3IP9bxbELatdxnsVTr35w=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNieYT3RV5shaEs+/6v//IguRvJkkPf39+vvIYf1mBn
 FQk06aPHSUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACbyoJeR4XOE1/YD3nX+1iw3
 pu2cfkdMXFptsWehxhXDRy/SZzH0P2f4Ma3iusq+9F23zcqcLp+R6mNveGTscvjtm8gOk+6XCf9
 YAQ==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,pmgr-pwrstate" anymore [1]. Use
"apple,t8103-pmgr-pwrstate" as base compatible as it is the SoC the
driver and bindings were written for.

The implementation on Apple M2 Pro/Max/Ultra SoCs is compatible so add
its per-SoC compatible with the new base.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
 .../bindings/power/apple,pmgr-pwrstate.yaml        | 27 +++++++++++++---------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index 6e9a670eaf56c8a03d28a83fb0b7f7f8d6aaf1f1..caf15188099921d2b92a20a616945627f34fb869 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -29,17 +29,22 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - apple,s5l8960x-pmgr-pwrstate
-          - apple,t7000-pmgr-pwrstate
-          - apple,s8000-pmgr-pwrstate
-          - apple,t8010-pmgr-pwrstate
-          - apple,t8015-pmgr-pwrstate
-          - apple,t8103-pmgr-pwrstate
-          - apple,t8112-pmgr-pwrstate
-          - apple,t6000-pmgr-pwrstate
-      - const: apple,pmgr-pwrstate
+    oneOf:
+      - items:
+          - enum:
+              # Do not add additional SoC to this list.
+              - apple,s5l8960x-pmgr-pwrstate
+              - apple,t7000-pmgr-pwrstate
+              - apple,s8000-pmgr-pwrstate
+              - apple,t8010-pmgr-pwrstate
+              - apple,t8015-pmgr-pwrstate
+              - apple,t8103-pmgr-pwrstate
+              - apple,t8112-pmgr-pwrstate
+              - apple,t6000-pmgr-pwrstate
+          - const: apple,pmgr-pwrstate
+      - items:
+          - const: apple,t6020-pmgr-pwrstate
+          - const: apple,t8103-pmgr-pwrstate
 
   reg:
     maxItems: 1

-- 
2.51.0


