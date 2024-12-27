Return-Path: <linux-i2c+bounces-8759-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B399FD401
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 12:53:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFDD3163215
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 11:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366241F2C43;
	Fri, 27 Dec 2024 11:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lar2jGjq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571461F4263;
	Fri, 27 Dec 2024 11:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735300353; cv=none; b=TMxRXel90vFF9tQ9DpEC+Xsc/4QkWoMo19MMrm6VRTZzyfDjwq9B8sey7jhwf5VC/BRQYLfcVynUvTmUB5ga0RtxyZcA6pIz6nPmXH0BdQZFc0371CW0+XiTItzk2Tasp5oZ6Olra8YqVMc9vaCwGsSJDzxNvvQSu0dxFiVNbaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735300353; c=relaxed/simple;
	bh=64StuxBrvBnQvmF+a4yvTMMg+o+iA0UY3EvIwVFalTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSxkNuTsgeg7kCobqT1hFe2MA3McsdaciiVR+fczhezSg7+90JNXquVe09K36CIJxaXkexZyZJ3+HwMoD8AFgYrZW9ztN667iKNR7pa6wdOatLjQZ6Y2bU0rRYT3DAb/bxlbQK5O/NGe7hJ4BGPI/Mv61+NAwXCSIfz1v/U/AgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lar2jGjq; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f441904a42so9105247a91.1;
        Fri, 27 Dec 2024 03:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735300350; x=1735905150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F68oBqhMh44dH9Aw6MBNH7MGeSmZg+ZawOT9qNwzoiM=;
        b=Lar2jGjqlI+KcECaHSxzm2JuJaWrneC590c4LpMEQGpZBsELjROqdRUxkw7Y6hR6Wn
         8G78kxFP9S2nYsiJ5bXF9j0Q/SkNS3d7z05Kd7+BQvnUqjwkXc9K91KXDyAFQ5zaXbxS
         6lMYDij+WxFoXbs+XfvGKb+Rwd+VMHu0jEp23yCxEqVgkfomwBUgB/wsngG+eK9s7wHg
         RZbiVVD6GBDLayefrFfmEsiSy2NamIsvAHtBIf7Mg2mGKVb/UB9um5pWgkxtlHCwGtMt
         t+vkVVMNasvALP2w4E5lLZHkTa8B1xDkUBAdjkW1Cm7GiXRCmszytq0gC8YtCc6C66SI
         ttFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735300350; x=1735905150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F68oBqhMh44dH9Aw6MBNH7MGeSmZg+ZawOT9qNwzoiM=;
        b=qr+TEPHlhiOzsYB9NOTgfRF6lTJ8xRcX+l72GSacjg4tc4sZUgdU9AEnOhhCk231yK
         PSCuiWpe5pqFRtZQnwncCfY79BggWm4LDaQPHJlljQz0102wak8C24goKE2QBwDig01v
         +O6o2rD3u1ejnIy5euqGUvz2zt1J7mSuqjBz01LkeFA+xwpKHi0S83BSDa4T8X7kiOg8
         5zWWORSOQ1TVL0SbCscW5s2LsGYl+FYCBYIcRzX1o9GL6MY8PR/Kno97sWjG/Hp5yYwo
         Lrpzc4VASR+p2gCEaQ72qb2udyc8bbjSwMrnBxunuMHQNOmADlhVfypDgIJS7qsWMvCT
         vM1g==
X-Forwarded-Encrypted: i=1; AJvYcCVWPOAoXcmXnzmcPZHmzF68A8Ko3cSyfqVn8pR8RtZN+gBwGqYkJjceqWjY2QBQhPg1uhipi8JTXS4=@vger.kernel.org, AJvYcCXMbEuLbI4EOIJkn9t33RcaSnVHx35oBxIm4cjqd8jgrnGFD1zwtdWusznu0TXpyc/um3dh9SV+iw7VZ54W@vger.kernel.org
X-Gm-Message-State: AOJu0YwZN3FDHP9feYCfxSiv0je3C0IUUpgHE7CTNhXCz/xsd/XoxoKu
	6oSnBa50g/CF4RYoeoQM8XsG0OrbdSbN2GlAjoAKjeNSpaM9Rkx+
X-Gm-Gg: ASbGncvZSlEwfueLJROvMWc1oINx5yXxmCiSLni8Cme31Kr4uFm981PJDdjIdS0G1no
	OO1ZIQ33sKfs0q62dB339devB/+svnRfUhAr9/tsgVCceheVKrt8W8ikUQnGwKo26tynQsS/tkP
	NzuIvty1JttgGN8LQAsrFw56gGdMTmPEAyBaqzTNwN1WwCrumw3Hoch0PpJpCgm6+kkNb59RaPV
	hwT+5PWvFGGtJjvRcXixNNXmiOr0jH5KYuaamNfjQrLcRbC5ekJDMKyOkqLKid2kt7mRNKBngsK
	M63+HfQ=
X-Google-Smtp-Source: AGHT+IE+GHwcp2U0mfwQBqgIzk2BUQI+hEo1INr+GTD4RMqz/gzyNVwPGRV/amtwD6RtAHtD1sBkbA==
X-Received: by 2002:a05:6a00:2181:b0:72a:a7a4:b641 with SMTP id d2e1a72fcca58-72abdebb873mr31587017b3a.18.1735300350475;
        Fri, 27 Dec 2024 03:52:30 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:9010:ac08:3a91:844a:cc65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbcbbsm14363990b3a.97.2024.12.27.03.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 03:52:30 -0800 (PST)
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
Subject: [PATCH v3 7/8] i2c: riic: Use predefined macro and simplify clock tick calculation
Date: Fri, 27 Dec 2024 11:51:53 +0000
Message-ID: <20241227115154.56154-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Replace the hardcoded `1000000000` with the predefined `NANO` macro for
clarity. Simplify the code by introducing a `ns_per_tick` variable to
store `NANO / rate`, reducing redundancy and improving readability.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v2->v3
- Collected RB and tested tags

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


