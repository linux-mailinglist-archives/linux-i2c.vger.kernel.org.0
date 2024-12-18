Return-Path: <linux-i2c+bounces-8587-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3299F5B4A
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 01:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD2E916E5BC
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 00:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CDDE130E58;
	Wed, 18 Dec 2024 00:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cB7zsohF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756117080D;
	Wed, 18 Dec 2024 00:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734481002; cv=none; b=kAaAisQa3QZCqK4K6o6slUXTcnVMMu2WSaohzJVo4AWk/ASSxM9CMm6ubQZYjtLCKyeAbfWaVPneOesmSJO1zIHrYBJ/jQmdnZHWocJGxUMLegf02t1zWN/4a1SNkaBHH+rz1DL8A8IEv12GpIYdIEJS0LeoAQyDkna96kQaOoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734481002; c=relaxed/simple;
	bh=O1c21zXPV98doPxaxobc5HUNIhBfX4wNZNSJ9kJ9gb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S0Bx8fHAxSnCh8phDTArysB6RDciQ/N2P1ACK7KynECb1VGuqXgU1j54njdn8oQf5Xt1ca9xHgsctKxj06xRyiBQbkpIzBwnnBI8IEksnHrsjFcJYrBgNnmeG4Z+lfFSmtk5Idq7MI/f3UHIgE679AgyYxBsLnt2tGn5KhlSfNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cB7zsohF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43635796b48so1442545e9.0;
        Tue, 17 Dec 2024 16:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734480999; x=1735085799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9oPfnkJc0KP7YSiaXz3SeZPwKzD4vqchRwAXJW+KQs=;
        b=cB7zsohFPubXgfhN6yCwpIlnFINQKv115RKXgxJYp9F2oLP7bz3f6Zf3Rihd+no1GW
         5nopIfV1KsuebmTkx6Obru/qQJpwLP04ynWkH7Gg6R9uzcfn9spP20j6VcYqPoFin6QY
         4Y7sPT7GlV1aTNcIIySsbw/p4ARJT55L0IST39F5z7CVq944ea3lZ7z8rnsk/B6w63C6
         D7/YkQojLMGhYviwCw2fIVbUEyhxQwuvhPsZ45EIZMQhA4iI58GtY437ZnGKKlO3QVCU
         xGqdEbQV9mWXZBeCrN3BRseB/GXjJ+RCwO7cumGQX9DkpPgdWfb4qBsVs+ojWO8LRQqc
         dRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734480999; x=1735085799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9oPfnkJc0KP7YSiaXz3SeZPwKzD4vqchRwAXJW+KQs=;
        b=aGJQfWm6CAwpRlie6rQjQpwbCbrM6cHPaqnhs8Iae+cofhjTWtoS5RiWazwAQhauwI
         HPmBIUPHcW7G9i+no59op3In94ffIOc3upORbLMGTQLxQeSs68Zs2pfdPHMJ3nNpQueV
         soRs2Rd4vBqEBoqZvlU7u/JSuHa3b3ZJXyxdLBdFcJjRW9kX+9ur2j9x7lBgFBCq2DC0
         2ckdIKT46y58IWvRaF5odrGg730jAewqJE0+dPkVo9hxuFAQEZ+izE5v8Rk4X3nAqx5P
         cA2ReOV7z9DAOxZ88r3W/L/hyFnudZTP7qrUcZc9pBG1e0Yen7bk0oH4c2cB2O9CS/jm
         UrMg==
X-Forwarded-Encrypted: i=1; AJvYcCVz9szO4c0z/xNRBICMApUxC/qbciI1wKs0+JQxJSx6ttOr18wzv31gNLYY9A8UFHjl1p6M1W/Y2sDnBinq@vger.kernel.org, AJvYcCWf+PYa5O6uL8O7rnh1CbfF1QrmYh9CHLc7/qQLQ2toR1RJNsbEhzwhiujJKvL2m2BX/2Fk6GHuVqA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmnb0dbu+wkRfj+a1MDT0ZvQAIj/VpHpqSET5MEfrq2orIE5L+
	HLwr4hVf+9W3t48AT4uGf6IThInyT4VgAp7JAsH+krDG2aePzoHc
