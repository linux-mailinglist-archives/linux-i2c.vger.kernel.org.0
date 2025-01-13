Return-Path: <linux-i2c+bounces-9051-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE396A0B6E9
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 13:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04B951623DA
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 12:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A960E23A59E;
	Mon, 13 Jan 2025 12:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diG434a+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A26239799;
	Mon, 13 Jan 2025 12:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736771226; cv=none; b=gOq+XZ1aBcCpCBBhNAVbRKbAFSezO+ejFVMdWzoYDSvRK59qfFysPPrEyq8Wfrq6+MJEawXjiyLdQ5KpqMiGvrtdu1YvMybYEbevicFF4lB3jKlTzTTzV1yHdLlkRR77WfBL9drPxRISO2DEZnQjlcAEQG0oXTfim+cBhmhMa94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736771226; c=relaxed/simple;
	bh=kxkVdWLNWABkMrhQXDHs8153xINcmHXb/kPLxxUgWhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOsTAyQP7OIZ5wk/pPzi1dEdM8VvR4iM9ymSMFrj+oEy2g9H9zO/jrr7+y9vI9N1NVxlixdA9JZvtcokxOnPNFpusIlzYj4L9z2fS3xsdUuV8u1ZQ2fk10vRh3/Bm7AwBXjgERrjQc2Pqme5I2eN8Ll0LsA2+PVoc1glDtQmX5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=diG434a+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436202dd730so29766455e9.2;
        Mon, 13 Jan 2025 04:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736771223; x=1737376023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ep0KfFAO2kailNpwGXc9iLyPxYa9AKLwF9zXOgKPL94=;
        b=diG434a+9zVeYf4ZIwXWFqBIi2NptFA8Tnoa/zHPqVmmX51rTqFXGcQ+OOmnKWr7/N
         bcBT8Oopj7abQ+vkoEYQ2g2IR8KLCDjbdf6fBvCvx+szTZs1Oz8QylbWuaGUwCtGQJ6f
         YL8xur3QSTkCXK0dxqyJLwN1lH0eiWIYsv1NNe7V+yI9meP8WeTqTQflNRcDEl1810dA
         aMhVlDOyciMHFnR2tbilw8R7/yOVo5SXQRgJcuDC5PFQeVEpBw0f2/1fY5ZYoTKQKheb
         zHgbw31fUA05ioPScrWWHxB5GvCQSgbyx6KNdBgfLfx33w0lKe8yFZmVBQ+0zMvg8lNL
         zcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736771223; x=1737376023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ep0KfFAO2kailNpwGXc9iLyPxYa9AKLwF9zXOgKPL94=;
        b=MnlEBc+GUdBP4F+pL0l9I3GONyM8v2RthqMwuvdSpFltToPH99rEnNqW2pjNilcrIh
         6dniBGAIcTTJsAg+Ia44DqMuw7nwsdMRO5RukM1jd657JrcUUhrVGHxp03SoyhKAZdgh
         Fjy4DU8phz7udyJrohKsQOLiccU53gyE0618zG4s9WWrqeDseBrUCFZ/58PQg2X61jEf
         XxbRxuYBC/ahECPvvm9R81eYgiGoi8zfO1i/EoYMkra2AQ4+Nb+MKMYkFT42ZyzhqU9g
         4i9nDL/H2hQ12I48OyPAceksGScrywaEpXbnfzmzcogDSYmBEgkL4NGfVRCl7wcRgoSY
         lJJA==
X-Forwarded-Encrypted: i=1; AJvYcCURzyYlztPZ83OdkYW9kdr7lnRFozKQmRJ2MUpSJ7p+Z9X6FCzUAqaFEKfTmNi4e2IluJIEvxQEKOeIDO3+@vger.kernel.org, AJvYcCUxGZ7TZtinU4RdZwPY9yaGPR+TtW8YzU/y+WqGirfyKC+aTtrx7X2r3aRVuh+8lqdND+q457ny+9c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/IDtG7O6iQrkfjLRI7kYVAVnPgjuzTepfHt+RXCw5ksQk8utO
	orJXetdAhptJl5Cc0JMq9+x6+faQeQAzHbs8rMHCSRpS3ENhlnlLxc1ece3lDrM=
