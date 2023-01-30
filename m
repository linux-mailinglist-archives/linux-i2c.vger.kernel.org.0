Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9ACC68150F
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jan 2023 16:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236841AbjA3Pc6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Jan 2023 10:32:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236320AbjA3Pc5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Jan 2023 10:32:57 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1387A26D
        for <linux-i2c@vger.kernel.org>; Mon, 30 Jan 2023 07:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675092775; x=1706628775;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5/1DwcvdPpIg8Tb+golSZVp4DQh6JIo0xZu1VDH4eUQ=;
  b=n1cLNQVA8FaQT5PH98ZckaXBdgS11xXOLcSmsbdrH6vcJzgoYaP9o+U4
   EuiN24yEC/+sgsv62nrH4gsfJuDiR34TdTrDaA5NYOtBQ4Z3smK9tNLIH
   pQCpwVEkwY1Dki+lrtWJpNZwJnjLMI4IDo8KseQy4g+IZtayAX1OyMXjN
   W/ZruCMdqupL9OmbahQLbDoEjTMm2s87fqFIKjQaulrXmKbmRvZr+3GTN
   R8JSDmk3P6Kb5zqu3VjIDsTUVAp2awtm8uziP0sfhXAlxcidqad6Rot9/
   3I85xMClG6hvZBdNKdDhiIXknA/J1XFtbI/zjYaU+GJJ8K///wyUXBweJ
   g==;
X-IronPort-AV: E=Sophos;i="5.97,258,1669071600"; 
   d="scan'208";a="28747100"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 30 Jan 2023 16:32:52 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 30 Jan 2023 16:32:52 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 30 Jan 2023 16:32:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675092772; x=1706628772;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5/1DwcvdPpIg8Tb+golSZVp4DQh6JIo0xZu1VDH4eUQ=;
  b=cas39Z2HTSOifSp6V2OVKM7+mjKBMdMm+56dh0LbresB+X+3yAMdG19S
   cfGWW7W9ylWh8cQqeWQe7AJLGF7SkpBk4yB6hdkO0kySD6kTLIahHojXj
   ATmbq6ck8SekQzh3CI62jfHo1NaahnCQM1CptJRgMlTrFsvmpC0vLfo3H
   vI5039mjCrCkwG+mMpXTdJuLVsqiKWp73oshckkBYnWcewJiFXh+YSP2Q
   qwAVFdPO2T3zyWonKlvC3ZBCI39zbVTMAZ+MIk0P02nhvLRhvyrOqHw5b
   zbjrxrw0onIiMofYAcFk2CUoBqXtDLGV0NPMfEsKy8d1XZr8KleiZDBhu
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,258,1669071600"; 
   d="scan'208";a="28747099"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 30 Jan 2023 16:32:52 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 12B37280056;
        Mon, 30 Jan 2023 16:32:52 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] i2c: imx-lpi2c: clean rx/tx buffers upon new message
Date:   Mon, 30 Jan 2023 16:32:46 +0100
Message-Id: <20230130153247.445027-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When start sending a new message clear the Rx & Tx buffer pointers in
order to avoid using stale pointers.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
I noticed an ambigous stack corruption once my rtc-pcf85063 driver probes.

[    2.695684] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: pcf85063_rtc_read_time+0x10/0x100
[    2.706669] CPU: 1 PID: 63 Comm: kworker/u8:2 Not tainted 6.2.0-rc6-next-20230130+ #1185 ca067559321ae817c063baccdba80d328f10f73
[    2.718331] Hardware name: TQ-Systems i.MX8QXP TQMa8XQP on MBa8Xx (DT)
[    2.724866] Workqueue: events_unbound deferred_probe_work_func
[    2.730712] Call trace:
[    2.733161]  dump_backtrace+0x9c/0x11c
[    2.736914]  show_stack+0x14/0x1c
[    2.740232]  dump_stack_lvl+0x5c/0x78
[    2.743907]  dump_stack+0x14/0x1c
[    2.747225]  panic+0x34c/0x39c
[    2.750283]  __ktime_get_real_seconds+0x0/0xc
[    2.754653]  pcf85063_ioctl+0x0/0xf0
[    2.758232]  __rtc_read_time+0x44/0x114
[    2.762081]  __rtc_read_alarm+0x258/0x460
[    2.766095]  __devm_rtc_register_device+0x174/0x2b4
[    2.770986]  pcf85063_probe+0x258/0x4d4
[    2.774825]  i2c_device_probe+0x100/0x33c

