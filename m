Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68A0869D133
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Feb 2023 17:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbjBTQRn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Feb 2023 11:17:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232192AbjBTQRm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Feb 2023 11:17:42 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1D86193;
        Mon, 20 Feb 2023 08:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1676909860; x=1708445860;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m8U/qv7GUyyJtoJ/cmMrOe+OYej/LgVV8kl3LQxG2EQ=;
  b=QShoYGpULHw6T2K/CIBpTfxAChbEnG9hAijx8wNRHPt6l5YD29bOf6ol
   VSb8KEEGbw5OUvWDYgqqjuFfZrmky48eJrs/0hJHXWG+3Q4kHUmJGmGSZ
   ivj7z2yrJY6/Zsno5k7ORo83gKDQHH4DGEFvGprF4lAa+pjlfs7adxNTv
   S4VdyR1GE62oO1/WOTUPLvKS/pMph8niit3ErlIQ8nkIWhIRMqerqYcvm
   kkhSoVyULHHTmcXijmRmQE37+3Y7BSx05fDtQdiG8pPg5OUk3PZO9eYQ3
   rHzTajf2b2TY8diSWy4Q305Nvp6zBAcEOC3/UruczIw/+Ai2BMbo4ssEc
   w==;
X-IronPort-AV: E=Sophos;i="5.97,313,1669071600"; 
   d="scan'208";a="29196106"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 20 Feb 2023 17:17:38 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 20 Feb 2023 17:17:38 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 20 Feb 2023 17:17:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1676909858; x=1708445858;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=m8U/qv7GUyyJtoJ/cmMrOe+OYej/LgVV8kl3LQxG2EQ=;
  b=Lk/q+IZjSFrI/5NiWKV0J0Zp23BAbN2iLfGv+ssgKvprEbkYJg2+8v7W
   QbcEcbOGdjo25bYpYuBUutZdMh4e7Vdi627XUfgOYAX08XjPjihvZXFOK
   l8Zd4oMXjT3E1KIJxbZ/CI5GXmtji1tuAucWIB18QEP5e2xX4NqCeLvwf
   bHrCEWvgIkUdkZTbH8Oel0MQyedc952xIbF1YhiPgJ9T5k2gNtePiphqG
   O86GdDL5zfkR7+qrMZratlzaLpNE7RGPY7ieYBJ2I4ko0Vz4Y05gzb/LG
   td5I8Kc7E+dWu5AseV/I5YANhoQzVBy0sh9un4KeOoFg8tO2gYm4YnDnz
   w==;
X-IronPort-AV: E=Sophos;i="5.97,313,1669071600"; 
   d="scan'208";a="29196105"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Feb 2023 17:17:38 +0100
Received: from localhost.localdomain (SCHIFFERM-M2.tq-net.de [10.121.49.14])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id BDA7C280056;
        Mon, 20 Feb 2023 17:17:37 +0100 (CET)
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>
Cc:     Federico Vaga <federico.vaga@cern.ch>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: [PATCH] i2c: ocores: generate stop condition after timeout in polling mode
Date:   Mon, 20 Feb 2023 17:16:28 +0100
Message-Id: <20230220161628.463620-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Gregor Herburger <gregor.herburger@tq-group.com>

In polling mode, no stop condition is generated after a timeout. This
causes SCL to remain low and thereby block the bus. If this happens
during a transfer it can cause slaves to misinterpret the subsequent
transfer and return wrong values.

To solve this, pass the ETIMEDOUT error up from ocores_process_polling()
instead of setting STATE_ERROR directly. The caller is adjusted to call
ocores_process_timeout() on error both in polling and in IRQ mode, which
will set STATE_ERROR and generate a stop condition.

Fixes: 69c8c0c0efa8 ("i2c: ocores: add polling interface")
Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/i2c/busses/i2c-ocores.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index a0af027db04c1..28bcda3f7040a 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -342,18 +342,18 @@ static int ocores_poll_wait(struct ocores_i2c *i2c)
  * ocores_isr(), we just add our polling code around it.
  *
  * It can run in atomic context
+ *
+ * Return: 0 on success, -ETIMEDOUT on timeout
  */
-static void ocores_process_polling(struct ocores_i2c *i2c)
+static int ocores_process_polling(struct ocores_i2c *i2c)
 {
 	while (1) {
 		irqreturn_t ret;
 		int err;
 
 		err = ocores_poll_wait(i2c);
-		if (err) {
-			i2c->state = STATE_ERROR;
-			break; /* timeout */
-		}
+		if (err)
+			return err;
 
 		ret = ocores_isr(-1, i2c);
 		if (ret == IRQ_NONE)
@@ -364,6 +364,8 @@ static void ocores_process_polling(struct ocores_i2c *i2c)
 					break;
 		}
 	}
+
+	return 0;
 }
 
 static int ocores_xfer_core(struct ocores_i2c *i2c,
@@ -387,16 +389,16 @@ static int ocores_xfer_core(struct ocores_i2c *i2c,
 	oc_setreg(i2c, OCI2C_DATA, i2c_8bit_addr_from_msg(i2c->msg));
 	oc_setreg(i2c, OCI2C_CMD, OCI2C_CMD_START);
 
-	if (polling) {
-		ocores_process_polling(i2c);
-	} else {
+	if (polling)
+		ret = ocores_process_polling(i2c);
+	else
 		ret = wait_event_timeout(i2c->wait,
 					 (i2c->state == STATE_ERROR) ||
-					 (i2c->state == STATE_DONE), HZ);
-		if (ret == 0) {
-			ocores_process_timeout(i2c);
-			return -ETIMEDOUT;
-		}
+					 (i2c->state == STATE_DONE), HZ) ?
+						0 : -ETIMEDOUT;
+	if (ret) {
+		ocores_process_timeout(i2c);
+		return ret;
 	}
 
 	return (i2c->state == STATE_DONE) ? num : -EIO;
-- 
2.34.1

