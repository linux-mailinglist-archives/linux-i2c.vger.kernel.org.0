Return-Path: <linux-i2c+bounces-3512-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C39CF8C7BE5
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4656D1F224C4
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9B7157A53;
	Thu, 16 May 2024 18:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="FxGoWv0Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3E2156C60;
	Thu, 16 May 2024 18:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883573; cv=none; b=YA5lhNVLvobdCO5LEsy8muRoS99Wt9bhuBbNnfFyO+BzrmJxefwTsqLMEKz1Ykv5VJ5yX9RNa2tJIaRDuYo29roHvnbJQIMbQNtjR8K8fywhKj7c69HAsf+iGUh+gvKsvY1ngtqC4Tpm6kUpTLDA4FTJKWwDILrNqjsvSZV/RHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883573; c=relaxed/simple;
	bh=yUz/ROMGEoe6+SLnrmcPZvLaUjxobW2ydVpNVylcngM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cXNfBLLG5hno34eih0BD/Glxp7FA6yDOOX74C7MStpiBeuGGVeF4RMiu3eGFMYRqZjIYNZ523N1M72WuKKhagr1hoIrYvLp75jzKqZ8rc+6LSOAZIy5J1M6I9z3z8VKoVMjKXC5HfGvjrDOVITDhsWl4s3OKA73S6g0XI2qbJAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=FxGoWv0Y; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GGl7Po022376;
	Thu, 16 May 2024 18:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5eeoXCbaU56E8ifND9k7gRXOpAZyJwysFP2rCDv7kG0=;
 b=FxGoWv0Y9wMBGc4p8nTH25aHPVJhrGdgY7nO/NpEAEcJncObclh2XbUBzZEkpr9+hZ3n
 GQ8YGqsjLekaqJiByMM08b4DZ+Sk0wMmjl0dHWwSuLaW1Vysw5YnNLThmwQmaPn5tyMb
 YUy3YTK4MIJZFUu87Q97WQmsGkmzdLGZyeDiCKJ2dIk5lGZw801fyNPc+/GUt85GGOVw
 nISNO1FyQuJXVwCJowOY7kpshJS6giUzzq+wP5l5F7jy39B8isL+c+TPKWlCFXdAaTIj
 FXyKFa2ZAXPzwrgR3pdS0Y6swpEQHkhtwUMJuBgiQ6z+l56iA8O4U0zDcWoIx/I0r+eb LA== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5nycr8d7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:12 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GFXZgi029599;
	Thu, 16 May 2024 18:19:11 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2n7m34kx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 18:19:11 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GIJ9If28574388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 18:19:11 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6503B58087;
	Thu, 16 May 2024 18:19:09 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2500D58065;
	Thu, 16 May 2024 18:19:09 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.107.19])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 18:19:09 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
        joel@jms.id.au, alistair@popple.id.au, jk@ozlabs.org,
        andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
        eajames@linux.ibm.com
Subject: [PATCH v3 06/40] fsi: core: Improve master read/write/error traces
Date: Thu, 16 May 2024 13:18:33 -0500
Message-Id: <20240516181907.3468796-7-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: 7nyjdNlNVNj31MUGPHseawf0FtNyXecb
X-Proofpoint-ORIG-GUID: 7nyjdNlNVNj31MUGPHseawf0FtNyXecb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 phishscore=0 suspectscore=0
 mlxlogscore=881 adultscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405160132

