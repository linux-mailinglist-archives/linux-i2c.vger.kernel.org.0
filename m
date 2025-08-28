Return-Path: <linux-i2c+bounces-12472-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE2DB3A097
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 16:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BA4316AEEF
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 14:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75A13375B2;
	Thu, 28 Aug 2025 14:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="VaHDj0PY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="C+edsKmm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9464D335BAE;
	Thu, 28 Aug 2025 14:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389744; cv=none; b=VT/cKjaXvoeM5qyeGPl1FNYR9NLVavlownDNLLq+szCh7r0IWWFB1lWanCGCmnefxniLi15UKXBseTKHn8xne21e0k2W0vOAMPX0RoNPq5C7iqDn9oyRh87WbQZs1hW+51AtAiBLPEJFKC3ofnbDWko8Gbdret8PkOg+X0+uSMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389744; c=relaxed/simple;
	bh=Jb83KxX2H7kR1o63dY79EQbQmU6FMtXfENWdCwzKWS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VPtTeebTjdNBSPT7Itujw80eETPSXuKODZEkNaAEXCOKlDYNREGhFJ/zHqgQdIET1B8DHY0F+i7r9FNWE42D25L/+6bErZyc1XL9kbDgz1M+qUV3AehfR/RZsFqODdZVMPGJMmAjrpK6rVUP7oogalOsxmgan6+qNznlqHfFosc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=VaHDj0PY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=C+edsKmm; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailflow.phl.internal (Postfix) with ESMTP id B45EF1380DBE;
	Thu, 28 Aug 2025 10:02:21 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 28 Aug 2025 10:02:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1756389741;
	 x=1756396941; bh=d1uuzbyK+TBo4FKAGVpnZlWXc03joPgRcgcWkt54xQI=; b=
	VaHDj0PY+V+AsDh4qD25M+zhsGKWgtfDZDmedCbfP+EkCQywzgXWlXCSEVOZqjhv
	7UZDu6/4yqx3KWACwKGn5LTqKnxsBWoIjiIALvisrCm7/zS4GdUOU9F8QOqhZqr4
	52CERp0d39AmPJd9FDDN+AW75JzwtwpCvLw7mean4SYOlIFpXQVoUOPNBMh+jdEz
	D79ERgCHoJ1EgTJ2F9+G6aSnPOGIuNisCxV4zoA260iNJLDc+uc23w/RLNiTUPAe
	z2w8u8vZlTDOVQmyocuG6YW2KzUxtme3qVyz/azJd5mOmMaYtl2mh5bXR7hSIARr
	+RDkwh75QL1OIv6ORBFu3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389741; x=
	1756396941; bh=d1uuzbyK+TBo4FKAGVpnZlWXc03joPgRcgcWkt54xQI=; b=C
	+edsKmmgQpUUdgiXz5LRMt0w28yLVSrI7MsZIsPtNCituhTpwZWvWREvhgEUux8E
	UBUPU/V3A+VmSYDz/LJL2HcEQPGPbJn85jPh9iULAwQ9ptIoydbVftX5jaoxNChL
	pGf2VdxOMZu4rsUsCRI7dK4JTkGvJpAJiPVD4IgksWwaBzebhFRxXEdNyu/l5vew
	P0GAwEdjQcjBQf4I7zxFIuQygK9qSFWSxstrpmyON8c1VbcceKab4h0+EwHlrTgx
	VtIUyVBue5/yaokYBcyDn2mVXwQyuw65vK2hiNQ8nvdPBlqYAsqTumRJxGestZ0l
	cIHYxhton2o+jvcED5jaQ==
X-ME-Sender: <xms:bWGwaJOjUfAt2gPyXzDYH-QgJmwJCaGGpCEF_YS9LWfnNJUTQi4o_g>
    <xme:bWGwaKzDA0OMFWaVfRJCxHerCzhhNRw1vEilx6gOfrXXtVKMukX1cJvIXBs5IMyW2
    dJRufB8zrpTOT8c5E0>
X-ME-Received: <xmr:bWGwaC9T6uH96i2PXR13lLZfcIcmo8wmeaNpImOLE4UvHEniBDl75tdgju-d8XMrtL141uNjsLM1QkKRUb-Yt8MTLM8hd_X1i4qFRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeduvddvucetufdoteggodetrf
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
X-ME-Proxy: <xmx:bWGwaMwXMChxee1x41cVZmcENyVrdN8cxsZouPfGzoov0QyiO-HTAw>
    <xmx:bWGwaHGFJ459KgUjWGFOoXpHCZ4kv4lQ07dAIJ1f4VXkCYekMANtJA>
    <xmx:bWGwaCnKTsBNdTFXQdp_hlUWzUIJOXQtsQOpCfMJzEJ8eJq_-3nYqw>
    <xmx:bWGwaDRt5Z0bkvGLPlUQu2b9W3E7SszPvHJLDA8J1WqUm92N57d-Xg>
    <xmx:bWGwaOEpaf--yyX6ZMRIBcyqRqWVh9eTLzAZ62ilQKNakq-L_QMdUoRG>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:02:19 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:33 +0200
Subject: [PATCH 14/37] nvme-apple: Add "apple,t8103-nvme-ans2" as
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-14-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=987; i=j@jannau.net; s=yk2024;
 h=from:subject:message-id; bh=Jb83KxX2H7kR1o63dY79EQbQmU6FMtXfENWdCwzKWS4=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNiZadqXLVW/17dYSM90/iZHgq4LH/1RnpqsA7RybLB
 Ckm/ursKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMBHO8wx/RW5UOcq4h897Z+b1
 dkFcZmbHiZmFYQxWMamLXq4qmr1On+G/0/STT/xviR66ueGsrL7KNjXWPxf99SodOUPr7JdPniH
 IDwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,nvme-ans2" anymore [1]. Add
"apple,t8103-nvme-ans2" as fallback compatible as it is the SoC the
driver and bindings were written for.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/nvme/host/apple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index 1286c31320e630cb012009d6b962526e0553869f..1f57a7a20715cb2370f1e72872c2e08bde44bbc8 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -1626,6 +1626,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(apple_nvme_pm_ops, apple_nvme_suspend,
 				apple_nvme_resume);
 
 static const struct of_device_id apple_nvme_of_match[] = {
+	{ .compatible = "apple,t8103-nvme-ans2" },
 	{ .compatible = "apple,nvme-ans2" },
 	{},
 };

-- 
2.51.0


