Return-Path: <linux-i2c+bounces-5940-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E33369655EA
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 05:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A07E628188C
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 03:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EEB1369AE;
	Fri, 30 Aug 2024 03:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJ4Y7eYO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D4B14B95B;
	Fri, 30 Aug 2024 03:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724989740; cv=none; b=Zz58Si+3xMTlut29vKhJtuCxUxz5DDlFeA7j71waSV48yGFznYBpPI+xftMK+w2z+MLp8bTumyA9TV3c2PcZ4pLhaLaQHferwyuqcJvw5Z+ytW02cOoyB7CEBPKFh0C4WeCmrUllDufJ/hBNWHD20c3aFUs9XlRst9bN8Uo/VvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724989740; c=relaxed/simple;
	bh=sHbyhwkdQzUqqbyCyCEmbs2jlo7Vy3Ug32cJpM0RiWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ugSdyNy/WyhFCnEdH7nIQs5VzRkhzx0PqSYTXvqL9kCEMeiztv/qVNfAIQEupBI39rhFr60BcmLbcgOZOUS1yoC2bAtmYhALmi8gLnRz8IxT3Ua6KeGfb0REbMTTHKokLX2p/3l7NH+65C60Yh5H7lWAZ/QNjIhkhsl0kjs5KfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJ4Y7eYO; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2d3c098792bso1042072a91.1;
        Thu, 29 Aug 2024 20:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724989738; x=1725594538; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nuaU/FEUSJ1zDJhf2kq5x0CsZK8UIXnkrpW0Xmu9tsI=;
        b=SJ4Y7eYOojUA5Z/rfEK0SFKlsMwk5rwQZH6TCL+PctRD5+nFogFwEJfOV1ESfD86rI
         D3OdJJCSyELmcgvmHQ9xNEXx/aFyaeNPne1yWp3chaOQXsEdTZiLurx370e/o0wrt9cu
         svFiSzm3mKIeSsXuyiNWG1CwPGuD5PYp7Bux1yZDq0LZg+NFv5dvuz5kiNHGKZ/JRBSq
         GVI+LyWSbXoIWKOfxJcJwcxY+l+a588HTWX3J3wqMuud5Aqtv3hOPV4p47jvoXe9HmBj
         /4nxjHRvNXo6Shuds2lGxq9CVYU18f2KgksOphuxXyoojhfb5qVj5M/1U0F3Coh30iw4
         HLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724989738; x=1725594538;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nuaU/FEUSJ1zDJhf2kq5x0CsZK8UIXnkrpW0Xmu9tsI=;
        b=US+tL6kfjOgZDdZp8z7Vfg39Sbw9E+Y2vziDgZLtBNbC/67yHMVqPmssxUhXlNTINx
         gyYB3GWfQlLkoQo0ekyjhnhlRXi9R6zJpUCUfivPoUKvFNH+GHbsBesPd53PQQbvcu1X
         d3Bqi4nIkb+g+9LH7Ni/V+AU43/gVf3eOIUCPvVYW+0JeVXfrk5f4QEPSk36gu+gryB1
         tnpBsOA9m3dUj9aAXyJ4fh2V0lMI1KuD6IX1WfBg4Y7Lm8+TqK0KRJmylOJ/pg1hnkK7
         YbaFbmwZbn2/OtGXLNk6wkOhC0EVRA/Ty5unXpJwRA0JIbrC1WRa5a7WXghB2abE9rTB
         A0qg==
X-Forwarded-Encrypted: i=1; AJvYcCVeqzraPwustxE7zqQIgA4KFczrJmBtZCJ+7jdH+dRNeIAtbMVA0VV0juXb0fLWyn9apL6QOs0mux/4HcUZ@vger.kernel.org, AJvYcCXeIdbdQ9U2Yh0bPwjx9YeXvdNwl67+aQB74aOhOMkBuAY6xxyXFI5sR8F6LTvWkrgyiREu68dpn3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7CECqZRTwcZxn5uAGRLsRbca1/DVnGaUJy54G5YL0Y9P1njXZ
	v4uMB+Km3a07373bpRYhEuCTR1cCbTDRnKQ2tCYRVCpo8gH6BOU=
X-Google-Smtp-Source: AGHT+IFvcywH8BJHv9GFcHbrQr1DMuLwHzrwh4tiQWWXNGDKDjjMuTvElE/5TNzEIJwRDxb0/LFeSA==
X-Received: by 2002:a17:90b:d8f:b0:2d8:7a29:838f with SMTP id 98e67ed59e1d1-2d87a298613mr29080a91.10.1724989738433;
        Thu, 29 Aug 2024 20:48:58 -0700 (PDT)
Received: from localhost (2001-b400-e338-dab5-746d-1a82-f21e-bb0a.emome-ip6.hinet.net. [2001:b400:e338:dab5:746d:1a82:f21e:bb0a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85b11b7e0sm2616978a91.17.2024.08.29.20.48.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2024 20:48:57 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
X-Google-Original-From: Tyrone Ting <kfting@nuvoton.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	wsa@kernel.org,
	rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com,
	warp5tw@gmail.com,
	tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	kfting@nuvoton.com
Cc: openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] i2c: npcm: correct the read/write operation procedure
Date: Fri, 30 Aug 2024 11:46:35 +0800
Message-Id: <20240830034640.7049-3-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240830034640.7049-1-kfting@nuvoton.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

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
index bbcb4d6668ce..2b76dbfba438 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1628,13 +1628,10 @@ static void npcm_i2c_irq_handle_sda(struct npcm_i2c *bus, u8 i2cst)
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


