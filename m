Return-Path: <linux-i2c+bounces-8874-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0372AA006B6
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 10:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 459CB18844A7
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 09:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A005D1D5ADC;
	Fri,  3 Jan 2025 09:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dzk6wYrJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121221D5143;
	Fri,  3 Jan 2025 09:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735895962; cv=none; b=d4gEx6cWUb9PVNhVATb623R+fhdIerqjnrmJe4zedFNzpYKC664ZUt8PP6WmC16uQnyVkQuMcZVxr3Pp3OfdEVk7I2w/cJBcIZAaeG4GS2yLvWuL0fkAth0v0P0JgfY5kBWmsInuiyd9yYaylgL+D6q98cMA0PgRyDhOv0udItY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735895962; c=relaxed/simple;
	bh=H3BGHV+hqByntCmC4Mk6Y1zGCgtp0X+ATVa5BuzUyqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+Kwvxx0drVjjlDUpRJNOq+jdsYiksKHNBpQiSPmbkpTaxQYEsqAvZY0cDrxm0qFDpb+EQ136N71r0G/2eb6k0tyoFfe2QvG5stJ7KvC5L90zbyXP/pKo+dEWSTaqhqkTYYy9eNgHLfcoihwh5RBhFbCYtCPLdiPVJVyBLfi2kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dzk6wYrJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso79424745e9.3;
        Fri, 03 Jan 2025 01:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735895957; x=1736500757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXymxgBA3nfQnH+aUrjAZrq/QguZ/NMkC+2P4OG0kmI=;
        b=Dzk6wYrJ4u795KwlEqg1ybL+8Jva4Aruk66Iqy89vKhto7xbeNoQWtaaNPTL4fWaZr
         lYfMX6KrfaN6vd59lFPirhjBzSADD1HMY4mB//hj2Wb3yZckh5Z7oNjgqFYhhiX6cxJx
         MwykogjUHVIcYTeqN++bg1O0nUAagPNdXHlCuI0OdMG9pQ7VyPwqyh/UdUMd8NYjQ3qC
         YxS34iEZc9tMgAkqn3igNgED7rpAJF4DRTKsQTC4MEoLy1yNr/yM2tEi/Cchx9q3hFpa
         i2PT7KwPAsaUFxU0+nf01XKuikTH/6823EWxbt0agkqVIZ5BpAELEpFQqfcIiFAVnX/3
         nQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735895957; x=1736500757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXymxgBA3nfQnH+aUrjAZrq/QguZ/NMkC+2P4OG0kmI=;
        b=eFZ2rLXmKR7g63sdHY9R8j0C6SW8pCapmsvxUa7tQCg/eLhW4t70nzrKN6Szu+Jebo
         TmtHQ1ZG2Vye0JL1FeQMJJzbI9RnIk1too/YdzW9xSe91flYAbkcHPyfM47clF+TVoin
         KtrYBqTBByIXqqFMR+EIc7kx6tDutgcNm6jF35hpIru2mcWKVHD7lAQcGpOaY69IOrs2
         ld+0btTgykDISJ/vKKDGuzRslS9hKw4UfXHJFvnm2hcEZ/7SCw7OU0lZcQ7yXaknr94m
         xRb4RpobVOT/hcfY7B4gEjHj3kSotu2JEJh5Qtx7rDayha9iZB7xQhDx2RAXUXgiSt5K
         ugIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIVANXsAAGuIi1Un1xquxwB6bhBTIkKUBufXGctffWjv42ZOjsd4DZ7uOi+3+PuNoB6ctpXHJ0HjMpa2NZ@vger.kernel.org, AJvYcCUuxtN20Ahxpr15IV3t/FLQtmIt4MmUYHlpqO/NU9dMWkoBqKeHxDUDyCB9+tf1G+EOllwe7HcBbJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkxyH5fSoLUa7270xtYWe1utsIOl8XeU2GXD40sMyjHu1Jcjs1
	6K8kZpy6zy6udevzyEahSnKZJA7aGHtUk45GnF7T+VyP6v2BayQ6
X-Gm-Gg: ASbGncuWYgyg6tmQJBL9O7abvui7cPI4jQ6HE6UoUMHEhYhpti8KGzH4LhSR2JoS4l8
	tRRcuYA94NvKKEZzisvXdEeZnY2di65AcT5/N6oP+xJfeYvSgGj8Kcm1IKib8/F8ctAk0VTv8Bj
	EDOpTrGRbiQghsGDc+/xyOjRpvMGzWF6KFQu1ZGCldU0nFRQz9/73g8GGkWXyRFjmJ4Xeg7XTTi
	SInfgOMp4g2vSh+cFqQUN3WkoCrTqxVPlYB6hSuHhBJmg4JQcCxAvN846KA3xIA4LWfAvrF10y/
	Nyvk0fdtOQ==
X-Google-Smtp-Source: AGHT+IEg/rGbg9t+Pi0lEg5J93rtZ7Cl0ndnmH572G9tK1NtGFLJjVbCEFVwVd5Cb7rw73vdSyXnxQ==
X-Received: by 2002:a05:600c:3b24:b0:436:2923:d23a with SMTP id 5b1f17b1804b1-43668b7a683mr328059965e9.33.1735895956907;
        Fri, 03 Jan 2025 01:19:16 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:84e9:7adb:b646:c9c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366a093cbfsm452493275e9.22.2025.01.03.01.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 01:19:16 -0800 (PST)
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
Subject: [PATCH v4 5/9] i2c: riic: Use GENMASK() macro for bitmask definitions
Date: Fri,  3 Jan 2025 09:18:56 +0000
Message-ID: <20250103091900.428729-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Replace raw bitmask values with the `GENMASK()` macro in the `i2c-riic`
driver to improve readability and maintain consistency.

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
 drivers/i2c/busses/i2c-riic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 5551964c3971..ab9ec7f12032 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -34,6 +34,7 @@
  * Also check the comments in the interrupt routines for some gory details.
  */
 
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/err.h>
@@ -56,7 +57,7 @@
 #define ICCR2_RS	BIT(2)
 #define ICCR2_ST	BIT(1)
 
-#define ICMR1_CKS_MASK	0x70
+#define ICMR1_CKS_MASK	GENMASK(6, 4)
 #define ICMR1_BCWP	BIT(3)
 #define ICMR1_CKS(_x)	((((_x) << 4) & ICMR1_CKS_MASK) | ICMR1_BCWP)
 
@@ -74,7 +75,7 @@
 
 #define ICSR2_NACKF	BIT(4)
 
-#define ICBR_RESERVED	0xe0 /* Should be 1 on writes */
+#define ICBR_RESERVED	GENMASK(7, 5) /* Should be 1 on writes */
 
 #define RIIC_INIT_MSG	-1
 
-- 
2.43.0


