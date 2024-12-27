Return-Path: <linux-i2c+bounces-8753-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F34A29FD3EF
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 12:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F7103A10FA
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 11:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F30F1F237A;
	Fri, 27 Dec 2024 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g53+7UkB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D0042070;
	Fri, 27 Dec 2024 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735300329; cv=none; b=kIVIAkh3OsgqyneuDAk671PZV+6AKcQJRo4pGPE0yUjK9by+ByedArC6nrfHO9Q7rH3uO5xHj7UL7c2S0ZbydcrHux9a8807UsUEi/aT743Cte9tKHGWHOfkJMUlyX5g7clobN1h2vMhj8yvK/XVEBAQUNOwv+kyI3gqSMgj/S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735300329; c=relaxed/simple;
	bh=lrzpHr/DFhrf8Bni+hCjVrbzYexPvT8SpQ48LcVmilE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQzKFmMgzZ09jx5X7YMmXqmUj+GFjZpcHt6fpC4dhUPevjA8DD7mwW8PoPSQ3Pm6FUZtRsn+Vr8Fb3DcAq7itpjMFsilmY6tVQAxx9ww3x0Y/9XvOn+17SGeduE8iZRW0xHeyVT6oe9JWs9Iu32vQUfhJo71NGcKYrXTixC6dnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g53+7UkB; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-216395e151bso63220695ad.0;
        Fri, 27 Dec 2024 03:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735300326; x=1735905126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6ssRe+un38eDrKoU2iPeM3GHtYdMNvqdXI/VFe25BE=;
        b=g53+7UkBBKztnGrQVrZBzRhu4Q31NGcQhr3ooPd021vf004UREiQjOTQGiv4EEjK+K
         BCPi00Xv/DZ5NNkRjbRXw0DEuW1/ZhZqvE70SRwIkbDLnyyyqiXgdP6ejzuvw9MXAZzD
         3LXotVRTCFDkeZHLi8iLBrUeSDpb4ZTpilt3dH3IkQ3hAuDYa+PXLLzWUIUSWTCRwgOP
         vvTCP/zyPhKkPUFfdLTLaLWfZuH9n6byr9AmMLk5BoC+F4l5wcZO57qSSxmkg0uduDsZ
         80l6TVYPT5r1pMm4cnvQD2SEwsVQJfx9ntpumucpslWLKgP2Bc22dCCn3/PfmOky19Fq
         5uOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735300326; x=1735905126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6ssRe+un38eDrKoU2iPeM3GHtYdMNvqdXI/VFe25BE=;
        b=b1pfsiGU/ujDgnqZN1hTN/f95f5cD+eW7XpsH47aksV/vLaK0mOBM4brqK8kTtImod
         tBo4x9YlYoRR9KKQUBUeTB2DFd5jzQz3vYVlxsqOWYgoZsKIurtah2UILn0AnZdbS1yL
         JO6gdgMxXVHJpq1XYwsXGMyn7oNc/6XoW7DYdKO7Rulfz1BCP+wYBOpBMRqjn8mu2KfC
         hizQme5X0rPJIAUME1Ud4HEIigPo3KCR4vcRc5SAa0lOEQDQeG9gQvT+6NqlyrQFI2U1
         y8UtDZ5dBauvOUvVZF9tcjICvdBfqb15UoJTpz4r1+Is7GcXLlHNteVRFSKGTz4ZyNbs
         oZ4g==
X-Forwarded-Encrypted: i=1; AJvYcCWVTCvJotIsJ3sjNmu72+ExPik6AfhTFBuRAwZhox0B1+4/i++BGuLi5vfauRJhDFGRsxTjEJe03HOedp81@vger.kernel.org, AJvYcCXdxEQtgPxCqSbmHul8BocYj4nBGu/AREFx6ChLLPY9DjhJSrPNYwdmcz5rV57CiRss32qfjHJZp1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRcVB2J8+oP76nJ6y1CaTZcmC0vU8iW1eO9pmC52dXbiseat37
	sm1bIW9AypTZKbolLdR/iqPDmHMgHmLl+cScDGZby1eUTcefXgq4
X-Gm-Gg: ASbGncu1x4CROYCPfD359686UkJEXOcndfb/TpadzGN9IqdlOc+fBqXmWCWMQqR69yU
	zQUWcVWGBuSDVYy42rVFMABF7l540LatWS18Ew6yPUgXIT6ezrP2xnFObzit9GGB+nyq/ti52FG
	RIUFHWYwQOPfPr5BFMs2O0xlojQWNiMo/dHZy6pD2bzfX/VSJqtsn5Ybo0xD+5m2cCGiQZwcGQ5
	RyZ5pixIrhF55BDAWrbLM7rHj73nm+FjF6uDzxpEj90cj8h8gbgWU4cTJvhAotURaCy1nm3YsLa
	7Tg3sGc=
X-Google-Smtp-Source: AGHT+IH976eqe87smpQrJsBmFfU4YlGmuUtVPebyMpbeHhKOiQIG0hRM7WOw5glEbHrVK7JixxoTXw==
X-Received: by 2002:a05:6a20:2d24:b0:1e1:b0e8:11dc with SMTP id adf61e73a8af0-1e5e1fa14a4mr32499414637.21.1735300325718;
        Fri, 27 Dec 2024 03:52:05 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:9010:ac08:3a91:844a:cc65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbcbbsm14363990b3a.97.2024.12.27.03.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 03:52:05 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 1/8] i2c: riic: Use dev_err_probe in probe and riic_init_hw functions
Date: Fri, 27 Dec 2024 11:51:47 +0000
Message-ID: <20241227115154.56154-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
adapter is not initialized at this stage.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
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
index 9264adc97ca9..e1babd5077d4 100644
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
+		return dev_err_probe(dev, -EINVAL, "invalid speed (%lu). Too slow.\n",
+				     (unsigned long)t->bus_freq_hz);
 
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
@@ -470,10 +467,9 @@ static int riic_i2c_probe(struct platform_device *pdev)
 
 		ret = devm_request_irq(dev, ret, riic_irqs[i].isr,
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


