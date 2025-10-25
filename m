Return-Path: <linux-i2c+bounces-13803-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49391C09B84
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Oct 2025 18:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 170B0427A34
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Oct 2025 16:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20491307AC7;
	Sat, 25 Oct 2025 16:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNnPT9JD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDB2305978
	for <linux-i2c@vger.kernel.org>; Sat, 25 Oct 2025 16:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409999; cv=none; b=NGeSK9jxjbSc3JUeLVk0ZWv1RPASx+/IVSSfa1fjsKtwdSPS0jE/hAXcBxMF0OoaBbB/TlVvFYMaFKmfYxnTi5rA5A84A+tuiYxWJTEUB3rmmWRRf7g6Ppmk3VE/ifgiN71FaG3zG7lcl8EZ1pJRWMQRCIMFv5itLw1uKX1bv8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409999; c=relaxed/simple;
	bh=miSwCWAWlgSls2mz8C4vY/8512hTOCwNwE82bGQwr34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ewyu/hn0DslIVasYstlBY+e3sSE6x7btxJGCJk3jj2lneYQzn5MdgQ8rs6va1XfIhY80IBoke7cBuAdsSJ4c4zgZGLhz5TRYO39FMz+TL1dx2aThRQOy8Ccznzy4AtFJrm3tzgGoI9LuY8dil0MBDJ1VJdXWkr3h1zXIc36qzdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNnPT9JD; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-88f2b29b651so334508885a.0
        for <linux-i2c@vger.kernel.org>; Sat, 25 Oct 2025 09:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761409995; x=1762014795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhEz+tkYwuCSnU6LNYxfD5DkxTKdrSyEg2dThddkEgo=;
        b=lNnPT9JDvNdft6l0Uo98joHCwEP2lpuHXb1pBz28Fx4uY1P85iYzNuVFAQdW1533U2
         t303A0RPZ4Xa1Susp82zygD1snjYmhzHFDDI6dFMAWWIgE6Fr2sWlT3ACXH0NdCcsIn+
         mHL0+hlilKvqRybrNPWETkmCclOlF8Bw8eWcYOrbPABIyltdAqNEp/gr/WMcoz2CRx17
         GAqQWUkMCXOdIlQVFV1NPXrdO0rWApm/suR/6Q4hZfP8R0T7m3dp3kW3Gj2sMV5miKe7
         CTUWckFq12qH47pT2pZdMHkd5y72TNErDhQHaJZrloCGPYbWQc9iK/x2MF7LEeuTc6cS
         K+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761409995; x=1762014795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhEz+tkYwuCSnU6LNYxfD5DkxTKdrSyEg2dThddkEgo=;
        b=mfrYYcVGX7F0w3SN9wEJxuEjBc6miMZOykVD46E9RGCUj8FNBTYAeqtit7Q2bcXkBh
         rfe+yVGsEfVp/72co0q0nohsusyvDCs0w7zn1XKMEp0AhAbPraOaOl0WY5QM+cEkL74p
         sYfB9kzFuwDdrwankyOCMmuwUa3Yyt+qw/xWbhLHweQcs2hFvpvf2JgAY2IHivJi8a8C
         8iP1DrLxzbWQWZ/eO/W6c+M3PGVKNB5oa1LrNELdwFFeaHcY6wrGi6nGfPI9n7Wvm4EO
         VTlJn1ES304tRYNsH5wXkF726AVuvCQGFlfVFwWcIf6dzV3LiFx8WyJKfLQBJhsIJxQ6
         NOQA==
X-Forwarded-Encrypted: i=1; AJvYcCWeJ5aIiUeFVY8pH8SVg/Bqd1A41YjTBPkAwdM1shNiyhTWdyR/A1egGxdKC2EDDoKT7wlkJBltAto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/uRwB71GHsDWdhtnhuSYvXISgF8Hri6ad+nqd/2VaHQ72D3o9
	3ZK2ORU5V8clkuJgu0GKC2k7jU1CsQoLBb3EmpMtp5IPGINke/zLIYzr
X-Gm-Gg: ASbGnctWTkMoyYtrPUcCa31VnKpMZkpCaa4EZ0p5HlF1Gmm2F9B7sBoRjnnZowx/Bdo
	6SJBjCCT7Z0S711NWKFbJba8cS68hzFnz59avt+NQe9RJUg2BQZLo0Vt0tVvA6C4FTsf+gBChQY
	tMpd54bEcmBMNM8R6kL4MWIQqbZF17cmqGRU1kG0ZMhnBlrCIQVDuNxc88uleI55PiV9yl99H86
	AjKTvGclhBXLeh6R+mjIBmL89HOoZVnMdLRKaaRSUFzCV0GipGlmnkwfzmRRobnbUC61tDU0JlN
	QLWzW17zQEq8JjevfVp5xAmicfdPtPVEVj0Az1da+ex0VMwXyXWB1A6rOvRuHoNH6AX8Ls1YIia
	BUboKswOX7n3XPfI7tBGLokyfTqFfQatIw7MxLEBfBIzPlHyNujHVlVtqo3yA+KxVUr3sDeByVg
	wnRU8gEwQ=
X-Google-Smtp-Source: AGHT+IFDvjrbgHR4c+YHa9gstK3rUAjMPa1JntDOFoEPIMpUO9JHPoIw8Cykn+I5mIOdA49QSX5xZw==
X-Received: by 2002:a05:620a:aa01:b0:8a1:e059:cea0 with SMTP id af79cd13be357-8a1e059d294mr36247085a.84.1761409994607;
        Sat, 25 Oct 2025 09:33:14 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f254a297dsm174758885a.28.2025.10.25.09.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:33:13 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 10/21] i2c: nomadik: don't use GENMASK()
Date: Sat, 25 Oct 2025 12:32:52 -0400
Message-ID: <20251025163305.306787-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025162858.305236-1-yury.norov@gmail.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
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


