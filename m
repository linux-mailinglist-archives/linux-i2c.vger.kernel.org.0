Return-Path: <linux-i2c+bounces-9047-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDB1A0B6E1
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 13:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17C187A4794
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 12:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF5222AE7B;
	Mon, 13 Jan 2025 12:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8uFQGiR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C740E22F16E;
	Mon, 13 Jan 2025 12:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736771222; cv=none; b=C56aVv6JrRK0vog7dDc4kaUbPBdyzCfgt3GZP1ThC6IQ674T6jkzA86ISASN/iwFMFCVNbwsSgkz7gBqXpKVHC0mXxq1scXAZKIaLp5rSXiTBDBAJ9No7ftiNg2eN1cZTGViEqQs6hYIpUCxlQe1D6CT2AwH5bVIJNyKy5umlj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736771222; c=relaxed/simple;
	bh=kD/BB26IlDjp+BdXvMhyWMQzfTjuj11XTsCTUTRtnqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CxoNAqfohZkkLt5VO+1/CbIwMt3v4IP3oJMolroR6QozaFpnZFYlJEtS3DIJ07Jmt25zTZWtQCDKzKtxFAqOfU3/LBkOTE0SEdwvjPv6nj//zYBCJBJNGd+CptN/x4Vp1j0cqOcWAL8r4+qDO98geZSM9rsxrt+Zw4OfbDVm45Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8uFQGiR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so48634405e9.0;
        Mon, 13 Jan 2025 04:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736771219; x=1737376019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLFxeHsbZaMLi7y4U70NTqyWNjRRV0RJYoNkPRe1z3c=;
        b=E8uFQGiR23PjDvOc7p9ji3lzxHocelzezvga91HUT5eVlHDbCSyeXjOZwCoT8U70dA
         fC/fClvhlEiferVWWJUvqNCmjBMeGCJmyUmEDtHLdCvsMmfOMD4RCuGtIEpV3VlfYGPD
         qFksiTYg2GRAKmJuWlc00XY/nkOZV6TeAkPFJeUkYY/U56iHq+UDD0mdJrgIcmWAiAlx
         jGQkuVPOq8mCmqv7fEqHtrLDj7pkblavGdcZWF+eaF0JZ047YtIsq2VNigRiwZ/x/YLa
         3ql42rQTiCRX3HEGTQV3Qa/wGRoclcKidNNs6Lj/ypur3RJbbrab8RIooRW3gCN+/TEj
         bhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736771219; x=1737376019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLFxeHsbZaMLi7y4U70NTqyWNjRRV0RJYoNkPRe1z3c=;
        b=QbjTq5JAcEFC05SCs02i8J+KXIJ5nfaIM9BFFV6XUwuPNcC3gorXEbVxe6d9jxxXAf
         1aoWK1Ttoxx4gTTrYhvhTSWBWt6PWbGuVMqX4CcsjDYy59o1Rsx9mMaT/3S+TM32CPgS
         sl8X1wofU5UNktvTbZ3Y3aqhHxkUpGV7pRcy3lnR3xioCgHiAbs+d+HAhwYDsaMK8Hpj
         wSKL+bbvmKf53+LkbqPA3R0R4PHKYTnDaXtt9pHr8PEnP5lk+VjavI/HfpzCnIPPaUJQ
         PJD2SOuvYUeBDTv9eDQQpLZO3vyjIx6eGHr9tLaNTwtSNEU7GNDi8/2q43CQeUFor5Q/
         IkTg==
X-Forwarded-Encrypted: i=1; AJvYcCVSw/StTvBhCX+6joKzQxg3p+XR/tBwQ3eoS9SMm/piNkfLhJZk671E/7DDDO+OVFU/k0fQZ778M/A=@vger.kernel.org, AJvYcCXVk9Vn6NxZ11nv9P+Qd4I9lZcEWLjgdrB9zna1Gzrv/Gn/14/GtV56Vv4iL2oOhGccezRVN+iAhwkc0Kal@vger.kernel.org
X-Gm-Message-State: AOJu0YzMSPtJKXhqDenBxkZ5cBrvtNOTkRZwsZf9KfWTjNl7bRtcp1IA
	kZGYpWrRjEcwjpBx+7ks439FcGJG2yv1WMxazjz6kUxY9YATIOXa
