Return-Path: <linux-i2c+bounces-8501-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C79929F1495
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 19:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC10D188D342
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 18:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AA51F03E2;
	Fri, 13 Dec 2024 17:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTCbwpSA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1801EF0B1;
	Fri, 13 Dec 2024 17:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734112726; cv=none; b=IAYVA8K/DjLlMlfA4bVskGMBPIBIpnPNTJCnCKX2K+8Qg0MUx2a64d83Zlxy03uRQ2WONIy/diKwfggSp6VHIHqkWo4YVgIPF0dI0tjPFnH6smWygibCskTKcAjbQP5rpHBbgagMb+z3/3+CgQ6UIGq3pIyTLYchYaU6qbUqDhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734112726; c=relaxed/simple;
	bh=A+D4b3BQmPK+Wger8wye87FzQJiq5IArXnw1p0rbQTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZYCIcm04Bp+uNlqRSjyvGCFn3VJYhw8iTlGTeL9xDycyZAANzBQZZX7GzVUTVIyEzPu33O2DCY2SsRjxLzRuPeTYDWGKQTiemPpvIT9VKWDBsoIxkcKC2B4wgZwF8EMbzio+jm+eQcLjx3GgpeVtsz1RPv5hjUhzMXg9x27azaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTCbwpSA; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4362f61757fso8221635e9.2;
        Fri, 13 Dec 2024 09:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734112722; x=1734717522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAbrDsxEvILPM2FjpklK/XIsRBEt8VddEL8z2eQpt7U=;
        b=QTCbwpSAR2to7awKHQYXVTUfmfhUTEV1gpctyPd8sEupWoX6d9Cctl5Y/EhPVAC0vS
         RUI3nBxPP35KUUOkMPntULhRGesnIbfN1cW+Qi4djupWejCENnsd1rRJZumhVqFIt/ia
         bKQ4ra+3cYPyY4Mw4004sTIdszDZuGW5qm47xb5blFEtyVfvO9eNaScxxDawP3Xz8fkC
         Kgj0DCkYw3nksIjcCotv8JJHo36Y9m7RJCLXCnwFtrSfq26kLjL0eO8s6xuV21OEfp4S
         RYpwnpE+H2nwympJvzH+SCt16MT+zywIMEnDG14Z/v/qMx3wJp3fMTuS7F+6b/+3MvkU
         M9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734112722; x=1734717522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAbrDsxEvILPM2FjpklK/XIsRBEt8VddEL8z2eQpt7U=;
        b=tWhjdHqu+u3+jeM133NW2IPQJHaKoriOSxCvJ6+d1NooY9yzmrnB9Z/Lu6/jj/Qt0o
         7dzssOIvmfxsh2s8FfKD0+AQrJYLLNRm30xD1gZ/ARf1nm0Mi/ZpU0sHbXyQe2hvsy9Y
         /5dZrQSI2J+3yU4AK2SQ5YZwrPlrh3N9FNTym6zJYrxIPYLejyQD8juDyovOfja3njgC
         bj//9Ev8VMEP+RU1O2G8TzY+IOK+N8d0tGAHyaAxIQYSUZWTZyNp21MQFY3lE48ykvh8
         KF5oFuk+rwT5hl4XZbmxkw4IKIUvwcMBnP8gk3NNO7V29TYo91SPlAqX1CqRr3lH101O
         Y6Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUqgFRA74G1huCMOsB16wnM+k+o8LpwWFbtLRSeSbotpuhFgyPHNE0pf22JuYykPLhjZWcEEAX3/y9p78/9@vger.kernel.org, AJvYcCWpTu26kW1lbKjj0kODHxUDu/oPMvz2F0d2YTBsiXkZKQyFg1rzNT+ghQ4pdt8eNIzkivz/yYXURmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ+zYY+7nxGdO3+4PUj55jC3DA6NAeayDXdW4Wm6LJktbSwh1K
	fOfxwHp1KWsTifCyiJDtjgKqV/yfCyAhoS+ccLXYBp/UKmo7EQoQ
X-Gm-Gg: ASbGnctqg8YDFsxEdNSl29liiXXI6kjW7NS7j+9CjMeYLXcMetG9WYFAH/lLiWtd3hs
	TUtyxZXKdHt0vz04HE0P4knN9J11WZDZ70UJN5IWqKeLgBK5o3GY5ZZLnHMEkKq7IGrFjze9zhO
	0bPHkQFR3+ioUT+nbH8/VjRQqSsnTfMBCRdxs1YGjF/YeNrtemzzMXBMmMlJvp7VLYQFgeaGWpU
	ku6DOFHb2xGAGXn482edDtMJT1mowRhIuKf/2uacr32ncgeNGmZhrjxgnkeTJfI2/bt8osykz12
	42jFqClywQ==
X-Google-Smtp-Source: AGHT+IExtUcM7v+BXqiojll9F4g7AwEvhZz4YEHTKyRS6TOwpMVgvxozMVyz1/IHnc3IsPiBBD9xqQ==
X-Received: by 2002:a05:6000:184f:b0:382:3efc:c6d8 with SMTP id ffacd0b85a97d-38880af13bdmr2651725f8f.12.1734112722356;
        Fri, 13 Dec 2024 09:58:42 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:4eec:e99c:89a6:d7a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c804d573sm119088f8f.64.2024.12.13.09.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 09:58:41 -0800 (PST)
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
Subject: [PATCH 7/9] i2c: riic: Use predefined macro and simplify clock tick calculation
Date: Fri, 13 Dec 2024 17:58:26 +0000
Message-ID: <20241213175828.909987-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
 drivers/i2c/busses/i2c-riic.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index e51bf911da0c..48812e7d9cef 100644
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


