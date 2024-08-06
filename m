Return-Path: <linux-i2c+bounces-5169-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF669492DC
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 16:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D46401C23A2F
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 14:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1062417AE10;
	Tue,  6 Aug 2024 14:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Xc9U1iDh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859DC18D64A
	for <linux-i2c@vger.kernel.org>; Tue,  6 Aug 2024 14:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722954045; cv=none; b=VTmpJ4q/Md+XpZruuNbMexDjn22z5AxL5m6OcExGn85YVGL9StEroN+klJyo1WW4o7S6cxl+lxa1xhO8vfMoIBBuL8HNLaznwmyARci0dCTtxNO2UNNE+PowqAHjb6f9dqOAEjMof7bwc+bB7Q1w8wmNJlHx21HqFF4tyHPZVxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722954045; c=relaxed/simple;
	bh=GcbsOglTmhNNwZpS47DIxBLpCSQcEHlfmE9HWgnOAXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wd3c5tLTbik3xnplG+4Gv+8Hay9ZW2cYKRv9syCNO60LLbbLaTcRT8s4lwokInS4MQV+coACHaf0UY5fjsCHFKcOnIBGdIQkFFc99qPYatJS1ldauhMgPoehLXQvKx7jVJfXEmIUhqBQyLEnjgNmyIhsRyD5F2ujFhVta9gKtGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Xc9U1iDh; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=OWcMsHYr3RRRiGrn/KyEpFLqpH5pnaD2wsuOUNsaofg=; b=Xc9U1i
	DhLf9ZxwegNhwsBTr2yNg/6TuxZ+kQrQ2bOzJtLWwFfnb4ASxanE9dlY8WZThwwu
	9U95wUEXJGqeAq1ABNnCb/iqc4VT59CYfxutg4JzMzUiX8LdlEZYDFrDct/ysgUS
	R/4gqr3c7HGczcVORjl33f6almX4uTgTKQ65GCmQhS4sCmrL9kfuiBQlo8MxMrGT
	gnyzytQxlf5RMFco9XJknwIZvyZRDkIOdbGygrEX5/LcxCqrWdVMZFROYHaylMeX
	n7RHKLUa+wtNfSZHRzzAFZrecKhdu2P/luWqY/P6pSyE3ke7LphdWtqkdOYW6plk
	vZylCLEggYb2qZ1A==
Received: (qmail 249214 invoked from network); 6 Aug 2024 16:20:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Aug 2024 16:20:39 +0200
X-UD-Smtp-Session: l3s3148p1@/I96fwQfIIYgAwDPXxLGAIH3oZkcU6AS
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 3/3] i2c: testunit: return current command on read messages
Date: Tue,  6 Aug 2024 16:20:32 +0200
Message-ID: <20240806142033.2697-4-wsa+renesas@sang-engineering.com>
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
index a0335782d109..b558adc59af2 100644
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
index 19296ff09930..a3e1b5e8b659 100644
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


