Return-Path: <linux-i2c+bounces-9046-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A401A0B6DF
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 13:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6967A160CF5
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 12:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D11A233141;
	Mon, 13 Jan 2025 12:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ct/8toTL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A42B22CF20;
	Mon, 13 Jan 2025 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736771222; cv=none; b=XDtLdUqzCIwehY5iLN+TYGQ4XT4DHX1xDViZq33C82wvwkOTi3IS5iDoYQhd+Og+wH2CQ5en1Gu30qh5ZZEkOMndNYSR4chxVaRaO0/0rGnFS7UBEatAXXYhW61mmRfpHQhp+zFOgNv7moLxtPNlajxOeKCHUsd2rfh9dUemkvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736771222; c=relaxed/simple;
	bh=g5laTRAgY1gdvIii8C9AlPVnsizuMBnSyfZ01yGizLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aD+aVzTF9HYfo4kPuGVKGuUL4P8nsaHhZwDXShdyhic+VwPcrGgmcItdaAAODF8ueeR+v7VpDG2EsX0V/nOBE+IEHuwam92TgTt6R5w9Z8wh2bRzeN5WOrv/KJiJPGzwHI/vM51VUr9FClhEvBMIPqLm8JaCd465CYFCYL2Hs6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ct/8toTL; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso44528555e9.1;
        Mon, 13 Jan 2025 04:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736771218; x=1737376018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2aP7wxtN8DueoMdmDqjwDxDgdAEwzbMAGyBqdL8kNk=;
        b=ct/8toTLHj7xWOZI9gPC/wX1UrCNCplOI53o9pWASIfBVTUQGCtKSFBEbMT04hujok
         2ba+ArG0i6CE6yztinB3Rq5/7nX/FNn+AzHIDN9eITJ0JfnW9Tzx10vsgeLTNkxgq8bq
         It0Nz3PdhvlWgV9KLsKCyfd9pTDDy3TzzyJtTMYCOEMEAIR3kIENjrYs+wFfQQgycVbu
         WadHxq1rFv+VM6mepozM3eUzEUZPavsfiTXJIykvRxFZVooQC+T3qSs4aGSOkNC2GNJQ
         LzsnXUePYBWmSGQ7T03v+QbQqE0moeqAjb/Apzk0cTU6Mwh6gfau0KjtRqztMsLzdNxZ
         H2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736771218; x=1737376018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2aP7wxtN8DueoMdmDqjwDxDgdAEwzbMAGyBqdL8kNk=;
        b=LQ1W5LidztfUJMSOZUQ50g2aUfMvzf9SeE2td9OY/XPdGhrOVU091CIl1ILmWi3Pf6
         XLD4KYT2xzRlICVccQJspoB3SrknBZoXD2ICsbi7ZyP2LaVF23FxEd+n5zF6c+oSte3C
         RxsqWC5/+Y0AO0eDPmABZRCkEK5YRPt+Ckg5+CsptmjAPnQ+BSbHhxCVDw4WIoBfVnJK
         k4DWIcASW2mBygvkuatshOTP/agyHWDPfOUca9lefFHkhYcswb/Cxyr1/ecQx+IeS+G+
         A2tCWSl7UzVK2HIYbynCQ1wYeEzzFvgF5mzGTe+CrUAYhiNVBB90NkudFKhfIV9t3pH2
         /xHg==
X-Forwarded-Encrypted: i=1; AJvYcCUkHkCJnXG1//61Rx0djDLNMqdeNaxUAoOC1TlrmHzm4OoDDHDANjDH8880h78LQjwbBPZQpOgOPv0=@vger.kernel.org, AJvYcCWPyvYebKE8dABgNSdXF7+pG+NOJZC+VfkYBLfPugsvUOzcndDw5SnN1VD60tCXcNxGmskP7tNtlY4VBzJD@vger.kernel.org
X-Gm-Message-State: AOJu0YwunTzy+5Y9Wue0rMcJaVL0RlUoChHnwQXA0J33Juargk1/KUUD
	geg8jMomt3NWrg0SPVO1WUUqQDEZ7tLk6ks+Gyj0ag2a+lS0BXTx
