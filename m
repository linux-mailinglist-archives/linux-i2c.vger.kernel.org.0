Return-Path: <linux-i2c+bounces-5168-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA039492D8
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 16:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17E411F248F1
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 14:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDAC18D655;
	Tue,  6 Aug 2024 14:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YcQf7Tol"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2488A18D640
	for <linux-i2c@vger.kernel.org>; Tue,  6 Aug 2024 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722954044; cv=none; b=gqiV2dGndbuuuZ3xeeFgpN4/+8Q+URNsLDNVixG1kjs5esyXe0cIl5iTp2B2uphEvS9oZ3U4kExkoaNbih1yXd6qp32NqndZIGo9lIw0AjAo9RN+9dudxy+iZkqtgXwXsNoUBduqugXa+KOGHOjpdAtJ17YMM+2PZBP+VN7myqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722954044; c=relaxed/simple;
	bh=jIOuqhgEBh6VGxaQQdjTBnedyoXCh3aKOlKNnhGoZr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b9XpdkH28l+dROgFlyIoZ1rT2ST1nUaXjAmd00nweU7efbqvFkLGK2AEMNfAV5VQv2wcGs+MsAEzj6rm71P2eMHMdS/v3PWCJ73SBtY+hEOoxKtmqGDWisA6+UCRSVNA3ahPWJNYInSBgm9eSBVanGPykC01pyRWfEIuogp7nCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YcQf7Tol; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=pgj087NucnHKxua0poSb91px8mDb2gODWDuPOmjAJHI=; b=YcQf7T
	olB1HU2zUkNS4lit9bw0nqhHXV+gIy6Glyw+ZWpIuSqg6Ak8/ND7KTS5Up6O1b2i
	DRWEMAOQFr3xMQL5MuJzsHqhGMLlOtLtZbIj2dlS4sAfWDyZpZbGAEH1TgFxKY9U
	BbbCjvmx9DbLY8QqQdbaHboTCklM9vbVMDEfGp7g2EgZrpBgTRARTN+kxD/r3nYM
	2Bl8ewoc/JVsbyNgWp9PNOiHbJDagVi+pNwskFyOzEMu3g+pOTF+dweGgZBMTJbI
	bVVtx1CI1lcJypcqb23aLvCkydq1pya5pvmCOWgL5yBE0k9IbQRAVhqRGiJniLPg
	xFZYhDTXf0tEj4xg==
Received: (qmail 249166 invoked from network); 6 Aug 2024 16:20:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Aug 2024 16:20:37 +0200
X-UD-Smtp-Session: l3s3148p1@3r5gfwQfGIYgAwDPXxLGAIH3oZkcU6AS
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 1/3] i2c: testunit: sort case blocks
Date: Tue,  6 Aug 2024 16:20:30 +0200
Message-ID: <20240806142033.2697-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806142033.2697-1-wsa+renesas@sang-engineering.com>
References: <20240806142033.2697-1-wsa+renesas@sang-engineering.com>
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


