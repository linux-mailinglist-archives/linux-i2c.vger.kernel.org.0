Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF6344D22B
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 07:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbhKKHBO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 02:01:14 -0500
Received: from smtpbguseast3.qq.com ([54.243.244.52]:47465 "EHLO
        smtpbguseast3.qq.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231514AbhKKHBN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Nov 2021 02:01:13 -0500
X-QQ-mid: bizesmtp31t1636613882truf2e02
Received: from localhost.localdomain (unknown [113.57.152.160])
        by esmtp6.qq.com (ESMTP) with 
        id ; Thu, 11 Nov 2021 14:58:01 +0800 (CST)
X-QQ-SSF: 01400000000000I0F000B00C0000000
X-QQ-FEAT: AY4E1/TiQGEqooOLL+JwiziAqSqzJdg1D17e0luiDXA0GDGf7aPI255il749k
        1ZimvTCKWXlMgYCS2U0VDWGD9aiH/b3sTU8UStJTjhM1yz04Sl3vAzHAtSI3Z07hfbaCYQa
        jvd9IIuTNxztfjcGFgPWNhR5S3VMeXMIHWd+gvqmWj/vDejKfnHvERYoV1uG39Ry52mwT7m
        V6VqKpRcTTQrOow/lARfIRyWyRpsXGdkrqlUNJG9ngKg5rzMC/zl1QKnxnXHxVCcrsUJIKV
        nyDyMQL9jaMeEKTOWh+ZTegNiv+/O+a8zArZXKGGvLzWU8D+aEklwbdXeu3gSkfqo9qgTKS
        Ivcn6O05Y2WgxxsmqSG8eAYwMNM9g==
X-QQ-GoodBg: 2
From:   huangbibo <huangbibo@uniontech.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        p.zabel@pengutronix.de, huangbibo <huangbibo@uniontech.com>
Subject: [PATCH] i2c: designware: I2C unexpected interrupt handling will cause kernel panic
Date:   Thu, 11 Nov 2021 14:57:59 +0800
Message-Id: <20211111065759.7423-1-huangbibo@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I2C interrupts may be triggered unexpectedly,
such as programs that directly access I2C registers,
bus conflicts caused by hardware design defects, etc.
These can cause null pointer reference errors and kernel panic.

kernel log:
[   52.676442] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
...
[   52.816536] Workqueue: efi_rts_wq efi_call_rts
[   52.820968] pstate: 60000085 (nZCv daIf -PAN -UAO)
[   52.825753] pc : i2c_dw_isr+0x36c/0x5e0 [i2c_designware_core]
[   52.831487] lr : i2c_dw_isr+0x88/0x5e0 [i2c_designware_core]
[   52.837134] sp : ffff8020fff17650
[   52.924451] Call trace:
[   52.926888]  i2c_dw_isr+0x36c/0x5e0 [i2c_designware_core]
...
[   52.957394]  gic_handle_irq+0x7c/0x178
[   52.961130]  el1_irq+0xb0/0x140
[   52.964259]  0x21291d30
[   52.983729]  0x21160938
[   52.986164]  __efi_rt_asm_wrapper+0x28/0x44
[   52.990335]  efi_call_rts+0x78/0x448
[   53.019021] Kernel panic - not syncing: Fatal exception in interrupt

Signed-off-by: huangbibo <huangbibo@uniontech.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 2871cf2ee8b4..6af1ede38253 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -631,8 +631,14 @@ static int i2c_dw_irq_handler_master(struct dw_i2c_dev *dev)
 	if (stat & DW_IC_INTR_RX_FULL)
 		i2c_dw_read(dev);
 
-	if (stat & DW_IC_INTR_TX_EMPTY)
-		i2c_dw_xfer_msg(dev);
+	if (stat & DW_IC_INTR_TX_EMPTY) {
+		if (dev->msgs) {
+			i2c_dw_xfer_msg(dev);
+		} else { //null  pointer
+			i2c_dw_disable_int(dev);
+			return 0;
+		}
+	}
 
 	/*
 	 * No need to modify or disable the interrupt mask here.
-- 
2.20.1



