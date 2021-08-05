Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841283E1E1F
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Aug 2021 23:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234312AbhHEVt6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Aug 2021 17:49:58 -0400
Received: from linux.microsoft.com ([13.77.154.182]:49542 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233838AbhHEVt6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Aug 2021 17:49:58 -0400
Received: by linux.microsoft.com (Postfix, from userid 1046)
        id 7B5A020B36E8; Thu,  5 Aug 2021 14:49:43 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7B5A020B36E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1628200183;
        bh=SsBMOCXcw1KTxHPV+Kx5Z5bw2rNQDy5iy70OREmZWIc=;
        h=From:To:Cc:Subject:Date:From;
        b=oXkOZHyKUuC3XHtMyeHfLTBX18n/T/JnQV2JiH0J18vsgBq0pdKd0cTYb8co0WT/h
         Cy1jGM5FdJummXe47j0UdWO/DJJcl/GWapTNCsabAkulcmaso/bEdKMqLn6WVG5Mo/
         TX0MX+BToTMZex0J54PhVWkLmmR/rYD7p44aRlpY=
From:   Dhananjay Phadke <dphadke@linux.microsoft.com>
To:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Ray Jui <rjui@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>
Subject: [PATCH] i2c: iproc: fix race between client unreg and tasklet
Date:   Thu,  5 Aug 2021 14:49:05 -0700
Message-Id: <1628200145-4962-1-git-send-email-dphadke@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Similar NULL deref was originally fixed by graceful teardown sequence -

https://lore.kernel.org/linux-i2c/1597106560-79693-1-git-send-email-dphadke@linux.microsoft.com

After this, a tasklet was added to take care of FIFO full condition for large i2c
transaction.

https://lore.kernel.org/linux-arm-kernel/20201102035433.6774-1-rayagonda.kokatanur@broadcom.com/

This introduced regression, a new race condition between tasklet enabling
interrupts and client unreg teardown sequence.

Kill tasklet before unreg_slave() masks bits in IE_OFFSET.
Updated teardown sequence -
(1) disable_irq()
(2) Kill tasklet
(3) Mask event enable bits in control reg
(4) Erase slave address (avoid further writes to rx fifo)
(5) Flush tx and rx FIFOs
(6) Clear pending event (interrupt) bits in status reg
(7) Set client pointer to NULL
(8) enable_irq()

 --

 Unable to handle kernel read from unreadable memory at virtual address 0000000000000320
 Mem abort info:
   ESR = 0x96000004
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
 Data abort info:
   ISV = 0, ISS = 0x00000004
   CM = 0, WnR = 0
 user pgtable: 4k pages, 48-bit VAs, pgdp=000000009212a000
 [0000000000000320] pgd=0000000000000000, p4d=0000000000000000
 Internal error: Oops: 96000004 [#1] SMP
 CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O
 Hardware name: Overlake (DT)
 pstate: 40400085 (nZcv daIf +PAN -UAO -TCO BTYPE=--)
 pc : bcm_iproc_i2c_slave_isr+0x2b8/0x8e4
 lr : bcm_iproc_i2c_slave_isr+0x1c8/0x8e4
 sp : ffff800010003e70
 x29: ffff800010003e80 x28: ffffda017acdc000
 x27: ffffda017b0ae000 x26: ffff800010004000
 x25: ffff800010000000 x24: ffffda017af4a168
 x23: 0000000000000073 x22: 0000000000000000
 x21: 0000000001400000 x20: 0000000001000000
 x19: ffff06f09583f880 x18: 00000000fa83b2da
 x17: 000000000000b67e x16: 0000000002edb2f3
 x15: 00000000000002c7 x14: 00000000000002c7
 x13: 0000000000000006 x12: 0000000000000033
 x11: 0000000000000000 x10: 0000000001000000
 x9 : 0000000003289312 x8 : 0000000003289311
 x7 : 02d0cd03a303adbc x6 : 02d18e7f0a4dfc6c
 x5 : 02edb2f33f76ea68 x4 : 00000000fa83b2da
 x3 : ffffda017af43cd0 x2 : ffff800010003e74
 x1 : 0000000001400000 x0 : 0000000000000000
 Call trace:
  bcm_iproc_i2c_slave_isr+0x2b8/0x8e4
  bcm_iproc_i2c_isr+0x178/0x290
  __handle_irq_event_percpu+0xd0/0x200
  handle_irq_event+0x60/0x1a0
  handle_fasteoi_irq+0x130/0x220
  __handle_domain_irq+0x8c/0xcc
  gic_handle_irq+0xc0/0x120
  el1_irq+0xcc/0x180
  finish_task_switch+0x100/0x1d8
  __schedule+0x61c/0x7a0
  schedule_idle+0x28/0x44
  do_idle+0x254/0x28c
  cpu_startup_entry+0x28/0x2c
  rest_init+0xc4/0xd0
  arch_call_rest_init+0x14/0x1c
  start_kernel+0x33c/0x3b8
 Code: f9423260 910013e2 11000509 b9047a69 (f9419009)
 ---[ end trace 4781455b2a7bec15 ]---

Fixes: 4d658451c9d6 ("i2c: iproc: handle rx fifo full interrupt")

Signed-off-by: Dhananjay Phadke <dphadke@linux.microsoft.com>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index cceaf69279a9..6304d1dd2dd6 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -1224,14 +1224,14 @@ static int bcm_iproc_i2c_unreg_slave(struct i2c_client *slave)
 
 	disable_irq(iproc_i2c->irq);
 
+	tasklet_kill(&iproc_i2c->slave_rx_tasklet);
+
 	/* disable all slave interrupts */
 	tmp = iproc_i2c_rd_reg(iproc_i2c, IE_OFFSET);
 	tmp &= ~(IE_S_ALL_INTERRUPT_MASK <<
 			IE_S_ALL_INTERRUPT_SHIFT);
 	iproc_i2c_wr_reg(iproc_i2c, IE_OFFSET, tmp);
 
-	tasklet_kill(&iproc_i2c->slave_rx_tasklet);
-
 	/* Erase the slave address programmed */
 	tmp = iproc_i2c_rd_reg(iproc_i2c, S_CFG_SMBUS_ADDR_OFFSET);
 	tmp &= ~BIT(S_CFG_EN_NIC_SMB_ADDR3_SHIFT);
-- 
2.17.1

