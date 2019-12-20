Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A99261279B6
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2019 12:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727216AbfLTLAB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Dec 2019 06:00:01 -0500
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:37746 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727177AbfLTLAB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Dec 2019 06:00:01 -0500
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1iiG0h-0003wk-Uw; Fri, 20 Dec 2019 10:59:56 +0000
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.3)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iiG0h-001bVy-NA; Fri, 20 Dec 2019 10:59:55 +0000
From:   "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To:     linux-kernel@lists.codethink.co.uk
Cc:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
Subject: [PATCH] i2c-amd756: share definition of amd756_smbus
Date:   Fri, 20 Dec 2019 10:59:54 +0000
Message-Id: <20191220105954.382490-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a shared header to declare amd756_smbus that is used
by two files, to remove the following sparse warning:

drivers/i2c/busses/i2c-amd756.c:286:20: warning: symbol 'amd756_smbus' was not declared. Should it be static?

Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
---

Cc: Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org
---
 drivers/i2c/busses/i2c-amd756-s4882.c | 2 +-
 drivers/i2c/busses/i2c-amd756.c       | 2 ++
 drivers/i2c/busses/i2c-amd756.h       | 4 ++++
 3 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100644 drivers/i2c/busses/i2c-amd756.h

diff --git a/drivers/i2c/busses/i2c-amd756-s4882.c b/drivers/i2c/busses/i2c-amd756-s4882.c
index 063274388a75..741b9309d8b6 100644
--- a/drivers/i2c/busses/i2c-amd756-s4882.c
+++ b/drivers/i2c/busses/i2c-amd756-s4882.c
@@ -27,7 +27,7 @@
 #include <linux/i2c.h>
 #include <linux/mutex.h>
 
-extern struct i2c_adapter amd756_smbus;
+#include "i2c-amd756.h"
 
 static struct i2c_adapter *s4882_adapter;
 static struct i2c_algorithm *s4882_algo;
diff --git a/drivers/i2c/busses/i2c-amd756.c b/drivers/i2c/busses/i2c-amd756.c
index ef1307a258e9..86ee8d102d69 100644
--- a/drivers/i2c/busses/i2c-amd756.c
+++ b/drivers/i2c/busses/i2c-amd756.c
@@ -32,6 +32,8 @@
 #include <linux/acpi.h>
 #include <linux/io.h>
 
+#include "i2c-amd756.h"
+
 /* AMD756 SMBus address offsets */
 #define SMB_ADDR_OFFSET		0xE0
 #define SMB_IOSIZE		16
diff --git a/drivers/i2c/busses/i2c-amd756.h b/drivers/i2c/busses/i2c-amd756.h
new file mode 100644
index 000000000000..f3db35939b5c
--- /dev/null
+++ b/drivers/i2c/busses/i2c-amd756.h
@@ -0,0 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) 2019 Ben Dooks <ben.dooks@codetrhink.co.uk> */
+
+extern struct i2c_adapter amd756_smbus;
-- 
2.24.0

