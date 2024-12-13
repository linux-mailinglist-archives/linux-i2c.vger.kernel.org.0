Return-Path: <linux-i2c+bounces-8502-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA1C9F1490
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 19:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7936228139B
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 18:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838991F0E4B;
	Fri, 13 Dec 2024 17:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGMKp0Kd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809B01F03CE;
	Fri, 13 Dec 2024 17:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734112727; cv=none; b=n33bQ6G1HmPVelyLz7bF9jLS6i87CKeIDCS1W9ufECvNI8Uv6TBC7Qh0gBfaedtpyqdH0KiRv8mNyGTolkbmsjxpsoBcfxcnM1vPP/dDm1PHhDv/nVqYy8s5tLEGhD+SNE67mFR+YMdDWPvYW9hCzH5mnJJzFcBRb8A7M+SqlvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734112727; c=relaxed/simple;
	bh=DpIe8jgrItvnhSA7SbrN6HdkN/siT0OgekjPRdjzvzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oA3hk2qjKpayh46P77P06dda080VJguHJgs4tA7KuKUtdEZn1OKDCCY4eXOBqFXEowcV1ah7XHDurC7CSrB+hgSzLkLj6SBoKyGxkNZ+Xhz9ylJBmVEKkgBu/KKR+oHF2on2J7aUtuKyZUZYQ3RMDZK0MTtESVYWfOXH3HFp7SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGMKp0Kd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43621d27adeso14612915e9.2;
        Fri, 13 Dec 2024 09:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734112724; x=1734717524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmWil1cxIYx3s+bMSXeGjJtO1HSZn1VjUtrO9+QRfPU=;
        b=hGMKp0Kd/vf57E+jM/Flc/rye4lO6qHvjCL2aK7S4KbHQeKPNATWm3+CiOLuV9k4gq
         3HY0kLk4GGoGoq3xZ8pJFlqxRnptt9qW6MKO5Xd5M1Gjm8H093VFxFwXlrcSmeuumdd6
         ggUJHsbXwmeZ8WfDDhWnYq7gQvVtKSJyVqgTBz9Ak4LFRGerrhRyltj0oM2XyGZpr3W3
         XLBmXeBAlG6Jz7cSJdk9Sl8+bUp++0TdsGxZiZ7LDSJ9Sr+gymI1vuDaWrhZFqs3GbqB
         w/DKRXaoABlWzlGyQv2BlON1jvs3tH62h40GCAdBn/haEPKlHfwxcL1BD9zgpQNYzh8/
         qTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734112724; x=1734717524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmWil1cxIYx3s+bMSXeGjJtO1HSZn1VjUtrO9+QRfPU=;
        b=XGq6FOQf4mwwhIakIlc4bEqE0HD0krQkwFWSIarmRg74fph8dE0mwhwR4zjsdd1qDB
         oUglYHjLvnrQ/B/Qdfa3WS7kS9nPB/P2B5ktrjKCTEXWCo/OExsmY9l1taZXZiMUhbxD
         OPchS8HP5Xo9KZLvIA0QIbSFrEytJ4QRGu7iWD2hRhGG8Q3nTaQB1yG11fIscFJdtu3D
         2SBWe1lBDzrSvYf9LzbvSlzY262eiVelK4fnhVtVZX2Bdl1OtP19aA+NWEs3vowxAygk
         e9CaZlBNiATgREDelKOhtHlt3pU18qu7/5uUKyr9EbGhqNJcKWbryMki7IgZeuKAo71Z
         WM6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHcrQ9r4BoooiPnOTrpMBDZ3DVsYHdWtl4NGtdV1o/unvNfYOuYMhx/6eF+KyyyOp6RpAZXdZLef1dHtJ1@vger.kernel.org, AJvYcCUxGat/wKYalq9KBKAVTbuUL1Ap/OKL9mhlbOGGn7n5SM4efoRgcftCnOPIk/GjZtzZRfQOGWQjCHE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza6ie80mpYWcxYRIHKZ4x2r4V4uJvxXpQkfV9sMtfbw06bkjOs
	Rn497LIrv4iYBYy/6rcdqVqqSUUuP3cBXqLnaO6fS6ARPniOgwBd
