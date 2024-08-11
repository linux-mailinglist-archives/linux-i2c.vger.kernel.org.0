Return-Path: <linux-i2c+bounces-5292-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4368594E35B
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2024 23:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F35D4281588
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2024 21:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DCF158D98;
	Sun, 11 Aug 2024 21:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SfHl/wwU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C460B15FD08
	for <linux-i2c@vger.kernel.org>; Sun, 11 Aug 2024 21:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723411410; cv=none; b=jQTz2wpr1pYvrTfj1L0Qi1AkrCRS0gq4hW8cfgWl3AvB8sJqwuFQO/VCqr28SOzYznopFgBGKMnQyqDA3PxJG2vXlQJ/6v1mLhzita/6D2OFeJp+BX6x3+1/HAe3mnYAkQ6+6R0zrspbg21nYr8JyUAvoUoCrXlwB27wjX98CCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723411410; c=relaxed/simple;
	bh=s+QtlQkN1TBv2DlSLGxKM756HLmt+3SjAIOsYE9q1n0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZlXKEbKGJ+JgUbIqnaeaGc9mMJHYmAkwlU4DL1RtW1J7ceT3sPPzvcLd1aP+koLqKpEOJmhlNRdolRm326JVMUywj/DtE+2WHgXDlPLMDVtmY+xLgfTBPqcc3mslrII8gwTdutE8hLgbxvf6zTCKit3hn9owc8Zq8135GE+pc20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SfHl/wwU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=d/PFylhViZ8m5LgSnK1jY9LTCD9Ckx8s1nhCAApPX40=; b=SfHl/w
	wU8XrD0UUBwRijyu4ziJiRMkKnO+aa20xP3cQ36FUQMIXDjt9dhj4TEKcSE/bxqs
	mdH/zAj8YrIXEo9rpCN7rzqhWgwA3+1aSIhg6o34+3P6A7EN0sP5FXIJiA51YI4p
	hgFgP5q8npdJbhxVnEQaYfXouLX7Lz9g2dtdOLGDYKIrB85yIYAWZCUeFcsJHXKm
	Bkj/i2R5wbTNUfcYTIdYtslH9fXoLPBqjTRyT8KkCzpnENSQijm8ghlVA9BhwQ9+
	ujzpgrhl9A5X1oTJVbJZjBPLvb+QO51xTLmeNMetMjm0i1OcYUnnLjTY1xtncJ+a
	M7pFphOBAUjIHwhQ==
Received: (qmail 1179573 invoked from network); 11 Aug 2024 23:23:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2024 23:23:24 +0200
X-UD-Smtp-Session: l3s3148p1@/H6F/G4fHpUujnvj
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 2/4] i2c: testunit: use decimal values in docs when appropriate
Date: Sun, 11 Aug 2024 23:23:14 +0200
Message-ID: <20240811212317.16119-3-wsa+renesas@sang-engineering.com>
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

Sometimes decimal values are just shorter (like for cmds), sometimes
they are even easier to understand (like for the delay value). Make use
of them.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/slave-testunit-backend.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/i2c/slave-testunit-backend.rst b/Documentation/i2c/slave-testunit-backend.rst
index 37142a48ab35..ee019db53938 100644
--- a/Documentation/i2c/slave-testunit-backend.rst
+++ b/Documentation/i2c/slave-testunit-backend.rst
@@ -75,7 +75,7 @@ from another device on the bus. If the bus master under test also wants to
 access the bus at the same time, the bus will be busy. Example to read 128
 bytes from device 0x50 after 50ms of delay::
 
-  # i2cset -y 0 0x30 0x01 0x50 0x80 0x05 i
+  # i2cset -y 0 0x30 1 0x50 0x80 5 i
 
 0x02 SMBUS_HOST_NOTIFY
 ~~~~~~~~~~~~~~~~~~~~~~
@@ -95,9 +95,9 @@ bytes from device 0x50 after 50ms of delay::
 
 Also needs master mode. This test will send an SMBUS_HOST_NOTIFY message to the
 host. Note that the status word is currently ignored in the Linux Kernel.
-Example to send a notification after 10ms::
+Example to send a notification with status word 0x6442 after 10ms::
 
-  # i2cset -y 0 0x30 0x02 0x42 0x64 0x01 i
+  # i2cset -y 0 0x30 2 0x42 0x64 1 i
 
 If the host controller supports HostNotify, this message with debug level
 should appear (Linux 6.11 and later)::
@@ -116,7 +116,7 @@ should appear (Linux 6.11 and later)::
     - DELAY
 
   * - 0x03
-    - must be '1', i.e. one further byte will be written
+    - 0x01 (i.e. one further byte will be written)
     - number of bytes to be sent back
     - leave out, partial command!
 
@@ -131,5 +131,5 @@ from length-1 to 0. Here is an example which emulates
 i2c_smbus_block_process_call() using i2ctransfer (you need i2c-tools v4.2 or
 later)::
 
-  # i2ctransfer -y 0 w3@0x30 0x03 0x01 0x10 r?
+  # i2ctransfer -y 0 w3@0x30 3 1 0x10 r?
   0x10 0x0f 0x0e 0x0d 0x0c 0x0b 0x0a 0x09 0x08 0x07 0x06 0x05 0x04 0x03 0x02 0x01 0x00
-- 
2.43.0


