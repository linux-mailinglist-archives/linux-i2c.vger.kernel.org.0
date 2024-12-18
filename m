Return-Path: <linux-i2c+bounces-8588-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9E39F5B4F
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 01:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC59417311F
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 00:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8541013BC0E;
	Wed, 18 Dec 2024 00:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbZgf6RB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6BA132105;
	Wed, 18 Dec 2024 00:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734481004; cv=none; b=KG14K72jqmH9ciZBoU0bzLSFVCwJ1g3ppuj2Uq7wYFWPGUym6sGpE9ZAF6oA5bqXi3wMiKmOwwXXbQI5QiHJnyK3MKx6MXbGKFRtB4W3WcyCBruQTTitTESYvqYKT/jRE/NPoq4jW6TvG/8DMoIWMrCXmsOt8yIPVagwdN8bSAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734481004; c=relaxed/simple;
	bh=dEhhjSkwOsvO0yfTViPopf8lOjINrFffHGS1mQAkTNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E16UAdslNF4x+I98ic36aVDnOqFknecnTP1DDbb/CDOVqFP0+8Vmr6JsQCbTQPy4WaGQ3hD589eCN6lKbOrKsF1XnrUsm7Gm+vRniCx83SwAeKTBzT2rO7dk1jZKunLaDfCwgMnfhAX75Ue2gbrsgTvI8M88UBDQDJDmo11xCec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbZgf6RB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434a766b475so61935085e9.1;
        Tue, 17 Dec 2024 16:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734481000; x=1735085800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yvkm4UBpAer1MShQHJyBEWf6t2rql/v0gNJBjW4RLVI=;
        b=bbZgf6RBxLWHrMUjCyh8TqVmBTShF4aQunrHphEA4Jm6JHeT5iEhlPi6kA+3LDy7bQ
         X4zzkYVX5/W2wUmD0EzaGyCtxXM8raVtQiIJEH26iesr8785MlZT5YYQ5HW08TOyjpok
         Lap18IXCnHqZzU8Te1hWc46KAES1Ms7AWvhhg1z7cZfG425+9+1KVG0qdR1GHl9TqLE6
         2AcuZgHDCSXvIHHgfxrr2C9DLoqyX101TbrLeMEmqpKeFtLAASh7bG6cR2OusmmFBXCd
         fvCp0eRCU0jsldN9dyxfmgMzZcA2eMOVmbDUG9N94QC5DwQnBSz8w0Lc+dX2A/K4DNZk
         4b1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734481000; x=1735085800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yvkm4UBpAer1MShQHJyBEWf6t2rql/v0gNJBjW4RLVI=;
        b=KYIaBigufeEMexad8lWmbArS+IEx0sY2hrhvf2WVPRQPifhm4ZMWhE2VUk3xGyKLnw
         tvLZWIU5yon9EZsIytjzVfGLPjGyQK+zdcQ471xaCxkXnKes0qFgzJ4+ctaVwdzaRDdY
         uHAqUyn0TeteAOlpP7gRIlG9bo1fv6XQzn/7JQ55p+cVU7gpAI9zeouClBUz1K4DOcEp
         +yHXMREfhvFtKCZ3Sx04uG6KuB/oPnL6DEumnJgswgs9jdo+5IuNoOCaukiQL3WwCnWw
         5RqWo3HRwp29eb02rPmGLqIkerxwFCA+6Gffw+z9NMpAh5JleTyJOFwpx/JotAyCDn/e
         YDrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvw1UiOIIyULdoAdxKE6IWZBdR3UhmRtnVDOl6A0cqCQBAZpmpz+/ZM391SYGt1Xu8v9lbQvhtRZGuFFGi@vger.kernel.org, AJvYcCXU31ZCk9Ksa9bbtjoLxzGWORuCqY9wAX4/UIcnKQck2Bw6ODHvU1rKly4AATSBxjVLXiNKp4RT3oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbPwtd5QXHnTyj8ioN6DTpFyZNF+dieiXBIT/BrTntqopoPPjE
	hrKT+tlJmsdJPyTwzddc+n/P2QRGP7xw//4MNCdua2zpLUS5GDl/
X-Gm-Gg: ASbGncuL2UgSNtHeUrgnmgQT0XitiL7HFKws92akJEsUswK6QgGkoAG27k85KmiHfGB
	Ea/6YQOuIeJsbkjuUiEDa2Ll946wd5sbm/SRq+dvKAVdCsuVA/w5pAyyyxdLYLn33b/26hWfeul
	S8Rosunpq3SN+VKpzq1lcARXKQPg6N+im+QtHDDdFZT0uRoK6EwSmqdCX4ZnsaHF4ksTlYCjQpl
	e9nTeZKX35pFd2Z798Zd0vuVkLwzW/sNkM19/u8uFfcsu+W5JsWDFzYWyIQUW45JDyLMtk3pTC5
	spU0I55cag==
X-Google-Smtp-Source: AGHT+IHbChzHzVEJjYkpceGOI4V0se0kepaUxaf5o3D/fAdXBr90ot/F9Sx15BvHAQRJl9H+MThydw==
X-Received: by 2002:a05:6000:178b:b0:386:3835:9fec with SMTP id ffacd0b85a97d-388e4d8fbc0mr592302f8f.44.1734480999844;
        Tue, 17 Dec 2024 16:16:39 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:ca61:1d3a:8af0:1c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b1f638sm2135495e9.37.2024.12.17.16.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:16:39 -0800 (PST)
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
Subject: [PATCH v2 8/9] i2c: riic: Add `riic_bus_barrier()` to check bus availability
Date: Wed, 18 Dec 2024 00:16:17 +0000
Message-ID: <20241218001618.488946-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2
- Used single register read to check SDA/SCL lines
---
 drivers/i2c/busses/i2c-riic.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index a2d0cde5ac54..586092454bb2 100644
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


