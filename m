Return-Path: <linux-i2c+bounces-10712-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFB8AA54FA
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 21:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 543641C22810
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 19:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB416276025;
	Wed, 30 Apr 2025 19:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IL85ScRX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE17B1DDC0B;
	Wed, 30 Apr 2025 19:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746042419; cv=none; b=GI6hgNsY/y+oPXR76axThSzjcWOQ5gBJ9SMrGtKjF+7EU/mBRnLXA70qLZTBvBcz7rKqQ2Mz3E8OnI5ntoAZ/hQJ/7hRE0rCXIVpA2sLXVmVerDNYCSRyrw4OOKCQ5sqcaarDB3tc74T/GtAzTIcsj+xXwdfOQDjdv16Za+6Euc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746042419; c=relaxed/simple;
	bh=WKCK2tn5wB2qCSrWfSxehJ1Pi1fyjtSVwxfap0lLWZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cNbB9N9aE+TtmrLZXnz5M24pdEoEbPprTvcR9iAtzMnM+OQ6lTGS2vWnWQ6+9Hbi99hMdMn6Ri15rxO/n3VpnxA7banyHyowMN1VuZlDTrmVz+ijxxQ74mZsSP5D999oOCsikvbWwfhiBhWC4xS/3tGF8GA+ORIuyQ10lJLUU0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IL85ScRX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf680d351so7913055e9.0;
        Wed, 30 Apr 2025 12:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746042416; x=1746647216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoQqeV/Aw5s9vNmJJr19RcGCs9WfikYSyXiIiBXDlJc=;
        b=IL85ScRXQzQbuOCNHerdcFcn4HmfVWJ/ezD1GtzJd5aqwhyDNjpKY+3Zg8GoeDot+n
         6/6YRrxKdgsiqUJbfhHlj3mQzCajwRge3uYw7dYBNtN0ANZgTsU8Z/mfbdiqgRuKhK0d
         4j1tLb4YFgDlqQ/S4hN4iQ/CpoMMiiQI7XCfJHaFNKgKXpidVGsRWDDGlL7cVEy8gBJu
         UWAu8NcOUxlvdonC/hejnFIfJI54EXCogRDxURJ9Cakk1zIL+mB1GQT5m1NOk6DGGeQY
         fn+NI1AoYpocRBDcvC+o1wSe7Jqnj4fhwCCJ0HK9vB9xseTVc2UiARzItVi7KbCwmAKQ
         6goQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746042416; x=1746647216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DoQqeV/Aw5s9vNmJJr19RcGCs9WfikYSyXiIiBXDlJc=;
        b=W+nTbSQe8DrbAdYi46t3M/NSUKCV24aGzs1l8l/R2mjD9hCORlkWWeCBiggEaQ/6AI
         8CSaQOmEwH/tKrZwR+xVpLej8K3v4adjMWRtuSCYlXQ/USBYuw7P4Ti8YSqCYPUwr3fg
         ZQDu0lk70G/+13p5GO4FSNXlUCpIrqHGuqOjErt6izUsLCDisribpOdmXkAN3zz079uO
         jORDIIBikUKEUQZkhW6+3GXMt9uOCJIOTZkjhbMXBuLiYA53T7N+3tNMZqlpqa0v/fAf
         fbzC/7F4xAQ18RDub+z05Oct+DBCSdfKHZQP/HaVrsK/pDuxWVhm3oSUS63EVKXTgSIR
         LZaA==
X-Forwarded-Encrypted: i=1; AJvYcCWcETtG5rhIVmpAV4g7ozsChqq4VtDkXW6OueoPSHgOPDaUW9730xPK39GPE6cNHOx/d6Vsm/Qmw7+rbu52@vger.kernel.org, AJvYcCWn3mQK/Ct1jfmilO1P5PVY3Qk9KnSzzhOyx6E5x5P/ZQA0zDCy9ipAFbAwm6A/s3EVdtcvfXPhsek=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZiAslOmKrAufWvnKPqwt1nltjYKnRwcgMv+JDfxYMaL8szYnF
	33WIv/XI5A50xp9CLSKmcTL7R8slPkwshhVypkrvR6l5dJtG/RAT
X-Gm-Gg: ASbGncuLqnkD/c9wKvSq+1llo4tBuyO7jw+chCtL3dJ7dPZLDIbZkgE4qBR9Ny59YiE
	smR6xukXXKdUml8g0PKqdnhk8O87CAvN1/hZfhZDMfVH+hzzT9J0LoR03hXtZ5/0NL1Eac07jh7
	R9raimm0O7jO5wK576lOkgDzmqaaP2euBDnwZniSH5Kdoc6Ip8Q0lUpurSi3SzNYlykPBW00Zff
	ouokKhLo4KRhFhUJBOnsn6f01GK8n2y6sQ6+cFmvP4E0RJ2lXm/r23CF3VxHItye1QBxm8cyM5M
	BNFYc3pGKaiaSp7DAUDzsn7i+TOhjlIzTFdWJX6nhJ/LEJbkmWBxJlUQSBIZUAtAb60e4qHA47s
	=