X-Gm-Gg: ASbGncvETNYpeJpeB+cmrzzUR+no4qfrCAX9Y1z8+W2ecwbypJSoDpUHkDkCv8xS1sE
	x/eQil4LvYvoSpQsNL/fursOVb/7XcUQx4TfP04SWzfg7WwvK6uqWKYeG60KcqvNyLugPsTbt1/
	mMcsjaIxOdH+rIqoqbp7ufez74mPKj0Z8SfD/gn/UyAqZBg9+gy3cr2EeUumDOtDIX0npxbLZXU
	XdYcALZSqUdSnnp1GTk0FUeyST72H+ZGR5vTqPVw5zSblMV4Z8+WjNEn/k4kvTagkvzoI61Ef7X
	BGMGqF2jRQ==
X-Google-Smtp-Source: AGHT+IFsgLgEBrMB7TTIJ/qjyTgtk19I+bBa9GftLkpjygWN6k7hLa5OVQFYWM3xH/JzRmnhoP+0xA==
X-Received: by 2002:adf:9787:0:b0:386:3e48:f732 with SMTP id ffacd0b85a97d-38a87303f5dmr15132911f8f.16.1736771222734;
        Mon, 13 Jan 2025 04:27:02 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:acc9:404c:3a6c:d1aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c23dcsm11812720f8f.101.2025.01.13.04.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:27:02 -0800 (PST)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 08/10] i2c: riic: Use predefined macro and simplify clock tick calculation
Date: Mon, 13 Jan 2025 12:26:41 +0000
Message-ID: <20250113122643.819379-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Replace the hardcoded `1000000000` with the predefined `NSEC_PER_SEC`
macro for clarity. Simplify the code by introducing a `ns_per_tick`
variable to store `NSEC_PER_SEC / rate`, reducing redundancy and
improving readability.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4->v6
- Included `linux/time.h`
- Included RB/TB tested from Geert and Wolfram

v3->v4
- Switched to use NSEC_PER_SEC instead of NANO
- Updated the commit message
- Dropped the RB/TB tags

v2->v3
- Collected RB and tested tags

v1->v2
- Collected RB tag from Geert
---
 drivers/i2c/busses/i2c-riic.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index d1768b38b12d..aa3e4f430b11 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -46,6 +46,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
+#include <linux/time.h>
 
 #define ICCR1_ICE	BIT(7)
 #define ICCR1_IICRST	BIT(6)
@@ -313,6 +314,7 @@ static int riic_init_hw(struct riic_dev *riic)
 {
 	int ret;
 	unsigned long rate;
+	unsigned long ns_per_tick;
 	int total_ticks, cks, brl, brh;
 	struct i2c_timings *t = &riic->i2c_t;
 	struct device *dev = riic->adapter.dev.parent;
@@ -376,8 +378,9 @@ static int riic_init_hw(struct riic_dev *riic)
 	 * Remove clock ticks for rise and fall times. Convert ns to clock
 	 * ticks.
 	 */
-	brl -= t->scl_fall_ns / (1000000000 / rate);
-	brh -= t->scl_rise_ns / (1000000000 / rate);
+	ns_per_tick = NSEC_PER_SEC / rate;
+	brl -= t->scl_fall_ns / ns_per_tick;
+	brh -= t->scl_rise_ns / ns_per_tick;
 
 	/* Adjust for min register values for when SCLE=1 and NFE=1 */
 	if (brl < 1)
@@ -387,8 +390,7 @@ static int riic_init_hw(struct riic_dev *riic)
 
 	pr_debug("i2c-riic: freq=%lu, duty=%d, fall=%lu, rise=%lu, cks=%d, brl=%d, brh=%d\n",
 		 rate / total_ticks, ((brl + 3) * 100) / (brl + brh + 6),
-		 t->scl_fall_ns / (1000000000 / rate),
-		 t->scl_rise_ns / (1000000000 / rate), cks, brl, brh);
+		 t->scl_fall_ns / ns_per_tick, t->scl_rise_ns / ns_per_tick, cks, brl, brh);
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
-- 
2.43.0


