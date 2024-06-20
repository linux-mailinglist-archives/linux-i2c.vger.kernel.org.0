Return-Path: <linux-i2c+bounces-4140-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A10910FFC
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 20:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA0A7283E1F
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 18:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4306D1C2327;
	Thu, 20 Jun 2024 17:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="Z1WAPFAm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CAB1B9AAF
	for <linux-i2c@vger.kernel.org>; Thu, 20 Jun 2024 17:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906284; cv=none; b=JXhb0zf1PUlN8r+jM3SfWcL4Klf4IUiGa1ZZWF1Tf0OflP1Ik2w+QrukqAL2EkEgiouim9V7sCGO6UkoP3eklo64PcASuI8dvij0/Xd3Ych5movibvzU+/zH/hrX7mgGpZp/3u7ePB/b+15wJKWUDH6c1JE23xbsPNVPBS57elQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906284; c=relaxed/simple;
	bh=57mSqvK5F8icDZvtosz8MW5pSg98mK2P/IkbkOYFjBo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bb9iFGhzjJ/QtTwCJ2XyU86nqALJQVubD5z4yJE5j7Gh/ryhDvOYHoyFOlj9JSSbckPsTjxshcuCPW7UOFWDHO7DpwMoOUkBoeLZW+SXmFpN1IfJt1LD2fAfcFdmA5F+V0pHh3hB0TdEXe6FCEg1NpOQhCkhbbZlKTX2qwUTB/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=Z1WAPFAm; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a6e349c0f2bso138732566b.2
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jun 2024 10:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906280; x=1719511080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLJSsUsQJimHeyehvy4obxzFbfnPiiocs4Of944Xm3I=;
        b=Z1WAPFAmggyZXgLQQ8xHRVLJyIdVqTm6EFiZQkqU98DYk6IGKMtR0IbCNv8eef7YzJ
         4U5udbizQMs46zEqIFLLcbKD6EtEnSEv7giK2XYYh7iwjvYnoT/O3BVQt6wbbJy8D2jR
         WvPVWf5OPR+9R73AdLBwFo6uXDNiyz4Q0GVRQbP4JgqR6vr1DSMg7WEOq3R+k69zaT5i
         VDWjNunvXVyqv5ZGr2lZ8ZG4qGUrUJEnTdNpG1agdy5Rp1xak0eQNgAdsOXgyqale1hO
         FHt1JdLhWZ4fm+JxXSREDbBVDzEf+viVWyUTEj8FpRgGHT6Fa0Ul950C885uZOllMtUi
         WA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906280; x=1719511080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LLJSsUsQJimHeyehvy4obxzFbfnPiiocs4Of944Xm3I=;
        b=lYcNc4tR+JDC8s/uWD5uSaYY8HNNas6/RJOvF/qKQj4ELAkAK9Dw+JhtP0lU+VYuGZ
         +PDoosrNRIJoAKjW/bK8ODOivNSJS5EGDJ1+y3vFjzC3euHB+rchtfp9LERLZgz8E1ny
         dBuG7Cw8DaWpviBMQkHdyR1/yOzDjXFuhPQZbHZaie1BYt/yuJwiAsyHV8ORm5bmk4I/
         3yAK7kEwOEXPL1qiXnm9cb2T2h8M6Z9Xw3iPcJS/CEb/0Xmp7C4Qky1RHy6RJrfV2bUB
         npd9L8q7MpIjKty85zzUdgSdTOXqgGCRWYKqnOLvyjiYc4mwdZicFyhh1x4XuIQMnvoY
         l4BA==
X-Forwarded-Encrypted: i=1; AJvYcCVsnb0VpPdylDsCTUkjP0oqG7Qc3ePbow4YGmBEPuXUqdNFEdk5SZiLkgb8ZL5groC0Olrenu4ozotaLT7EfnLaCpNQMAdOgvT1
X-Gm-Message-State: AOJu0YyLoEhrodvhWlDLLKY7I79iUfj3aBBPtwrGvDo2jaQUC2u0dX4h
	9CxB4/dSir+P6eZ7lX8wA39mVzI8TrhQsedcy/awmVQ0HFUPhqe6KLMJAytNIPc=
X-Google-Smtp-Source: AGHT+IGXtwYdokrlfBxhK8FxTp2sWYE+r/rA8OXrz8ajsAvjdcVPMUue0BkFzpXPCbEPXWGLdile5Q==
X-Received: by 2002:a17:907:8025:b0:a6f:147f:7d06 with SMTP id a640c23a62f3a-a6fab7de093mr273780966b.77.1718906280266;
        Thu, 20 Jun 2024 10:58:00 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.10.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:57:59 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Markus Elfring <Markus.Elfring@web.de>
Subject: [Patch v4 01/10] dt-bindings: dma: pl08x: Add dma-cells description
Date: Thu, 20 Jun 2024 19:56:32 +0200
Message-Id: <20240620175657.358273-2-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recover dma-cells description from the legacy DT binding.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v4:
- This patch is new in v4

 Documentation/devicetree/bindings/dma/arm-pl08x.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/arm-pl08x.yaml b/Documentation/devicetree/bindings/dma/arm-pl08x.yaml
index ab25ae63d2c3..191215d36c85 100644
--- a/Documentation/devicetree/bindings/dma/arm-pl08x.yaml
+++ b/Documentation/devicetree/bindings/dma/arm-pl08x.yaml
@@ -52,6 +52,13 @@ properties:
   clock-names:
     maxItems: 1
 
+  "#dma-cells":
+    const: 2
+    description: |
+      First cell should contain the DMA request,
+      second cell should contain either 1 or 2 depending on
+      which AHB master that is used.
+
   lli-bus-interface-ahb1:
     type: boolean
     description: if AHB master 1 is eligible for fetching LLIs
-- 
2.25.1


