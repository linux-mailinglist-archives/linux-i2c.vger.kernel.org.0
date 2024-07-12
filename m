Return-Path: <linux-i2c+bounces-4960-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C8E92F87A
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 11:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54F391C20EFB
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 09:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C809114E2E1;
	Fri, 12 Jul 2024 09:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UltaTzy0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE801146D79
	for <linux-i2c@vger.kernel.org>; Fri, 12 Jul 2024 09:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720778107; cv=none; b=fUuuNna4Q14TVMBadGYxRusNW+7QPjD8Rp3LPWtkCGeR+rmYuiGYQDYojCMnpL7jM9IfS6pim2lmwno7Yqca6S7iORwt3l5CONZtuTA+dYQYbf+ZP7Lf0fMs1noDwrY1xXR+4uTEYgnWl90EoFVwd04FHISWkdokeM/kChvjjc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720778107; c=relaxed/simple;
	bh=BKoJFwAmycB7Kma4J/9n0dCdGo15MiIP+EskSWqagKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ubT0CbJgwt+bn3QtTdlWlCA7rthSssTcJYu/zPC4qzvx50JAoz7RJRVvWVbUGqOzOOp1gFESKoYLYVp02BikwHV1sexb9NAUVLWmvoZLcCV3WxzgMxyMQP4BO5WsqOqJyt7KRLS50OSSCaajVUU+YVH1sFaXuwrR1GN7Fg7u1jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UltaTzy0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=xQaGUFxI3F9bIC
	0Je/JYNWxB96sa3rnzDYmiL5jgjgk=; b=UltaTzy0hvYwLJ0qoR6z2j8fk7Rcz6
	jTfDIa9dBX/FgFGKg66+2r6i/qrdgANRyCQVAEMwgjeKYlvg+DItt4wm9OjUSRg5
	NabgnPUZSM2MHPFJW8UXC23kxfRGiEjTsn9iK5b7ABzQpoB7eUNr0SOKhUxnRAjx
	ucCStDEDpjZ/zR78BMAqyx88q8+53Sd7P/eDlC3H5A32FyzeyJoIvE3hpcIGXvYs
	+fuLqOqILwWtW43iB5G1j6BTVVSnbcBo4id/bkDmg98MxkNWebGMdq14HguOIQe5
	6Vynv5s4XDahMeAjrPcuft2Z6iP0Df8OCYyOp6ZrYW2D108ODyOfvu8w==
Received: (qmail 1114581 invoked from network); 12 Jul 2024 11:54:59 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jul 2024 11:54:59 +0200
X-UD-Smtp-Session: l3s3148p1@jbJP3wkdeKIgAwDPXwmZAIsFIv4n+Dpm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: document new callbacks in i2c_algorithm
Date: Fri, 12 Jul 2024 11:52:40 +0200
Message-ID: <20240712095453.11440-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When updating the callbacks, adding their kernel-doc was forgotten. Add
it now.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20240712165527.75e4ddc9@canb.auug.org.au
Fixes: a93c2e5fe766 ("i2c: reword i2c_algorithm according to newest specification")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Andi, this is the minimal fix for the the regression reported by
Stephen. Please apply it on top of the rewording series. There will be
more fixes in this paragraph but these should go better via my tree, I
guess, after I pulled yours.

 include/linux/i2c.h | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 9d45b7b912dd..e9cc14b1f9a1 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -513,10 +513,10 @@ i2c_register_board_info(int busnum, struct i2c_board_info const *info,
 
 /**
  * struct i2c_algorithm - represent I2C transfer method
- * @master_xfer: Issue a set of i2c transactions to the given I2C adapter
+ * @xfer: Issue a set of i2c transactions to the given I2C adapter
  *   defined by the msgs array, with num messages available to transfer via
  *   the adapter specified by adap.
- * @master_xfer_atomic: same as @master_xfer. Yet, only using atomic context
+ * @xfer_atomic: same as @xfer. Yet, only using atomic context
  *   so e.g. PMICs can be accessed very late before shutdown. Optional.
  * @smbus_xfer: Issue smbus transactions to the given I2C adapter. If this
  *   is not present, then the bus layer will try and convert the SMBus calls
@@ -525,27 +525,33 @@ i2c_register_board_info(int busnum, struct i2c_board_info const *info,
  *   so e.g. PMICs can be accessed very late before shutdown. Optional.
  * @functionality: Return the flags that this algorithm/adapter pair supports
  *   from the ``I2C_FUNC_*`` flags.
- * @reg_slave: Register given client to I2C slave mode of this adapter
- * @unreg_slave: Unregister given client from I2C slave mode of this adapter
+ * @reg_target: Register given client to local target mode of this adapter
+ * @unreg_target: Unregister given client from local target mode of this adapter
+ *
+ * @master_xfer: deprecated, use @xfer
+ * @master_xfer_atomic: deprecated, use @xfer_atomic
+ * @reg_slave: deprecated, use @reg_target
+ * @unreg_slave: deprecated, use @unreg_target
+ *
  *
  * The following structs are for those who like to implement new bus drivers:
  * i2c_algorithm is the interface to a class of hardware solutions which can
  * be addressed using the same bus algorithms - i.e. bit-banging or the PCF8584
  * to name two of the most common.
  *
- * The return codes from the ``master_xfer{_atomic}`` fields should indicate the
+ * The return codes from the ``xfer{_atomic}`` fields should indicate the
  * type of error code that occurred during the transfer, as documented in the
  * Kernel Documentation file Documentation/i2c/fault-codes.rst. Otherwise, the
  * number of messages executed should be returned.
  */
 struct i2c_algorithm {
 	/*
-	 * If an adapter algorithm can't do I2C-level access, set master_xfer
+	 * If an adapter algorithm can't do I2C-level access, set xfer
 	 * to NULL. If an adapter algorithm can do SMBus access, set
 	 * smbus_xfer. If set to NULL, the SMBus protocol is simulated
 	 * using common I2C messages.
 	 *
-	 * master_xfer should return the number of messages successfully
+	 * xfer should return the number of messages successfully
 	 * processed, or a negative value on error
 	 */
 	union {
-- 
2.43.0


