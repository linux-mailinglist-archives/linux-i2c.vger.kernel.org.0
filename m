Return-Path: <linux-i2c+bounces-13399-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCECBC1524
	for <lists+linux-i2c@lfdr.de>; Tue, 07 Oct 2025 14:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D47CC3C6433
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Oct 2025 12:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01952DE6FC;
	Tue,  7 Oct 2025 12:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="H1zBBmj+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-relay153-hz1.antispameurope.com (mx-relay153-hz1.antispameurope.com [94.100.133.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A402DE6E9
	for <linux-i2c@vger.kernel.org>; Tue,  7 Oct 2025 12:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759839068; cv=pass; b=bGfpO90AszDUDW2m2lf4LCEFAjtjebwEtOzZMzYXZtT2u9/8F/DF9XfTfiDBLL7cElr6ztJFGwXQZudj2YmJwysb8UBqdk2U9Dc5RR0dsQUGxN5xS5hywTWr+OTis+N/rC6yba5rrzFbSXjhYMQ3b0FG8eGm3chT++4V+5nJBAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759839068; c=relaxed/simple;
	bh=3j0JdlFUnGt3tfG7YPtOUi8vTMw+9MP7QHS0YPialiw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PQ6Ohp78qizulJO74A2/4ZzMh3s72ix29PO427XTppfNTdq0hh+t134R4nO+qOxmBnxv9tGUZzeSWDbZYT7MOjFx8mR4SLq4kMZWR6jQJ/NsUlpDTRgpKyib7J3x3lyG47hcXxf5X2HITaR0IbuawRbUt+5jqHT8PpO8rL7aQyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=H1zBBmj+; arc=pass smtp.client-ip=94.100.133.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate153-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Uvq9jMd8Lrspqtm/8PiIsc9tK7EfCgg5pSBz7TgiqKg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1759839010;
 b=is+R7xR/tVUM5grcksXt7FJ3aNuuzXgaTqqxwpiN0qdH7JckI8coqWfpuyEiL6tMDERquy7t
 0Sa+3WhL7xFOhrJgv1dvrUKxjug7X5L5eg6mq3HPM+hoDW13xYwtF38d8A5P3eJ2/UUbZY4jFF4
 tMAlOxtebSGIGS0omxjcIH/HZ9jtke3SQ24T+movDL4HChMAkXgimFwQbLIiY2uYB91iFZ2NXXs
 ttOCOxorDhn6czyjb3RPt8Ljs7DciT2ZmHqBHpvRmg1wyKBZNmSnJS77StZzq6FFNa2HMHsUTlv
 hESB6Sr1OcTCoP8T2yHDsZK/sJ+cFsR7fbXMK5KuOtTqQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1759839010;
 b=AkYPtf6aHf33MqS1H9VqduvYAegHVzCkRbB1hg+lcLzQSgsRCkSR7UZZ2sbb6TJDr4kgiT5a
 8feihsDa9Oj6NIi/3HP0PH/QNeuTKNWttYHOIn9v3EhaIZmMVNrRN6AcXTlNMHGNKPEk+qSlv5b
 5/yx2/y3EZTsWRj+0zSu/M9xbBKsvLsEuZ40Ytm25wG28dTUVUBRlZWCd4r2cHiTgvdixDR5UFD
 pTBm1jOWOE9oQ+VLqS7h7MKadQzQ7NLFRry/dJ0b0PY9+9Axpw41/uJQvXZs5AT3MegRezkvaab
 O/FByE1bHxyXTjW+IP88dwPgQsdDbIfnUpt9DkCKboPHQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay153-hz1.antispameurope.com;
 Tue, 07 Oct 2025 14:10:09 +0200
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id EA536CC0E4E;
	Tue,  7 Oct 2025 14:09:56 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Peter Korsgaard <peter@korsgaard.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 1/2] i2c: ocores: replace 1ms poll iteration timeout with total transfer timeout
