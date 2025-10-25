Return-Path: <linux-i2c+bounces-13804-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ED9C09D9D
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Oct 2025 19:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 824965615FF
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Oct 2025 16:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B95A3126BF;
	Sat, 25 Oct 2025 16:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epYhg3gv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E224310774
	for <linux-i2c@vger.kernel.org>; Sat, 25 Oct 2025 16:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761410453; cv=none; b=Tg11ufutzWGLjdDZAobkZL4dyyhAAMgOF1X5Nfd0h+4VLvZRUfHJrHTopGrtiQwJzw+s5Re9rqKzfZ20WULQvXAJl9JaO9bXGCFWaLytt9Ly7A9waD0xE60WWu1VD1tKJ/fIsXHQdVhFc0KU2WMVY0qsjy2qxYX40cV5GyHeLx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761410453; c=relaxed/simple;
	bh=miSwCWAWlgSls2mz8C4vY/8512hTOCwNwE82bGQwr34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cZvlHlvlI1kHdhUylOe3gvGf+/sm9PcUM9ui7UAdcCdfs6F0eFFv9x3zW//JSsxXL1otap3WZRwoHB7a85+KgRldkO6n7efRq3WwEeiOWPoICILVI58aXIAKWwj/KaOiNbCX6Qa03yOhz5Em6y/IFLPvB7M/pNfzKiuEEYV9ROE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epYhg3gv; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4e4d9fc4316so34504061cf.2
        for <linux-i2c@vger.kernel.org>; Sat, 25 Oct 2025 09:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410450; x=1762015250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhEz+tkYwuCSnU6LNYxfD5DkxTKdrSyEg2dThddkEgo=;
        b=epYhg3gvZzKHKHOJgQngb8ty+no/S030Bw2bPZcIikPfhcCFkDCvAEuCOudSywR4ZX
         LjXgG+dhg/7YWCFHvpLjnhqrY2+Zk171kJNnvw6sw7pzI0nqHWuNGWLScLi7m7uBR/Mw
         lpbzm2P+3j6qMP2vJa+rOOasmnZVYrmEO2VbYfXj6oicn/DHc5HrGMNfcPQsiEgHeIJE
         zkJhdRoWyhpYj4lSLJibNnztw2+eB9qpSinEqISekDz8gF9rvUSCMnqNLt871pPnTlq6
         RAnZoTlEmPNEitmJU3AtHUNxD1R90exH3Dytfh2gxad5drz0bSRaFv2U6fjk/xqASl3K
         OYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410450; x=1762015250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhEz+tkYwuCSnU6LNYxfD5DkxTKdrSyEg2dThddkEgo=;
        b=Y27wRvAtSSDrNrUVzeOLzFeFvgcNZRzhDtbGsWLzOsLiBXpzM4aiROpAeYuN+sYzvd
         9ov4dR+B9lLlYKwVc2ATkB+x4wCFMVx3fu07Ubxt3r7mzii0j46VDWPdLjYkZ6yiJ7bA
         CXibphRtl73qWdWtq7ipTLJu50Fzr7KB+n0w8DQQYFQvd59Y56P0bRsbpaGa+jUILTH/
         cgmCqYgzx5RP/NLOwWcH8LoL7LGDO75YfdX0ayXSckL5CMxKPmj6l5A+41c6JNf+64aR
         6d7n0REsV+9MhIu0CeH6RIzO8iHrLFs+iUa5kXFs3SunstslDj2JWP0AkREuVHOVYCUb
         yA4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHEacFzIyVaHyb4Tw/8ORZZl/pPBNhRGCYNjg2efaix7bllHmPTQ4GudurXz5NpKyaaS4K8dToVVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZhBDrLwkufpQYeuYB1YlC26V5hXGc1TrfZ27mSuD8k7xLBBiZ
	pP7NjtVR1e0v1LuwiHa9a9cf6GF3fMVrKl9C0UCJFppfu9vVwoP+eEoV
X-Gm-Gg: ASbGnctLLCmVx0zBssRPLXaIGtKNiyX1NX5XLe5Kw/eIXKROtz3/9ASU8NabmkntWwq
	Ty8GUrm1vVXl9vKQQE+8dkOcs9taZnyhgMvxSkQqfKlVOZbo2XCYuaJ3mvBEwvFNp1ts0eZgR7l
	Iy8UQGoBV4WVYB6cTgLkLwJnsZLOSMhXne5BxLzc17xTXGbL/Vn+xC3XduWIAe5SEnv6AwlrriX
	qSDiTJCp+Pn2OTpmg0w4YF12OtASef2F1tCUb1t3WkfB21gXoGgpfbry7nPAuY4mRuAaW27ZHev
	Y6/GaoIAlVG5RCV28mASyr2PtQsmW2dYqZs121Cuyx183Ufr+XD4pkn+WWUnQyczmLymNEl5prB
	1HVY+ViidCXv8vUfnWb6zyaiRUgYQbaru5hta4EALJZhrtrYMYyoxnzAV3bHx0oEOmNroge0m
X-Google-Smtp-Source: AGHT+IFg107k/tCYFMcohq67EzH90IUaPmb/gULgz0xOuwcBmv/ppnfnMODk2cLJXAhzPksQP0R0Mw==
X-Received: by 2002:a05:622a:153:b0:4e8:bae7:4d0a with SMTP id d75a77b69052e-4e8bae74e00mr318957881cf.51.1761410449893;
        Sat, 25 Oct 2025 09:40:49 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eba3860692sm15069131cf.30.2025.10.25.09.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:40:49 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 10/21] i2c: nomadik: don't use GENMASK()
