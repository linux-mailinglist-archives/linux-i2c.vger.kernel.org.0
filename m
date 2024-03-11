Return-Path: <linux-i2c+bounces-2323-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B6A877BE5
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 09:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB7B9281309
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 08:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFE5125AE;
	Mon, 11 Mar 2024 08:47:03 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AF811CBE
	for <linux-i2c@vger.kernel.org>; Mon, 11 Mar 2024 08:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.0.225.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710146823; cv=none; b=TFJ/pYCNYJ5ACq+LFabtrhE9Du1ExTPcX/6sXsD3b97EO7jHWiREsH3gBQB1pICTehboHrfnBrYFf4CiwKFB7y7OdxzyPKbXgLveBOba81l25EKww54Y/bucPs0vYEHP/bdfaSjITTNO/Y8lzUkMblhIDOh56RU4YsG2cZOfA44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710146823; c=relaxed/simple;
	bh=zXsAgtBAlhz6Qb6zI92JhSFhEPeLF9YdtgRdVJFAq+c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f5gmS4d59ixb+nQsVhDhZjZEzU/cmfgskrMVa8CJyRYfhMjfJ6Erd+XanIpAcLrf/8ACluUvF4Z2fNd/oSAfuc+KJzvvtHhIdoZaXpOCMaZR9T5ekc+syS4/zzlGpHjnlih+UJLNt/kpfE845/XnfJ4q9G/d1VBgcSjV45/ABPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=210.0.225.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1710146816-086e23661a081f0002-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx1.zhaoxin.com with ESMTP id bGmZLMsxGIYOQ98x (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Mon, 11 Mar 2024 16:46:57 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Mar
 2024 16:46:56 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 11 Mar 2024 16:46:56 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>, <wsa@kernel.org>
CC: <hanshu@zhaoxin.com>
Subject: [PATCH v2 2/2] i2c: viai2c: Fix bug for msg->len is 0
Date: Mon, 11 Mar 2024 16:46:55 +0800
X-ASG-Orig-Subj: [PATCH v2 2/2] i2c: viai2c: Fix bug for msg->len is 0
Message-ID: <3fb1398741536232a1e9b54a5de4072420046db5.1710146668.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <a3c58b7f15276fab324dd1e158a9f00c195f6f0f.1710146668.git.hanshu-oc@zhaoxin.com>
References: <a3c58b7f15276fab324dd1e158a9f00c195f6f0f.1710146668.git.hanshu-oc@zhaoxin.com>
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
X-Barracuda-Start-Time: 1710146816
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1794
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.121961
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

For the case that msg->len is 0(I2C_SMBUS_QUICK), when the interrupt
occurs, it means that the access has completed, viai2c_irq_xfer()
should return 1.

v1->v2:
	Added some code comments; The commit log is adjusted.
	Link: https://lore.kernel.org/all/20240311032600.56244-2-hanshu-oc@zhaoxin.com/

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>
---
 drivers/i2c/busses/i2c-viai2c-common.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
index 4c208b3a509e..fbb76d7ea3b0 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.c
+++ b/drivers/i2c/busses/i2c-viai2c-common.c
@@ -123,6 +123,14 @@ int viai2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	return (ret < 0) ? ret : i;
 }
 
+/*
+ * Main process of the byte mode xfer
+ *
+ * Return value indicates whether the transfer is complete
+ *  1: all the data has been successfully transferred
+ *  0: there is still data that needs to be transferred
+ *  -EIO: error occurred
+ */
 static int viai2c_irq_xfer(struct viai2c *i2c)
 {
 	u16 val;
@@ -142,10 +150,11 @@ static int viai2c_irq_xfer(struct viai2c *i2c)
 		if (val & VIAI2C_CSR_RCV_NOT_ACK)
 			return -EIO;
 
+		/* I2C_SMBUS_QUICK */
 		if (msg->len == 0) {
 			val = VIAI2C_CR_TX_END | VIAI2C_CR_CPU_RDY | VIAI2C_CR_ENABLE;
 			writew(val, base + VIAI2C_REG_CR);
-			return 0;
+			return 1;
 		}
 
 		if ((i2c->xfered_len + 1) == msg->len) {
@@ -195,6 +204,7 @@ static irqreturn_t viai2c_isr(int irq, void *data)
 			i2c->ret = viai2c_fifo_irq_xfer(i2c, true);
 	}
 
+	/* All the data has been successfully transferred or error occurred */
 	if (i2c->ret)
 		complete(&i2c->complete);
 
-- 
2.34.1


