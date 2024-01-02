Return-Path: <linux-i2c+bounces-1078-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9CE8222DA
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jan 2024 22:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40CCB1F22D55
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jan 2024 21:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC79616428;
	Tue,  2 Jan 2024 21:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbqmuC5u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04C4168A2;
	Tue,  2 Jan 2024 21:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5537114380bso7667877a12.3;
        Tue, 02 Jan 2024 13:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704229335; x=1704834135; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pl2sKqyXIKOm6mYqJIAawBojqHAiFXnTSzlfYOxfUAg=;
        b=LbqmuC5u4HxexuMPrl7VovjiSkU0jP1pYwGzeqaD6guex5BCPwYgBkNHdC9EKBgKmo
         xcaSqSOsWhpS4KnivTXJ4hIrrKr4kYMvt3Uwk4PMrQdZzI0XtQcqz3x8kp4Y3inVE+BS
         tkCfSpZAJtzhUYKv6rh4pSrK1x28K/YBe4NndJU46h8KBLobikL9sF4Wa7b3cqJXW0N2
         opKZem4VrcBIn2476i1lff5uWL1uD89JcL492q19IZI8onNCfVh6Z7kvOHj9o1H1Thau
         PFKRcZ2I62Lt4krWES1fpyxKtAcvC6etjNqO9Qops5404CcHusAsN6Ar2R6/aL/kH6pt
         iWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704229335; x=1704834135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pl2sKqyXIKOm6mYqJIAawBojqHAiFXnTSzlfYOxfUAg=;
        b=qCAgI/OVMbI+xInu8FLuFdicujl0e/zgqg5MLd4kbXNq6f2ys1YrKxx/3mnAE539Mk
         MshqqpXeNmtqgg+b0lyjYebxRB86PNkoRun3TNvuKSorFSEmv/BihW6iWfk4SBzCPRvU
         sA4Yxu6AxAGgJwyLZuXu9MRYJn9ANjGcCiAUD1eCEOvGqVRNnxjj7xJPNTlBFkN4NV3+
         n6HtdO5B9/bjALDy83eXN0j+GkT2DfMZVEkeLRnMGidCYGoV42fH3IQfjpzbbTQooJgc
         wlAx2pD+M/pqFd+sKw+Fn0uY2iTrEmXRt0Vo4qcmG1Sf1VRLwDmKUmljGUwkZ5InBVD2
         Cqqw==
X-Gm-Message-State: AOJu0Yy+SRglO2u4VrUTMTelSpTQ0jIr59cme7hZTL8LdqcHVO9T7Kfe
	61yoHdEc3epfpPpQrppKGGRgvpvWWXmeZis2kPYkLLdwjZY=
X-Google-Smtp-Source: AGHT+IELFOf9PwgDsb7X5rgou83wT8RUNJY+CXNEk02T21FgF4UfcBPZMB4T2lRYNuDe4p0oOvJMeyIVcq1BBVh/cnI=
X-Received: by 2002:a50:a687:0:b0:554:4dde:4ca6 with SMTP id
 e7-20020a50a687000000b005544dde4ca6mr13807600edc.4.1704229334942; Tue, 02 Jan
 2024 13:02:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230327-tegra-pmic-reboot-v7-2-18699d5dcd76@skidata.com> <20240102150350.3180741-1-mwalle@kernel.org>
In-Reply-To: <20240102150350.3180741-1-mwalle@kernel.org>
From: Benjamin Bara <bbara93@gmail.com>
Date: Tue, 2 Jan 2024 22:02:02 +0100
Message-ID: <CAJpcXm7W2vckakdFYiT4jssea-AzrZMsjHijfa+QpfzDVL+E3A@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] Re: i2c: core: run atomic i2c xfer when !preemptible
To: Michael Walle <mwalle@kernel.org>
Cc: benjamin.bara@skidata.com, dmitry.osipenko@collabora.com, 
	jonathanh@nvidia.com, lee@kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, nm@ti.com, 
	peterz@infradead.org, rafael.j.wysocki@intel.com, richard.leitner@linux.dev, 
	stable@vger.kernel.org, treding@nvidia.com, wsa+renesas@sang-engineering.com, 
	wsa@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

On Tue, 2 Jan 2024 at 16:03, Michael Walle <mwalle@kernel.org> wrote:
> With preemption disabled, this boils down to
>   return system_state > SYSTEM_RUNNING (&& !0)
>
> and will then generate a backtrace splash on each reboot on our
> board:
>
> # reboot -f
> [   12.687169] No atomic I2C transfer handler for 'i2c-0'
> ...
> [   12.806359] Call trace:
> [   12.808793]  i2c_smbus_xfer+0x100/0x118
> ...
>
> I'm not sure if this is now the expected behavior or not. There will be
> no backtraces, if I build a preemptible kernel, nor will there be
> backtraces if I revert this patch.


thanks for the report.

In your case, the warning comes from shutting down a regulator during
device_shutdown(), so nothing really problematic here. However, later in
the "restart sequence", IRQs are disabled before the restart handlers
are called. If the reboot handlers would rely on irq-based
("non-atomic") i2c transfer, they might not work properly.

> OTOH, the driver I'm using (drivers/i2c/busses/i2c-mt65xx.c) has no
> *_atomic(). So the warning is correct. There is also [1], which seems to
> be the same issue I'm facing.
>
> -michael
>
> [1] https://lore.kernel.org/linux-i2c/13271b9b-4132-46ef-abf8-2c311967bb46@mailbox.org/


