Return-Path: <linux-i2c+bounces-2874-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDB189FB47
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 17:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BD061C220F3
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 15:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A16E1591E1;
	Wed, 10 Apr 2024 15:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b="Q/AmYQNp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B76716DEB3
	for <linux-i2c@vger.kernel.org>; Wed, 10 Apr 2024 15:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.110.109.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712762003; cv=none; b=bRaIhEXjOWaH6CDOm94eZ1W1TYtxzW8uZXP554PBSKh30wZdcSNi9mWirNbhmU1n0P8sZtVqG7zi3H5RuR8tlD0Ue8UC064Qn4eJYBK5/B/Fq8IIpHLuIk+kVMH4zO3NWUF6ee3jzHH7r8v83fjF25qTCrwSneIRs78qoHv9Zhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712762003; c=relaxed/simple;
	bh=HWyWNzmqF0PM8cvIwPI1I3AZyqOEwNACriZxYwCKyU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ygav9pyKZinH60d00qS4em/MNMGTVE9EjxlXciBkyoXa6nLauCGXSrCZHpscC7UwoktjRasj3W2GbHnrqYh1OYkq0xwkjBPRdSNG4yMOJaj9tyfQikkQjX3UzwepLJz4xa0/Stb6yibjCeKIJK9aNEU2p77uOVPXHgTSZt8RdTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il; spf=pass smtp.mailfrom=tkos.co.il; dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b=Q/AmYQNp; arc=none smtp.client-ip=84.110.109.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tkos.co.il
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id AF79B44023D;
	Wed, 10 Apr 2024 18:12:43 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1712761963;
	bh=HWyWNzmqF0PM8cvIwPI1I3AZyqOEwNACriZxYwCKyU8=;
	h=From:To:Cc:Subject:Date:From;
	b=Q/AmYQNp5Y70n/kaWO3GO4OsjuYqpvzkWealv7fVMiby7DkjtVcUlae96mKY36jKh
	 mC9CzF2oE54Gw6p5VqRdnTos6tTDNwcUB9fezv/3fXUNpsTZw0jGPNrXAedd2DfFMM
	 I4FYjJp+1Qc1ZlJ/jFxIfltVBUZOC/ucSb1UtEc05JWNZ039OR5HE/z4hCH4AJirK+
	 q+ZKcd+CkouH+5R5sYFE90QWTnU2wNsc6aXc9RmKe8HDWsVIP9rSwf/KLC5RJtKuou
	 MF5kMowSmGMApjs6kNYyJs5Vv/R6gdZ8bucAJK9yuB3oYyWQB+ZWFYR4kTX3zUyA9Y
	 BIiIlldseZOeA==
From: Baruch Siach <baruch@tkos.co.il>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org,
	Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] i2c: smbus: fix NULL function pointer dereference
Date: Wed, 10 Apr 2024 18:12:56 +0300
Message-ID: <4269631780e5ba789cf1ae391eec1b959def7d99.1712761976.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running i2cdetect on i2c slave device (i2c-designware) gives this splat:

[   53.306730] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[   53.318340] Mem abort info:
[   53.323864]   ESR = 0x0000000086000004
[   53.330374]   EC = 0x21: IABT (current EL), IL = 32 bits
[   53.338446]   SET = 0, FnV = 0
[   53.344263]   EA = 0, S1PTW = 0
[   53.350166]   FSC = 0x04: level 0 translation fault
[   53.357806] user pgtable: 4k pages, 48-bit VAs, pgdp=00000008c7d8e000
[   53.367008] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
[   53.376559] Internal error: Oops: 0000000086000004 [#1] PREEMPT SMP
[   53.382892] Modules linked in:
[   53.385936] CPU: 6 PID: 420 Comm: i2cdetect Not tainted 6.9.0-rc3-yocto-standard+ #1295
[   53.393926] Hardware name: xxx (DT)
[   53.398531] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   53.405480] pc : 0x0
[   53.407656] lr : __i2c_transfer+0x1f4/0x830
[   53.411834] sp : ffff800082c13b00
[   53.415136] x29: ffff800082c13b00 x28: 0000000000000001 x27: 0000000000000001
[   53.422259] x26: ffff8000813aa340 x25: ffff0000c69553c0 x24: 00000000ffff0eeb
[   53.429383] x23: ffff8000813a6000 x22: ffff800082c13bc0 x21: 0000000000000000
[   53.436506] x20: 0000000000000001 x19: ffff000040b82140 x18: 0000000000000000
[   53.443630] x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffffff59bd58
[   53.450753] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
[   53.457876] x11: 0000000000000000 x10: 0000000000000000 x9 : ffff8000807e4470
[   53.464999] x8 : ffff800082c13c05 x7 : 0000000000000001 x6 : ffff800082c13d56
[   53.472122] x5 : 0000000000000001 x4 : 0000000000000000 x3 : 0000000000000000
[   53.479245] x2 : 0000000000000001 x1 : ffff800082c13bc0 x0 : ffff000040b82140
[   53.486368] Call trace:
[   53.488803]  0x0
[   53.490629]  i2c_smbus_xfer_emulated+0x148/0x6d0
[   53.495236]  __i2c_smbus_xfer+0x130/0x4d0
[   53.499235]  i2c_smbus_xfer+0xc0/0x128
[   53.502973]  i2cdev_ioctl_smbus+0x110/0x2b0
[   53.507145]  i2cdev_ioctl+0x9c/0x348
[   53.510710]  __arm64_sys_ioctl+0xb4/0xe0
[   53.514624]  invoke_syscall+0x4c/0x118
[   53.518365]  el0_svc_common.constprop.0+0xc4/0xf0
[   53.523058]  do_el0_svc+0x24/0x38
[   53.526362]  el0_svc+0x28/0xb8
[   53.529407]  el0t_64_sync_handler+0x134/0x150
[   53.533751]  el0t_64_sync+0x14c/0x150
[   53.537405] Code: ???????? ???????? ???????? ???????? (????????)
[   53.543485] ---[ end trace 0000000000000000 ]---

Callers of __i2c_transfer() must verify that master_xfer is not NULL.
Check that before i2c_smbus_xfer_emulated() call.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/i2c/i2c-core-smbus.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index e3b96fc53b5c..d252716c9f74 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -604,8 +604,11 @@ s32 __i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 		 */
 	}
 
-	res = i2c_smbus_xfer_emulated(adapter, addr, flags, read_write,
-				      command, protocol, data);
+	if (adapter->algo->master_xfer)
+		res = i2c_smbus_xfer_emulated(adapter, addr, flags, read_write,
+				command, protocol, data);
+	else
+		res = -EOPNOTSUPP;
 
 trace:
 	/* If enabled, the reply tracepoint is conditional on read_write. */
-- 
2.43.0


