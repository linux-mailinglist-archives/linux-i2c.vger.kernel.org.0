Return-Path: <linux-i2c+bounces-1031-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C55381F44E
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 04:18:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE96F1F22180
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 03:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4134402;
	Thu, 28 Dec 2023 03:17:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF423C15
	for <linux-i2c@vger.kernel.org>; Thu, 28 Dec 2023 03:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1703733469-1eb14e0c7e06b50003-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx2.zhaoxin.com with ESMTP id 2H4QgrbZIjkPKyB5 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 28 Dec 2023 11:17:50 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Dec
 2023 11:17:49 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 28 Dec 2023 11:17:48 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <andi.shyti@kernel.org>, <cobechen@zhaoxin.com>, <hanshu-oc@zhaoxin.com>
Subject: [PATCH v5 6/8] i2c: wmt: fix a bug when thread blocked
Date: Thu, 28 Dec 2023 11:17:44 +0800
X-ASG-Orig-Subj: [PATCH v5 6/8] i2c: wmt: fix a bug when thread blocked
Message-ID: <3cc1129b018d2a0a27d299a2eaea65a6b60d6504.1703733126.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703733126.git.hanshu-oc@zhaoxin.com>
References: <cover.1703733126.git.hanshu-oc@zhaoxin.com>
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
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1703733469
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 3075
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.118654
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

During each byte access, the host performs clock stretching.
In this case, the thread may be interrupted by preemption,
resulting in a long stretching time.

However, some touchpad can only tolerate host clock stretching
of no more than 200 ms. We reduce the impact of this through
a retransmission mechanism.

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-viai2c-common.c | 37 +++++++++++++++++++++-----
 drivers/i2c/busses/i2c-viai2c-common.h |  2 ++
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
index 60a4d4ccaf12..e5eca10efedc 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.c
+++ b/drivers/i2c/busses/i2c-viai2c-common.c
@@ -2,7 +2,8 @@
 #include <linux/of_irq.h>
 #include "i2c-viai2c-common.h"
 
-#define VIAI2C_TIMEOUT		(msecs_to_jiffies(1000))
+#define VIAI2C_TIMEOUT			(msecs_to_jiffies(1000))
+#define VIAI2C_STRETCHING_TIMEOUT	200
 
 static int viai2c_wait_bus_ready(struct viai2c *i2c)
 {
@@ -25,12 +26,35 @@ static int viai2c_wait_bus_ready(struct viai2c *i2c)
 static int viai2c_wait_status(struct viai2c *i2c)
 {
 	int ret = 0;
-	unsigned long wait_result;
+	unsigned long time_left;
+	unsigned long delta_ms;
+
+	time_left = wait_for_completion_timeout(&i2c->complete,
+						VIAI2C_TIMEOUT);
+	if (!time_left) {
+		dev_err(i2c->dev, "bus transfer timeout\n");
+		return -EIO;
+	}
 
-	wait_result = wait_for_completion_timeout(&i2c->complete,
-						msecs_to_jiffies(500));
-	if (!wait_result)
-		return -ETIMEDOUT;
+	/*
+	 * During each byte access, the host performs clock stretching.
+	 * In this case, the thread may be interrupted by preemption,
+	 * resulting in a long stretching time.
+	 * However, some touchpad can only tolerate host clock stretching
+	 * of no more than 200 ms. We reduce the impact of this through
+	 * a retransmission mechanism.
+	 */
+	local_irq_disable();
+	i2c->to = ktime_get();
+	delta_ms = ktime_to_ms(ktime_sub(i2c->to, i2c->ti));
+	if (delta_ms > VIAI2C_STRETCHING_TIMEOUT) {
+		local_irq_enable();
+		dev_warn(i2c->dev, "thread blocked more than %ldms\n",
+				delta_ms);
+		return -EAGAIN;
+	}
+	i2c->ti = i2c->to;
+	local_irq_enable();
 
 	if (i2c->cmd_status & VIAI2C_ISR_NACK_ADDR)
 		ret = -EIO;
@@ -184,6 +208,7 @@ int viai2c_xfer(struct i2c_adapter *adap,
 	int ret = 0;
 	struct viai2c *i2c = i2c_get_adapdata(adap);
 
+	i2c->to = i2c->ti = ktime_get();
 	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
 		if (!(pmsg->flags & I2C_M_NOSTART)) {
diff --git a/drivers/i2c/busses/i2c-viai2c-common.h b/drivers/i2c/busses/i2c-viai2c-common.h
index f171f81e4d0f..73a88398d763 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.h
+++ b/drivers/i2c/busses/i2c-viai2c-common.h
@@ -58,6 +58,8 @@ struct viai2c {
 	u16			tcr;
 	int			irq;
 	u16			cmd_status;
+	ktime_t			ti;
+	ktime_t			to;
 };
 
 int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num);
-- 
2.34.1