The backtrace did not indicate the actual cause of it. Checking the code the
RTC driver seemed to be ok, so it has to be in the i2c bus driver.
At some point I noticed that I see both Rx and Tx interrupts at the same time,
which is odd. Also both rx_buf and tx_buf was set simultaneously. Clearly
a bug to me.
Clearing the buffer pointers upon each new i2c message triggered a NULL
pointer dereference:

[    2.694923] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000001
[    2.703730] Mem abort info:
[    2.706525]   ESR = 0x0000000096000004
[    2.710278]   EC = 0x25: DABT (current EL), IL = 32 bits
[    2.715595]   SET = 0, FnV = 0
[    2.718653]   EA = 0, S1PTW = 0
[    2.721798]   FSC = 0x04: level 0 translation fault
[    2.726680] Data abort info:
[    2.729556]   ISV = 0, ISS = 0x00000004
[    2.733387]   CM = 0, WnR = 0
[    2.736358] [0000000000000001] user address but active_mm is swapper
[    2.742719] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[    2.748990] Modules linked in:
[    2.752051] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.2.0-rc6-next-20230130+ #1184 44a8abebca6bfabc93e20ac52bce
47da7f92cec1
[    2.763368] Hardware name: TQ-Systems i.MX8QXP TQMa8XQP on MBa8Xx (DT)
[    2.769902] pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    2.776868] pc : lpi2c_imx_write_txfifo+0x44/0xb0
[    2.781585] lr : lpi2c_imx_isr+0x60/0x8c
[    2.785512] sp : ffff800008003ef0
[    2.788831] x29: ffff800008003ef0 x28: ffff8000099c1ec0 x27: 00000000bfe632c8
[    2.795980] x26: 0000000000000000 x25: ffff800009b935ed x24: ffff800009a4d4c0
[    2.803130] x23: ffff00000365e800 x22: 0000000000000128 x21: 0000000000000000
[    2.810280] x20: ffff0000033f4080 x19: 0000000003000103 x18: 0000000000000000
[    2.817430] x17: ffff80003688a000 x16: ffff800008000000 x15: 0000000000000000
[    2.824579] x14: 0000000000000000 x13: ffff8000099d1db8 x12: 0000000000000000
[    2.831729] x11: ffff800009503180 x10: 0000000000000a80 x9 : ffff8000099b3d20
[    2.838879] x8 : ffff8000099c29a0 x7 : 00000000000000c0 x6 : ffff000002838028
[    2.846029] x5 : 0000000000000002 x4 : 0000000000000000 x3 : 0000000000000000
[    2.849626] imx-scu system-controller: RPC send msg timeout
[    2.853178] x2 : ffff800009c88060 x1 : 0000000000000001 x0 : ffff0000033f4080
[    2.858764]  enet1: failed to power off resource 252 ret -110
[    2.865897] Call trace:
[    2.865901]  lpi2c_imx_write_txfifo+0x44/0xb0
[    2.878443]  __handle_irq_event_percpu+0x5c/0x188
[    2.883151]  handle_irq_event+0x48/0xb0

$ ./scripts/faddr2line build_arm64/vmlinux lpi2c_imx_write_txfifo+0x44/0xb0
lpi2c_imx_write_txfifo+0x44/0xb0:
lpi2c_imx_write_txfifo at drivers/i2c/busses/i2c-imx-lpi2c.c:364

This now clearly pinpoints the wrong access which previously corrupted the
stack. The error leading to this wrong access is addressed in the
following patch.

 drivers/i2c/busses/i2c-imx-lpi2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 188f2a36d2fd..c6d0225246e6 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -463,6 +463,8 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 		if (num == 1 && msgs[0].len == 0)
 			goto stop;
 
+		lpi2c_imx->rx_buf = NULL;
+		lpi2c_imx->tx_buf = NULL;
 		lpi2c_imx->delivered = 0;
 		lpi2c_imx->msglen = msgs[i].len;
 		init_completion(&lpi2c_imx->complete);
-- 
2.34.1

