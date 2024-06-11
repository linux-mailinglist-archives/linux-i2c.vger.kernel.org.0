Return-Path: <linux-i2c+bounces-3965-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE0990382A
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 11:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66F8E1C22BA1
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2024 09:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E301779BA;
	Tue, 11 Jun 2024 09:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CxsoHWHs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DC517083F
	for <linux-i2c@vger.kernel.org>; Tue, 11 Jun 2024 09:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718099487; cv=none; b=cn6jJctTp3DvsrV0wFHf+1kAd6z4E8VKFAlVSRbbuiOXjbkj1E0BpaCPgR3kijYcsq8epAuzlsFgdyDpv0lkme8LH9RcienR96bq9aenrvBRRuGDuZLs/lKhMm5J+fiFQqYuR/BFohfApkvhbqag/mX1Gn96Sn1OxseJ9blWxb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718099487; c=relaxed/simple;
	bh=M3sP57whPMEKglNBLqbJ/9YfpM3OYVMio9G5VSbZfCM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lKjlj46j5snCbZGnfO/DdjVcS9YEqOsarlWlm5pVifXiF1JWRlAosWVdti06k5CSihfjBq2tS68tD4pp8XrSlMH0/jZkPte5rDZQZH+aOIOsEpTUw4dpSy9ULSqlTogfiVb8dqg1PMYuGdae/V2ZlXSQ51IMdL9WZIhtsElTlRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CxsoHWHs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=0VI96GF2sRbXga
	gYVUW48owhEm5vm0nVephK1lZYgUQ=; b=CxsoHWHsP3/5G3kCovWY7mLIE8p2+w
	nBN7g0a8KUGdcAzSwyNbDtGVAraxJaUY3y0K6FXSw5ZTX+XMZf2JSWKg2IWU2GLG
	muqwtXfrNMpT/2nvfAcEjTyDic2TumGwTreqLtSWpw/S1uP8F2b+eY4dKIlD9txw
	DJ0oNKk3oCSjSB2DkxsnAL4ES1y+YciJ+EMPRiRRy8ChLnICWoMFWlNMaLv/Buy7
	cqk8MFGQS4A2igNS/u1vWqszOdVKc4vSZ5tQ41mYPJZZwvXuGljQ2lkK0WnpRTKF
	Jo/yIS0TyKquYC1h6QNBELRYCAOVVNdUIIrxr4hpECm25vN265wpVeuQ==
Received: (qmail 380400 invoked from network); 11 Jun 2024 11:51:13 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jun 2024 11:51:13 +0200
X-UD-Smtp-Session: l3s3148p1@K8LFNJoaIJZehhrL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: i2c: testunit: use proper reST
Date: Tue, 11 Jun 2024 11:50:31 +0200
Message-ID: <20240611095108.10639-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This document is hardly readable when converted to HTML. Mark code
sections as such and use tables to improve readability a lot. Some
content has slightly been moved around, but no significant changes were
made.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This is a preparational patch before adding more features to the
testunit.

 Documentation/i2c/slave-testunit-backend.rst | 122 +++++++++++++------
 1 file changed, 82 insertions(+), 40 deletions(-)

diff --git a/Documentation/i2c/slave-testunit-backend.rst b/Documentation/i2c/slave-testunit-backend.rst
index ecfc2abec32d..0df60c7c0be4 100644
--- a/Documentation/i2c/slave-testunit-backend.rst
+++ b/Documentation/i2c/slave-testunit-backend.rst
@@ -16,9 +16,9 @@ Note that this is a device for testing and debugging. It should not be enabled
 in a production build. And while there is some versioning and we try hard to
 keep backward compatibility, there is no stable ABI guaranteed!
 
-Instantiating the device is regular. Example for bus 0, address 0x30:
+Instantiating the device is regular. Example for bus 0, address 0x30::
 
-# echo "slave-testunit 0x1030" > /sys/bus/i2c/devices/i2c-0/new_device
+  # echo "slave-testunit 0x1030" > /sys/bus/i2c/devices/i2c-0/new_device
 
 After that, you will have a write-only device listening. Reads will just return
 an 8-bit version number of the testunit. When writing, the device consists of 4
@@ -26,14 +26,17 @@ an 8-bit version number of the testunit. When writing, the device consists of 4
 written to start a testcase, i.e. you usually write 4 bytes to the device. The
 registers are:
 
-0x00 CMD   - which test to trigger
-0x01 DATAL - configuration byte 1 for the test
-0x02 DATAH - configuration byte 2 for the test
-0x03 DELAY - delay in n * 10ms until test is started
+.. csv-table::
+  :header: "Offset", "Name", "Description"
 
-Using 'i2cset' from the i2c-tools package, the generic command looks like:
+  0x00, CMD, which test to trigger
+  0x01, DATAL, configuration byte 1 for the test
+  0x02, DATAH, configuration byte 2 for the test
+  0x03, DELAY, delay in n * 10ms until test is started
 
-# i2cset -y <bus_num> <testunit_address> <CMD> <DATAL> <DATAH> <DELAY> i
+Using 'i2cset' from the i2c-tools package, the generic command looks like::
+
+  # i2cset -y <bus_num> <testunit_address> <CMD> <DATAL> <DATAH> <DELAY> i
 
 DELAY is a generic parameter which will delay the execution of the test in CMD.
 While a command is running (including the delay), new commands will not be