Date: Sat, 25 Oct 2025 12:40:09 -0400
Message-ID: <20251025164023.308884-11-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025164023.308884-1-yury.norov@gmail.com>
References: <20251025164023.308884-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GENMASK(high, low) notation is confusing. Switch to BITS() or FIRST_BITS()
where appropriate.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/all/CAHk-=whoOUsqPKb7OQwhQf9H_3=5sXGPJrDbfQfwLB3Bi13tcQ@mail.gmail.com/
Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 44 ++++++++++++++++----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 19b648fc094d..4c79ada5e1d4 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -53,9 +53,9 @@
 
 /* Control registers */
 #define I2C_CR_PE		BIT(0)		/* Peripheral Enable */
-#define I2C_CR_OM		GENMASK(2, 1)	/* Operating mode */
+#define I2C_CR_OM		BITS(1, 2)	/* Operating mode */
 #define I2C_CR_SAM		BIT(3)		/* Slave addressing mode */
-#define I2C_CR_SM		GENMASK(5, 4)	/* Speed mode */
+#define I2C_CR_SM		BITS(4, 5)	/* Speed mode */
 #define I2C_CR_SGCM		BIT(6)		/* Slave general call mode */
 #define I2C_CR_FTX		BIT(7)		/* Flush Transmit */
 #define I2C_CR_FRX		BIT(8)		/* Flush Receive */
@@ -63,31 +63,31 @@
 #define I2C_CR_DMA_RX_EN	BIT(10)		/* DMA Rx Enable */
 #define I2C_CR_DMA_SLE		BIT(11)		/* DMA sync. logic enable */
 #define I2C_CR_LM		BIT(12)		/* Loopback mode */
-#define I2C_CR_FON		GENMASK(14, 13)	/* Filtering on */
-#define I2C_CR_FS		GENMASK(16, 15)	/* Force stop enable */
+#define I2C_CR_FON		BITS(13, 14)	/* Filtering on */
+#define I2C_CR_FS		BITS(15, 16)	/* Force stop enable */
 
 /* Slave control register (SCR) */
-#define I2C_SCR_SLSU		GENMASK(31, 16)	/* Slave data setup time */
+#define I2C_SCR_SLSU		BITS(16, 31)	/* Slave data setup time */
 
 /* Master controller (MCR) register */
 #define I2C_MCR_OP		BIT(0)		/* Operation */
-#define I2C_MCR_A7		GENMASK(7, 1)	/* 7-bit address */
-#define I2C_MCR_EA10		GENMASK(10, 8)	/* 10-bit Extended address */
+#define I2C_MCR_A7		BITS(1, 7)	/* 7-bit address */
+#define I2C_MCR_EA10		BITS(8, 10)	/* 10-bit Extended address */
 #define I2C_MCR_SB		BIT(11)		/* Extended address */
-#define I2C_MCR_AM		GENMASK(13, 12)	/* Address type */
+#define I2C_MCR_AM		BITS(12, 13)	/* Address type */
 #define I2C_MCR_STOP		BIT(14)		/* Stop condition */
-#define I2C_MCR_LENGTH		GENMASK(25, 15)	/* Transaction length */
+#define I2C_MCR_LENGTH		BITS(15, 25)	/* Transaction length */
 
 /* Status register (SR) */
-#define I2C_SR_OP		GENMASK(1, 0)	/* Operation */
-#define I2C_SR_STATUS		GENMASK(3, 2)	/* controller status */
-#define I2C_SR_CAUSE		GENMASK(6, 4)	/* Abort cause */
-#define I2C_SR_TYPE		GENMASK(8, 7)	/* Receive type */
-#define I2C_SR_LENGTH		GENMASK(19, 9)	/* Transfer length */
+#define I2C_SR_OP		BITS(0, 1)	/* Operation */
+#define I2C_SR_STATUS		BITS(2, 3)	/* controller status */
+#define I2C_SR_CAUSE		BITS(4, 6)	/* Abort cause */
+#define I2C_SR_TYPE		BITS(7, 8)	/* Receive type */
+#define I2C_SR_LENGTH		BITS(9, 19)	/* Transfer length */
 
 /* Baud-rate counter register (BRCR) */
-#define I2C_BRCR_BRCNT1		GENMASK(31, 16)	/* Baud-rate counter 1 */
-#define I2C_BRCR_BRCNT2		GENMASK(15, 0)	/* Baud-rate counter 2 */
+#define I2C_BRCR_BRCNT2		FIRST_BITS(16)	/* Baud-rate counter 2 */
+#define I2C_BRCR_BRCNT1		BITS(16, 31)	/* Baud-rate counter 1 */
 
 /* Interrupt mask set/clear (IMSCR) bits */
 #define I2C_IT_TXFE		BIT(0)
@@ -339,7 +339,7 @@ static int init_hw(struct nmk_i2c_dev *priv)
 #define DEFAULT_I2C_REG_CR	(FIELD_PREP(I2C_CR_OM, I2C_OM_MASTER) | I2C_CR_PE)
 
 /* grab top three bits from extended I2C addresses */
-#define ADR_3MSB_BITS		GENMASK(9, 7)
+#define ADR_3MSB_BITS		BITS(7, 9)
 
 /**
  * load_i2c_mcr_reg() - load the MCR register
@@ -1028,11 +1028,11 @@ static void nmk_i2c_of_probe(struct device_node *np,
 }
 
 static const unsigned int nmk_i2c_eyeq5_masks[] = {
-	GENMASK(5, 4),
-	GENMASK(7, 6),
-	GENMASK(9, 8),
-	GENMASK(11, 10),
-	GENMASK(13, 12),
+	BITS(4, 5),
+	BITS(6, 7),
+	BITS(8, 9),
+	BITS(10, 11),
+	BITS(12, 13),
 };
 
 static int nmk_i2c_eyeq5_probe(struct nmk_i2c_dev *priv)
-- 
2.43.0


