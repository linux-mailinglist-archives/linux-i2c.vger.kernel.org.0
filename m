Return-Path: <linux-i2c+bounces-13046-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFFDB84521
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 13:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19D71580A96
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Sep 2025 11:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7399D2BEC3D;
	Thu, 18 Sep 2025 11:18:46 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20DB34BA40;
	Thu, 18 Sep 2025 11:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758194326; cv=none; b=XWXWdLNSt8V4OTxxdHcbPAXrvlJByc544SvLR/9slAHWhMTb/ond+OV6UCwuUsTh1inQBTrGbwCZM2pG/Zmt0MdwPAAZ0mxpyMFaxrSrXokeF7MBwS8fao1P99TVLa1zwLvm2/RYOuae3ytauBzm7CuvGHLbs9pNPDyYD23Icdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758194326; c=relaxed/simple;
	bh=M8OutrhX6i0XRNgR9xeSTB1Jl2VwiaubAtm4cFYZj9Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=isqIBcPmn2697r000n6pnWJCNVQ5zjFR2aQx3oX1hVKWdvSmt/0YfsKBiibf5JfJs91sDV7HLlI8bv2dt+xqknHDy44eyhhdQ3TVk7DO0B0BpXMDJSnssCCd0tUBejZc5EauJOtRg0KxHbdMYm11b3P1fON04+R+9wXx03gLDzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4cSCjH3ch4z2VRxL;
	Thu, 18 Sep 2025 19:15:15 +0800 (CST)
Received: from dggpemf500016.china.huawei.com (unknown [7.185.36.197])
	by mail.maildlp.com (Postfix) with ESMTPS id C3A9F1A016C;
	Thu, 18 Sep 2025 19:18:41 +0800 (CST)
Received: from huawei.com (10.50.159.234) by dggpemf500016.china.huawei.com
 (7.185.36.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 18 Sep
 2025 19:18:40 +0800
From: Wang Liang <wangliang74@huawei.com>
To: <wsa+renesas@sang-engineering.com>, <dhowells@redhat.com>,
	<rostedt@goodmis.org>
CC: <yuehaibing@huawei.com>, <zhangchangzhong@huawei.com>,
	<wangliang74@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>
Subject: [PATCH] i2c: dev: Fix field-spanning write in __do_trace_smbus_write()
Date: Thu, 18 Sep 2025 19:39:56 +0800
Message-ID: <20250918113956.169348-1-wangliang74@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500016.china.huawei.com (7.185.36.197)

A field-spanning write warning was observed with following output:

  ------------[ cut here ]------------
  memcpy: detected field-spanning write (size 86) of single field "entry->buf" at ./include/trace/events/smbus.h:60 (size 34)
  WARNING: CPU: 1 PID: 2646 at ./include/trace/events/smbus.h:60
  CPU: 1 UID: 0 PID: 2646 Comm: syz.0.310 Not tainted 6.17.0-rc5+ #5 PREEMPT(none)
  RIP: 0010:do_trace_event_raw_event_smbus_write.constprop.0+0x37a/0x520 include/trace/events/smbus.h:23
  Call Trace:
   <TASK>
   __do_trace_smbus_write include/trace/events/smbus.h:23 [inline]
   trace_smbus_write include/trace/events/smbus.h:23 [inline]
   __i2c_smbus_xfer.part.0+0x5ce/0x9a0 drivers/i2c/i2c-core-smbus.c:572
   __i2c_smbus_xfer+0xa3/0x1a0 drivers/i2c/i2c-core-smbus.c:566
   i2c_smbus_xfer drivers/i2c/i2c-core-smbus.c:546 [inline]
   i2c_smbus_xfer+0x208/0x3c0 drivers/i2c/i2c-core-smbus.c:536
   i2cdev_ioctl_smbus+0x2cd/0x850 drivers/i2c/i2c-dev.c:389
   i2cdev_ioctl+0x3bb/0x800 drivers/i2c/i2c-dev.c:478
   vfs_ioctl fs/ioctl.c:51 [inline]
   __do_sys_ioctl fs/ioctl.c:598 [inline]
   __se_sys_ioctl fs/ioctl.c:584 [inline]
   __x64_sys_ioctl+0x191/0x210 fs/ioctl.c:584
   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
   do_syscall_64+0x5d/0x2d0 arch/x86/entry/syscall_64.c:94
   entry_SYSCALL_64_after_hwframe+0x76/0x7e
   </TASK>

Similar to previous commit 57f312b95593 ("i2c: rtl9300: Fix out-of-bounds
bug in rtl9300_i2c_smbus_xfer"), the data->block[0] is used for length and
it comes from user. Add check for the variable to avoid out-of-bounds bug.

Fixes: 8a325997d95d ("i2c: Add message transfer tracepoints for SMBUS [ver #2]")
Signed-off-by: Wang Liang <wangliang74@huawei.com>
---
 drivers/i2c/i2c-dev.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index e9577f920286..b00961561134 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -386,6 +386,12 @@ static noinline int i2cdev_ioctl_smbus(struct i2c_client *client,
 		if (read_write == I2C_SMBUS_READ)
 			temp.block[0] = I2C_SMBUS_BLOCK_MAX;
 	}
+
+	if (temp.block[0] > I2C_SMBUS_BLOCK_MAX) {
+		dev_dbg(&client->adapter->dev, "block[0] out of range in ioctl I2C_SMBUS.\n");
+		return -EINVAL;
+	}
+
 	res = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
 	      read_write, command, size, &temp);
 	if (!res && ((size == I2C_SMBUS_PROC_CALL) ||
-- 
2.34.1


