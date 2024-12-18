Return-Path: <linux-i2c+bounces-8583-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC70F9F5B40
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 01:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1AEC16FEC6
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 00:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6D235974;
	Wed, 18 Dec 2024 00:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hs9pl3/Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC5D35952;
	Wed, 18 Dec 2024 00:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734480997; cv=none; b=j0/1jOwssBgbDIOD39l9chvJxJdSPOCCgHU4sR3LkbAd7KBBEN4Jnx6C0XF8NNodR3B0/tzyi+cXln3tj9P5gAR0+Go9ZyuGzisiZ79mg2gvjxn8Ny/cR7bahN3rZoMICDrKT2fc1IX3Mjvuc6nAa44wN3l/yD96VOF2SvxHFxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734480997; c=relaxed/simple;
	bh=aKv/SnjD32JL/k+ADGSCQVQI0Gudg9gQc25t3nYAy4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f3Xixfti7RvdXEfc7XecoVe5keUbyTSt4BsafBWijruT1imK2ZUIn96KPAzCgCUxP3wy+g6n9JdDB9WEEsAzIj/R8eWnmxx9DFbaCC5OjwxhmDG2IMv1SYp2VWDspLTZCaq1Wbe1crPTFePfw90jklwO+N/ELehC6XQu2bVLK2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hs9pl3/Y; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43635796b48so1442315e9.0;
        Tue, 17 Dec 2024 16:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734480994; x=1735085794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzo6pnZ8nQQ+9j1S4YV7Ap9BOpc4Nyt6rMblsqFBVt4=;
        b=Hs9pl3/YpwjCxw4omUZsrxEMU/1o8CgthbpTIrn5wgSbKfn8qhM77SgsgB9hX2WFLH
         bQutyfw02x9SwAXUN3tEzauvJlWSahgTSil++ZAyJ31x7K6B5jDnjwVLlpYCaMXnKHSm
         3ovn7zxYUt9fqGW729gkkfNCyBU94qtar/2kq2W4zrmNf/fGx8y2dX9Y93Vk7E0NRUyj
         DsGkwtzeJBqomQ0g56JcJiuIyimGnzHevFobxzsc+aW+zOvyCW0K1/bkcjG8ah/KwNBP
         lnd2NtUVzfo13/kazQA+gXL3UrnLxN1m8VXRpfwURAhL0xSWAxRLbqlYyV3Vp2xlnFOr
         kklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734480994; x=1735085794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzo6pnZ8nQQ+9j1S4YV7Ap9BOpc4Nyt6rMblsqFBVt4=;
        b=netPhzCe3Ggy2+AnvYtc+PRxz95/ZgvueCRXvYar39S0qSAs+KpqvQndFpUvFFKn9g
         7e5IYogiNeK4aQpURA0HzKRno0AfPEnqBYtJ3ieUAdnjV4+VtuSapuyhwOjSY7py0gDz
         /sVqTICcu0PcqjPnqeULbEiCyNYS0lJvori7HVmNjbDAUo3PfM+Ckf53x8oYLiaVGou8
         fbI3OInz8eWDJi4u/fQokHeuA8gpq9LzGpVoTbTe5LhPJkhSH5SRyY5h+Qz45k24/2Yv
         ZCH7756El1XcC9dAHP8Fxl5tIKfQV9AMbXDO9qp2SmWFGfCvKqK06a7QKv4jEAUV2PWI
         Gi7w==
X-Forwarded-Encrypted: i=1; AJvYcCVLQ5+bwqckyI7ZtnC2WUvJCFAY4iaRV1TdoeZ4tDJmoemWk9MeF56yN+9Idtd9B0VDO4Rzzx6XzB4=@vger.kernel.org, AJvYcCVcrc54SaXi/WXovGJOgqqsv9iK42KEtVPz6izDeeAc9PMlHjIorC06q5tpfCTvtiQy/RA3pUh3rCdVoTTR@vger.kernel.org
X-Gm-Message-State: AOJu0YzpqdYge5sVWDsaif/ibx15GI1NMEN5+dEosp5N6x2r+TOjBRIB
	Eq6oYrFm+z3gIKx/SkBvthbbcEcOkjN7+KQzPjAPr4mYHAD3VspM
X-Gm-Gg: ASbGncvepsrthl4ihnalLEcU4RcEtuZFfcf5auiwXe5XAmTWkEOmbJUlcWfcNu0b3I3
	IPVzCBDH4YaX8mhd0rLeHXBrXLhgcnJKLOfwaJlzxwWwhwrVsouUPKcG5ScQs3s7SBa6tyA3DAH
	iPBEjjOrzTu4HVYwmkft82geq39i+ppqbDlw6o83hOZ1JMONa0+RBKXX72d2tNubaMEYFCFmuN3
	Nk+uL0BPh3F40a6zrLCohpE338m3JTzzro69xsfU+owoi6P82eljHygkJDyMBeHEqRKIszDOeAn
	xBgL15Yzzg==
X-Google-Smtp-Source: AGHT+IFltRpUzSozDoA87m1TZYC7pxqBMTSIWpKZiQtJf4EL6iU4SamKsm8UvtQf1qY7MgprIN04/w==
X-Received: by 2002:a05:600c:1808:b0:436:17a6:32ee with SMTP id 5b1f17b1804b1-436481b9110mr44086365e9.10.1734480994104;
        Tue, 17 Dec 2024 16:16:34 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:ca61:1d3a:8af0:1c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b1f638sm2135495e9.37.2024.12.17.16.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:16:33 -0800 (PST)
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
Subject: [PATCH v2 4/9] i2c: riic: Use GENMASK() macro for bitmask definitions
Date: Wed, 18 Dec 2024 00:16:13 +0000
Message-ID: <20241218001618.488946-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Replace raw bitmask values with the `GENMASK()` macro in the `i2c-riic`
driver to improve readability and maintain consistency.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2
- Collected RB tag from Geert
---
 drivers/i2c/busses/i2c-riic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 954e066d61a8..ddae4b74a86b 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -55,7 +55,7 @@
 #define ICCR2_RS	BIT(2)
 #define ICCR2_ST	BIT(1)
 
-#define ICMR1_CKS_MASK	0x70
+#define ICMR1_CKS_MASK	GENMASK(6, 4)
 #define ICMR1_BCWP	BIT(3)
 #define ICMR1_CKS(_x)	((((_x) << 4) & ICMR1_CKS_MASK) | ICMR1_BCWP)
 
@@ -73,7 +73,7 @@
 
 #define ICSR2_NACKF	BIT(4)
 
-#define ICBR_RESERVED	0xe0 /* Should be 1 on writes */
+#define ICBR_RESERVED	GENMASK(7, 5) /* Should be 1 on writes */
 
 #define RIIC_INIT_MSG	-1
 
-- 
2.43.0


