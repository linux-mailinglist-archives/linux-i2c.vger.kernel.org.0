Return-Path: <linux-i2c+bounces-9052-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBF7A0B6F2
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 13:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4894F3A4F8D
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 12:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2D823DEA8;
	Mon, 13 Jan 2025 12:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emkZJg63"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C766623A579;
	Mon, 13 Jan 2025 12:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736771227; cv=none; b=BBs2DOmZVfu6vrfjV0vCFgMknz0pJD07i9r/SwnvtKHBsYdkEquS5uHjN+0LQ8iFyExFj7YtEPCJe6XVI13s5qI9mRCRAihgNQemN9l0mSWv88tNBOwb821wJDIsOQ9jgZZGBAN+ZAv4zFE6M9VrsP1TgMpyopJpwfUE2vlDH6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736771227; c=relaxed/simple;
	bh=3Uv1tiFV4GlgTWpZ9h/HxzvVDe0P5DA97d4NIr0LF8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HS3blyUIosHF52gIlkQaIhP1j9LHoLmZ8RcAO0LQxHbsIMlCRvBdyoj2N7XCDzmwxh/m6SxN8x6IRQ7g/aEfclEYmxqGkyyfVbZ+GvFq26/oMdHioQ9s23npb6K4eL0jDzdJtu1pw/bLP4YR2Frwastuhrmxgda3mLyqBjwtQp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emkZJg63; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so2138439f8f.2;
        Mon, 13 Jan 2025 04:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736771224; x=1737376024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4+VZACaH/dvwtO2cJgknMiIs63iY2gH5Qg6pU/Yu0g=;
        b=emkZJg63+R95F1TvsxjeM+W5AxRUOQJLkGqkYJSupL6+uifzscOI2Kk5s/6heF8JgY
         w+fEloAD95eM4/8qwI/KuHRUCO3KOTrK/QzEfPbXVQ6lmduqDauHrVJLPH4w+vixmZ6v
         cwyRvl13A3uFiDHZiAlyJR3ZJ3OgzSb4Jtx4UxOyZZFMEFW6FMN4kGzN5Rjxeb28/7Zy
         BILnfxs5pSH8IK7d7c+6dlRb3s0NEsVw0d6+j2xazbHRmBzIvSuHeYVFbPwMUhb1FZRi
         ljl6WJkVdJ/LuZNe8ElirS1Ns1gsmu1/jtpqAN2bxfGuMOCh/QeZZBmnFRe2dz+t96SA
         YFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736771224; x=1737376024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m4+VZACaH/dvwtO2cJgknMiIs63iY2gH5Qg6pU/Yu0g=;
        b=HrxhZc0zNIP5y3g3i7gs7EnJtxp8HcW+BqS2zWYuXMs1ZTZQO6ju3L6KNz3pDEUU6/
         IHLrZ9XMtaucdRjd3Hjdl/No6BikoSmfVD0eXMr0GIE9iCe+LyZD+lY4Ob4TUJWSGzfa
         78G9YhdHMD/P2BTyyHiphyLl5eL/UtV6bc2m8FVhjeCMaOOvC36vCH8g8mE2URPqSKxG
         TwXClKb8y3t1dX9NfLsWovyobc8imQQuxqzK5CDLRFyHkfFPyhl0MuB6Wdjh23FWcmPO
         W6/3XYX4REFkin45KlYnQmzqkhrDWTqcQD/RIO/rZ9kT4KtUb5BkG5f6wdEcp4gOETi2
         biRg==
X-Forwarded-Encrypted: i=1; AJvYcCXFUFoqItG+a9i6jN31/wxUHuvll9WNHx5TEiaThQQVT+qVwzbdmJRfXMBVKvAbmsvuRoumfpygCJw=@vger.kernel.org, AJvYcCXJiPvmaRd/gYma1wDjH4/DvKRL6suPAQAiDYUgefFgDqnAX5b+58DMjs6+eZl4JKvIB08BOV6KihOuNYCJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxzImU31V/EHyrlpYHmXdmLtoOXrEkf3zn04m25MBMIGnn4I7OX
	1XNcTZTUH8VnceP4lE1lH/I+OQxOCXFcW/RgjFmLJ9roNjNy6tYD