I tried to implement an atomic handler for the mt65xx, but I don't have
the respective hardware available to test it. I decided to use a similar
approach as done in drivers/i2c/busses/i2c-rk3x.c, which calls the IRQ
handler in a while loop if an atomic xfer is requested. IMHO, this
should work with IRQs enabled and disabled, but I am not sure if this is
the best approach...

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index a8b5719c3372..3c18305e6059 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -16,6 +16,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/module.h>
@@ -307,6 +308,8 @@ struct mtk_i2c {
     bool ignore_restart_irq;
     struct mtk_i2c_ac_timing ac_timing;
     const struct mtk_i2c_compatible *dev_comp;
+    bool atomic_xfer;
+    bool xfer_complete;
 };

 /**
@@ -994,6 +997,20 @@ static void i2c_dump_register(struct mtk_i2c *i2c)
         readl(i2c->pdmabase + OFFSET_RX_4G_MODE));
 }

+static irqreturn_t mtk_i2c_irq(int irqno, void *dev_id);
+
+static int mtk_i2c_wait_xfer_atomic(struct mtk_i2c *i2c)
+{
+    unsigned long timeout = jiffies + i2c->adap.timeout;
+
+    do {
+        udelay(10);
+        mtk_i2c_irq(0, i2c);
+    } while (!i2c->xfer_complete && time_before(jiffies, timeout));
+
+    return i2c->xfer_complete;
+}
+
 static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
                   int num, int left_num)
 {
@@ -1015,7 +1032,10 @@ static int mtk_i2c_do_transfer(struct mtk_i2c
*i2c, struct i2c_msg *msgs,
     if (i2c->auto_restart)
         restart_flag = I2C_RS_TRANSFER;

-    reinit_completion(&i2c->msg_complete);
+    if (i2c->atomic_xfer)
+        i2c->xfer_complete = false;
+    else
+        reinit_completion(&i2c->msg_complete);

     if (i2c->dev_comp->apdma_sync &&
        i2c->op != I2C_MASTER_WRRD && num > 1) {
@@ -1195,8 +1215,12 @@ static int mtk_i2c_do_transfer(struct mtk_i2c
*i2c, struct i2c_msg *msgs,
     }
     mtk_i2c_writew(i2c, start_reg, OFFSET_START);

-    ret = wait_for_completion_timeout(&i2c->msg_complete,
-                     i2c->adap.timeout);
+    if (i2c->atomic_xfer)
+        /* We can't rely on wait_for_completion* calls in atomic mode. */
+        ret = mtk_i2c_wait_xfer_atomic(i2c);
+    else
+        ret = wait_for_completion_timeout(&i2c->msg_complete,
+                         i2c->adap.timeout);

     /* Clear interrupt mask */
     mtk_i2c_writew(i2c, ~(restart_flag | I2C_HS_NACKERR | I2C_ACKERR |
@@ -1238,8 +1262,8 @@ static int mtk_i2c_do_transfer(struct mtk_i2c
*i2c, struct i2c_msg *msgs,
     return 0;
 }

-static int mtk_i2c_transfer(struct i2c_adapter *adap,
-               struct i2c_msg msgs[], int num)
+static int mtk_i2c_transfer_common(struct i2c_adapter *adap,
+                  struct i2c_msg msgs[], int num, bool atomic)
 {
     int ret;
     int left_num = num;
@@ -1249,6 +1273,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
     if (ret)
         return ret;

+    i2c->atomic_xfer = atomic;
     i2c->auto_restart = i2c->dev_comp->auto_restart;

     /* checking if we can skip restart and optimize using WRRD mode */
@@ -1303,6 +1328,18 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
     return ret;
 }

+static int mtk_i2c_transfer(struct i2c_adapter *adap,
+               struct i2c_msg msgs[], int num)
+{
+    return mtk_i2c_transfer_common(adap, msgs, num, false);
+}
+
+static int mtk_i2c_transfer_atomic(struct i2c_adapter *adap,
+                  struct i2c_msg msgs[], int num)
+{
+    return mtk_i2c_transfer_common(adap, msgs, num, true);
+}
+
 static irqreturn_t mtk_i2c_irq(int irqno, void *dev_id)
 {
     struct mtk_i2c *i2c = dev_id;
@@ -1328,8 +1365,12 @@ static irqreturn_t mtk_i2c_irq(int irqno, void *dev_id)
         mtk_i2c_writew(i2c, I2C_RS_MUL_CNFG | I2C_RS_MUL_TRIG |
                    I2C_TRANSAC_START, OFFSET_START);
     } else {
-        if (i2c->irq_stat & (I2C_TRANSAC_COMP | restart_flag))
-            complete(&i2c->msg_complete);
+        if (i2c->irq_stat & (I2C_TRANSAC_COMP | restart_flag)) {
+            if (i2c->atomic_xfer)
+                i2c->xfer_complete = true;
+            else
+                complete(&i2c->msg_complete);
+        }
     }

     return IRQ_HANDLED;
@@ -1346,6 +1387,7 @@ static u32 mtk_i2c_functionality(struct i2c_adapter *adap)

 static const struct i2c_algorithm mtk_i2c_algorithm = {
     .master_xfer = mtk_i2c_transfer,
+    .master_xfer_atomic = mtk_i2c_transfer_atomic,
     .functionality = mtk_i2c_functionality,
 };

