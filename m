Return-Path: <linux-i2c+bounces-13450-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EBABCF398
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Oct 2025 12:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BACE189B1DC
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Oct 2025 10:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04739241695;
	Sat, 11 Oct 2025 10:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OCNHXvTl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01927204F99
	for <linux-i2c@vger.kernel.org>; Sat, 11 Oct 2025 10:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760178736; cv=none; b=PQ0UR6NudB4eOive70/TR799mJjCEh63Zh7Zq5lILGtoMPuqFlpYRc4QkSCnIEmmvnFKdByJQJgnXuQVNWxb4kY5RcsnDBJD3rjCdfdK5nynxPrcWf6zvPacPQW3/vgxMeOYBG8G0jpPluq29MACcC4VIXB7wZzmUz8vh17wL10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760178736; c=relaxed/simple;
	bh=2/6vQ2M8GA04r5ne5JBaZS7VOi+wRTeERQJ4rP3DspM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hVWM2IN06ol2SydqhOmqvvEmsX5YgClCYDr7f0uYuMQaya46V6ZhPY+qNOVeZu6ycIs7sYmXXt/vstHMTKAlCCPXeysxZ5frvRGr/NeG0SW76SWxRBl25UyycNCzphl4mQgnaZGQkQBZYVTk4WP+mqp+uC4JUC9vyz6V1u+h96U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OCNHXvTl; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=khamaVxLyFWfGo
	ToFxOhc1bRpojNKYYX5jLKClNZej4=; b=OCNHXvTlau2mX5bxk+8AskpULXka8V
	GeQZgWCjV8q78gwGEjWtbC+Dgt6Ehs5T6X/CsvJw53R//2EdDSqqqUFcW+m44Bkw
	b+fKXKtCziZE0qYEPXBpC56r2YwtYHf95jcsjxCkwyPi1bjUtrrVogSlKcq5VJt7
	OM23DDCqZ1uhkB0xW4TTJ+izjU/DBbK2NMR8ZwEsi7N1+XfL8K/UQkjS86Qz156e
	BC/8fHFGfPkNs+qMbNYIUuQTolcp9+1UzKbWZDqj/szd3Z//4DdPsmp1AkjLWbdh
	gvPV1MpVmt7/qyqmqTLt4fZ9Ulos2BQjvcKQm59sR9GkSQ/ddOp0lBKg==
Received: (qmail 1793365 invoked from network); 11 Oct 2025 12:31:57 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Oct 2025 12:31:57 +0200
X-UD-Smtp-Session: l3s3148p1@l8kwi99AIqsujntw
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] Revert "i2c: boardinfo: Annotate code used in init phase only"
Date: Sat, 11 Oct 2025 12:31:53 +0200
Message-ID: <20251011103153.2354-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 1a2b423be6a89dd07d5fc27ea042be68697a6a49 because we
got a regression report and need time to find out the details.

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Closes: https://lore.kernel.org/r/29ec0082-4dd4-4120-acd2-44b35b4b9487@oss.qualcomm.com
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-boardinfo.c | 4 ++--
 include/linux/i2c.h         | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-boardinfo.c b/drivers/i2c/i2c-boardinfo.c
index 338800321f8b..4df8ad092df3 100644
--- a/drivers/i2c/i2c-boardinfo.c
+++ b/drivers/i2c/i2c-boardinfo.c
@@ -22,7 +22,7 @@ EXPORT_SYMBOL_GPL(__i2c_board_lock);
 LIST_HEAD(__i2c_board_list);
 EXPORT_SYMBOL_GPL(__i2c_board_list);
 
-int __i2c_first_dynamic_bus_num __ro_after_init;
+int __i2c_first_dynamic_bus_num;
 EXPORT_SYMBOL_GPL(__i2c_first_dynamic_bus_num);
 
 
@@ -48,7 +48,7 @@ EXPORT_SYMBOL_GPL(__i2c_first_dynamic_bus_num);
  * The board info passed can safely be __initdata, but be careful of embedded
  * pointers (for platform_data, functions, etc) since that won't be copied.
  */
-int __init i2c_register_board_info(int busnum, struct i2c_board_info const *info, unsigned len)
+int i2c_register_board_info(int busnum, struct i2c_board_info const *info, unsigned len)
 {
 	int status;
 
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 11a19241e360..20fd41b51d5c 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -499,7 +499,7 @@ static inline struct i2c_client *i2c_verify_client(struct device *dev)
  * Modules for add-on boards must use other calls.
  */
 #ifdef CONFIG_I2C_BOARDINFO
-int __init
+int
 i2c_register_board_info(int busnum, struct i2c_board_info const *info,
 			unsigned n);
 #else
-- 
2.47.2


