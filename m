Return-Path: <linux-i2c+bounces-3546-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1E28C7C76
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEC7F1F2163D
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4D0165FB3;
	Thu, 16 May 2024 18:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="PAX9103Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0FC15747C;
	Thu, 16 May 2024 18:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883606; cv=none; b=gfG5OWvzZVxXqK6r5r9oNYH0ZWXoox3DiGt61sGTCS4NO6WOVaqu/AdC1cIYJdAjOR5F7fWlvTH5rjdpxoqxV2jUp9OcVGBW0AyYCGdzHdX7kjId++iAzEMZoufhpk4IejWNHROmn6CXzpvv4X4/gPUZjYUMs0CPZQy/cwzSkJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883606; c=relaxed/simple;
	bh=wl7RxaZ446EFTr7U3MZ8YZvx9qI3UF/DnMsNBZ+TxEg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dhAsVCHKWlTzP0Z8XJNwl2O8k129Z8hLkUhBI4Oib/yD7KRm1921053PG89HPgXFsioJVE1y7UhIvY1cB7Jc9rPJW0IY+juwmbFqsI3qQ/JOVgX2uZy2hD/AVmbNvvvbD0qaLid3AhLoKSEIDSfRskEjethDoPtgj825r+bnZEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=PAX9103Z; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GHbvhI010836;
	Thu, 16 May 2024 18:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ZO87ym+vrHlW5NSObf7CjE5XoUUtGZQpDoF/ti0pRyg=;
 b=PAX9103ZEVgQp21y/Po8N3dK+qubCe3iljsXsgesvk1p8SKy0H//kOe8cjYkLtu1OFDx
 JOZBHoHdaXi2smmaUZc2vBWH0NkXntt49fXlZrcyy64ryPGgviEgxxZ16C6akmhdE00M
 Q+PnVdduJAf1s+uRkU/u7zr/V6tlCzVhD4O1YDv1sISNskMifJz9q4NyVq6XR5SjFVzb
 BO+2SvrxGDcmDt+2RPXhC0mYv6BatIfsGy4UUado5m4yzYce6YWcAC9RQttarfQadkey
 A5jsxgurq8CK11J939RDo+j5imMPC6f8VYVx9qNKc91Y9G2q/fbbp+lKrj7t+oSDU/cy Xg== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5pq5r368-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:18 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GFQLsM005986;
	Thu, 16 May 2024 18:19:17 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2mgmud35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:17 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJE8426411654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:17 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE6B95807A;
	Thu, 16 May 2024 18:19:12 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FB245806B;
	Thu, 16 May 2024 18:19:12 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:12 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 17/40] fsi: aspeed: Refactor trace functions
Date: Thu, 16 May 2024 13:18:44 -0500
Message-Id: <20240516181907.3468796-18-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240516181907.3468796-1-eajames@linux.ibm.com>
References: <20240516181907.3468796-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SJUFraF2MmaFOkX6y36r_0vh4Mt_xvBo
X-Proofpoint-ORIG-GUID: SJUFraF2MmaFOkX6y36r_0vh4Mt_xvBo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 clxscore=1015 mlxlogscore=889 priorityscore=1501 adultscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

Remove the opb error trace, add a timeout trace, and combine the
read/write traces.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c          | 29 +++------
 include/trace/events/fsi_master_aspeed.h | 80 ++++++++----------------
 2 files changed, 34 insertions(+), 75 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 29932037c9866..04aa5cb9b6fad 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -122,16 +122,17 @@ static int __opb_write(struct fsi_master_aspeed *aspeed, u32 addr,
 
 	status = readl(base + OPB0_STATUS);
 
-	trace_fsi_master_aspeed_opb_write(addr, val, transfer_size, status, reg);
-
 	/* Return error when poll timed out */
-	if (ret)
+	if (ret) {
+		trace_fsi_master_aspeed_timeout(reg, status, false);
 		return ret;
+	}
 
 	/* Command failed, master will reset */
 	if (status & STATUS_ERR_ACK)
 		return -EIO;
 
+	trace_fsi_master_aspeed_opb_xfer(addr, transfer_size + 1, val, false);
 	return 0;
 }
 
@@ -175,13 +176,11 @@ static int __opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 
 	result = readl(base + OPB0_FSI_DATA_R);
 
-	trace_fsi_master_aspeed_opb_read(addr, transfer_size, result,
-			readl(base + OPB0_STATUS),
-			reg);
-
 	/* Return error when poll timed out */
-	if (ret)
+	if (ret) {
+		trace_fsi_master_aspeed_timeout(reg, status, true);
 		return ret;
+	}
 
 	/* Command failed, master will reset */
 	if (status & STATUS_ERR_ACK)
@@ -204,6 +203,7 @@ static int __opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 
 	}
 
+	trace_fsi_master_aspeed_opb_xfer(addr, transfer_size + 1, result, true);
 	return 0;
 }
 
