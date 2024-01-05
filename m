Return-Path: <linux-i2c+bounces-1122-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CF8824F57
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 08:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55B2F1F22232
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 07:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB3A20B15;
	Fri,  5 Jan 2024 07:52:04 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD65720B1B
	for <linux-i2c@vger.kernel.org>; Fri,  5 Jan 2024 07:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1704441111-086e230f2811770003-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx1.zhaoxin.com with ESMTP id dVDEBq4zAjZr8t10 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Fri, 05 Jan 2024 15:51:52 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Jan
 2024 15:51:51 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 5 Jan 2024 15:51:50 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <wsa@kernel.org>, <cobechen@zhaoxin.com>
Subject: [PATCH v7 4/6] i2c: wmt: fix a bug when thread blocked
Date: Fri, 5 Jan 2024 15:51:47 +0800
X-ASG-Orig-Subj: [PATCH v7 4/6] i2c: wmt: fix a bug when thread blocked
Message-ID: <f56773092681736140447f47962aa2f6c3df3773.1704440251.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
References: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1704441112
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 3408
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.119008
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

v6->v7:
	1. some dirty patches were removed
	2. rename structure member 'to/ti' to 't1/t2'
	   to make it easier to understand.
	3. add a comment about arbitration.
	Link: https://lore.kernel.org/all/b0f284621b6763c32133d39be83f05f1184b3635.1703830854.git.hanshu-oc@zhaoxin.com/

During each byte access, the host performs clock stretching.
In this case, the thread may be interrupted by preemption,
resulting in a long stretching time.

However, some touchpad can only tolerate host clock stretching
of no more than 200 ms. We reduce the impact of this through
a retransmission mechanism.

Since __i2c_lock_bus_helper() is used to ensure that the
current access will not be interrupted by the other access,
We don't need to worry about arbitration anymore.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-viai2c-common.c | 26 ++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-viai2c-common.h |  3 +++
 2 files changed, 29 insertions(+)

diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
index 3e565d5ee4c7..0fd2554731ca 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.c
+++ b/drivers/i2c/busses/i2c-viai2c-common.c
@@ -22,12 +22,37 @@ int viai2c_check_status(struct viai2c *i2c)
 {
 	int ret = 0;
 	unsigned long time_left;
+	unsigned long delta_ms;
 
 	time_left = wait_for_completion_timeout(&i2c->complete,
 						msecs_to_jiffies(500));
 	if (!time_left)
 		return -ETIMEDOUT;
 
+	/*
+	 * During each byte access, the host performs clock stretching.
+	 * In this case, the thread may be interrupted by preemption,
+	 * resulting in a long stretching time.
+	 *
+	 * However, some touchpad can only tolerate host clock stretching
+	 * of no more than 200 ms. We reduce the impact of this through
+	 * a retransmission mechanism.
+	 *
+	 * Since __i2c_lock_bus_helper() is used to ensure that the
+	 * current access will not be interrupted by the other access,
+	 * We don't need to worry about arbitration anymore.
+	 */
+	local_irq_disable();
+	i2c->t2 = ktime_get();
+	delta_ms = ktime_to_ms(ktime_sub(i2c->t2, i2c->t1));
+	if (delta_ms > VIAI2C_STRETCHING_TIMEOUT) {
+		local_irq_enable();
+		dev_warn(i2c->dev, "thread blocked more than %ldms\n", delta_ms);
+		return -EAGAIN;
+	}
+	i2c->t1 = i2c->t2;
+	local_irq_enable();
+
 	if (i2c->cmd_status & VIAI2C_ISR_NACK_ADDR)
 		ret = -EIO;
 
@@ -158,6 +183,7 @@ int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	int ret = 0;
 	struct viai2c *i2c = i2c_get_adapdata(adap);
 
+	i2c->t2 = i2c->t1 = ktime_get();
 	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
 		if (!(pmsg->flags & I2C_M_NOSTART)) {
diff --git a/drivers/i2c/busses/i2c-viai2c-common.h b/drivers/i2c/busses/i2c-viai2c-common.h
index 28799e7e97f0..d0ffba22104d 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.h
+++ b/drivers/i2c/busses/i2c-viai2c-common.h
@@ -49,6 +49,7 @@
 #define VIAI2C_REG_MCR		0x0E
 
 #define VIAI2C_TIMEOUT		(msecs_to_jiffies(1000))
+#define VIAI2C_STRETCHING_TIMEOUT	200
 
 struct viai2c {
 	struct i2c_adapter	adapter;
@@ -59,6 +60,8 @@ struct viai2c {
 	u16			tcr;
 	int			irq;
 	u16			cmd_status;
+	ktime_t			t1;
+	ktime_t			t2;
 };
 
 int viai2c_wait_bus_not_busy(struct viai2c *i2c);
-- 
2.34.1


