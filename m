Return-Path: <linux-i2c+bounces-5289-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D86F394E356
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2024 23:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 960CD281489
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2024 21:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6DE158A23;
	Sun, 11 Aug 2024 21:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jxpCMgiJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11A714F109
	for <linux-i2c@vger.kernel.org>; Sun, 11 Aug 2024 21:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723411410; cv=none; b=ddob+Zk+iotc5O8UqmYZgXdqSifDhFKhV3g1jTRYIahymqN7HGt2VkB/NBa2EhqwYhOS9wLSAwzxO89OlsBQ9VpscZ1if6FpmjEMTQusVVhmVN6Lv8fnB2dW+/D2rD2gXDhnyl1p8lq+hfg172iqGYdeKZcAmruYe9jMoUshyZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723411410; c=relaxed/simple;
	bh=TYJRFJT33kUuYRs97MBX+Rxz6oZ/tM9PrPrQzDsL8pE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGy4S8JktIaXLkRjxdozDYLC27FJ9TfSQSzrM/KLqd2kfQR5IhlU6XqV55zcQ9a9Yukwa5JZ3r1xDpo+FzY709BDD2d+yqvVNH4hXHnWMA7nKj+PgmExRLWMpYbrum+XBlBDM2NaOeTxYddYi0rW938PN6v1sXw9sOSa/5ZHImo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jxpCMgiJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=TpO1S+bnppNBX7TtCqfy6jWW3YMy11GS8DrfzbIuaNw=; b=jxpCMg
	iJNbdFJzcTGN99t6fV1BqkWAFx0TneYFI3wJADc9Y41P1Lyyjpn1QRgVIfbx0kAv
	JmOIhzdzefh9yqiEt6N7/YVlEIKMIGOgUOa7ts/WxtCy3Z9OWqqEYCaIRP5G5Uhk
	iCPjPqR/mX3XKNKDytTCogwxtrqgy8JISw5j3Y8a9PW9wA73LTPeyMmiVAKt0q23
	JNoIKJoN7Q67Ezfz14Md0dNuhjSSSV38x73n+hDP7Z5u05obEm3ZJTC9Ec3D5V1P
	HCHcll96ZIgqlshYyqeS6mefb3rvLtNUSgvbgmy3LI3aAtpqjYNUNBwDfQJjCRaF
	33PvwcuPDRXuHNIw==
Received: (qmail 1179615 invoked from network); 11 Aug 2024 23:23:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2024 23:23:26 +0200
X-UD-Smtp-Session: l3s3148p1@gMGk/G4fLpUujnvj
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 4/4] i2c: testunit: return current command on read messages
Date: Sun, 11 Aug 2024 23:23:16 +0200
Message-ID: <20240811212317.16119-5-wsa+renesas@sang-engineering.com>
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

Because the testunit can start tests in the future via the DELAY
register, it may happen that a command is still pending. Support
detecting that by returning the number of a command in progress (if
there is one).

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/slave-testunit-backend.rst | 14 ++++++++------
 drivers/i2c/i2c-slave-testunit.c             |  4 ++--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/Documentation/i2c/slave-testunit-backend.rst b/Documentation/i2c/slave-testunit-backend.rst
index 110c0055064f..d3ab5944877d 100644
--- a/Documentation/i2c/slave-testunit-backend.rst
+++ b/Documentation/i2c/slave-testunit-backend.rst
@@ -20,11 +20,13 @@ Instantiating the device is regular. Example for bus 0, address 0x30::
 
   # echo "slave-testunit 0x1030" > /sys/bus/i2c/devices/i2c-0/new_device
 
-After that, you will have a write-only device listening. Reads will just return
-an 8-bit version number of the testunit. When writing, the device consists of 4
-8-bit registers and, except for some "partial" commands, all registers must be
-written to start a testcase, i.e. you usually write 4 bytes to the device. The
-registers are:
+After that, you will have the device listening. Reading will return a single
+byte. Its value is 0 if the testunit is idle, otherwise the command number of
+the currently running command.
+
+When writing, the device consists of 4 8-bit registers and, except for some
+"partial" commands, all registers must be written to start a testcase, i.e. you
+usually write 4 bytes to the device. The registers are:
 
 .. csv-table::
   :header: "Offset", "Name", "Description"
@@ -170,4 +172,4 @@ are not equivalent to a REPEATED START. As an example, this returns just the
 default response::
 
   # i2cset -y 0 0x30 4 0 0 i; i2cget -y 0 0x30
-  0x01
+  0x00
diff --git a/drivers/i2c/i2c-slave-testunit.c b/drivers/i2c/i2c-slave-testunit.c
index 51b399aa09a0..04060bc8a9d0 100644
--- a/drivers/i2c/i2c-slave-testunit.c
+++ b/drivers/i2c/i2c-slave-testunit.c
@@ -15,7 +15,6 @@
 #include <linux/slab.h>
 #include <linux/workqueue.h> /* FIXME: is system_long_wq the best choice? */
 
-#define TU_CUR_VERSION 0x01
 #define TU_VERSION_MAX_LENGTH 128
 
 enum testunit_cmds {
@@ -159,7 +158,8 @@ static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
 		else if (is_proc_call)
 			*val = tu->regs[TU_REG_DATAH];
 		else
-			*val = TU_CUR_VERSION;
+			*val = test_bit(TU_FLAG_IN_PROCESS, &tu->flags) ?
+					tu->regs[TU_REG_CMD] : 0;
 		break;
 	}
 
-- 
2.43.0


