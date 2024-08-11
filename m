Return-Path: <linux-i2c+bounces-5291-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E8E94E35E
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2024 23:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F4B1B21C06
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2024 21:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CD41607B8;
	Sun, 11 Aug 2024 21:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lg+nJqlt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C457D15FCE7
	for <linux-i2c@vger.kernel.org>; Sun, 11 Aug 2024 21:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723411410; cv=none; b=bRNWZ31fIOGtl46Sn8mlbCpbq5wUB3e8ERz2abF4Dm9PuTF4S6xzVctWNoLU6ZjsxfOG4/BZpTUyFuNsybLUzScdtWudh2bvoC7+myhqBDKDMp5bqbRd/BBGm8H/g34SoD2KbVS/RV+ZEi8Ktv35SqZ5Tabh/3O3ljO1ANulyUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723411410; c=relaxed/simple;
	bh=jIOuqhgEBh6VGxaQQdjTBnedyoXCh3aKOlKNnhGoZr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=besXPeYv6WXGZPomVCIBBh0D3//ADCjvOWsbLJAOdhBI6TIdP8cb0HPgVcxSU3lWGMWIs+naByHtiWbbuCq0Qk8akfJyYXy6F4Hh8KZdCAnuvfVgS3X8feJIBq3iBjYj1bROGXnVw5fPTm+ZzOemNjdKKx6/sR2eWuqpK6qTYMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lg+nJqlt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=pgj087NucnHKxua0poSb91px8mDb2gODWDuPOmjAJHI=; b=lg+nJq
	lt3LtiWRh1PtN2E5thmV0e7pwGHE2Y6EjFJUW6FTgfqqhj8+x+4Xht2DFa3c79hy
	fsX0A/Qh5HU5OM6ngMN4Zkc7ZN9v4l/4Ck1mjhCLcSL4VbTNlMq2m7aDtb0K4YHS
	Ot8sq7NQiiyyK1MCOE1tQiFHosQHT1//Us8Oy2gJVjARq01b02fqwTH9CCY/SEN6
	h/TGFwX2oULXJJ+yNIf4K7JVhb4JSMlQQE1oZGGrvVex71i6uxO2U5MImE/2YSsB
	JNCFXe4fM6Wlmp4I/OEbiMzfvdvdIHRJYfV6tuq8+kpwcMDwTD4KMbu9pvyhBa/G
	546PNG1R8XM3Jmdw==
Received: (qmail 1179550 invoked from network); 11 Aug 2024 23:23:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2024 23:23:23 +0200
X-UD-Smtp-Session: l3s3148p1@iJ96/G4fFpUujnvj
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 1/4] i2c: testunit: sort case blocks
Date: Sun, 11 Aug 2024 23:23:13 +0200
Message-ID: <20240811212317.16119-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240811212317.16119-1-wsa+renesas@sang-engineering.com>
References: <20240811212317.16119-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because a 'fallthrough' was refactored away, the order of 'case'
statements can be sorted better now to ease understanding the flow of
events.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-slave-testunit.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/i2c-slave-testunit.c b/drivers/i2c/i2c-slave-testunit.c
index 4c550306f3ec..be1d2e900aef 100644
--- a/drivers/i2c/i2c-slave-testunit.c
+++ b/drivers/i2c/i2c-slave-testunit.c
@@ -94,6 +94,14 @@ static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
 	int ret = 0;
 
 	switch (event) {
+	case I2C_SLAVE_WRITE_REQUESTED:
+		if (test_bit(TU_FLAG_IN_PROCESS, &tu->flags))
+			return -EBUSY;
+
+		memset(tu->regs, 0, TU_NUM_REGS);
+		tu->reg_idx = 0;
+		break;
+
 	case I2C_SLAVE_WRITE_RECEIVED:
 		if (test_bit(TU_FLAG_IN_PROCESS, &tu->flags))
 			return -EBUSY;
@@ -127,14 +135,6 @@ static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
 		tu->reg_idx = 0;
 		break;
 
-	case I2C_SLAVE_WRITE_REQUESTED:
-		if (test_bit(TU_FLAG_IN_PROCESS, &tu->flags))
-			return -EBUSY;
-
-		memset(tu->regs, 0, TU_NUM_REGS);
-		tu->reg_idx = 0;
-		break;
-
 	case I2C_SLAVE_READ_PROCESSED:
 		if (is_proc_call && tu->regs[TU_REG_DATAH])
 			tu->regs[TU_REG_DATAH]--;
-- 
2.43.0


