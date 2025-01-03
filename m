Return-Path: <linux-i2c+bounces-8871-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7223DA006AC
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 10:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FA11163942
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 09:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D0D1B87EC;
	Fri,  3 Jan 2025 09:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cULrHFKb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5531D2B2A;
	Fri,  3 Jan 2025 09:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735895957; cv=none; b=FCUiZBkEAX1CXashlub8H3oQbbpBmrPFriwDqizHA/bzkpUsxerrJy1DmuuhaZsVWbmR7hE0KN9JbxFA1W02mekNHR/UtxhDa/AN6g52w8yNQFFQxDHVVpndpi244nk0lnyUfLB8NA3WnSFKnhY7z529LdFB+UJS2O6dK5NEqSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735895957; c=relaxed/simple;
	bh=bULAalD5QJBL9vIjSovbP45/QlOuIW1he2eC8KwtC4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nl+z/CEkDnhTCdXjZ4zjDHZhOwDFvTfefhsY7nbIIXdaKPkT4/q2t2MDraEba2PAf69ExZeeMOhbTBFI5OYTg7P7aaC/P6a6KvJ8ArVtYtoSVpP4sdaAFkYbK/HrcyWiaMahsRqVj9CljVUec0nQ/utCtbHmmNV7d4kLUBtAqDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cULrHFKb; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso122759415e9.1;
        Fri, 03 Jan 2025 01:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735895954; x=1736500754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2OPM7TGlALYjuAONwjHdanb07QeJdpPzvLSV0+BUrg=;
        b=cULrHFKboTYMLKLCRvj2TwJhANTisYPLp+B6JxuooXAmyNN2WTd8zk8n23xpA/i7u2
         Vyrrlc7X5vdLYNZwEjKThhTqtfBdSxCHhjuYoDMr6AyxhYFPRSommvbCIiAIkfFKQQa6
         /GkXjyFVlzsvw1Sg4Y9rAimCbc/6iQoz8PuS9iilyd3omyV8nNpjteSh4Ia+XlomENFF
         yLfS37VgAgZzOfWp9Xvy99LMUEgh8+4WaDU2qGdfwPSWzwV9j5ZDIzz+3At9Hzr//WsQ
         3BDSV0Skps5CAvjAlunmjflrIsBailDb5/Zo+w+eCZcBmR/tL039ub/8wNeLqttUu9MM
         5zoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735895954; x=1736500754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2OPM7TGlALYjuAONwjHdanb07QeJdpPzvLSV0+BUrg=;
        b=KkXe5IrERZOvXPOxEwluTWnxufTRXBybsmO8j9rm5nqVxESXDhD+CxzDpH/2N6Ombu
         OoSM8u0ZiNQmNGbVxzXXz2Co+7wPn0LZLwQw64GQdDxBMlrupZtLeYytgPc+/O+q/Hnm
         aVlaBiYfSy/viW1KdZio5XHc5MpveUQbtsNOAU4lSvh+y8P5Ay+g2SDTQKeDhuhbZQr2
         kw9Om+v3K0yPqgB/78e+nftxzPP55KeRDZbzmd7Rbd438qBXfo/kKxJuifCdLQdGlFGU
         mejamTyMSZuICI+Oatm8N0bYudowxpH8My84hjBxk76rJjf5P23aM7BWV7EdOH+4hUFW
         ESgw==
X-Forwarded-Encrypted: i=1; AJvYcCUt+I8REl33MOctIhA7HbRgAv9o/AeD6PpwzNmRJBNaredarc13TRZN0XYqFrfzFKyJtV8rLoK9gCorPAfq@vger.kernel.org, AJvYcCW4l2f+s9r0Hkts+QlQwf86LLqM4T6oGlvvbcL3juPot4p5av0dx9AivfZc0pBUsY81lMacgvRW82Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwafCiv+2qLEoEL6RU7s8kgD7AGif4ZIjtGp2SvtsA8zWA/hCSU
	3HVnTgWmDKaV7JUEnAFuWViGYq4jJmrGZNlIzYyZPMrF0MfkG9oX
X-Gm-Gg: ASbGncs1VIhb9f+RSIN8ElLsNpcZJW1UgOHi/42ezA66VPFVczRSPDuSqveNCwpOs4c
	73CYUnjTOVuwrWghyE43xGtsWkdct9KV3PVXuQGtv/lSzfss0KmpaNGJLafTtTmM+1rCSyabOb7
	XuMLM2lKmOigUEmq+fSpKibACOo8iwpud+Is82xFfzYnIPMhg1j/i5WI76FuyUEvs+QGbIFG+5m
	9BKJVWN/8cd3RQPiHMiEZKgwUHwdvQxpFt5oHxVFVzgWp69Ku5FKeQCpP3LaA4y6BLTcXOVLCTl
	QFXN8uRFQg==
X-Google-Smtp-Source: AGHT+IGbXZOIhq3ZwWqYUA2M/NS4pwsMVul7dLJya/8cPi0GT77oEa4UlW158deCfcEPMlvC6RFLsQ==
X-Received: by 2002:a5d:64eb:0:b0:386:3711:ff8c with SMTP id ffacd0b85a97d-38a221f1fddmr36113049f8f.23.1735895953806;
        Fri, 03 Jan 2025 01:19:13 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:84e9:7adb:b646:c9c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366a093cbfsm452493275e9.22.2025.01.03.01.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 01:19:13 -0800 (PST)
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
Subject: [PATCH v4 2/9] i2c: riic: Use dev_err_probe in probe and riic_init_hw functions
Date: Fri,  3 Jan 2025 09:18:53 +0000
Message-ID: <20250103091900.428729-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index c9b2ceaf4000..9041936fde04 100644
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
@@ -468,10 +465,9 @@ static int riic_i2c_probe(struct platform_device *pdev)
 
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