X-Gm-Gg: ASbGncuu4Arf8R0Or/FxOhnDRx1hQjvuuaJAGw0LNI2NRgdZ2vXpBNJcqkhxPijLaL6
	2M7i3a/FBIu5ZiAOe2JMOdnWRa6kTN2R72ah8n2plryCBV70LRnw2GByum3VEqoHmttR7rCQMgD
	YVfHd/mWSuvhdrsjzwRExL0RDyE0lvo2LWRhb0X+psvSBUVQjsGjut1q0moZuSC9KeHUYeytj21
	ocQK5IJZqVy1/wE+ETO3UsJfB0Ogqt0+8aAxMZJSzNbM39wfyyn1ymMvAeNcWfIcll0aR476j+u
	F3jB8VE6nQ==
X-Google-Smtp-Source: AGHT+IFIYx+5/25sqC0jeqDKLPbTtPIxvBxy4/NlXn1kqsUfczYDgo8/6SaWBRL/g173S3p+9grp/w==
X-Received: by 2002:a05:600c:1ca5:b0:436:1b0b:2633 with SMTP id 5b1f17b1804b1-4365532c98dmr4564775e9.9.1734480998688;
        Tue, 17 Dec 2024 16:16:38 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:ca61:1d3a:8af0:1c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b1f638sm2135495e9.37.2024.12.17.16.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:16:37 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 7/9] i2c: riic: Use predefined macro and simplify clock tick calculation
Date: Wed, 18 Dec 2024 00:16:16 +0000
Message-ID: <20241218001618.488946-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace the hardcoded `1000000000` with the predefined `NANO` macro for
clarity. Simplify the code by introducing a `ns_per_tick` variable to
store `NANO / rate`, reducing redundancy and improving readability.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2
- Collected RB tag from Geert
---
 drivers/i2c/busses/i2c-riic.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 378887b133a5..a2d0cde5ac54 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -45,6 +45,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
+#include <linux/units.h>
 
 #define ICCR1_ICE	BIT(7)
 #define ICCR1_IICRST	BIT(6)
@@ -312,6 +313,7 @@ static int riic_init_hw(struct riic_dev *riic)
 {
 	int ret;
 	unsigned long rate;
+	unsigned long ns_per_tick;
 	int total_ticks, cks, brl, brh;
 	struct i2c_timings *t = &riic->i2c_t;
 	struct device *dev = riic->adapter.dev.parent;
@@ -375,8 +377,9 @@ static int riic_init_hw(struct riic_dev *riic)
 	 * Remove clock ticks for rise and fall times. Convert ns to clock
 	 * ticks.
 	 */
-	brl -= t->scl_fall_ns / (1000000000 / rate);
-	brh -= t->scl_rise_ns / (1000000000 / rate);
+	ns_per_tick = NANO / rate;
+	brl -= t->scl_fall_ns / ns_per_tick;
+	brh -= t->scl_rise_ns / ns_per_tick;
 
 	/* Adjust for min register values for when SCLE=1 and NFE=1 */
 	if (brl < 1)
@@ -386,8 +389,7 @@ static int riic_init_hw(struct riic_dev *riic)
 
 	pr_debug("i2c-riic: freq=%lu, duty=%d, fall=%lu, rise=%lu, cks=%d, brl=%d, brh=%d\n",
 		 rate / total_ticks, ((brl + 3) * 100) / (brl + brh + 6),
-		 t->scl_fall_ns / (1000000000 / rate),
-		 t->scl_rise_ns / (1000000000 / rate), cks, brl, brh);
+		 t->scl_fall_ns / ns_per_tick, t->scl_rise_ns / ns_per_tick, cks, brl, brh);
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
-- 
2.43.0