X-Google-Smtp-Source: AGHT+IGsdAAvCLhiw2OjKgxq3viK7+pv6o27XdNNwzYFElUloDVRGL8LC8ht5HFJtSwnmf/rEHayiw==
X-Received: by 2002:a05:6000:1807:b0:3a0:7caf:7de with SMTP id ffacd0b85a97d-3a092cf4c0dmr636821f8f.11.1746042415953;
        Wed, 30 Apr 2025 12:46:55 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46517sm17861646f8f.71.2025.04.30.12.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 12:46:55 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 1/2] i2c: riic: Implement bus recovery
Date: Wed, 30 Apr 2025 20:46:46 +0100
Message-ID: <20250430194647.332553-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430194647.332553-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430194647.332553-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Implement I2C bus recovery support for the RIIC controller by making use
of software-controlled SCL and SDA line manipulation. The controller allows
forcing SCL and SDA levels through control bits, which enables generation
of manual clock pulses and a stop condition to free a stuck bus.

This implementation wires up the bus recovery mechanism using
i2c_generic_scl_recovery and provides get/set operations for SCL and SDA.

This allows the RIIC driver to recover from bus hang scenarios where SDA
is held low by a slave.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 53 +++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index d7dddd6c296a..740e53bdb2a9 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -53,6 +53,8 @@
 #define ICCR1_IICRST	BIT(6)
 #define ICCR1_SOWP	BIT(4)
 #define ICCR1_SCLI	BIT(1)
+#define ICCR1_SCLO     BIT(3)
+#define ICCR1_SDAO     BIT(2)
 #define ICCR1_SDAI	BIT(0)
 
 #define ICCR2_BBSY	BIT(7)
@@ -151,11 +153,11 @@ static int riic_bus_barrier(struct riic_dev *riic)
 	ret = readb_poll_timeout(riic->base + riic->info->regs[RIIC_ICCR2], val,
 				 !(val & ICCR2_BBSY), 10, riic->adapter.timeout);
 	if (ret)
-		return ret;
+		return i2c_recover_bus(&riic->adapter);
 
 	if ((riic_readb(riic, RIIC_ICCR1) & (ICCR1_SDAI | ICCR1_SCLI)) !=
 	     (ICCR1_SDAI | ICCR1_SCLI))
-		return -EBUSY;
+		return i2c_recover_bus(&riic->adapter);
 
 	return 0;
 }
@@ -439,6 +441,52 @@ static int riic_init_hw(struct riic_dev *riic)
 	return 0;
 }
 
+static int riic_get_scl(struct i2c_adapter *adap)
+{
+	struct riic_dev *riic = i2c_get_adapdata(adap);
+
+	return !!(riic_readb(riic, RIIC_ICCR1) & ICCR1_SCLI);
+}
+
+static int riic_get_sda(struct i2c_adapter *adap)
+{
+	struct riic_dev *riic = i2c_get_adapdata(adap);
+
+	return !!(riic_readb(riic, RIIC_ICCR1) & ICCR1_SDAI);
+}
+
+static void riic_set_scl(struct i2c_adapter *adap, int val)
+{
+	struct riic_dev *riic = i2c_get_adapdata(adap);
+
+	if (val)
+		riic_clear_set_bit(riic, ICCR1_SOWP, ICCR1_SCLO, RIIC_ICCR1);
+	else
+		riic_clear_set_bit(riic, ICCR1_SOWP | ICCR1_SCLO, 0, RIIC_ICCR1);
+
+	riic_clear_set_bit(riic, 0, ICCR1_SOWP, RIIC_ICCR1);
+}
+
+static void riic_set_sda(struct i2c_adapter *adap, int val)
+{
+	struct riic_dev *riic = i2c_get_adapdata(adap);
+
+	if (val)
+		riic_clear_set_bit(riic, ICCR1_SOWP, ICCR1_SDAO, RIIC_ICCR1);
+	else
+		riic_clear_set_bit(riic, ICCR1_SOWP | ICCR1_SDAO, 0, RIIC_ICCR1);
+
+	riic_clear_set_bit(riic, 0, ICCR1_SOWP, RIIC_ICCR1);
+}
+
+static struct i2c_bus_recovery_info riic_bri = {
+	.recover_bus = i2c_generic_scl_recovery,
+	.get_scl = riic_get_scl,
+	.set_scl = riic_set_scl,
+	.get_sda = riic_get_sda,
+	.set_sda = riic_set_sda,
+};
+
 static const struct riic_irq_desc riic_irqs[] = {
 	{ .res_num = 0, .isr = riic_tend_isr, .name = "riic-tend" },
 	{ .res_num = 1, .isr = riic_rdrf_isr, .name = "riic-rdrf" },
@@ -495,6 +543,7 @@ static int riic_i2c_probe(struct platform_device *pdev)
 	adap->algo = &riic_algo;
 	adap->dev.parent = dev;
 	adap->dev.of_node = dev->of_node;
+	adap->bus_recovery_info = &riic_bri;
 
 	init_completion(&riic->msg_done);
 
-- 
2.49.0


