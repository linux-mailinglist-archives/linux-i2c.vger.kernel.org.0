Return-Path: <linux-i2c+bounces-7488-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E9C9A5A58
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 08:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E44131F2315D
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 06:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB1B1D04B9;
	Mon, 21 Oct 2024 06:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpPbvsZ0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585CB1D0E03;
	Mon, 21 Oct 2024 06:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729492081; cv=none; b=HGTLe8XCQYv/1FjMMJusb8txRco/p4qKNWZbHRN4CF+DDi1CrYyXuJmIIceet4pK3u9Wq1a8vOKR9lyv4BLjO+Fip/Cg333k+DZ4g8PiT72jcgcMgUjSQKzMj1EB7A3lkhvns3UQ9nrb21xEt6D0bn2vwJcIoWGO/bwaxzzL6OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729492081; c=relaxed/simple;
	bh=NOPkjGhKVOiGWicXd75GPoJZCbXcSjN/IslYGdiAEaQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Mo0p656wRvaceHaF8NG+bmriLxoW0obW7rBmEm3oETLyZ5mHrD+npkRe5wM6fwD+hpX8lpjw1yEOr/0+Pzwl7Tyii+QYV6BLBLFvGdoHfAA5wKrZwmvRAyYOikhHCaDoDlmDzOcW9mNVI3dzsVH67cPGDP5RzLFZ0T5V5bIiG7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CpPbvsZ0; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ead1edbf1dso1052707a12.0;
        Sun, 20 Oct 2024 23:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729492078; x=1730096878; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mOLFK47U9/Y6DQjYR5qVahjW1+FgiYlZ12obUNdB6kg=;
        b=CpPbvsZ0CSbHOIuUl3K7OLTDunwdfeouqiVAQB5NbFVsnafRD9CmXlkDq7EcPYUZqV
         owYbo8vogRn1sYSgCuc00sTpuEZsl0v+sSwiNsNC6tqR3mmw4NTCNmBXLUWhTrK8KHQv
         DbRZmSauOnBntfr1uuPq5K2J8Ag/b4MpMZj6htLUEWcgWjzXWQ7qBf8PSum7+YUouWTM
         HQjnI11942auyf5s1bjGjiYkign2BCTecquC4qNxS0t1av2FRPJT1Jcfd6KEX6GC9MJI
         I/4XelvQKn/qY6wbP5GD0j8HI5e5gm/BIh2PXL0i6UL/+pRfPI6xVL+JPtmmwtdrzD25
         JhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729492078; x=1730096878;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mOLFK47U9/Y6DQjYR5qVahjW1+FgiYlZ12obUNdB6kg=;
        b=lbgdDI7HqfbT7t5rdGhRxprQ28ZMnbW5zpDrMRDuzZIw+Cg7OfWmYuq00SIX7KIB4z
         pmBOsXdQrfGdls0Y6ZLrbEVosfzJFT3x5l+umqNm9oL+ocsvUwdtn87IojfGCM5cWFlM
         z1NFrLR8LBYruiA5MCvlb8w+jfeRKH2DpuRJlXGUyCKdyzAF72c3XwcTqKXtTnfjXxpb
         tPmY1jc7HfJb7sdm4+iXXqRO+tMZSLpyyNi37pq4Ay3byN+J2Ihu4UiFtWKxZ3mtr3Hy
         3GvDV9JMxN+mZpRiMV/5OvZshEhx0MSA3i5K9felcu2WDziFwwnBgnfo9io+mXKEu2kD
         D+vA==
X-Forwarded-Encrypted: i=1; AJvYcCVlYo0xqcyCfIGUvxOys0b7FUiV0kMONBc46eEBRg0TijAoSkkI3S+J6PN6lyvkufK7QsuVCPo38UQ=@vger.kernel.org, AJvYcCWuRH6H0AtmSXyfLaDw5hl2VP7oUz0y8a4HY3IoWLV8n5UAT9ptzxhUlUSXS9Xmix5gXRBPcvIP443xH91j@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5whFotY2E6F1KBQi1Dnjovti8CCvkWaZiTw3c0d3vRIa6SvI8
	w32Qnrlvo6vAAAGmmrem8DzMAKCxE4tsEDCdW+PborriQz1lcFo=
X-Google-Smtp-Source: AGHT+IESXZ+/N3PIyc7LDJsv7sVHecGiuGUJEHC9qjMUpsNRwbQBPLejQVhpBz9mg4VYhkBtf6gopw==
X-Received: by 2002:a05:6a21:3a94:b0:1d8:a759:525b with SMTP id adf61e73a8af0-1d92c575d5cmr15442030637.34.1729492078605;
        Sun, 20 Oct 2024 23:27:58 -0700 (PDT)
Received: from localhost (2001-b400-e38e-c9a7-dd38-775c-4093-c057.emome-ip6.hinet.net. [2001:b400:e38e:c9a7:dd38:775c:4093:c057])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeaafaa40sm2236471a12.15.2024.10.20.23.27.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2024 23:27:58 -0700 (PDT)
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
Subject: [PATCH v7 4/4] i2c: npcm: Enable slave in eob interrupt
Date: Mon, 21 Oct 2024 14:27:32 +0800
Message-Id: <20241021062732.5592-5-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241021062732.5592-1-kfting@nuvoton.com>
References: <20241021062732.5592-1-kfting@nuvoton.com>
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
index 7c13f9f6014a..1551f9755ce4 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1925,6 +1925,12 @@ static int npcm_i2c_int_master_handler(struct npcm_i2c *bus)
 	    (FIELD_GET(NPCM_I2CCST3_EO_BUSY,
 		       ioread8(bus->reg + NPCM_I2CCST3)))) {
 		npcm_i2c_irq_handle_eob(bus);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		/* reenable slave if it was enabled */
+		if (bus->slave)
+			iowrite8(bus->slave->addr | NPCM_I2CADDR_SAEN,
+				 bus->reg + NPCM_I2CADDR1);
+#endif
 		return 0;
 	}
 
-- 
2.34.1