Consolidate the master read and write traces into one trace and
change the result trace into an error trace for less spam.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c     |  26 +++++----
 include/trace/events/fsi.h | 112 ++++++++++++-------------------------
 2 files changed, 51 insertions(+), 87 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 44875f2350b04..b3029f9c05e4a 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1116,14 +1116,15 @@ static int fsi_master_read(struct fsi_master *master, int link,
 {
 	int rc;
 
-	trace_fsi_master_read(master, link, slave_id, addr, size);
-
 	rc = fsi_check_access(addr, size);
-	if (!rc)
+	if (!rc) {
 		rc = master->read(master, link, slave_id, addr, val, size);
-
-	trace_fsi_master_rw_result(master, link, slave_id, addr, size,
-			false, val, rc);
+		if (rc)
+			trace_fsi_master_error(master->idx, link, slave_id, addr, size, val, rc,
+					       true);
+		else
+			trace_fsi_master_xfer(master->idx, link, slave_id, addr, size, val, true);
+	}
 
 	return rc;
 }
@@ -1133,14 +1134,15 @@ static int fsi_master_write(struct fsi_master *master, int link,
 {
 	int rc;
 
-	trace_fsi_master_write(master, link, slave_id, addr, size, val);
-
 	rc = fsi_check_access(addr, size);
-	if (!rc)
+	if (!rc) {
 		rc = master->write(master, link, slave_id, addr, val, size);
-
-	trace_fsi_master_rw_result(master, link, slave_id, addr, size,
-			true, val, rc);
+		if (rc)
+			trace_fsi_master_error(master->idx, link, slave_id, addr, size, val, rc,
+					       false);
+		else
+			trace_fsi_master_xfer(master->idx, link, slave_id, addr, size, val, false);
+	}
 
 	return rc;
 }
diff --git a/include/trace/events/fsi.h b/include/trace/events/fsi.h
index 5ff15126ad9d5..fed8835f438e5 100644
--- a/include/trace/events/fsi.h
+++ b/include/trace/events/fsi.h
@@ -8,101 +8,63 @@
 
 #include <linux/tracepoint.h>
 
-TRACE_EVENT(fsi_master_read,
-	TP_PROTO(const struct fsi_master *master, int link, int id,
-			uint32_t addr, size_t size),
-	TP_ARGS(master, link, id, addr, size),
+TRACE_EVENT(fsi_master_xfer,
+	TP_PROTO(int master_idx, int link, int id, uint32_t addr, size_t size, const void *data,
+		 bool read),
+	TP_ARGS(master_idx, link, id, addr, size, data, read),
 	TP_STRUCT__entry(
-		__field(int,	master_idx)
-		__field(int,	link)
-		__field(int,	id)
-		__field(__u32,	addr)
-		__field(size_t,	size)
+		__field(int, master_idx)
+		__field(int, link)
+		__field(int, id)
+		__field(uint32_t, addr)
+		__field(int, size)
+		__field(uint32_t, data)
+		__field(bool, read)
 	),
 	TP_fast_assign(
-		__entry->master_idx = master->idx;
+		__entry->master_idx = master_idx;
 		__entry->link = link;
 		__entry->id = id;
 		__entry->addr = addr;
-		__entry->size = size;
-	),
-	TP_printk("fsi%d:%02d:%02d %08x[%zu]",
-		__entry->master_idx,
-		__entry->link,
-		__entry->id,
-		__entry->addr,
-		__entry->size
-	)
-);
-
-TRACE_EVENT(fsi_master_write,
-	TP_PROTO(const struct fsi_master *master, int link, int id,
-			uint32_t addr, size_t size, const void *data),
-	TP_ARGS(master, link, id, addr, size, data),
-	TP_STRUCT__entry(
-		__field(int,	master_idx)
-		__field(int,	link)
-		__field(int,	id)
-		__field(__u32,	addr)
-		__field(size_t,	size)
-		__field(__u32,	data)
-	),
-	TP_fast_assign(
-		__entry->master_idx = master->idx;
-		__entry->link = link;
-		__entry->id = id;
-		__entry->addr = addr;
-		__entry->size = size;
+		__entry->size = (int)size;
 		__entry->data = 0;
 		memcpy(&__entry->data, data, size);
+		__entry->read = read;
 	),
-	TP_printk("fsi%d:%02d:%02d %08x[%zu] <= {%*ph}",
-		__entry->master_idx,
-		__entry->link,
-		__entry->id,
-		__entry->addr,
-		__entry->size,
-		(int)__entry->size, &__entry->data
-	)
+	TP_printk("fsi%d:%02d:%02d %s %08x {%*ph}", __entry->master_idx, __entry->link,
+		  __entry->id, __entry->read ? "read" : "write", __entry->addr, __entry->size,
+		  &__entry->data)
 );
 
-TRACE_EVENT(fsi_master_rw_result,
-	TP_PROTO(const struct fsi_master *master, int link, int id,
-			uint32_t addr, size_t size,
-			bool write, const void *data, int ret),
-	TP_ARGS(master, link, id, addr, size, write, data, ret),
+TRACE_EVENT(fsi_master_error,
+	TP_PROTO(int master_idx, int link, int id, uint32_t addr, size_t size, const void *data,
+		 int ret, bool read),
+	TP_ARGS(master_idx, link, id, addr, size, data, ret, read),
 	TP_STRUCT__entry(
-		__field(int,	master_idx)
-		__field(int,	link)
-		__field(int,	id)
-		__field(__u32,	addr)
-		__field(size_t,	size)
-		__field(bool,	write)
-		__field(__u32,	data)
-		__field(int,	ret)
+		__field(int, master_idx)
+		__field(int, link)
+		__field(int, id)
+		__field(uint32_t, addr)
+		__field(int, size)
+		__field(uint32_t, data)
+		__field(int, ret)
+		__field(bool, read)
 	),
 	TP_fast_assign(
-		__entry->master_idx = master->idx;
+		__entry->master_idx = master_idx;
 		__entry->link = link;
 		__entry->id = id;
 		__entry->addr = addr;
-		__entry->size = size;
-		__entry->write = write;
+		__entry->size = (int)size;
 		__entry->data = 0;
-		__entry->ret = ret;
-		if (__entry->write || !__entry->ret)
+		if (!read)
 			memcpy(&__entry->data, data, size);
+		__entry->ret = ret;
+		__entry->read = read;
 	),
-	TP_printk("fsi%d:%02d:%02d %08x[%zu] %s {%*ph} ret %d",
-		__entry->master_idx,
-		__entry->link,
-		__entry->id,
-		__entry->addr,
-		__entry->size,
-		__entry->write ? "<=" : "=>",
-		(int)__entry->size, &__entry->data,
-		__entry->ret
-	)
+	TP_printk("fsi%d:%02d:%02d %s %08x {%*ph} %d", __entry->master_idx, __entry->link,
+		  __entry->id, __entry->read ? "read" : "write", __entry->addr, __entry->size,
+		  &__entry->data, __entry->ret)
 );
 
 TRACE_EVENT(fsi_master_break,
-- 
2.39.3


