Return-Path: <linux-i2c+bounces-8878-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFC8A006C1
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 10:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 831B6163AFE
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 09:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FED1D63F5;
	Fri,  3 Jan 2025 09:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdruoAl8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572761D5CFF;
	Fri,  3 Jan 2025 09:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735895966; cv=none; b=rVgKx/rSQJ5lwLueDQHQF7VqvOrL6uhoS4hSjNPj7cxA74WV46XukNgSeiHUh6y9qN1sL77k821gpYelmc48R5HvMFV+SBKvt/n8HDn4aqRpbsMJ8qdgAGmyqqgCChS7Hc6YycyHQ1H8Odg1QY5Fzl/uCDcsfqRpb4XkUjBK6MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735895966; c=relaxed/simple;
	bh=+4OMMUZfh4BkjVViKYkCPGwka9jdUb6j6tqSnv6+3wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vc8XsEfsC6u07INhknB6V2T1OqxGFyBZDGIlmkty8y0USoK4bm4MJ8RxHFvoY7pZ4XX0jLwthwtIFXLu8R2jA/wOzVojqclAbpeq2ejDBmXLzKNa0Z9co0PpFPAHBZHVWzNsdwGIofUL7IIRJvTjFf3YDULoxhMG8jLXf173LNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdruoAl8; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385df53e559so9492117f8f.3;
        Fri, 03 Jan 2025 01:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735895962; x=1736500762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yurOIfpt2Q3gkoaHQayh4cFDnUaXcdQ7j4zWTYnga8=;
        b=OdruoAl829fkBBvNb95wYYsal5O8eg5iksqZ9IzY9nedj/E+63qmcN4X7l1piI1D2r
         /H2T4VJzJtSVpSAmTFsM6O/i5ZLy08AZKdV1zlvHSOdnXwjm2dzt5kSBdhw+n9KH+4eB
         ycLyKMI1SQ4iN/p3xDWt5Ws6a/PtS3kqHIuEBzpGC+6jIu5AXbCKguPjlxIVatHuC7rY
         FR/X5hZSqJF6cYUiFbrHK8BnzsUutK3AmFYREku7XcSZDIFpk0IH5SsJ8YfTLAp/Ecak
         VMsmjp3zC3TnNu/bYWEC3LO2mRWQtYb6j5vZHZRoJCZKv0ZzyXrxNZMx7p251+XJRi18
         AsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735895962; x=1736500762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0yurOIfpt2Q3gkoaHQayh4cFDnUaXcdQ7j4zWTYnga8=;
        b=J7SEHCZVbFqCV86LNUZ2ru0vMr1YTZPQY5J8mbtwJ3zOxFIvhCaaWjyM6pvFzEctp/
         cHp0Cm8uQNwaYhDFqwErlUslpidOA8hxO4qoBhlIg0ZRcPhnQxyx13haOurXnJsv4tul
         075L3uUFng+zdX8a35HCMwos7hlDHB02KwcOYzZeK1slCd6hN5jFrv4T2znNsX8JEk67
         gqTiRWJv47OulOZUx5GmUTUoRMjU1n+MCYs640UIi5rFqPyjsKzAd68aIF+Q7TE9JkUV
         n7Acb8vMqGY5XMch31U2LPOWKRTgZOF9/h8mGYwoMACQ2GNXQOqrvlolLx6/FNjjIKFa
         yHng==
X-Forwarded-Encrypted: i=1; AJvYcCVbfUXbLYPsG+Mlq+BouuDqY4K2sPYrlcNTC5MxA2e9nR5xwTv/+VdUT4wSBa6bBEirJw+ERezCYyJRaviB@vger.kernel.org, AJvYcCWiSry4L9+MPzl2YIYYRn2SjF8AFvQsY+r0aVgOrWSE1jwtOls/89jeg/faAJtV+5Rks6zjRa5DOXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIT/3J/cHcJ0PxjFU6qvbUIt95AuQZRWvVGwq6uzpKf3LaPwEQ
	eMkxG89cRUL5ILmlq754o9CYgK4Q+LMWIpi84v9ih/O5w/JUnJ2q
X-Gm-Gg: ASbGncvB8kP1upxXMcU1taWnXxvWJnVUmRf74zNEux49zNfcL+qI9eYg8ws+D7CL1wg
	YOxI6Sru9AZFitmfYmU0yPOlzoh2gYGqeppLaZPW0xbJB0ctFv+Uc9cg2KhZOXiNnUhi/mV0jnX
	4wxGRq+XrGLCojkyDu4Zt2dR1ZRihHgNmvAMsWQFMVky5bFy7CjE8FghlSbA+B5O0HkDHkS5i5Q
	SvQSCm1QmY/qInkbs3zxkxxxHFlprW1tswRqzD35f9AbMDOkCzETuX9oW6iIMyaBgSTU5MsS9Q8
	GpMz0sCL7Q==
X-Google-Smtp-Source: AGHT+IGj8NOm0X5nYwtYCd25/+ipYX/YuBIj/NeTZQqmtUaVhfyGmm7CLVb4/eebxY58FNsJZNud0Q==
X-Received: by 2002:a05:6000:144b:b0:385:efc7:932d with SMTP id ffacd0b85a97d-38a223ffb44mr40446408f8f.46.1735895962154;
        Fri, 03 Jan 2025 01:19:22 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:84e9:7adb:b646:c9c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366a093cbfsm452493275e9.22.2025.01.03.01.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 01:19:21 -0800 (PST)
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
Subject: [PATCH v4 9/9] i2c: riic: Add `riic_bus_barrier()` to check bus availability
Date: Fri,  3 Jan 2025 09:19:00 +0000
Message-ID: <20250103091900.428729-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 042933a2a985..bb8383d53b52 100644
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
@@ -52,6 +53,8 @@
 #define ICCR1_ICE	BIT(7)
 #define ICCR1_IICRST	BIT(6)
 #define ICCR1_SOWP	BIT(4)
+#define ICCR1_SCLI	BIT(1)
+#define ICCR1_SDAI	BIT(0)
 
 #define ICCR2_BBSY	BIT(7)
 #define ICCR2_SP	BIT(3)
@@ -137,6 +140,27 @@ static inline void riic_clear_set_bit(struct riic_dev *riic, u8 clear, u8 set, u
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
@@ -149,13 +173,11 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
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


