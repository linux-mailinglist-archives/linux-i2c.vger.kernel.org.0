Return-Path: <linux-i2c+bounces-1782-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6DA856FFF
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A34E1F239E5
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE7F14831C;
	Thu, 15 Feb 2024 22:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="B7P/o4j0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8111468E1;
	Thu, 15 Feb 2024 22:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034908; cv=none; b=AJJKrgfQxqfbAHc2QH5Lk1TFy2zkBCZX+M0q1awPAI3lWHPbOi/xexmmtQrSKHFP+e9x1d7N907hdrcEemjQ29RY3v5+IYp33xmCW/Ma66OS2gkkrHMTx6P+nCfDZ3wd0anqjT+SMJG2/tLISufmKhaCwliA6VlEJa4YP8O/K0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034908; c=relaxed/simple;
	bh=rehO7cLR4fQpk+ZuJ/GB/Ev81SeAWJhsriBJhdeCXCk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WCsUVyCJ6G1gTONNuy2wjNWd52jhVnenRStfRWJFgPn62ouUvXmB070FkduYz1rh8LYxofT1+DlGyacF+RZhE2lrzerLIpr0KerZ5EJskgAkmTCevRPqVitRgPl86CFnRvaQa/DkljB0wxa8nRKHS9FQNLyqZyfDBCQxd/eBiA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=B7P/o4j0; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FM0WvO017893;
	Thu, 15 Feb 2024 22:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zvpqrz1IR95x4v/nVIcA1R/mLkFs7xansTMd+3MOVyo=;
 b=B7P/o4j05NPCD/0yT0ifCaFZp9eC45B0JPnnpE75SHwIPLjBHkHE77qoSB0D3BtyYDud
 JPUaeaoXSsj7EDVD/dN/TWqsd+cmdDhYjIFql1r2WEJEfhDWnyDi19gSBT/V+qwo6LXp
 f/6s1TJxQml8994ISQU3wsxvmMVm3sVTXLjVVbEJ/qZSmFo0ocbXTnP6Qk0TN8yO3+cf
 SSJvF+ipssQd+bnvrqdcEvUJ3j/snnDRITdZchZExECbmeJpOTpy9MN/gvCOcNdFT4Bh
 4SOzIYnMEkQzSLHu0PNNxjCxgHJU3amzICAzj7yRGA1Erd9zwLPnXB5codp7wgZX5Ron mQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9u1bg69s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:11 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FJq2tl016197;
	Thu, 15 Feb 2024 22:08:10 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w6mymyhch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:10 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM882h45810372
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:10 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BD9F5806A;
	Thu, 15 Feb 2024 22:08:08 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5DE158076;
	Thu, 15 Feb 2024 22:08:07 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:07 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 17/33] fsi: aspeed: Refactor trace functions
Date: Thu, 15 Feb 2024 16:07:43 -0600
Message-Id: <20240215220759.976998-18-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240215220759.976998-1-eajames@linux.ibm.com>
References: <20240215220759.976998-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NNFDo-IrKkgOZ1em8O8Z2QNTGEKbtblX
X-Proofpoint-ORIG-GUID: NNFDo-IrKkgOZ1em8O8Z2QNTGEKbtblX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 spamscore=0 mlxlogscore=914 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150171

Remove the opb error trace, add a timeout trace, and combine the
read/write traces.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c          | 29 +++------
 include/trace/events/fsi_master_aspeed.h | 80 ++++++++----------------
 2 files changed, 34 insertions(+), 75 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index c36e7e49e965..1a91f3acdfcc 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -116,16 +116,17 @@ static int __opb_write(struct fsi_master_aspeed *aspeed, u32 addr,
 
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
 
@@ -169,13 +170,11 @@ static int __opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 
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
@@ -198,6 +197,7 @@ static int __opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 
 	}
 
+	trace_fsi_master_aspeed_opb_xfer(addr, transfer_size + 1, result, true);
 	return 0;
 }
 
@@ -220,19 +220,6 @@ static int check_errors(struct fsi_master_aspeed *aspeed, int err)
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
index 0fff873775f1..7eeecbfec7f0 100644
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


