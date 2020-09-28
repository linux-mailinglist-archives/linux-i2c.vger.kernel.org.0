Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95D1E27AC6C
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Sep 2020 13:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgI1LHB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Sep 2020 07:07:01 -0400
Received: from www.zeus03.de ([194.117.254.33]:49390 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbgI1LHA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 28 Sep 2020 07:07:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=01nGEfpmcWR/Z8vTKFz5RxIOA5A
        q3ATg6MxZerdf3aQ=; b=TGL/vyzbSugF892RfhgX+hp2FYEjrAccb9R9llk+hFE
        xU8wHfaFM3aT4SJLYQ02Qfvdgla5CgnY5eNsnlaLW7c5Ls7LJI7VGMIxbtrzulNP
        Op2hYvEweuRkm2bVoBBf68QCL3d4g0X77PHiAeCdGrKAWCY4VEcJn6cNucg7ninE
        =
Received: (qmail 2223494 invoked from network); 28 Sep 2020 13:07:08 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2020 13:07:08 +0200
X-UD-Smtp-Session: l3s3148p1@ObnSql2w7t+57tsR
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: testunit: improve documentation
Date:   Mon, 28 Sep 2020 13:06:47 +0200
Message-Id: <20200928110647.1791-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Mention that new CMDs will be NACKed while the old one is still
on-going, that the I2C address parameter of READ_BYTES is 7 bit only,
and reword one paragraph to be more precise.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/slave-testunit-backend.rst | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/i2c/slave-testunit-backend.rst b/Documentation/i2c/slave-testunit-backend.rst
index f537c62a8a83..2c38e64f0bac 100644
--- a/Documentation/i2c/slave-testunit-backend.rst
+++ b/Documentation/i2c/slave-testunit-backend.rst
@@ -20,10 +20,10 @@ Instantiating the device is regular. Example for bus 0, address 0x30:
 
 # echo "slave-testunit 0x1030" > /sys/bus/i2c/devices/i2c-0/new_device
 
-After that, you will have a write-only device listening. Reads will return an
-8-bit version number. The device consists of 4 8-bit registers and all must be
-written to start a testcase, i.e. you must always write 4 bytes to the device.
-The registers are:
+After that, you will have a write-only device listening. Reads will just return
+an 8-bit version number of the testunit. When writing, the device consists of 4
+8-bit registers and all must be written to start a testcase, i.e. you must
+always write 4 bytes to the device. The registers are:
 
 0x00 CMD   - which test to trigger
 0x01 DATAL - configuration byte 1 for the test
@@ -35,6 +35,9 @@ Using 'i2cset' from the i2c-tools package, the generic command looks like:
 # i2cset -y <bus_num> <testunit_address> <CMD> <DATAL> <DATAH> <DELAY> i
 
 DELAY is a generic parameter which will delay the execution of the test in CMD.
+While a command is running (including the delay), new commands will not be
+acknowledged. You need to wait until the old one is completed.
+
 The commands are described in the following section. An invalid command will
 result in the transfer not being acknowledged.
 
@@ -44,7 +47,7 @@ Commands
 0x00 NOOP (reserved for future use)
 
 0x01 READ_BYTES (also needs master mode)
-   DATAL - address to read data from
+   DATAL - address to read data from (lower 7 bits, highest bit currently unused)
    DATAH - number of bytes to read
 
 This is useful to test if your bus master driver is handling multi-master
-- 
2.28.0