@@ -226,19 +226,6 @@ static int check_errors(struct fsi_master_aspeed *aspeed, int err)
 {
 	int ret;
 
-	if (trace_fsi_master_aspeed_opb_error_enabled()) {
-		__be32 mresp0, mstap0, mesrb0;
-
-		opb_readl(aspeed, ctrl_base + FSI_MRESP0, &mresp0);
-		opb_readl(aspeed, ctrl_base + FSI_MSTAP0, &mstap0);
-		opb_readl(aspeed, ctrl_base + FSI_MESRB0, &mesrb0);
-
-		trace_fsi_master_aspeed_opb_error(
-				be32_to_cpu(mresp0),
-				be32_to_cpu(mstap0),
-				be32_to_cpu(mesrb0));
-	}
-
 	if (err == -EIO) {
 		/* Check MAEB (0x70) ? */
 
diff --git a/include/trace/events/fsi_master_aspeed.h b/include/trace/events/fsi_master_aspeed.h
index 0fff873775f19..7eeecbfec7f09 100644
--- a/include/trace/events/fsi_master_aspeed.h
+++ b/include/trace/events/fsi_master_aspeed.h
@@ -8,69 +8,41 @@
 
 #include <linux/tracepoint.h>
 
-TRACE_EVENT(fsi_master_aspeed_opb_read,
-	TP_PROTO(uint32_t addr, size_t size, uint32_t result, uint32_t status, uint32_t irq_status),
-	TP_ARGS(addr, size, result, status, irq_status),
+TRACE_EVENT(fsi_master_aspeed_opb_xfer,
+	TP_PROTO(uint32_t addr, uint32_t size, uint32_t data, bool read),
+	TP_ARGS(addr, size, data, read),
 	TP_STRUCT__entry(
-		__field(uint32_t,  addr)
-		__field(size_t,    size)
-		__field(uint32_t,  result)
-		__field(uint32_t,  status)
-		__field(uint32_t,  irq_status)
-		),
+		__field(uint32_t, addr)
+		__field(uint32_t, size)
+		__field(uint32_t, data)
+		__field(bool, read)
+	),
 	TP_fast_assign(
 		__entry->addr = addr;
 		__entry->size = size;
-		__entry->result = result;
-		__entry->status = status;
-		__entry->irq_status = irq_status;
-		),
-	TP_printk("addr %08x size %zu: result %08x sts: %08x irq_sts: %08x",
-		__entry->addr, __entry->size, __entry->result,
-		__entry->status, __entry->irq_status
-	   )
+		__entry->data = data;
+		__entry->read = read;
+	),
+	TP_printk("%s addr %08x size %u data %08x", __entry->read ? "read" : "write",
+		  __entry->addr, __entry->size, __entry->data)
 );
 
-TRACE_EVENT(fsi_master_aspeed_opb_write,
-	TP_PROTO(uint32_t addr, uint32_t val, size_t size, uint32_t status, uint32_t irq_status),
-	TP_ARGS(addr, val, size, status, irq_status),
+TRACE_EVENT(fsi_master_aspeed_timeout,
+	TP_PROTO(uint32_t irq, uint32_t status, bool read),
+	TP_ARGS(irq, status, read),
 	TP_STRUCT__entry(
-		__field(uint32_t,    addr)
-		__field(uint32_t,    val)
-		__field(size_t,    size)
-		__field(uint32_t,  status)
-		__field(uint32_t,  irq_status)
-		),
+		__field(uint32_t, irq)
+		__field(uint32_t, status)
+		__field(bool, read)
+	),
 	TP_fast_assign(
-		__entry->addr = addr;
-		__entry->val = val;
-		__entry->size = size;
+		__entry->irq = irq;
 		__entry->status = status;
-		__entry->irq_status = irq_status;
-		),
-	TP_printk("addr %08x val %08x size %zu status: %08x irq_sts: %08x",
-		__entry->addr, __entry->val, __entry->size,
-		__entry->status, __entry->irq_status
-		)
-	);
-
-TRACE_EVENT(fsi_master_aspeed_opb_error,
-	TP_PROTO(uint32_t mresp0, uint32_t mstap0, uint32_t mesrb0),
-	TP_ARGS(mresp0, mstap0, mesrb0),
-	TP_STRUCT__entry(
-		__field(uint32_t,  mresp0)
-		__field(uint32_t,  mstap0)
-		__field(uint32_t,  mesrb0)
-		),
-	TP_fast_assign(
-		__entry->mresp0 = mresp0;
-		__entry->mstap0 = mstap0;
-		__entry->mesrb0 = mesrb0;
-		),
-	TP_printk("mresp0 %08x mstap0 %08x mesrb0 %08x",
-		__entry->mresp0, __entry->mstap0, __entry->mesrb0
-		)
-	);
+		__entry->read = read;
+	),
+	TP_printk("%s irq %08x status %08x", __entry->read ? "read" : "write", __entry->irq,
+		  __entry->status)
+);
 
 TRACE_EVENT(fsi_master_aspeed_cfam_reset,
 	TP_PROTO(bool start),
-- 
2.39.3