X-Gm-Gg: ASbGncvH+jS12yQ+hXqLQ47ejdWmGnS3OoX9i+dyTNimR/o/oOnZBGjRNJKXEyTs5qk
	Iod82I0K11daexiNoOPP1KWGH+GDJWXBklXsTab/0+oS5Q/QoWGQJD7vTc43F2ZnEOaacC0ZmEY
	VJg0H4igOYcWvRqsPVzt6Hkozh40UJykcWm6A9stb/bBUGy46aHfkVW6GMVIDQvbAuEicpYf4u0
	mqvcDl9+jg2mvGzukjawYFDtjzUbajPxlwC+PovtsaREaWiURDy3pF8Qh9woTdJPQdHKPT4xu7k
	x9tWCyPMTA==
X-Google-Smtp-Source: AGHT+IEDHANdD0OtyAiI+EfqRMxcoPqhmLiqQ33TANc7Xqyva6QVsG50d/sXV3IKiC+zIFMXPK+inw==
X-Received: by 2002:a05:600c:1c82:b0:435:9ed3:5688 with SMTP id 5b1f17b1804b1-4362aa6f39emr33644775e9.18.1734112723656;
        Fri, 13 Dec 2024 09:58:43 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:4eec:e99c:89a6:d7a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c804d573sm119088f8f.64.2024.12.13.09.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 09:58:42 -0800 (PST)
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
Subject: [PATCH 8/9] i2c: riic: Add `riic_bus_barrier()` to check bus availability
Date: Fri, 13 Dec 2024 17:58:27 +0000
Message-ID: <20241213175828.909987-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Introduce a new `riic_bus_barrier()` function to verify bus availability
before initiating an I2C transfer. This function enhances the bus
arbitration check by ensuring that the SDA and SCL lines are not held low,
in addition to checking the BBSY flag using `readb_poll_timeout()`.

Previously, only the BBSY flag was checked to determine bus availability.
However, it is possible for the SDA line to remain low even when BBSY = 0.
This new implementation performs an additional check on the SDA and SCL
lines to avoid potential bus contention issues.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 48812e7d9cef..919da1bdcce5 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -40,6 +40,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -50,6 +51,8 @@
 #define ICCR1_ICE	BIT(7)
 #define ICCR1_IICRST	BIT(6)
 #define ICCR1_SOWP	BIT(4)
+#define ICCR1_SCLI	BIT(1)
+#define ICCR1_SDAI	BIT(0)
 
 #define ICCR2_BBSY	BIT(7)
 #define ICCR2_SP	BIT(3)
@@ -135,6 +138,27 @@ static inline void riic_clear_set_bit(struct riic_dev *riic, u8 clear, u8 set, u
 	riic_writeb(riic, (riic_readb(riic, reg) & ~clear) | set, reg);
 }
 
+static int riic_bus_barrier(struct riic_dev *riic)
+{
+	int ret;
+	u8 val;
+
+	/*
+	 * The SDA line can still be low even when BBSY = 0. Therefore, after checking
+	 * the BBSY flag, also verify that the SDA and SCL lines are not being held low.
+	 */
+	ret = readb_poll_timeout(riic->base + riic->info->regs[RIIC_ICCR2], val,
+				 !(val & ICCR2_BBSY), 10, riic->adapter.timeout);
+	if (ret)
+		return -EBUSY;
+
+	if (!(riic_readb(riic, RIIC_ICCR1) & ICCR1_SDAI) ||
+	    !(riic_readb(riic, RIIC_ICCR1) & ICCR1_SCLI))
+		return -EBUSY;
+
+	return 0;
+}
+
 static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 {
 	struct riic_dev *riic = i2c_get_adapdata(adap);
@@ -147,10 +171,9 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	if (ret)
 		return ret;
 
-	if (riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) {
-		riic->err = -EBUSY;
+	riic->err = riic_bus_barrier(riic);
+	if (riic->err)
 		goto out;
-	}
 
 	reinit_completion(&riic->msg_done);
 	riic->err = 0;
-- 
2.43.0


