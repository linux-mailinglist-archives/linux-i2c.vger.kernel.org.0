Return-Path: <linux-i2c+bounces-6692-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9AF977D1E
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 275B2282054
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EDA1D7E5B;
	Fri, 13 Sep 2024 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdbhNtJK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45B91C174C;
	Fri, 13 Sep 2024 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726222539; cv=none; b=EHDDn5qDTwD+XmaJ5te3Hay7gFcz4D5LgG7h0Df3wKi+E91umOR83ioGmBmmBTDIg8CqvxspV4yiuIiwculjJRVrim5pkdH1dIHYJknmKZVgj6yEFiYiMaAZmsLto2YU1tXWhRdW2LyB10r3vuYHVGp76iuxREq5KVhPIXhK4SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726222539; c=relaxed/simple;
	bh=OgAa7aTq2lPu3Ae+dtZHVJsh3t4kxm7ZckQl6MuZ9uU=;
	h=From:To:Cc:Subject:Date:Message-Id; b=CWgcJcEBtczxAzFxY++K+1Yqodbjb9uCeI+3mzUdWcst4yNSiEaUxOAsrVOnMn29ZycCC1TSBGn0AFxegL8z7ec+GhZ64rm5w3Vu3t/HC5IT09XiRNu5ZBT5EfoTkkwcBlGlhW35z/wHQe/JCGvLjKb37VoJ8Zp9v08EAcN/9I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdbhNtJK; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20688fbaeafso8657235ad.0;
        Fri, 13 Sep 2024 03:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726222537; x=1726827337; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVTHLdi2Mm542zmwkkAlJabphNlWmnDQC/mhVmCZ97o=;
        b=HdbhNtJKHVHhbbsJO+cWxokB2bWPnz+AEzkslOqS2Cy3lrAoruhiD47QMghRk+OG2P
         mhUxAStFMjQkQbWrsben/WsHbOpnh9VuEyN6O24d7E1CtxNA7Eog0/CPzWYw7FqKujRd
         Uf5so+YsbNMkvrQAeX1YdTlFomWhvYfIH9Udi68FBbmRuA53yKKhGPJ3eO1SWttu9ZJ5
         d2C4r6IYxw97TNpbzuLSd8AcUjMvMGYv0G3guntaUrDtFBBgmS9OB+Y+y7cWgDUgL+7j
         70pYmV/QH47gLtnjwhyZjyg/7MmM1y0EnPd9T2rxqumHk9beUoxuQIlQ0cLHOoh91nJr
         297w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726222537; x=1726827337;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVTHLdi2Mm542zmwkkAlJabphNlWmnDQC/mhVmCZ97o=;
        b=v/7BVrwCtomD2TpR6jUZkErE9qyz9pRTut2nRe1THgGCDXaJEFhrYKTrGg3P7yhkBB
         z2oi1LIHdkvkyvBt1KmT6LOomM1H2e62dQVfb2gMSbIqCKmxxtqIiK8Rqsl5p7e8R2V8
         ZDsxip8/rAUwFB6t3mYUHUL+JBS6mKd/dW9Pqnii6d966HLie3DP8mjIr0HcSEolfd/S
         xZstGpFmOd4OrRd3Bm+uVz0M0O0ORpY58L3WLmBCC7cWlZ/9J2QAKHbqNRpoE+nxx076
         x9TXSSWq3WHbZqPm9epBgmQvbGmnyd9ho8pd5b1JjFf+nrN7R/GxOhAKSHfHkSAW+wVh
         ixvw==
X-Forwarded-Encrypted: i=1; AJvYcCVS9ow1IBHw2E5MB/NorgT92k5DuO5UO5Ouh7XY/8ggtVngGfjfiWMkm3gpOWFKocF1QJZwZ62Cbk0=@vger.kernel.org, AJvYcCXw4n5GQP90UGraHQ9JfwbX89aMBP7NKkkHKXRs3uFb69dARUN1gLFkL2Hc/85IY8fjUDAG1l1AJGxXk9JW@vger.kernel.org
X-Gm-Message-State: AOJu0YxiCGA3CBHu5MJh3tmhWSkN/Y2ShiwGVENbqZm8j859fMZdgHiG
	BftfH8rMCkBKPdLAwmEXhtY3VvMzp0FslFPghQICMDWnhzsIpDU=
X-Google-Smtp-Source: AGHT+IEqBgm2LjVIYJxzm7H8JtO4VCPi7B8otV/hieFQza1fVLggbc0vnIC/IgXxwUmecHv9UgzFEQ==
X-Received: by 2002:a17:902:e54e:b0:1fd:791d:1437 with SMTP id d9443c01a7336-20781b476efmr34377225ad.6.1726222536829;
        Fri, 13 Sep 2024 03:15:36 -0700 (PDT)
Received: from localhost (2001-b400-e334-c33a-b4cd-4a8f-209a-cf54.emome-ip6.hinet.net. [2001:b400:e334:c33a:b4cd:4a8f:209a:cf54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afdd48esm25709495ad.178.2024.09.13.03.15.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2024 03:15:35 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Charles Boyer <Charles.Boyer@fii-usa.com>,
	Vivekanand Veeracholan <vveerach@google.com>
Subject: [PATCH v3 6/6] i2c: npcm: Enable slave in eob interrupt
Date: Fri, 13 Sep 2024 18:15:32 +0800
Message-Id: <20240913101532.16571-1-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
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
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 03de1353ad6e..bb4586563c0c 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1781,6 +1781,12 @@ static int npcm_i2c_int_master_handler(struct npcm_i2c *bus)
 	    (FIELD_GET(NPCM_I2CCST3_EO_BUSY,
 		       ioread8(bus->reg + NPCM_I2CCST3)))) {
 		npcm_i2c_irq_handle_eob(bus);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		/* reenable slave if it was enabled */
+		if (bus->slave)
+			iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR_SAEN,
+				 bus->reg + NPCM_I2CADDR1);
+#endif
 		return 0;
 	}
 
-- 
2.34.1