X-Gm-Gg: ASbGncuXmKLGp65VMG3PsZeJ3aJjRK0pk4uvLRo4ynwRE4aDMdgyZTnc7/Bmi1Wxzgi
	T98NHklUWmxeB9fQNbuF1W+I9xH6TAijplBVh+bBkLVSFEDHuRBlzTeOuGy/jlpxKi44luOm7vG
	4r0GDp0G4h0Y+RLa2EphcWf7UfglbPctBHsKk8wO9km6nMCxSFJ56IydsjBAgO5Ctn+GFgN21WZ
	2Kg32DQ4M5NgfYh2OhBGtG53tPyX42n4BcIYqiyE4blK2gJX3JKHB4f2FYhWLWHRXtCunfcclyP
	n8tNyikOWw==
X-Google-Smtp-Source: AGHT+IEJdT1V5ztbSQit1l4JUUiyXQNX5YIla9xZdjNckE55C9SpnMwefkT1tGr3ozOfyOqyW8KNCQ==
X-Received: by 2002:a05:600c:4f03:b0:434:f396:525e with SMTP id 5b1f17b1804b1-436e269c2e6mr184653945e9.9.1736771218578;
        Mon, 13 Jan 2025 04:26:58 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:acc9:404c:3a6c:d1aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c23dcsm11812720f8f.101.2025.01.13.04.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:26:58 -0800 (PST)
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
Subject: [PATCH v6 04/10] i2c: riic: Use BIT macro consistently
Date: Mon, 13 Jan 2025 12:26:37 +0000
Message-ID: <20250113122643.819379-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Easier to read and ensures proper types.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v4->v6
- Used linux/bits.h
- Since the changes were small, I've kept the RB/TB tags.

v3->v4
- Included bits.h
- Since the changes were small, I've kept the RB/TB tags.

v2->v3
- Collected RB and tested tags

v1->v2
- Collected RB tag from Geert
---
 drivers/i2c/busses/i2c-riic.c | 37 ++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index c555b6220e66..370cb83bf5ac 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -34,6 +34,7 @@
  * Also check the comments in the interrupt routines for some gory details.
  */
 
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/err.h>
@@ -46,32 +47,32 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
-#define ICCR1_ICE	0x80
-#define ICCR1_IICRST	0x40
-#define ICCR1_SOWP	0x10
+#define ICCR1_ICE	BIT(7)
+#define ICCR1_IICRST	BIT(6)
+#define ICCR1_SOWP	BIT(4)
 
-#define ICCR2_BBSY	0x80
-#define ICCR2_SP	0x08
-#define ICCR2_RS	0x04
-#define ICCR2_ST	0x02
+#define ICCR2_BBSY	BIT(7)
+#define ICCR2_SP	BIT(3)
+#define ICCR2_RS	BIT(2)
+#define ICCR2_ST	BIT(1)
 
 #define ICMR1_CKS_MASK	0x70
-#define ICMR1_BCWP	0x08
+#define ICMR1_BCWP	BIT(3)
 #define ICMR1_CKS(_x)	((((_x) << 4) & ICMR1_CKS_MASK) | ICMR1_BCWP)
 
-#define ICMR3_RDRFS	0x20
-#define ICMR3_ACKWP	0x10
-#define ICMR3_ACKBT	0x08
+#define ICMR3_RDRFS	BIT(5)
+#define ICMR3_ACKWP	BIT(4)
+#define ICMR3_ACKBT	BIT(3)
 
-#define ICFER_FMPE	0x80
+#define ICFER_FMPE	BIT(7)
 
-#define ICIER_TIE	0x80
-#define ICIER_TEIE	0x40
-#define ICIER_RIE	0x20
-#define ICIER_NAKIE	0x10
-#define ICIER_SPIE	0x08
+#define ICIER_TIE	BIT(7)
+#define ICIER_TEIE	BIT(6)
+#define ICIER_RIE	BIT(5)
+#define ICIER_NAKIE	BIT(4)
+#define ICIER_SPIE	BIT(3)
 
-#define ICSR2_NACKF	0x10
+#define ICSR2_NACKF	BIT(4)
 
 #define ICBR_RESERVED	0xe0 /* Should be 1 on writes */
 
-- 
2.43.0