@@ -45,44 +48,83 @@ result in the transfer not being acknowledged.
 Commands
 --------
 
-0x00 NOOP (reserved for future use)
+0x00 NOOP
+~~~~~~~~~
+
+Reserved for future use.
+
+0x01 READ_BYTES
+~~~~~~~~~~~~~~~
+
+.. list-table::
+  :header-rows: 1
+
+  * - CMD
+    - DATAL
+    - DATAH
+    - DELAY
+
+  * - 0x01
+    - address to read data from (lower 7 bits, highest bit currently unused)
+    - number of bytes to read
+    - n * 10ms
+
+Also needs master mode. This is useful to test if your bus master driver is
+handling multi-master correctly. You can trigger the testunit to read bytes
+from another device on the bus. If the bus master under test also wants to
+access the bus at the same time, the bus will be busy. Example to read 128
+bytes from device 0x50 after 50ms of delay::
+
+  # i2cset -y 0 0x30 0x01 0x50 0x80 0x05 i
+
+0x02 SMBUS_HOST_NOTIFY
+~~~~~~~~~~~~~~~~~~~~~~
+
+.. list-table::
+  :header-rows: 1
+
+  * - CMD
+    - DATAL
+    - DATAH
+    - DELAY
 
-0x01 READ_BYTES (also needs master mode)
-   DATAL - address to read data from (lower 7 bits, highest bit currently unused)
-   DATAH - number of bytes to read
+  * - 0x02
+    - low byte of the status word to send
+    - high byte of the status word to send
+    - n * 10ms
 
-This is useful to test if your bus master driver is handling multi-master
-correctly. You can trigger the testunit to read bytes from another device on
-the bus. If the bus master under test also wants to access the bus at the same
-time, the bus will be busy. Example to read 128 bytes from device 0x50 after
-50ms of delay:
+Also needs master mode. This test will send an SMBUS_HOST_NOTIFY message to the
+host. Note that the status word is currently ignored in the Linux Kernel.
+Example to send a notification after 10ms::
 
-# i2cset -y 0 0x30 0x01 0x50 0x80 0x05 i
+  # i2cset -y 0 0x30 0x02 0x42 0x64 0x01 i
 
-0x02 SMBUS_HOST_NOTIFY (also needs master mode)
-   DATAL - low byte of the status word to send
-   DATAH - high byte of the status word to send
+0x03 SMBUS_BLOCK_PROC_CALL
+~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-This test will send an SMBUS_HOST_NOTIFY message to the host. Note that the
-status word is currently ignored in the Linux Kernel. Example to send a
-notification after 10ms:
+.. list-table::
+  :header-rows: 1
 
-# i2cset -y 0 0x30 0x02 0x42 0x64 0x01 i
+  * - CMD
+    - DATAL
+    - DATAH
+    - DELAY
 
-0x03 SMBUS_BLOCK_PROC_CALL (partial command)
-   DATAL - must be '1', i.e. one further byte will be written
-   DATAH - number of bytes to be sent back
-   DELAY - not applicable, partial command!
+  * - 0x03
+    - must be '1', i.e. one further byte will be written
+    - number of bytes to be sent back
+    - leave out, partial command!
 
-This test will respond to a block process call as defined by the SMBus
-specification. The one data byte written specifies how many bytes will be sent
-back in the following read transfer. Note that in this read transfer, the
-testunit will prefix the length of the bytes to follow. So, if your host bus
-driver emulates SMBus calls like the majority does, it needs to support the
-I2C_M_RECV_LEN flag of an i2c_msg. This is a good testcase for it. The returned
-data consists of the length first, and then of an array of bytes from length-1
-to 0. Here is an example which emulates i2c_smbus_block_process_call() using
-i2ctransfer (you need i2c-tools v4.2 or later):
+Partial command. This test will respond to a block process call as defined by
+the SMBus specification. The one data byte written specifies how many bytes
+will be sent back in the following read transfer. Note that in this read
+transfer, the testunit will prefix the length of the bytes to follow. So, if
+your host bus driver emulates SMBus calls like the majority does, it needs to
+support the I2C_M_RECV_LEN flag of an i2c_msg. This is a good testcase for it.
+The returned data consists of the length first, and then of an array of bytes
+from length-1 to 0. Here is an example which emulates
+i2c_smbus_block_process_call() using i2ctransfer (you need i2c-tools v4.2 or
+later)::
 
-# i2ctransfer -y 0 w3@0x30 0x03 0x01 0x10 r?
-0x10 0x0f 0x0e 0x0d 0x0c 0x0b 0x0a 0x09 0x08 0x07 0x06 0x05 0x04 0x03 0x02 0x01 0x00
+  # i2ctransfer -y 0 w3@0x30 0x03 0x01 0x10 r?
+  0x10 0x0f 0x0e 0x0d 0x0c 0x0b 0x0a 0x09 0x08 0x07 0x06 0x05 0x04 0x03 0x02 0x01 0x00
-- 
2.43.0


