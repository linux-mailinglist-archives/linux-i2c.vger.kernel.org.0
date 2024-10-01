Return-Path: <linux-i2c+bounces-7116-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB80898B456
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 08:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20609B23486
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 06:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36491BC9FE;
	Tue,  1 Oct 2024 06:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYsJwjuV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126D01BCA15;
	Tue,  1 Oct 2024 06:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727764159; cv=none; b=nZd+EKuTDjQkgT/oneBKIjOJfNN+eEUI8Cfs+3Dir6CQHWvYkTMewUApC9+uv1FM9hdLjmysm14nbOHwO0uiN9SDh5qMOM9frBmthMTTUYhGzdyfz+IFt+iL6YQSJTTW24/IokWDBoqKg8fDbfefcVrkM8032k+0TEoPHL/eYEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727764159; c=relaxed/simple;
	bh=Z0EgJkSV+YBVAMFiQyi04yGgkhMhHKzXytf1IQwWUic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=u8Woj4uXzUqzeDIdeyaAWUPTM/5mFtRoj6PSCbIrKVIhmpOBdy4Fe3d+aRkAE+RoEJcBh/ZqKncRRvBVgsk1zxnizPij3Kf2h8gJJjSGS7LWSrtEn1KTfPRAY4DGRB2AQ8agFaNaD6tQtQlaantYSxR6LAy9N7bh1XcQTvsKI7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYsJwjuV; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20b58f2e1f4so18530985ad.2;
        Mon, 30 Sep 2024 23:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727764157; x=1728368957; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mgfOidgW6QQd83F5+t8/o7O3J5kWPZhDUGZrc2VOvL0=;
        b=nYsJwjuVVi8tR6gK2cta5eWL5JbDPTk37lI19oUyYbhtutdpymbEQ5grurLkBTG8kZ
         GA3paxxSKXY94vkxIUYQhpKzLbWGoPW61Co3ixCza2QhPJBW1qbqWv0evnz37J7scFiE
         y5AoEBLvkqeLm0M2OcYZgfNWPVHfGoAQp+9RQIn/eC/8a73R00h7LtQwCNEeWXeCTUym
         bfrVa+N1jTLG9yny9xbIaJ1mzKwMZI27c25wBKRJCcOmcYIswZWIxsuiWTuef/hiPYTH
         sdW75SI+BZMfanIv7t2uRZOd2/zMlXuu+DBkrtvK3HhQrpQCc2hi9ViMmrFiVnkCvNnu
         59aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727764157; x=1728368957;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgfOidgW6QQd83F5+t8/o7O3J5kWPZhDUGZrc2VOvL0=;
        b=PERnbKm+zoNXu20nwbZisdrX0rIw4DK2IB0XVDhiPqzampToDGf4ocoelUK4He6P/t
         +Ti9d06Z/edXp8cHMF7awauHG5PbcNU5ZQidZeFJ7SuHKb7ZEoQMDoDumnirrXrLCUXi
         g4Edf93F894pGu6lKLtSNWR7TJwiTrwmxekPDUza2/SYm0ccfAuBB3uyZyzNDBk+CZLD
         WKoAUGARBtlNl0zKf8JHmdlOPp5Kw9PsrdpCMpDR1AgqlhEbL1qyoc5HxHEIgpSiKtUW
         Y15usI9nFLzlOe9VYa45SraE9+DJBmYOOdjthrGyxpfvjWSvE80BM3DtS4HPmKrBf5w/
         Fx1g==
X-Forwarded-Encrypted: i=1; AJvYcCVGKqLtA69Y+VW+DiYO8X4rvEVYaRDUMSVtewACPKiUfhaNaMVvXkL7dpjBKC3OCC1Lt/PEhtxAsnU=@vger.kernel.org, AJvYcCVrdIVE0mJjRJopVQC6dJ0RuJLuRdGKQs/ftSdsHvR9oBy0fYlTOyYqzBcbNlenl/lC2OzT9bodxBg0/p+r@vger.kernel.org
X-Gm-Message-State: AOJu0YxWcMmIONh/oRgrUzyyYWz96n/ecLE65EKH/OXsOCwxwic/ttV0
	AJJSk1TdBzMxp7+sLH5G8CqeOHVOlxae/GpO27N5KwYR/vHXPWE=
X-Google-Smtp-Source: AGHT+IEGgc2H9KW6IF6JSqvVGEvxrh93vP8PdPD3gKW/pW7XUuaAD+zCQEBtQ//63IbUWmT78h4MFQ==
X-Received: by 2002:a17:903:184:b0:20b:57f0:b394 with SMTP id d9443c01a7336-20b57f0b612mr7096065ad.20.1727764157085;
        Mon, 30 Sep 2024 23:29:17 -0700 (PDT)
Received: from localhost (2001-b400-e30e-7f15-c94a-d42b-025a-8ff3.emome-ip6.hinet.net. [2001:b400:e30e:7f15:c94a:d42b:25a:8ff3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37da012fsm63736375ad.96.2024.09.30.23.29.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 23:29:16 -0700 (PDT)
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
Subject: [PATCH v5 1/6] i2c: npcm: correct the read/write operation procedure
Date: Tue,  1 Oct 2024 14:28:50 +0800
Message-Id: <20241001062855.6928-2-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241001062855.6928-1-kfting@nuvoton.com>
References: <20241001062855.6928-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Tyrone Ting <kfting@nuvoton.com>

Originally the driver uses the XMIT bit in SMBnST register to decide
the upcoming i2c transaction. If XMIT bit is 1, then it will be an i2c
write operation. If it's 0, then a read operation will be executed.

In slave mode the XMIT bit can simply be used directly to set the state.
XMIT bit can be used as an indication to the current state of the state
machine during slave operation. (meaning XMIT = 1 during writing and
XMIT = 0 during reading).

In master operation XMIT is valid only if there are no bus errors.
For example: in a multi master where the same module is switching from
master to slave at runtime, and there are collisions, the XMIT bit
cannot be trusted.

However the maser already "knows" what the bus state is, so this bit
is not needed and the driver can just track what it is currently doing.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
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


