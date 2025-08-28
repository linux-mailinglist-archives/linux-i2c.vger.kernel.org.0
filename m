Return-Path: <linux-i2c+bounces-12471-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB41B3A060
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 16:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10A86A00404
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 14:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC4933470E;
	Thu, 28 Aug 2025 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="TATu/aEd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cLmH1HDO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605FC3314A3;
	Thu, 28 Aug 2025 14:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389741; cv=none; b=hPDF6ppahMgehwUC/etSOUyuMP7ZCFXTV+hboXN5dOnP8WLwqDmZRT/O6qFDbGmt+s92PoGMFcwFiW8ICaKZQFq3SvdZpBeRSe14bVFcwRc87Oaj/TyMRJBBuePDyAo921ctX6ODx2fR3+f80/KvZ4QmWSHcMDyemn0EkB3vX0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389741; c=relaxed/simple;
	bh=fwlWHXlK1F3ZW5/scw/ugcuAufqFjwh+zEOkSopcdUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=edsdIswbXQiHmMon7GKdTRqXnE7cPIeZwS4FpSjmFQgxyURGkvb1rMsNLKeVrTAxPLjChaFx0RXvDUzKNY1Ea/m6thhQuv/CK/lP8I2vJFFuAPR0de8AokJjS+L5sH7BWHHVz7QlUwW42MFhghuDXy0delaq+lbRwDwRl6BGzus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=TATu/aEd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cLmH1HDO; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id BE9371380DA7;
	Thu, 28 Aug 2025 10:02:18 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 28 Aug 2025 10:02:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1756389738;
	 x=1756396938; bh=PJSAjPUgJujthn86fjzmtWHBBOTG9ts44gGI05Gk5C4=; b=
	TATu/aEdKzZ/REk0w2EOJSGOTuC+dPuxTgdMsyFxk38Zq7D6KVTn4AQHpYdDddaV
	W091xOgsqKdSgQpqA80hM2niKZFXdRfkKu+1/aBA5X80vN2HyNHOfNcNsiyWHyEJ
	uFE+f6tzCpTgF7B6vY7w27WbytcwAVwT7e8lgxBv5380kF0ZRAd/FBfJfjTQJd0s
	dWv6ZEQQUWfVX7qgqh/yAq4/y4eP7csptVkJjvo77Zshv7/+EMPGF5/HEJxesxCo
	48mDtVUn0ryUY2Qj8X0EAEWR/uviM3boDdM3/FGyx+7Zlvn+6PGNpR2uHux9+2KG
	0z0WVrR8iC8U4nrdPmfkvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389738; x=
	1756396938; bh=PJSAjPUgJujthn86fjzmtWHBBOTG9ts44gGI05Gk5C4=; b=c
	LmH1HDOxKagfv0iS3hQRq6vjdHodK5o9GVfSCsn81Hnks42aGzypH7on6eNh8sUE
	k98WEv4zNdz6a54oZ0CSxdM2I0tH2DumDQSqf29V22pBe2egzjpX3iX/uwMHNp3a
	QYRkgVjiir4z8cfQIVcMjiIQrTwlRLEb13wxBcdZtbyX3maHp1YkoClM9+dRAE4k
	IwY88onujI8FmPMghIgwFMe+hiPvNLPXpHNrGA2gyrrqA2dd5bEa15XY0xeTXnaf
	x9Q8gNE2UuT+BV+SXgs0/NBMiE2Jx8HTTSgadBk7M4XjSaNKO1URtTXtvD9L7emF
	ciaDM1w63loDNOpq1Q8CQ==
X-ME-Sender: <xms:amGwaCOQrHfS1W5XSPXmsXToGIflcZokz1XOTvG9DKBFl3w975edSw>
    <xme:amGwaIa0YGv5zKtM4POIBOWQnXJ4Q3gXtmhWmVR95vFRjmi63fSSh0BGgzm2Tbq7c
    GP12fI77oSR3_UrlaA>
X-ME-Received: <xmr:amGwaCNNrItUCJHB1y0Nfr7lpjCfAe_HvSdXL7MFLIex6RRe3zUGysm9f7W2Fbc6t9TMv7wJeLOHplppq7a4w_I0Pm-xrorny4vrRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeduvddvucetufdoteggodetrf
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
X-ME-Proxy: <xmx:amGwaNrE4SjWa0M6nAcyg9qc4ADfdqXm2F3-q7cWQ6bv3MaKC1PlnQ>
    <xmx:amGwaJsfT8OtI23o1imPXkUe4tWRTOv5wUIRXvF8pwvzenHAwwHPxA>
    <xmx:amGwaJTSNTC_M0yMrkYURcjE-LCSykIoIt5QKfXgwPDFvfrdU6TaqA>
    <xmx:amGwaBAU9w8swmbuTcQIyPqdYW68YkkDDHoEu6yE7QI-CgLbqJzlqg>
    <xmx:amGwaKjjvARS_lnDdLfyucLHiu5G3DZWZXaOJRXvUYcPljcqu4P26F3A>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:02:17 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:32 +0200
Subject: [PATCH 13/37] dt-bindings: iommu: apple,sart: Add apple,t6020-sart
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-13-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1007; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=fwlWHXlK1F3ZW5/scw/ugcuAufqFjwh+zEOkSopcdUY=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNiZaeMYbi24RWyds6ftqed0X/t2v7nnKbz/7tkTsE/
 3ne0crrKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMBH3WkaGpvDt0eV193d53Smr
 6Lj7rfDvA9+f4WfeVaw+cMnsScdEL4b/cZ3XUpV7jT/G1v0uqJ/4I6zX986Wn+rZ2z/NuxT/ZBI
 3EwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

"apple,t6020-sart" as found in Apple's M2 Pro/Max/Ultra SoCs is
compatible with SART3 used in t6000. Add its per-SoC compatible to allow
a distinction should it become necessary.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/iommu/apple,sart.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/apple,sart.yaml b/Documentation/devicetree/bindings/iommu/apple,sart.yaml
index e87c1520fea60a2de549aa8a469fcded52e3b6e3..dec0a5c6219732fbfd8c28d350db4b577d9ea377 100644
--- a/Documentation/devicetree/bindings/iommu/apple,sart.yaml
+++ b/Documentation/devicetree/bindings/iommu/apple,sart.yaml
@@ -30,7 +30,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: apple,t8112-sart
+          - enum:
+              - apple,t6020-sart
+              - apple,t8112-sart
           - const: apple,t6000-sart
       - enum:
           - apple,t6000-sart

-- 
2.51.0