X-Gm-Gg: ASbGncu5uMWItgRED8RPxvvX/KKZbWW+xRRVIxIbbHD0I2NH3Ic4Ra9/HEIsPeChOsE
	R/QqMK1f769Ypalm80SDnr90eg0ui6TQXQC5ItVCjdtkPBeQ/paLhaCXoMrP4WA2M3ynprJiWzG
	cXwptAjtlaRGDekRpBuHYdXk00PKI8tVbkag8hgQnY8VRxdL16kr+JiMmsgirNX3KRgJh5ImFXq
	ymeNDnr7BL1Veoh6NanK3nu1JkAdaeQfxet7PHjpRPxnRFzkv5X5Ds+yrLI4g4vYO2qgpl0/cap
	nzmD0W5VcA==
X-Google-Smtp-Source: AGHT+IFIKmE9m3bgbks+HbC08EMGmjcJ0dZpnRP4TPeBI6bN2lK0m8TJ2zk3DyzOBoCo9BLBol6U1g==
X-Received: by 2002:a5d:5f85:0:b0:385:fdc2:1808 with SMTP id ffacd0b85a97d-38a87336ee3mr18961746f8f.40.1736771223887;
        Mon, 13 Jan 2025 04:27:03 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:acc9:404c:3a6c:d1aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c23dcsm11812720f8f.101.2025.01.13.04.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:27:03 -0800 (PST)
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
Subject: [PATCH v6 09/10] i2c: riic: Add `riic_bus_barrier()` to check bus availability
Date: Mon, 13 Jan 2025 12:26:42 +0000
Message-ID: <20250113122643.819379-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Introduce a new `riic_bus_barrier()` function to verify bus availability
before initiating an I2C transfer. This function enhances the bus
arbitration check by ensuring that the SDA and SCL lines are not held low,
in addition to checking the BBSY flag using `readb_poll_timeout()`.

Previously, only the BBSY flag was checked to determine bus availability.
However, it is possible for the SDA line to remain low even when BBSY = 0.
This new implementation performs an additional check on the SDA and SCL
lines to avoid potential bus contention issues.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v4->v6
- No change

v3->v4
- No change

v3->v4
- Propogated error code when readb_poll_timeout() failed
- I've kept the RB/TB tags as the changes were minimal.

v2->v3
- Collected RB and tested tags

v1->v2
- Used single register read to check SDA/SCL lines
---
 drivers/i2c/busses/i2c-riic.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index aa3e4f430b11..d7dddd6c296a 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -41,6 +41,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -51,6 +52,8 @@
 #define ICCR1_ICE	BIT(7)
 #define ICCR1_IICRST	BIT(6)
 #define ICCR1_SOWP	BIT(4)
+#define ICCR1_SCLI	BIT(1)
+#define ICCR1_SDAI	BIT(0)
 
 #define ICCR2_BBSY	BIT(7)
 #define ICCR2_SP	BIT(3)
@@ -136,6 +139,27 @@ static inline void riic_clear_set_bit(struct riic_dev *riic, u8 clear, u8 set, u
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
+		return ret;
+
+	if ((riic_readb(riic, RIIC_ICCR1) & (ICCR1_SDAI | ICCR1_SCLI)) !=
+	     (ICCR1_SDAI | ICCR1_SCLI))
+		return -EBUSY;
+
+	return 0;
+}
+
 static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 {
 	struct riic_dev *riic = i2c_get_adapdata(adap);
@@ -148,13 +172,11 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	if (ret)
 		return ret;
 
-	if (riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) {
-		riic->err = -EBUSY;
+	riic->err = riic_bus_barrier(riic);
+	if (riic->err)
 		goto out;
-	}
 
 	reinit_completion(&riic->msg_done);
-	riic->err = 0;
 
 	riic_writeb(riic, 0, RIIC_ICSR2);
 
-- 
2.43.0


