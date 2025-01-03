Return-Path: <linux-i2c+bounces-8873-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B03A006B0
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 10:19:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62E29163A76
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 09:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3661D54F2;
	Fri,  3 Jan 2025 09:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrWFMcXl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B857A1D2F46;
	Fri,  3 Jan 2025 09:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735895960; cv=none; b=AkJdFQNok4x6fChv2dN6eHYpH1Tg98Q50nVHU7gPUgLp8D0L1SL3KSSyGk/EzFBWHYfAJgHysOhKkk54L/gSl4zkIrjJGYK+lKgfLhgMH5noAnUmtqDX8VKO+TE2TxtU2c0q5kj+NAeSTyzhKqOeaBq9QBfXrHt6dFmI+yNo//U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735895960; c=relaxed/simple;
	bh=zkRrUObJmVJ9XbJbPhkBEEXKgumRrCvPWXppMfRVLd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3YHXV7FFTpkutdD7uD+WbFR5Gn4B608YzxLY4TgwY8eKIhACxk5LZfq992QOwEdHZ4/kffCfqiX9hIp3aWQj/czsbSYU2DNyiQTNpz7rkLlZVdzRPXjjL/udIU/9WfvwQt+0KvbYsXnjxIHTkbfXJm270zrVFFVBmPCPx6ywVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrWFMcXl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361c705434so87524255e9.3;
        Fri, 03 Jan 2025 01:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735895956; x=1736500756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2HVpu9VKlVzY8IdkZhOKiWna1uiPP+wmt/t5mxL2t4=;
        b=HrWFMcXlf4nKxpT2NsRIQCSysrX0DxLW/QF2qe28sRclw/2Lm+rrMABoQnu3D66oYD
         2qb9nYxT6sGj3h6xHB+/a3kDQrVFlwQqckydLh8d29fd1V3aHovbDAxrHC59cFam5h+B
         Q/GYJI5OuwDgt1k3voqq5r50l1ExHCD6R9r0Gj4eL5BLljAnzygJhwXaQe6oZ9LI5I5d
         DhlvE/Feo1smPQM6d9tCT/ByLRDVIf69o8ZTVNOsq603AXVhGHX/WLsJVXOiAnsz764A
         XMbyjywVNQQoSXqloiklvrQvAkiWXnYxnD6TDfW03YYbnwSAssWw4ijoE/nN9ID8e+yT
         aKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735895956; x=1736500756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2HVpu9VKlVzY8IdkZhOKiWna1uiPP+wmt/t5mxL2t4=;
        b=ZBwwLneCMj1rV9ap2/C17NQlHZGidZqh+QHKGAwcIWaYbPiSj+1/Rh9kBC9BCHzCtD
         WhAK82hMj6otu75gBB7jsNwEOXUDihlKz6QYzFu2fRbykX7NtkT5tNbIGncydLrVrdE0
         Ocx+ujg6GWtrqu/OzTLdOauzsz8iGI/gaEqN7sfQupybIMlDgZVF8YHexEN4/seRHyT4
         3oJXRtSS+CERf4P+FwkbrkFXb481L5SmYipj7QOdFn0W2XxGdLp3lA5hMkqlIom1DmZ4
         BOIgUBt4y5L+xuXpJ+Ishko9StlSlUAT8MlC5JVH4dUIMvJv/d/dW/lj+LscLx3evqgS
         Z4dg==
X-Forwarded-Encrypted: i=1; AJvYcCUI1/kkxwTDZ4yXQp3sk4CcoAHKiLajehfZgEyF/QyjZ5GUmjrSk/MH4BVPnt4/DBV8UZ1C0MxBP3I=@vger.kernel.org, AJvYcCULiNXQDrbIH5JsAyQgaW2XKStOyIwjwmNi3QdgDIkPnOr31A3BZjjTFB/sqkkGzI1wlvrfgvYXnLi5eGro@vger.kernel.org
X-Gm-Message-State: AOJu0YwjLSzaFuNStGRpG/NXIO2nxB5P5CgXQvH0VGYZvb+O93AAfT7w
	qW9hXJPLHy7+afbzkWXBB1Lw7mEN3MR3twR16Fac/asSM0OKD/iy
X-Gm-Gg: ASbGncunc0TBsKy3/D9VzLQ/8mabcB7Z2LqOOWHZSfliU8Gm13jjYK10bgZ+YPpWVUt
	lsNSlwui6j5sbE71/vo0dqWqq4tXH06JDdGhLAFhjI+CF3yXd1vtoJWxIO41rTLhRjAvdSVf2/v
	hFXVnuLD45OJAL3/GMWbM0FyggKsqUU5jrVgYI/dx7rauITqn8FJHXsjZRpKO/NXDTNFuFsRKZC
	l9N2apMMekdfwKx7N1SIs1m4zyx6aGR7hRJ2nqS7xQH/raGqlt4dBQZo3dnz4UTEpN92MVNum+7
	UmQBULKKRA==
X-Google-Smtp-Source: AGHT+IH4+6w4OKa2DqT69LRW9WmPeorZEubkFLvWp64oZz/hpENXwQwdi4VP6FcTFTVWOy30ULwPsA==
X-Received: by 2002:a5d:47c9:0:b0:38a:615c:8223 with SMTP id ffacd0b85a97d-38a615c82bemr8284509f8f.10.1735895955911;
        Fri, 03 Jan 2025 01:19:15 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:84e9:7adb:b646:c9c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366a093cbfsm452493275e9.22.2025.01.03.01.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 01:19:15 -0800 (PST)
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
Subject: [PATCH v4 4/9] i2c: riic: Use BIT macro consistently
Date: Fri,  3 Jan 2025 09:18:55 +0000
Message-ID: <20250103091900.428729-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Easier to read and ensures proper types.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
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
index 459f7158ed11..5551964c3971 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -45,33 +45,34 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
+#include <vdso/bits.h>
 
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


