Return-Path: <linux-i2c+bounces-8755-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3F29FD3F5
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 12:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4849218830F2
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 11:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1741F37A9;
	Fri, 27 Dec 2024 11:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LX6mFccE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB1C1F37A0;
	Fri, 27 Dec 2024 11:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735300336; cv=none; b=l5Dmzugm1Fk+IcqD4VYPrdUzxU0xfH+UJLCKsmlLwunrktCJ6jGbkmAmFSkwW3YJq2+VE5V7xKuX/r2+dEy9SPiBzY/VLumQqUFWqAz6OnFvNbG63j+lLA3KooJ8m21lQ0fHPOdF2JW30dcHOEBldpLAxQ1iYF7EVe6dtUAsAGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735300336; c=relaxed/simple;
	bh=tF5pB82Fr4P93kY9OUCzA/qRcS817oSbil+H6fqsdT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5NyXlxWpSeA0NgJ0AKQR4PSHHF5zZSGqQrNBmv2fo0z7hyUJhenJ9KOt98EisluAd6FoALhE3ntGQCkL5LKwK9HxzHAMfhsvPHRYy+6/SDOmcGjT9Iis9f8LvlY3aATQyT1WMbAuhQOmqKODhAY4B2Kq18D5ads4m/4i50e8kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LX6mFccE; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f43da61ba9so7361246a91.2;
        Fri, 27 Dec 2024 03:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735300334; x=1735905134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/F3RfUKbaIaxAALUEZajWYhDqOeq2DVl0PqlMpbhTjA=;
        b=LX6mFccECGLXpFp20xBMZfozF+YbXuCbXffC4oEgdOA5NT5wWGUY2MM4FV05c+UYwT
         hGR+4Zb5MyxWEgUwsA0NCEspKOJsCBPxm9hG2NLK+v/PpDqpoKmHYp8x6LSuwl8Pc7sK
         0a4oRNLye6dD9Sa+UABWH+/nqqV+pEhDdJYIYz3Ip0knSW8dLs8LRxrARR7rbJtxaQ12
         N86T6+Rlfoo3x1u/4Lk8hqgnYZbhxFBBXREbahPA6HNDyTcHYIEjw0sDlh8Mm766wlZ4
         jpEsv71vlf6zndKuf0T24po3I6aU4nv94+gcU3DWA/QkPwV7lT8lelP+GDlZMJFWZorq
         6NIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735300334; x=1735905134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/F3RfUKbaIaxAALUEZajWYhDqOeq2DVl0PqlMpbhTjA=;
        b=BM8kugTNitNNml56bd9D5v7fATqbbjXaF+JCIMpPKYLV76pNX/Z/QvMz6hDb93MPNZ
         F/ivVmtwWUlOyWZW9vdU2apI8QPfoZ57Y/YDFkMu2RyXQOUxFf02ge1efbjOR1QAjdB7
         1aRNYXzAlElG/6MPDqU+eWt180qDi7xBVK87ANEEEBmAS2racPh193t1chqnYhK/nko5
         tq4WBoV0Jy00f9ct0cTwUKJ7jQB1cl0gxs6PQQIieJSsDSB2vGwmd/NEp4bCx7/SWVsN
         5IqY9b30YYDcnVRlSoS1ZaRDh9GFEjLAxaTI6XjpjLQ4htHXiF77ZXJfURerfNJeMLPJ
         w0Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUkWRua9FTvTjQs14GYf2CpvD7UuM4EjgK5Rubnf4xabRAeLSewGSfzkk2DzL0SWRrBwvGlBl+zJQs=@vger.kernel.org, AJvYcCVaDFkHCo5e+aBfHN46Hq4/5GCrApZ21PfIJJ5SVkR/EoTQZWyrUrsfyzi/An09dBmJiVRumyKmkjh9NtKT@vger.kernel.org
X-Gm-Message-State: AOJu0YzeU/vxgPKNATbsfFB6XkMdpyZsiaeu8fMLaB02e13/q5gfPJ2a
	IfBtatrGKX3s/N8K+TsC9+xxltTrsMc4FJXfM1I035JetDWBPsXY
X-Gm-Gg: ASbGncuxDA9hKauwNfqIupCFB55p3T1+aBDinb0MJlgfXKDp/M8rBH9bCl1Zu5UG4t0
	WdguNoXY0kjq7AwM3a7qAxHzoS2c4giWcvfsVXbyQU1fSbxlTxLhzunXH+f24j7BzE+hAnNx5/i
	9plN3LbF7to+41bVbbWv5dNfteeeVAHAIWQkqFduq+ooJrtyz8NSL5Czc3MRWYqGOQN4K3gM/Uq
	YLyFv5LqWAFwwGZojlpwYBxzgzj44XTv8vDePxQBNrzPoZyeSu9S7OBqARBPDoNaDWOjNwVNFrw
	UmsVVHM=
X-Google-Smtp-Source: AGHT+IHLwYFvGgSYPxCebbz4fj5SBO8nugJBfDkBINneFZcGegTyPZtN17rtAvD2uDCT/CD44i2A2w==
X-Received: by 2002:a05:6a00:35c9:b0:71e:6c3f:2fb6 with SMTP id d2e1a72fcca58-72abde65a60mr45834856b3a.8.1735300333965;
        Fri, 27 Dec 2024 03:52:13 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:9010:ac08:3a91:844a:cc65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbcbbsm14363990b3a.97.2024.12.27.03.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 03:52:13 -0800 (PST)
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
Subject: [PATCH v3 3/8] i2c: riic: Use BIT macro consistently
Date: Fri, 27 Dec 2024 11:51:49 +0000
Message-ID: <20241227115154.56154-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Easier to read and ensures proper types.

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
 drivers/i2c/busses/i2c-riic.c | 36 +++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 01195ffd4c07..954e066d61a8 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -46,32 +46,32 @@
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


