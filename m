Return-Path: <linux-i2c+bounces-12485-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B0FB3A0C0
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 16:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DC3C1C83D1E
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 14:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E9E35E4D7;
	Thu, 28 Aug 2025 14:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="BmIxiSS2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="O8J9E/jx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB37235AAD0;
	Thu, 28 Aug 2025 14:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389779; cv=none; b=VUkGcFB4vLyRxRLkcvgf0xW8C8c+x1Zrjx69CuaUImbqK9PjzQVZEakMVGhRyQfTd8Uzx8m/rhfdxbS40oB1cqsNKhLVb6hN+wz45zbujR8Y4CyCTDcTPjNIsEcZoKGEqWdN4xAozY5O3QEh3cKXMUlR/NmFpI63RNk8lgeSBwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389779; c=relaxed/simple;
	bh=Wx0RPczYgOK8CdqFLuZk+hLIaDjGO8awzo537j54hwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eT1lQ+p08uevvlQLfDeod1m1qv0KY985Nvgit8l/c/4l/5qthxkJcNyMSiKl9AyqrTbrC2Wd9S32PRTDoqGFpAPi1POyXNSbp0296ZP7lUExg+835Rf0SNihs1luoPh2tXqQcUMbGiiDjE3bnAFgZ4f8B9m73GhBYML6JXMkurY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=BmIxiSS2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=O8J9E/jx; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailflow.phl.internal (Postfix) with ESMTP id D87C91380DEF;
	Thu, 28 Aug 2025 10:02:56 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 28 Aug 2025 10:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1756389776;
	 x=1756396976; bh=OGZfAHvbSY8JyHgEl1wl2gThfaHwNzf7suY1jP1VvAE=; b=
	BmIxiSS2u79ypjT9YQ7vFoMethejmXc3d5rvdX7maA8ecUVcsB8b4NRY1CPuHrw6
	IFHBs9VK63t8iPA42BR2U+7vvnLgJp3RNeMh/1oLNidzUGsFBIR5AMKUAvgVWRoc
	3IYAUWp9mr7K5PprK7dnyDpNHiT+vyC9rqIU5TkHrZ6/8ywv+Z3dRE+PKSKytwcP
	lsWdg3lgB7GLnEplE1jyYy9qi5cO/e2hb1XxbqowECkxodASzzxfUuEYY0SdfWU3
	s3PwQ1QbRS+JHjxwi0TRYUlTac8r/1afaTj/kgQs7XSsu7+6Hj7oqlN6S0Q4ndXH
	LUp6PjUiYK5kSbQ74w8F7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756389776; x=
	1756396976; bh=OGZfAHvbSY8JyHgEl1wl2gThfaHwNzf7suY1jP1VvAE=; b=O
	8J9E/jxoNiOSENIr28OD9WsF7vi99QWEAZ3BUS6HlOgNQQ2WjRH6kNOsuCodTC5i
	h5WZ7rVLwd6M9VteZvMLdzaQ4zRRaGSlCjMCxV+zzQG/3YAj2y1QRnVSx0rsReTP
	LukbJSTMCXvBtYqyB47pI9co3FRifKFaJr3+AsP8gC6Q86Ei47RNUHE66oaOd26/
	Jt0pPLAtOdyF1KC7sRgkZA6tFzWjKFn2Mw6594pInmyJcHfYylTWz7CZAorTThnQ
	PcrADF1+slMoxcbXPZKisjH6d7Ab77DvERdm/t1iGA9HgJ9RvA1qsoplDpG33aH4
	BACL3405AX3Taia0CPsaQ==
X-ME-Sender: <xms:kGGwaJEkjCoRUtvdEgA8FtQ04mDvpslryNf4Xy5X4-mqm-MAUcvZNQ>
    <xme:kGGwaFy7Va1_NUwHdmEOPLi44QdhvRFDdeKnW7ZJV1JwoLSLdiPrnfeXqN_LEL2l-
    cCSMEpTQzzxD2_MGS0>
X-ME-Received: <xmr:kGGwaEF6bKaEogzYjF8EiiPlfIJt8KrdnfcvHU0hA-dL43Ug-Q9EHmEKGN959XyEsCEIS66EF-Ppg1LAX_iRI5KXJgHJVqE5zxGYlQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukeduvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepve
    ekkefgjeettdduueejgeeuteduffefteejudegieevuedvieffteeljeelgfeknecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpeefnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohep
    ieegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdhgphhiohesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhhrghnnhgvshesshhiphhs
    ohhluhhtihhonhhsrdhnvghtpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipd
    hrtghpthhtohepvhhkohhulheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqfigrthgthhguohhgsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkh
    gvthhtvghnihhssehophgvnhgsshgurdhorhhgpdhrtghpthhtohepkhgsuhhstghhsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehsrghgihesghhrihhmsggvrhhgrdhmvgdprh
    gtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:kGGwaKDu5dCxYDDc2xbzsVtPzdTjQRSl0IDwVVBcn_JEBcbPzC0l3w>
    <xmx:kGGwaOnMJEGKNXgAqbzhHKy0YCSLf0Ol2i35uGUKrxC3v-7cpnuInw>
    <xmx:kGGwaMqwzCW27I9TX2ng6I9-xHGQnJhjfQggasPoPO5TzcAq2HkHmg>
    <xmx:kGGwaA41oNoaiIsMYSzTrXGKMZEbYyl38v1tWET9r-fE6aVa4pisVw>
    <xmx:kGGwaByIdlklubDRh3vFevLR3WQcNcuXxTdF3OD50myljGaCEPE16BaL>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Aug 2025 10:02:55 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 28 Aug 2025 16:01:46 +0200
Subject: [PATCH 27/37] dmaengine: apple-admac: Add "apple,t8103-admac"
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-dt-apple-t6020-v1-27-507ba4c4b98e@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=924; i=j@jannau.net; s=yk2024;
 h=from:subject:message-id; bh=Wx0RPczYgOK8CdqFLuZk+hLIaDjGO8awzo537j54hwE=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowNidYMF6LFHV5u77H50aO/btFW26v3+ku16lXmZi7S+
 /syQGh3RwkLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQ3h4hSAiXgVMnyPLchwrj/OwpOqnro1
 Zqt2q6fKPfuQpVPv7+Z4Ea98M5fhv1+ESIHnrn2rdzz3dV97x8W6cVXByUe5C9n8cuybl5WnMQM A
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

After discussion with the devicetree maintainers we agreed to not extend
lists with the generic compatible "apple,admac" anymore [1]. Use
"apple,t8103-admac" as base compatible as it is the SoC the driver and
bindings were written for.

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/

Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/dma/apple-admac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index bd49f03742912198804a02a22e38da2c21093761..04bbd774b3b444f928986c266c53becf286daeea 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -936,6 +936,7 @@ static void admac_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id admac_of_match[] = {
+	{ .compatible = "apple,t8103-admac", },
 	{ .compatible = "apple,admac", },
 	{ }
 };

-- 
2.51.0


