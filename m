Return-Path: <linux-i2c+bounces-5186-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C9194A4EE
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 12:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89ED31C214F9
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 10:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695A81D3628;
	Wed,  7 Aug 2024 10:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JV4Tai2I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF311D2F73;
	Wed,  7 Aug 2024 10:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723025017; cv=none; b=U/Yf41BjuxhidPJYagP2YGUwLiEwqG7yGfgdVgugOiM/CUoFzpKHY+58Syokoeta6G0zlkHxVxjebOGMh92pkao7vnsSsBuHsEsGDKd3lhyrRRiasBGVt3PXfKRyES1Mt02ppj+HAysTAUYTSlcvAmW+EotHi57HhBJYpYklqyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723025017; c=relaxed/simple;
	bh=WiFkNY+L8Ma1TLKycukop1oNLXBvshI4BV9tUU4lSsU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=EXeyCwqN2w2rj3Rll38RbKuByEmNOcCBJgXIS1CKqhPiPZZCVPAqdNrLZVVpBEnlntd12KFb8MYkAIl5jvwGc51FKB0Cqp62DW1cIN57CTcplxZUlNLRi4A4J17f0HoxOrvoTm/EBgA/9Lo+KDNi9ZcND1I5Xwy/tM7h8mRmKrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JV4Tai2I; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fdd6d81812so14527955ad.1;
        Wed, 07 Aug 2024 03:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723025015; x=1723629815; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BDqYPFDQ8C1Tp5b7bagIZayk3yRE5OYklUz/hGN2mSE=;
        b=JV4Tai2IIK2KqQwEKMsgwZ1YbtDxMY3dQJIzhk//eGpgQy5QeEv5WMBIQqxbjKsWUf
         +ciIufux+xrm5UyBBTANTttLXDWVjVA/AmZ+LlfvdIRasjo9W6mqGAP8UcKc3W1vhhBp
         al0k7qkT3Xlxip1vHoPxS2KOUD9XsA7TlBtkkcDXXYHXDTTJs3uewjRYgNhsd1IlYa47
         kd43SaYo9ef9tBhxL+Oexpd7dE5NNK6kHgGPWmCDhMxldpCai/VoXYtgf52z9ujJ+ihO
         46EeqSAsQQeUDqmFfUNk15vVnbposOZNiT+OZrj3DdR7sVFhUvvKNhxcNULGk4xik/Q9
         9R6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723025015; x=1723629815;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BDqYPFDQ8C1Tp5b7bagIZayk3yRE5OYklUz/hGN2mSE=;
        b=ocouxbTnh81fLpmNbZbxGxmLg11sq08J+haei1LEp7V9Ix/zWywStDbPKHTUi9JeeO
         ueDRFLU4iA4McpiTbMUEn08XxNpzTU8u9CGwjxYnBpdYqPlIgtWJHshNxagblPALaOCj
         xcv+0vr62XNhtGwLY8QnzLjaufrIHgi03fSRxb/aLfIu+O878s1Qes1KUkB+l1DyndRs
         SZgT9vp7RArddBCYEaCygYrE+3CTNUAF+BWkfgzUwmeeslbKCfMcGyC9cJUGyps6V8b9
         Ysc4ySin7q3WLkBaNxA2mqqIprLblaMTbKGVEi37x1RMKSXLM7L+No86gARmLjQauW9Y
         0pfg==
X-Forwarded-Encrypted: i=1; AJvYcCXs/yY/FC6aGJ3i/gcRP00n5WhGmayjDSjBxHwgrLCcAds3iSC5f1jqBJp24dhy6pT1/9VK6cv9d5uY2UANBVQhtNZRWtJS1qYKX3fW
X-Gm-Message-State: AOJu0Yx9zMblMpNWZnLzOSRtJvnvlQJhRlISrWAOmPrUnPkTM0xQGIbZ
	2DqeduyRR+CGVsnHQd01t1JOiNSmMbZYsJUVkQR87GoyQMoAUI4=
X-Google-Smtp-Source: AGHT+IF6/COrwRqAiRFSVZRZmy72Ongk1XUuk5O7KX5dNirXd8DXP6iFhlCT6mU3VemP2quJG039bA==
X-Received: by 2002:a17:902:f691:b0:1fb:8e98:4468 with SMTP id d9443c01a7336-1ff573f4efbmr191271825ad.50.1723025014926;
        Wed, 07 Aug 2024 03:03:34 -0700 (PDT)
Received: from localhost (2001-b400-e352-b705-880f-4661-e7a1-4abb.emome-ip6.hinet.net. [2001:b400:e352:b705:880f:4661:e7a1:4abb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff58f6d80csm102373675ad.119.2024.08.07.03.03.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 03:03:34 -0700 (PDT)
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
Subject: [PATCH v1 2/7] i2c: npcm: use a software flag to indicate a BER condition
Date: Wed,  7 Aug 2024 18:02:39 +0800
Message-Id: <20240807100244.16872-3-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240807100244.16872-1-kfting@nuvoton.com>
References: <20240807100244.16872-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Tyrone Ting <kfting@nuvoton.com>

If not clearing the BB (bus busy) condition in the BER (bus error)
interrupt, the driver causes a timeout and hence the i2c core
doesn't do the i2c transfer retry but returns the driver's return
value to the upper layer instead.

Clear the BB condition in the BER interrupt and a software flag is
used. The driver does an i2c recovery without causing the timeout
if the flag is set.

Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index c8503acdaff8..bd444ff83a8c 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -332,6 +332,7 @@ struct npcm_i2c {
 	u64 nack_cnt;
 	u64 timeout_cnt;
 	u64 tx_complete_cnt;
+	bool ber_state;
 };
 
 static inline void npcm_i2c_select_bank(struct npcm_i2c *bus,
@@ -1519,6 +1520,7 @@ static void npcm_i2c_irq_handle_ber(struct npcm_i2c *bus)
 	if (npcm_i2c_is_master(bus)) {
 		npcm_i2c_master_abort(bus);
 	} else {
+		bus->ber_state = true;
 		npcm_i2c_clear_master_status(bus);
 
 		/* Clear BB (BUS BUSY) bit */
@@ -1697,6 +1699,7 @@ static int npcm_i2c_recovery_tgclk(struct i2c_adapter *_adap)
 		dev_dbg(bus->dev, "bus%d-0x%x recovery skipped, bus not stuck",
 			bus->num, bus->dest_addr);
 		npcm_i2c_reset(bus);
+		bus->ber_state = false;
 		return 0;
 	}
 
@@ -1761,6 +1764,7 @@ static int npcm_i2c_recovery_tgclk(struct i2c_adapter *_adap)
 		if (bus->rec_succ_cnt < ULLONG_MAX)
 			bus->rec_succ_cnt++;
 	}
+	bus->ber_state = false;
 	return status;
 }
 
@@ -2156,7 +2160,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
-	if (bus_busy) {
+	if (bus_busy || bus->ber_state) {
 		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 		npcm_i2c_reset(bus);
 		i2c_recover_bus(adap);
-- 
2.34.1


