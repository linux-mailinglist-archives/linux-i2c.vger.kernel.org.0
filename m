Return-Path: <linux-i2c+bounces-3868-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D70828FD8CF
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63FD81F22A46
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE4616FF4E;
	Wed,  5 Jun 2024 21:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Dv/RDUZ8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B6116ABC8;
	Wed,  5 Jun 2024 21:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622626; cv=none; b=C1siP1bV2jj5uEzhSBHqTUFbeyJe6vdSFGa9+Tw3SY83WGy/0jxwRAZryN7tdg4xSBQH/mrdiB3YdV27lXYaOmU8K4wx7imNbtBi5QLWHTrUyE+RsFhRJ6jtVbS7w7OPo6WATNmauqYYbBMOBYiWE1K7gGKlVJT4XFQhc2hxotE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622626; c=relaxed/simple;
	bh=wl7RxaZ446EFTr7U3MZ8YZvx9qI3UF/DnMsNBZ+TxEg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BE+GrJjmSCR8xgxzywQswqElXUTGlgq79vlmquaApStok490D/Ytnu9choSgWsoFY/ycxsb2Ll/X9hsMSz+WaZGLnupdwEQV22lbJidqXocQT7t1CuatKNX2kIO3vB3xpjCy8USmZELTrjUgopAHtXjOAChhoy1cPaarL+kwQA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Dv/RDUZ8; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455LBvuo014371;
	Wed, 5 Jun 2024 21:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=ZO87ym+vrHlW5NSObf7CjE5XoUUtGZQpDoF/ti0pRyg=;
 b=Dv/RDUZ8nP1GfKSkC10tP5LUh9CEhVsBR9gJVa2i7HsrqT+C5mgEGrMRkmYxlljI4sHX
 cAJP1E17McM/KrF9vlM18b5iROcRziO+lLzzmhugYEFDK2ziUDnzTjesCZDQrGaVhQj5
 yQ+T2p/5KW10eB+FhvCE6PhJSkB6ZWWX87nMAKI2XSo/vBLwxbQ4xjsASBBiHIJM/Gkl
 EbGlEtZ1ZzJJ11d69uV4RmsYXJ+EzdMCSYll2yXta70it5HOCSZXusIc9vqGvdaYr7gP
 fIEG9X2D3+Nl/QCOW/wFX0RtrAMcmPT/VLJP64n17n8cLXf3lGE1pwT99xfVwd2ZhC24 XA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjy57r2y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:23 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455JBRYS031204;
	Wed, 5 Jun 2024 21:23:23 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygeyppnu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:23 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNK9J44499268
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:22 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AAF1D58055;
	Wed,  5 Jun 2024 21:23:18 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E26358069;
	Wed,  5 Jun 2024 21:23:18 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:18 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 17/40] fsi: aspeed: Refactor trace functions
Date: Wed,  5 Jun 2024 16:22:49 -0500
Message-Id: <20240605212312.349188-18-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240605212312.349188-1-eajames@linux.ibm.com>
References: <20240605212312.349188-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: A-oZrEuoCSwLyCqB8ft9uiakyCYSYlj6
X-Proofpoint-ORIG-GUID: A-oZrEuoCSwLyCqB8ft9uiakyCYSYlj6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=888
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050160

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


