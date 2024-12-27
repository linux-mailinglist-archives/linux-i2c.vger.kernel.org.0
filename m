Return-Path: <linux-i2c+bounces-8760-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B62E29FD405
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 12:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 375E63A112A
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 11:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E781F4283;
	Fri, 27 Dec 2024 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIxsAGcZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B406B1F4279;
	Fri, 27 Dec 2024 11:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735300357; cv=none; b=Uthgi2A9vWWl+2w8VjmsurfJt3FKgaUVnfl6qsrXHvUOoi3F0dv+KMkVlGsOqoMKTYDTGx2IdI66AD/kBYoHm5ZAtnwFRC2oKzplyT003XXCPnF1ye+UZy+lOLnN+Qan88CvfurHkgPJ1iaodLUJqxPK0z9J9nhk0b1u74SmJrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735300357; c=relaxed/simple;
	bh=og/4mZT4bNYEAKSmR/ylW3YHosMHCE9n6VPZsM7lb2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vE6BT3d10xNrOG1yUC2YKazFOsfF9Qzfi9g2AYR9/QT9Bp1AE30D+YfuR5/OzuttZvV3yQ3TcMIGh2wNqSCTebC83OrLcoKu36+j7f8bJpvUismaE1Wa4Z6I1b9RFEZQPi3KJKPk45JulI3ly6BH1WFE1n2y8A4r91Lcpj53jhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIxsAGcZ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2162c0f6a39so95380435ad.0;
        Fri, 27 Dec 2024 03:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735300355; x=1735905155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxrnLWAApnmijlLFIQl/ov451ANyf6P2dk6YwXU3Ne0=;
        b=hIxsAGcZprTJ9n0qGJ7I0qoR+Kxgx3yZG0YL+1EfLTlwFcR2jCXAZhnf0IbRCKcGYz
         i7N/PDYTdh4XqRB0DoIpQZf5V0arOZCYnDrZe1cqI9rXvmS0MREJVcifAmAzQDtPA31t
         +L3QLhenIEGWIxJHyj657feZv25PieYZYMq/kqKjrvPl/rITgRBvfKdqDrvvd6QdCBks
         mPdOBWvffWikXN/aWFbx1Dd2sWL+r6ZPLIvHny4qt+eGovzQ4kxll2Et4etBwq6jcido
         JrDh5vWzv/DpWJDcPS/3bdgZOJyOp6Tf3DP1OwwP3HCqN79EjurzNyaxjWevyhhizcCi
         Otsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735300355; x=1735905155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxrnLWAApnmijlLFIQl/ov451ANyf6P2dk6YwXU3Ne0=;
        b=Q4ZGl7b4OWu3/4n0nfHvuhLY08rCv1299Y0anGZbdpnbZkJDZ+ULkVVtp5+n1jeKwr
         L9oeveUdQRMwwxwySE0LaSqsXSdRUZiqUFd7QD0MBur9TVLpJOrswFdUz+pmEmJ/V/cD
         0FaBVGg+PWhkIJdFfv025FXf/YeHqUn+1KlybG0lvbzEk2hZCKVn/bFgcqSy1gXqH1FQ
         RIdrFwes0jhOI1u/8NK7nDM9yNQA1vM2bipjips9zfS3gw1skc1aLIxGSInymOQGQSJ8
         7VJ21220Bdzcic+VpQgYba8oymOj3yQ58Ic4H3mBrfBZUbxGBjpjsK23GHeSIK0RX65A
         6Gsw==
X-Forwarded-Encrypted: i=1; AJvYcCWmpjDmripYji9X/65K9fSs9on3sg2RxURu9803il9C0nR29xHNnsENC8Vmro7RUGcYvp1ztaP+XIIqDGiW@vger.kernel.org, AJvYcCWuUgyfi6iw7hW8f/2/gRxRMxE5lqESe9eSNGdusWO/3Fq5oIrsrCGub1lDwllmfiiOYNl0rXIsFLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YycNfOK78dUn7wS6kVWPmGMkXxJxljJwfkqAp6e4GH5Ygiqmy34
	va4UmEJFeRSSapEMF88tRHQqQtmEQd1abz3LqA22u0u1HUpUr63l
X-Gm-Gg: ASbGncsrZAelDGAkSvlVHUqMJfg8vlLMtibW2QyEofcmVsiAO2o/5kSAPjK3ufXUV0H
	iwHrphrMjLD5Xy3xRkoKJT+IzUll6E8qDpBheNlPq99UC0hqUvFFG08rh8SQshhYeLRj0zHCG++
	a19GFfQYzVG8BEDJr/ZS0I36WhMpRu5WzxPYBO5x5zlOi+GhTb121AMEGne1ppkJ4e/AEee6tbL
	2+GLUCeKjmdMX6jlvblVgosggaoI205LudHp/gKe5gqtGjmBZdPfqMakF7uJHr1RPcvYlxKkUDa
	ozeDOoY=
X-Google-Smtp-Source: AGHT+IHtSLgnEjDMksHOF6grV+q2mjiLXJSbkTz7D07bHxrB0gSSLrsfjF9hKxiqgbgqLdyJ+6xAsA==
X-Received: by 2002:a05:6a21:648c:b0:1e2:2e4:6893 with SMTP id adf61e73a8af0-1e5e1e2979bmr43579802637.9.1735300354864;
        Fri, 27 Dec 2024 03:52:34 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:9010:ac08:3a91:844a:cc65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbcbbsm14363990b3a.97.2024.12.27.03.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 03:52:34 -0800 (PST)
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
Subject: [PATCH v3 8/8] i2c: riic: Add `riic_bus_barrier()` to check bus availability
Date: Fri, 27 Dec 2024 11:51:54 +0000
Message-ID: <20241227115154.56154-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v2->v3
- Collected RB and tested tags

v1->v2
- Used single register read to check SDA/SCL lines
---
 drivers/i2c/busses/i2c-riic.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index a2d0cde5ac54..cf20e75da044 100644
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
@@ -147,13 +171,11 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
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


