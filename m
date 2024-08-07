Return-Path: <linux-i2c+bounces-5185-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D59FA94A4EB
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 12:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 120111C21403
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 10:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052E11D1F62;
	Wed,  7 Aug 2024 10:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GW/B0Qbp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C531D1F51;
	Wed,  7 Aug 2024 10:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723025013; cv=none; b=FdYG8mnNC/LJCf9rL9inZ8wQAecY5tmN5gsPxUGX2x50Cr41tQRjrsFbrQnVrbrL2innYbfg881StfaCLQVRLqzRfoXkLFENnSXzbyhq79ckq8Jf16L/1/WLbFYVOOL5ZERzTHZlg4CAl+UEPlOtyx/vi/IPz3fS7CXg/fTnui4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723025013; c=relaxed/simple;
	bh=wBHnpnXQR2YnVe3Z3Xy1CQXht+Ilg8+LY704lrvFnm0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=aEoYZkjae6QzTl2Ucz0JrD+h2ASy67V5mQaKPyDxkQsCN7yJx+9meRTtt3SR2JDxQ0OvjJuqB9uxBqBa96xYK1vDXzYGbJXcC+QkMc53Z2EF1BWHzb/IUnP1+ra4PeNptrkcwxCY2w09/7pbDiHSViQ15mOVvACnh7blWnHYPn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GW/B0Qbp; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fb3b7d0d56so10523025ad.1;
        Wed, 07 Aug 2024 03:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723025011; x=1723629811; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CC5pNBBwbHzuFRI5vRop3kEGSaPPEJAGbytrwhnEs/A=;
        b=GW/B0QbpqN9WhgTewoKg62Z3PvaRlcvKfMguNHU+WMnISbsa189BVBfgZuDmTnwBMB
         wNJng5NF1JElrpZg9VlS+Z+tlVf7cAO/wbkYmG8IlIabxV4dMvfD/5i9+tDrqzV7XSfi
         iJd6EzelSKZ79CQki4NOjSn3J4SHPqMeg6QqzSp5dUvV1XZx/BD+yR0ODY57xfcdalzm
         s9iZAXcyl8cRIACkeInU/FXkesAPMDr01qs0mLXmEvecTNXbZ+POfZXuGk+ctKwGuYay
         MiT2zZiiDBASh6c5NXsavb7o5/w2N0FxoLOwIdb9bv8jwI5fgUI0AV+0C0CGLQUWd2ej
         WzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723025011; x=1723629811;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CC5pNBBwbHzuFRI5vRop3kEGSaPPEJAGbytrwhnEs/A=;
        b=qVWtDUhS6SqKPJQ7NpCNIozNQJWsGAIVJ89ct8cbJO0AyK8D/Hiw2xHZ0IFITFVm8h
         6nA/kEZ4nuPZQP/Ksu9m8Sv3sap7VGVhaw/Iz2z1dcaioJA8aFiKNhp8uBhYG8ogiwV1
         cm6syJS+7CrtU4nY23LRj2MrUNMvoHtasIiNOReD9rDI1Ps6XKgE9bg5TbwFqRAzmnPw
         2WJWQfrcV4sexA0KYXcTWKTSnaSNXYgnbkHiIBMczRAdAAcVLxeMrXJ+FR3kX/t16iZZ
         EaAP4G6sdebhxB1t67jjcEU9arghILk1eMt+ZEgG23dol/34FtQZA+Gcb3WysPVP6JuH
         5UMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV77OkxPnGTmCjLPXlIHkBnxQ6+zCeSZZIRldONn74IHrYMGxaLh73xe47o7ZZlCOgkctgU9XrFKJQwkJ3Z/gJDhUaj2UXB84LxPi9z
X-Gm-Message-State: AOJu0YwSIw/i/y3atHRuewxA6vOEom7etuTMfaGP04hiMbVY92qjEjwx
	Kh7NlOAUHnLihrSvFKypeCmS+TuEieosx0A0Q4+ESkEn7togtzc=
X-Google-Smtp-Source: AGHT+IGaljIfOINvp35rTl5T4iijxPSBPWtVHz2ZOvAehR7Vkfor0vpEheNeOShza8gm7JoO5jsENQ==
X-Received: by 2002:a17:902:ce10:b0:1fb:3b89:b11d with SMTP id d9443c01a7336-1ff57257f43mr185632175ad.4.1723025010560;
        Wed, 07 Aug 2024 03:03:30 -0700 (PDT)
Received: from localhost (2001-b400-e352-b705-880f-4661-e7a1-4abb.emome-ip6.hinet.net. [2001:b400:e352:b705:880f:4661:e7a1:4abb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59059f6dsm102022675ad.132.2024.08.07.03.03.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 03:03:29 -0700 (PDT)
From: warp5tw@gmail.com
X-Google-Original-From: kfting@nuvoton.com
To: tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com,
	rand.sec96@gmail.com,
	kwliu@nuvoton.com,
	jjliu0@nuvoton.com,
	kfting@nuvoton.com,
	warp5tw@gmail.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v1 1/7] i2c: npcm: correct the read/write operation procedure
Date: Wed,  7 Aug 2024 18:02:38 +0800
Message-Id: <20240807100244.16872-2-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240807100244.16872-1-kfting@nuvoton.com>
References: <20240807100244.16872-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Tyrone Ting <kfting@nuvoton.com>

Originally the driver uses the XMIT bit in SMBnST register to decide
the upcoming i2c transaction. If XMIT bit is 1, then it will be an i2c
write operation. If it's 0, then a read operation will be executed.

After checking the datasheet, the XMIT bit is valid when the i2c module
is acting in a slave role. Use the software status to control the i2c
transaction flow instead when the i2c module is acting in a master role.

Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2fe68615942e..c8503acdaff8 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1626,13 +1626,10 @@ static void npcm_i2c_irq_handle_sda(struct npcm_i2c *bus, u8 i2cst)
 			npcm_i2c_wr_byte(bus, bus->dest_addr | BIT(0));
 	/* SDA interrupt, after start\restart */
 	} else {
-		if (NPCM_I2CST_XMIT & i2cst) {
-			bus->operation = I2C_WRITE_OPER;
+		if (bus->operation == I2C_WRITE_OPER)
 			npcm_i2c_irq_master_handler_write(bus);
-		} else {
-			bus->operation = I2C_READ_OPER;
+		else if (bus->operation == I2C_READ_OPER)
 			npcm_i2c_irq_master_handler_read(bus);
-		}
 	}
 }
 
-- 
2.34.1