X-Gm-Gg: ASbGncvHrRZD+BIGTjb6amz+xCY81HRoW82qS6SAmZkGNsd1b/0LhFY4MT18mwrtsO0
	/A95yIyszG9I67VzsJ+3zZFN8MmfLaCke9dp8nZ5Yk6eQLgcK/ze+S98eDyazE3EqnuQxUHT6Mu
	E5qeHhb63AFWZr28V27YTVBxqM30W8g8D6arncPNvAlBgciUvpjbQD9h9RJUpMi/SzKH+o9Dcdd
	2hMMjNMY6IXe2aXYjUEmNVR181XlS5DHzJ3D7c43eUsNZv/3SozOXHauYw71RLo+LCVXrky7o/H
	q2aogfg8QA==
X-Google-Smtp-Source: AGHT+IGJhAZPHfGuzXSp4PexcbIZVhg0NX65E/CP6iiAhT3eDL5LDl4cE6PmjldbdowNvvGvphfpIw==
X-Received: by 2002:a05:600c:46d0:b0:431:58cd:b259 with SMTP id 5b1f17b1804b1-436e26f4d53mr189728405e9.31.1736771216661;
        Mon, 13 Jan 2025 04:26:56 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:acc9:404c:3a6c:d1aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c23dcsm11812720f8f.101.2025.01.13.04.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:26:56 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 02/10] i2c: riic: Use dev_err_probe in probe and riic_init_hw functions
Date: Mon, 13 Jan 2025 12:26:35 +0000
Message-ID: <20250113122643.819379-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113122643.819379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250113122643.819379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor error handling in the riic_i2c_probe() and riic_init_hw()
functions by replacing multiple dev_err() calls with dev_err_probe().

Additionally, update the riic_init_hw() function to use a local `dev`
pointer instead of `riic->adapter.dev` for dev_err_probe(), as the I2C
adapter is not initialized at this stage. Drop the cast to (unsigned long)
in the riic_init_hw() function when printing the bus frequency, and update
the error message to display the frequency in Hz, improving clarity.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v4->v6
- No changes

v3->v4
- Dropped `unsigned long` cast and updated the format specifier while
  printing bus frequency
- Since the changes were small, I've kept the RB/TB tags.

v2->v3
- Squashed dev_err_probe() change from patch #2 into patch #1
- Updated commit message
- Collected RB and tested tags

v1->v2
- Collected RB tag from Geert
---
 drivers/i2c/busses/i2c-riic.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 9809ac095710..4e2add343c9e 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -356,11 +356,9 @@ static int riic_init_hw(struct riic_dev *riic)
 		rate /= 2;
 	}
 
-	if (brl > (0x1F + 3)) {
-		dev_err(&riic->adapter.dev, "invalid speed (%lu). Too slow.\n",
-			(unsigned long)t->bus_freq_hz);
-		return -EINVAL;
-	}
+	if (brl > (0x1F + 3))
+		return dev_err_probe(dev, -EINVAL, "invalid speed (%uHz). Too slow.\n",
+				     t->bus_freq_hz);
 
 	brh = total_ticks - brl;
 
@@ -445,10 +443,9 @@ static int riic_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(riic->base);
 
 	riic->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(riic->clk)) {
-		dev_err(dev, "missing controller clock");
-		return PTR_ERR(riic->clk);
-	}
+	if (IS_ERR(riic->clk))
+		return dev_err_probe(dev, PTR_ERR(riic->clk),
+				     "missing controller clock");
 
 	riic->rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(riic->rstc))
@@ -472,10 +469,9 @@ static int riic_i2c_probe(struct platform_device *pdev)
 
 		ret = devm_request_irq(dev, irq, riic_irqs[i].isr,
 				       0, riic_irqs[i].name, riic);
-		if (ret) {
-			dev_err(dev, "failed to request irq %s\n", riic_irqs[i].name);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to request irq %s\n",
+					     riic_irqs[i].name);
 	}
 
 	riic->info = of_device_get_match_data(dev);
-- 
2.43.0


