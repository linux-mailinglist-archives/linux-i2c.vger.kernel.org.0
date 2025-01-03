Return-Path: <linux-i2c+bounces-8877-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94827A006BC
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 10:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 613A5163A03
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 09:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C101CEAD1;
	Fri,  3 Jan 2025 09:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W46vFgw0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E531D5CD1;
	Fri,  3 Jan 2025 09:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735895965; cv=none; b=bOoXJ6SEKaEUTJetCcWzMzBsFigCBDR0SHPV0gCHgNrfCE+2WrPd4CSOpeYmId17bUcoi1l1gaVYisunvAkeKkpZjdVaXpvQa+361zaHmEWBoHSkZFIFpWI2TCzGeBUQeuUKKScVelpRx3OGiYPLtzDJ59ldjqSZUUzy3dPOQTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735895965; c=relaxed/simple;
	bh=4C51F2g5rtYIOiiWjD+7aWGpYlSg9uyxPe4xB13BrMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sLXH5xIH231W1PD1yvF4ny7aho0cbv2fEVogq9VVUO3zLgw+PFXjdY5TSiCXT4sHfebrxTm4Dz3myzF8SKujm0mhR+jqyUDAj8Wq5aal7dsoHAArqr0o133Vtw5LhV7TZ1o8XiN8mv1U4mtFL4EBnrU8DFKkMerpySDFj/1bHhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W46vFgw0; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso72990225e9.1;
        Fri, 03 Jan 2025 01:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735895961; x=1736500761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHh51fkXKAHazwUrHjB1gbxZCr0pjDS/1vk1G1UeVto=;
        b=W46vFgw0Lc21VkbdU6S1PsKh9NAVPCmC1NrnhwQYeGDG4ZCpVIE+1zwHqFil7jbMRK
         ja5AdZxCaTl6VjN4cnz+YkTRX1k0jTeCwqaSfvq6J0jUOlUzqe824Z241yVPDV7A2Pl/
         35Xenf6EGRKoMVlK2q/HXTXygJj+oTFCWHHdrlC/cSv2ltigvbab9quAjrfSoQdK09Wr
         JBNGXGwDMcsCiCgA//fdMd2rIuWWMnuaLgUNlFBbkg9bb6Xxqo6eYu4HPST94HjOLqCU
         80LdttkkNmGIYhSnNthKgJWBWwKvgNINrvPrAHLIgtxJASgbrrIcbLIEyqErCClnS+A9
         IyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735895961; x=1736500761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHh51fkXKAHazwUrHjB1gbxZCr0pjDS/1vk1G1UeVto=;
        b=mGBj1u2bX1WVLfrl45fLMLkyLfZiyGJnn5AZKI/OBcbaPUXIMaHJIF0P0uVrXRR7Ow
         q7cnlB6sVDGAt9noblRK7UPC7uQsgp7/6EtHgmoAIYr3Wh2dI8urNGE9JMALN3/zNMpw
         ZvWifgrH9svnvM38hLiur4Oq4a266FOpVReHCF5K9H4YwsSek43vFFc1e7nbiLwcD5mf
         kkrDCScO/9rW/fekloAINthwD8n3a2LHWw0+FDv2E1yJblvStfy2CFyOmdCYqHanW9pb
         //SjZVocQOja7sfRA8QKKnu07GXhGz8qkEmUQZeff0P4C17A1CfPb5y6AcGXAvh5I6e6
         +4zA==
X-Forwarded-Encrypted: i=1; AJvYcCV8eaXg0v0q/JMIxafaL61/iptHMY23fDSZQxU9ph5bXCUnmRDgs73zKCsf0a//zk4/hs+p+lfUqSo=@vger.kernel.org, AJvYcCXo87KF6qyxY9djOvSZ/Uag6nI9+cDwFqxQLU+QmmcjEMEp7O8PT7o99FuaSYwO5HEJPFgLs3OAAIxsUsjR@vger.kernel.org
X-Gm-Message-State: AOJu0YzopuuSD7YijQHA3MkfKWtwWgap3YwTNhIxpO0n83C2uFASB9Si
	U0i6Z613KVQdAlo97cgKbq/GhSuppuTIv0msI6er9AUdrQelY2v+oMCK3zCE
X-Gm-Gg: ASbGncsrOcPE3r4JkRWJOyqX8a351MqS/bmXdQtNkvOK+WNnUxQDvzkVFdIytkyckll
	s2Tld8I0hDP/TZ8A6UZFOPeX1gozncHHqtjYCbnjbhR2lTu814DdBdVLGamiaeOFqHxbGGbbGz4
	70EluuTjvgYeZz1RzIrMYSG8etJ0opuTtkqJckOuYcOPHftrwn2IWKo9JsEIJmEr4NE6+qKij0i
	EC4c7rfojMnLr3v2+0eY80Jcsn9eOuqMpJVmqy+OTeduJmQV9MloLKLeb3nBtQ/tDJXmvFPM5jR
	RPyHV5lwPw==
X-Google-Smtp-Source: AGHT+IG44qI/dgkLDoQgXMew27iZICM2uvMbm4ppzD+sdG6bHHhhSJOc01DaG6MiKXQ11FZQDwSE/Q==
X-Received: by 2002:a05:600c:a696:b0:436:1af3:5b13 with SMTP id 5b1f17b1804b1-4365c79ac13mr434891065e9.15.1735895961140;
        Fri, 03 Jan 2025 01:19:21 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:84e9:7adb:b646:c9c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366a093cbfsm452493275e9.22.2025.01.03.01.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 01:19:19 -0800 (PST)
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
Subject: [PATCH v4 8/9] i2c: riic: Use predefined macro and simplify clock tick calculation
Date: Fri,  3 Jan 2025 09:18:59 +0000
Message-ID: <20250103091900.428729-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Replace the hardcoded `1000000000` with the predefined `NSEC_PER_SEC`
macro for clarity. Simplify the code by introducing a `ns_per_tick`
variable to store `NSEC_PER_SEC / rate`, reducing redundancy and
improving readability.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
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
index eff1efd381dd..042933a2a985 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -47,6 +47,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <vdso/bits.h>
+#include <vdso/time64.h>
 
 #define ICCR1_ICE	BIT(7)
 #define ICCR1_IICRST	BIT(6)
@@ -314,6 +315,7 @@ static int riic_init_hw(struct riic_dev *riic)
 {
 	int ret;
 	unsigned long rate;
+	unsigned long ns_per_tick;
 	int total_ticks, cks, brl, brh;
 	struct i2c_timings *t = &riic->i2c_t;
 	struct device *dev = riic->adapter.dev.parent;
@@ -377,8 +379,9 @@ static int riic_init_hw(struct riic_dev *riic)
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
@@ -388,8 +391,7 @@ static int riic_init_hw(struct riic_dev *riic)
 
 	pr_debug("i2c-riic: freq=%lu, duty=%d, fall=%lu, rise=%lu, cks=%d, brl=%d, brh=%d\n",
 		 rate / total_ticks, ((brl + 3) * 100) / (brl + brh + 6),
-		 t->scl_fall_ns / (1000000000 / rate),
-		 t->scl_rise_ns / (1000000000 / rate), cks, brl, brh);
+		 t->scl_fall_ns / ns_per_tick, t->scl_rise_ns / ns_per_tick, cks, brl, brh);
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
-- 
2.43.0


