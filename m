Return-Path: <linux-i2c+bounces-5190-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A99B94A4FA
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 12:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 105941F22D42
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 10:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41CF21D2783;
	Wed,  7 Aug 2024 10:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jyel3jKj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32CD1D1F6D;
	Wed,  7 Aug 2024 10:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723025041; cv=none; b=bxWJIMWRLydE3W6ViE2GF+1P0PzB52irZSgXHyE+E18TrqgRZRR+lhhMzgMVGHz2RDCMY8BSVAk7/gNOZrrQuG1F7mWMLY9Z4+xMZ1yoR4i7tamUi3rQo2l9COjDr2H8FutH/MjekCVJXxbqBQLLXOgwZKzqrfW+MQBlxrVRZFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723025041; c=relaxed/simple;
	bh=8h/4D9Loh9+7L3cMb5JZ1tuCg39PSza5aVYggDMoFJM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=JTtUzeoGtQSLrtCXcrFL2L24/87FBFCcHoMDGnGAqHaNNdImPcQ4+5Oy+SrUFU5YdtEE4uiGihUySOktldAIqIj2/NTxkWX9mVrkgylXNelB7rlSCh3/8yrOMfsMopkhfzAOrGAKlOeWy57iIrErh6JgD0GoaKAcDcjQkutu8XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jyel3jKj; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2cb52e2cb33so1145306a91.0;
        Wed, 07 Aug 2024 03:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723025039; x=1723629839; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W94oTh1WrpjtYbDe0PsjN6io4lhC/2PtOkavVHNKo6A=;
        b=jyel3jKjxZAfH0Sr6Beh+FApJi0w6wzMyULpS6V2aqamx8M1DExPHJ704TAXt5EkoC
         nif8Lm8twQyILwBRcypj2veCGyRj+EctXRwqM+8jTpjlyVjf5/t0CjJM3B9EyhCEMjPO
         deKEAN9PFv4XesQIZdQ/hbMtYCwSfVwSZNbtrpDj3UYSomAJ+vrw9eK2QlBDLRn9gFRM
         KUq0y7vxxVadOgOWJqCcXh4T8cY8Rjrv4if4aeOiqiHDs+WrW1BbyPJ7eDLAh3sgNpuY
         zVeCn2iKpu9QYi3xv3wwGHZFRy0T2ZpJtpqJFf664G9y33hZQyMKJCwDSqEV+QOJ9TSt
         NQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723025039; x=1723629839;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W94oTh1WrpjtYbDe0PsjN6io4lhC/2PtOkavVHNKo6A=;
        b=lWFDiuSCd2ocZKrQ/dyVQ+EcydBS/kQ7B2r5wCYuD//sZBmDdcpeMa6JVlbu1JHO21
         nttdsHDCi8j6L/1ASsNFlnNNKNVl6+Lqc3hkxCTLUxFJpcez8UdfIjCp6sTKnr/Si9pn
         U9dsCt3Dyx71WJd9Dz/ibmhGx64ZlE2+zFEVmXUPlsrfKPwEbS0dqZAY7aPi7xEnuN46
         6pUM8eYI5Ogchywu1BgX4VQIG6oAFLs7WsGiIgK3fxEHAy8lic8GyN2A3YhvsPQK4tO7
         EMvWAXauBFdD5/8M4LthC+5Wz+JPUAidPzx2lDTx+VHXYNi/DmzEdFvjRbCzJR4dae6a
         s2fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHlJQd3mXt5xc/w0BGg9vPiWeo1GUbinNGWzRP03CQb5wdWoxuLCH+0LJM5dIxDpYC8cNcysXjfzcSb8rBO3BlcqcjI2exMkBdX6P5
X-Gm-Message-State: AOJu0YyZn7ax9U4xTpjJiycKXb/KlnPtmFQCVxDMwv9UZUjneXjrUvHT
	43yYrzO+UxQWHNxNdDvNzFh19HRAAxDxqtqGiC+HLCle/5rNZp4=
X-Google-Smtp-Source: AGHT+IEtErHrkaTLB2321lpC9Qnp5UW5M58gOw9LihcCHDK4055uDANBVYx2t8DdEPxzwS/tqCkoxw==
X-Received: by 2002:a17:90b:4c05:b0:2c8:85c:750b with SMTP id 98e67ed59e1d1-2cff952f21emr16992766a91.34.1723025038868;
        Wed, 07 Aug 2024 03:03:58 -0700 (PDT)
Received: from localhost (2001-b400-e352-b705-880f-4661-e7a1-4abb.emome-ip6.hinet.net. [2001:b400:e352:b705:880f:4661:e7a1:4abb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3aee9acsm1116910a91.26.2024.08.07.03.03.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 03:03:58 -0700 (PDT)
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
	openbmc@lists.ozlabs.org,
	Charles Boyer <Charles.Boyer@fii-usa.com>,
	Vivekanand Veeracholan <vveerach@google.com>
Subject: [PATCH v1 6/7] i2c-npcm7xx.c: Enable slave in eob interrupt
Date: Wed,  7 Aug 2024 18:02:43 +0800
Message-Id: <20240807100244.16872-7-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240807100244.16872-1-kfting@nuvoton.com>
References: <20240807100244.16872-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Charles Boyer <Charles.Boyer@fii-usa.com>

Nuvoton slave enable was in user space API call master_xfer, so it is
subject to delays from the OS scheduler. If the BMC is not enabled for
slave mode in time for master to send response, then it will NAK the
address match. Then the PLDM request timeout occurs.

If the slave enable is moved to the EOB interrupt service routine, then
the BMC can be ready in slave mode by the time it needs to receive a
response.

Signed-off-by: Charles Boyer <Charles.Boyer@fii-usa.com>
Signed-off-by: Vivekanand Veeracholan <vveerach@google.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 1537fb7baa8c..1af6a927b9c1 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1779,6 +1779,12 @@ static int npcm_i2c_int_master_handler(struct npcm_i2c *bus)
 	    (FIELD_GET(NPCM_I2CCST3_EO_BUSY,
 		       ioread8(bus->reg + NPCM_I2CCST3)))) {
 		npcm_i2c_irq_handle_eob(bus);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		/* reenable slave if it was enabled */
+		if (bus->slave)
+			iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR_SAEN,
+				bus->reg + NPCM_I2CADDR1);
+#endif
 		return 0;
 	}
 
-- 
2.34.1