Date: Tue,  7 Oct 2025 14:09:24 +0200
Message-ID: <1eb320b6b7d3a12e62785893ea68c4d16aa2560d.1759838476.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient:linux-i2c@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay153-hz1.antispameurope.com with 4cgw1d33B4zqXZn
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:6cd45e746b0bc038b83f7a622e5751fb
X-cloud-security:scantime:3.438
DKIM-Signature: a=rsa-sha256;
 bh=Uvq9jMd8Lrspqtm/8PiIsc9tK7EfCgg5pSBz7TgiqKg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1759839009; v=1;
 b=H1zBBmj+GFfYco3gp0VTSBX6nr8jbFJ86NYmNb9IaEg43UpjRlkDH/XqoG1aZxoB4qefL/p5
 q6Hxr2Me1hEwvHtGXmwOQgVvwJKQL6Sho2Wmw5DOsG8kAjFA14a4lvRbeYy2znVs0WYJL5j++qv
 k7mAWPrcs7uaAZsDr/KaqkBhJIHcmxv0mR0pz0DOrtIYcN2vT/M3YisH3m8rfLYm4h7aAD13IX8
 xZfFXCAoFEDg4KAaFd+tzBtdeGN+kOrrbFCKPRl1Y5nRoOoa4LxFWwaggVlXNPBgP/lRLW7WMmq
 YpY8atERb2SGbVxlUC/SovxbwBC+N1ikchTd1MVw4bxVg==

When a target makes use of clock stretching, a timeout of 1ms may not be
enough. One extreme example is the NXP PTN3460 eDP to LVDS bridge, which
takes ~320ms to send its ACK after a flash command has been
submitted.

Replace the per-iteration timeout of 1ms with limiting the total
transfer time to the timeout set in struct i2c_adapter (defaulting to
1s, configurable through the I2C_TIMEOUT ioctl). While we're at it, also
add a cpu_relax() to the busy poll loop.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/i2c/busses/i2c-ocores.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index 0f67e57cdeff6..1746c8821a149 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -258,7 +258,7 @@ static void ocores_process_timeout(struct ocores_i2c *i2c)
  * @reg: register to query
  * @mask: bitmask to apply on register value
  * @val: expected result
- * @timeout: timeout in jiffies
+ * @timeout: absolute timeout in jiffies
  *
  * Timeout is necessary to avoid to stay here forever when the chip
  * does not answer correctly.
@@ -269,17 +269,16 @@ static int ocores_wait(struct ocores_i2c *i2c,
 		       int reg, u8 mask, u8 val,
 		       const unsigned long timeout)
 {
-	unsigned long j;
-
-	j = jiffies + timeout;
 	while (1) {
 		u8 status = oc_getreg(i2c, reg);
 
 		if ((status & mask) == val)
 			break;
 
-		if (time_after(jiffies, j))
+		if (time_after(jiffies, timeout))
 			return -ETIMEDOUT;
+
+		cpu_relax();
 	}
 	return 0;
 }
@@ -287,12 +286,13 @@ static int ocores_wait(struct ocores_i2c *i2c,
 /**
  * ocores_poll_wait() - Wait until is possible to process some data
  * @i2c: ocores I2C device instance
+ * @timeout: absolute timeout in jiffies
  *
  * Used when the device is in polling mode (interrupts disabled).
  *
  * Return: 0 on success, -ETIMEDOUT on timeout
  */
-static int ocores_poll_wait(struct ocores_i2c *i2c)
+static int ocores_poll_wait(struct ocores_i2c *i2c, unsigned long timeout)
 {
 	u8 mask;
 	int err;
@@ -310,15 +310,11 @@ static int ocores_poll_wait(struct ocores_i2c *i2c)
 		udelay((8 * 1000) / i2c->bus_clock_khz);
 	}
 
-	/*
-	 * once we are here we expect to get the expected result immediately
-	 * so if after 1ms we timeout then something is broken.
-	 */
-	err = ocores_wait(i2c, OCI2C_STATUS, mask, 0, msecs_to_jiffies(1));
+	err = ocores_wait(i2c, OCI2C_STATUS, mask, 0, timeout);
 	if (err)
-		dev_warn(i2c->adap.dev.parent,
-			 "%s: STATUS timeout, bit 0x%x did not clear in 1ms\n",
-			 __func__, mask);
+		dev_dbg(i2c->adap.dev.parent,
+			"%s: STATUS timeout, bit 0x%x did not clear\n",
+			__func__, mask);
 	return err;
 }
 
@@ -336,11 +332,12 @@ static int ocores_poll_wait(struct ocores_i2c *i2c)
  */
 static int ocores_process_polling(struct ocores_i2c *i2c)
 {
+	unsigned long timeout = jiffies + i2c->adap.timeout;
 	irqreturn_t ret;
 	int err = 0;
 
 	while (1) {
-		err = ocores_poll_wait(i2c);
+		err = ocores_poll_wait(i2c, timeout);
 		if (err)
 			break; /* timeout */
 
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


