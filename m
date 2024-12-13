Return-Path: <linux-i2c+bounces-8497-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD69E9F1489
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 18:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1900188CED4
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 17:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CEA1E764A;
	Fri, 13 Dec 2024 17:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8YmuUyr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF891EB9F8;
	Fri, 13 Dec 2024 17:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734112720; cv=none; b=az2lMiarq/m+00a5PN85/lAuFNG4BdtDSWc/AeNGwH9OcZ/3o/UwN7m48at7zzRIDFl4xa0liObX8QUN32wNIpZ+XFS3EpgWNtR5c7XnuxU3JiRWitUakioc3sPa4Lz5fEnHKB+s0gAN7wJvS3RcongQr3OlTe2HGDknD6fSFXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734112720; c=relaxed/simple;
	bh=v6gRovSpSw1Dpn6da67WqnL5HJw9i7Rb0ebquq57WdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WVBiK/5bQM6pTdS0erpkoI8Y3wEFRRUxn9yKICeeb7TT3HGic/W85afe9d4Sf83wgzp4FthYd4AXzhzWmKvDP4N8oKldtk9wRXOKlVxPG8+p6xUy2HK1WSaoAf/TNdH+eWbPYoHflihSxhJ5akt23C+/C/5QVm0MEECsmHPrcBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8YmuUyr; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385e0e224cbso1091033f8f.2;
        Fri, 13 Dec 2024 09:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734112717; x=1734717517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isddyxmmGgOgjcayZ6HGdvTWBUz67VDzdtOROZt8tn8=;
        b=j8YmuUyr8pyMNrM0oslmtFKxM6Sw+9M6VukKPvalU21a0hPB8OkhGyllurkLddWx0b
         XPvPxakM7RHrf+BeS/NTPQvY1Km240LEAWfeAWHR8m1oz+gHh1oMOHq+m+ymis30kzSE
         BUqjRiHmxZQZ3YM1u8nFuM0qiQtfS7YZFstkyMWBBaRh79LepZ6wQzZHb76Cw5GBs9kj
         udDu2Eg4CfgSSU/MsciSu57tu0+//rrpC+CCzJJPTj7pIO+55ogz8GIfA+QJqLLGdjEt
         E8OL0OwDCZ+S627eHq6yswmYu1wKnVMKhqD7Nbktqy1m+lYbCxp82APsUv2hRp1oVv6P
         1pfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734112717; x=1734717517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isddyxmmGgOgjcayZ6HGdvTWBUz67VDzdtOROZt8tn8=;
        b=vK+ys3N17vRh2fBEiuBME5qREZsn+yO31js5uLOGI3yctYI7qgcocFaniTGbToQC8h
         w1+QBAJ19+EiCEIO+k2krTisTTpWkKUvjtxJnK2nHa3T1ppIrzLZwZ+ff7bHXQZyBZ5I
         N8dxqc6EkwVz6sgdnDe/eviHxJE9WFTCFehUSJDXjoZoT0XMWkKJsdZCZVpf+koraRk/
         C9md7/7HadkdtLy0gCgjRK0NA9APbpCRP1iixMzbmdUqrsWHhwqIOoJm9i1FD7Tlullb
         ieBWKEuS48CwLUKFUS/MKO6tPk2/n6x84eU0hu7//pnWsC3Osev8zr0WP1/4XMoVCGcg
         OMhg==
X-Forwarded-Encrypted: i=1; AJvYcCXnXlANCt8k6Wfc2iNp0Q2tguiLoqLdYn25khImLo4AMwV2kTwQqMOFEl2fJ9QYdzP4wQbt0unWW8GotsC4@vger.kernel.org, AJvYcCXzNCLIktU67zZGjZe9E9ie2EAO0ZfxixzmIUEvG0MEbSfdvK1mLkTI33Hana/OZGPgMX+q6vxRk5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLhhABFef8nUB7wxVD6+Symp+lV9B0cLOuqXxyklYKkI0gXFz3
	PALEfQqzh/VAm85zV5Kg5eQg9te0yog5hfAO7ZTEjigyhQnLTJwg
X-Gm-Gg: ASbGnctkFzs0NmwziOvRnpmE4mNAtX6OVgx40x1hPSy7SkNQGSBE1AGZcYBOeyqP70y
	Zm/jEJRsRE6GAOMX2zaqtgHHfEgoleaeRDKdr/niwFoslqEs/9Nf3rcPUrAmx3Hc9Ln9UBdKhPL
	xHFZORNIsz8EErjVkKq/put4vzA9I4P4d5dBG96ShcghSsXcdAkoGaB3Msohky1mKnZIJOAkbeW
	dUEsCcxq1/62B6lMbWXAvTuiD61t4evWi3w4oNvU9c1JxT42H7xbXxpE8FvOeSqXk+tJWxBscTw
	4LDLCSou6Q==
X-Google-Smtp-Source: AGHT+IEs95uhShUZYTyFBw4pkogT1ks9Ew7DEhDpTBgmZAupQO/qiQ/VEnupl7xMhJi0k4cOFusukQ==
X-Received: by 2002:a05:6000:144f:b0:385:fae4:424e with SMTP id ffacd0b85a97d-3888e0c07b9mr2452260f8f.52.1734112716578;
        Fri, 13 Dec 2024 09:58:36 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:4eec:e99c:89a6:d7a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c804d573sm119088f8f.64.2024.12.13.09.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 09:58:35 -0800 (PST)
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
Subject: [PATCH 3/9] i2c: riic: Use BIT macro consistently
Date: Fri, 13 Dec 2024 17:58:22 +0000
Message-ID: <20241213175828.909987-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Easier to read and ensures proper types.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 36 +++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index d01bb52d86ed..659b0702293a 100644
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


