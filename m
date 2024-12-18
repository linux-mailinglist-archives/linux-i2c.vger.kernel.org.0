Return-Path: <linux-i2c+bounces-8584-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A0D9F5B41
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 01:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C05C1700E6
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 00:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E559A35977;
	Wed, 18 Dec 2024 00:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOr0Bicz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844F519BBC;
	Wed, 18 Dec 2024 00:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734480997; cv=none; b=kSUju4vaIBHt1UzYjlLlYN1sLPCf/HDMhi/3lTsJspB0G9xCMoD+rcuGbjZLbT4o2dF1s2tkOEC0cDr555pS0psb/NzDoORaZIKKLBwG4J3NQjuidCDs2SCSUsACDU0t65Q+jXJXwWpnfi2QLv2bHItVmOdsM+//1ZOFaqqZd0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734480997; c=relaxed/simple;
	bh=DlHusKjm5MYxKJgaJjDb8vAXc89QRVe1imEnLwqhHgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XHU/ynNeHOUeI971uXXev1nVBQ2vC0JTf9pwMiPnjcjWHtgVWXOHWCwcHlq54qNThy0Q++yRXI91Zmvf4mjArgmFHZXzt3qwS9wOpm7w8U5coR7ohzp7wcmtGWhpFeoHO92h+mSHrmLP4iuM3m2wqV2COE3x/fXa4dTkT+ocXp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOr0Bicz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43626213fffso1267325e9.1;
        Tue, 17 Dec 2024 16:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734480993; x=1735085793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNw6LJnURoiyf5a/UCknyuAtawx0cwOabKiECwUUDWs=;
        b=JOr0Bicz0ZZ8/rWy9ult4f+to66gkQKofEo6DwYub6Pn7NpFpr3jOlQLB/EmH4f2uN
         9HGTJZWs0Db7029i8ts78ske18TRX1IvTa3ez0/MO4rL6pJ+4K7KfiUEjTBsH6rhbzL3
         U0D8TBqmaqx0Os17e2f4wAnR9CNCYKUuzXLQ/PptkW/AmJCyJD8dJLBCzFjXwsSTz7ki
         5ky/xvi2IhyUXugQndBPBeRhl/TW7bYDsdWYwZVEMimzMnuZAWacllH3ZugPa9jtCtH1
         jO7WGstC2OtMbxQsywCoO1kNkDJeqL6B/knZUjrRLVPX20Y5Tqt/UYOucj+q90lfzShn
         3VQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734480993; x=1735085793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yNw6LJnURoiyf5a/UCknyuAtawx0cwOabKiECwUUDWs=;
        b=D0oAuu9q3n97kfn4o9cCQtD91h41FgSA+toZqQ+tnaL4k9J4+X3FL8ZMzYLLH/OexQ
         k0djAT1M8zzy3EaSgsan7+scojGUZA81PmHhZlW3KaPinsgML2vogr1zQES28gASiB3c
         XWXPmGO8zwKH3GJ/eNlWpMm5qV4NSUmVnafchsYd/9vDRWU9x5/wKi7x9Gi+szpkpHhd
         GalhFKQRXfE6KjetqgleBTwgOZ6mkxYCFuKP6Q1zMnrNqZNmGO+YD/OuEYXhDnHz7c1R
         Td+u50qDCLKMFEVDjmhTLghtFQvoEboF1I58zV6nVC1sgbwORYylgv9p5E905TtOsYL6
         jo9w==
X-Forwarded-Encrypted: i=1; AJvYcCWL/BEFyABQnMigkd3YxBSTFjTxDn9CgdlAMPw8nIKnsK9gdcmNk0Fws7iwQV9zJTF+6naBqIRAESOuWFNa@vger.kernel.org, AJvYcCWvgY7TvXTt5khlEOdDbo3hTJE/83+vYJo0E69pN01MjFwO4Z0AfSdKhgXd8fJzfbMxKOFAt+/9PwA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy4T76MPNDo61eWYwdWmUcb860H6AZB/9MB7CobXuZEEZaXm8u
	lGRbOnErhvhzGXJF1sQHM8HHwjHDE7abTBEx0IiFyKEFbXrLiq9I
X-Gm-Gg: ASbGncteJ2zRPsLmpBwJo7YBIp6IXEIj2LE7sbumPwxLYlUvBhzAUqnPR6Mk6G7eoD4
	x8suTTLxCyeRTHsesD9Pf7qSv2zcLbEXyhUo5LORXirmodbcbthrw4KIyTq3qkoJIK/vwZD3mlM
	sM/s00tSa6iCFIjGU1FBrpqtB075Tkr/+6DpQxunvdkB03dd7B1R1ZZlRnyd5fH+nrlhd+X0old
	+o/cjCr06RRDgfBEEt0b/D2ds7FwGifVTVHnJvyj8GRz4AhAreC4ygosqNkOxa042axyz4xv89L
	VOadWlvkvQ==
X-Google-Smtp-Source: AGHT+IEgMHKKICwiWXw4q352qa42ek2pm3QiKHPT7PQNLvpbYvEoxzbU9PgzdrV5qsScJdYOMCyGDw==
X-Received: by 2002:a05:600c:3516:b0:436:1b77:b5aa with SMTP id 5b1f17b1804b1-4364815c7d6mr49268975e9.8.1734480992542;
        Tue, 17 Dec 2024 16:16:32 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:ca61:1d3a:8af0:1c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b1f638sm2135495e9.37.2024.12.17.16.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:16:31 -0800 (PST)
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
Subject: [PATCH v2 3/9] i2c: riic: Use BIT macro consistently
Date: Wed, 18 Dec 2024 00:16:12 +0000
Message-ID: <20241218001618.488946-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Easier to read and ensures proper types.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
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


