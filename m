Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC6A484C40
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jan 2022 02:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235813AbiAEBzb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jan 2022 20:55:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235708AbiAEBza (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jan 2022 20:55:30 -0500
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8410AC061761
        for <linux-i2c@vger.kernel.org>; Tue,  4 Jan 2022 17:55:29 -0800 (PST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id F37A580002;
        Wed,  5 Jan 2022 14:55:24 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1641347724;
        bh=kvY+bEeup5Ig6phY7LQasgFR3ppmMuE8olWJR4RbEQ0=;
        h=From:To:Cc:Subject:Date;
        b=ThPWn92HgAJ8JoKsvmpd/+WXCpLbD8OeNnvNmB7dfRqwiK7BxvrCCeu8eFn3R6lMU
         5kF6QWxS5lk8URRlRTwN/hhk/bexxY+Gd4TR3VRZdntKqiUn1IeHQcX41gOn7A2AIM
         bkurXUBKs/P7t+ySJc+NyV+4QKGMKelrxtNkUKvK+uHap4vRagY/KXoNmALl9En5Wx
         YGSuuCxiymNUtdtDGsUVjQn6vVmN1vM3y5ZYuzLWbKkN2ewOfQKHDwGXCafHRcZF4C
         kq7NogyEG0LHJYmwCHYqwdcIyEWvZV/wKHm6OZI2oxwc+wX6WVNuOJ4uNUH1KQdMzA
         thqA6tRAUdfSQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B61d4fa8c0000>; Wed, 05 Jan 2022 14:55:24 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by pat.atlnz.lc (Postfix) with ESMTP id C7A8D13EE13;
        Wed,  5 Jan 2022 14:55:24 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id E941A2A1DC7; Wed,  5 Jan 2022 14:53:10 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     wsa@kernel.org, mbizon@freebox.fr
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] i2c: mpc: Avoid out of bounds memory access
Date:   Wed,  5 Jan 2022 14:53:04 +1300
Message-Id: <20220105015304.1368234-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=HvoI5HbS c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=DghFqjY3_ZEA:10 a=uamDuLK_r6lGlXGo6nQA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When performing an I2C transfer where the last message was a write KASAN
would complain:

  BUG: KASAN: slab-out-of-bounds in mpc_i2c_do_action+0x154/0x630
  Read of size 2 at addr c814e310 by task swapper/2/0

  CPU: 2 PID: 0 Comm: swapper/2 Tainted: G    B             5.16.0-rc8 #1
  Call Trace:
  [e5ee9d50] [c08418e8] dump_stack_lvl+0x4c/0x6c (unreliable)
  [e5ee9d70] [c02f8a14] print_address_description.constprop.13+0x64/0x3b0
  [e5ee9da0] [c02f9030] kasan_report+0x1f0/0x204
  [e5ee9de0] [c0c76ee4] mpc_i2c_do_action+0x154/0x630
  [e5ee9e30] [c0c782c4] mpc_i2c_isr+0x164/0x240
  [e5ee9e60] [c00f3a04] __handle_irq_event_percpu+0xf4/0x3b0
  [e5ee9ec0] [c00f3d40] handle_irq_event_percpu+0x80/0x110
  [e5ee9f40] [c00f3e48] handle_irq_event+0x78/0xd0
  [e5ee9f60] [c00fcfec] handle_fasteoi_irq+0x19c/0x370
  [e5ee9fa0] [c00f1d84] generic_handle_irq+0x54/0x80
  [e5ee9fc0] [c0006b54] __do_irq+0x64/0x200
  [e5ee9ff0] [c0007958] __do_IRQ+0xe8/0x1c0
  [c812dd50] [e3eaab20] 0xe3eaab20
  [c812dd90] [c0007a4c] do_IRQ+0x1c/0x30
  [c812dda0] [c0000c04] ExternalInput+0x144/0x160
  --- interrupt: 500 at arch_cpu_idle+0x34/0x60
  NIP:  c000b684 LR: c000b684 CTR: c0019688
  REGS: c812ddb0 TRAP: 0500   Tainted: G    B              (5.16.0-rc8)
  MSR:  00029002 <CE,EE,ME>  CR: 22000488  XER: 20000000

  GPR00: c10ef7fc c812de90 c80ff200 c2394718 00000001 00000001 c10e3f90 0=
0000003
  GPR08: 00000000 c0019688 c2394718 fc7d625b 22000484 00000000 21e17000 c=
208228c
  GPR16: e3e99284 00000000 ffffffff c2390000 c001bac0 c2082288 c812df60 c=
001ba60
  GPR24: c23949c0 00000018 00080000 00000004 c80ff200 00000002 c2348ee4 c=
2394718
  NIP [c000b684] arch_cpu_idle+0x34/0x60
  LR [c000b684] arch_cpu_idle+0x34/0x60
  --- interrupt: 500
  [c812de90] [c10e3f90] rcu_eqs_enter.isra.60+0xc0/0x110 (unreliable)
  [c812deb0] [c10ef7fc] default_idle_call+0xbc/0x230
  [c812dee0] [c00af0e8] do_idle+0x1c8/0x200
  [c812df10] [c00af3c0] cpu_startup_entry+0x20/0x30
  [c812df20] [c001e010] start_secondary+0x5d0/0xba0
  [c812dff0] [c00028a0] __secondary_start+0x90/0xdc

This happened because we would overrun the i2c->msgs array on the final
interrupt for the I2C STOP. This didn't happen if the last message was a
read because there is no interrupt in that case. Ensure that we only
access the current message if we are not processing a I2C STOP
condition.

Fixes: 1538d82f4647 ("i2c: mpc: Interrupt driven transfer")
Reported-by: Maxime Bizon <mbizon@freebox.fr>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-mpc.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 53b8da6dbb23..db26cc36e13f 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -492,7 +492,7 @@ static void mpc_i2c_finish(struct mpc_i2c *i2c, int r=
c)
=20
 static void mpc_i2c_do_action(struct mpc_i2c *i2c)
 {
-	struct i2c_msg *msg =3D &i2c->msgs[i2c->curr_msg];
+	struct i2c_msg *msg =3D NULL;
 	int dir =3D 0;
 	int recv_len =3D 0;
 	u8 byte;
@@ -501,10 +501,13 @@ static void mpc_i2c_do_action(struct mpc_i2c *i2c)
=20
 	i2c->cntl_bits &=3D ~(CCR_RSTA | CCR_MTX | CCR_TXAK);
=20
-	if (msg->flags & I2C_M_RD)
-		dir =3D 1;
-	if (msg->flags & I2C_M_RECV_LEN)
-		recv_len =3D 1;
+	if (i2c->action !=3D MPC_I2C_ACTION_STOP) {
+		msg =3D &i2c->msgs[i2c->curr_msg];
+		if (msg->flags & I2C_M_RD)
+			dir =3D 1;
+		if (msg->flags & I2C_M_RECV_LEN)
+			recv_len =3D 1;
+	}
=20
 	switch (i2c->action) {
 	case MPC_I2C_ACTION_RESTART:
@@ -581,7 +584,7 @@ static void mpc_i2c_do_action(struct mpc_i2c *i2c)
 		break;
 	}
=20
-	if (msg->len =3D=3D i2c->byte_posn) {
+	if (msg && msg->len =3D=3D i2c->byte_posn) {
 		i2c->curr_msg++;
 		i2c->byte_posn =3D 0;
=20
--=20
2.34.1

