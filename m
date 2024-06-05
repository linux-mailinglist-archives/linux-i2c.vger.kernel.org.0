Return-Path: <linux-i2c+bounces-3839-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ED48FD85F
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BABCC1C20E0B
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989A915F418;
	Wed,  5 Jun 2024 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="YVdz2aft"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC5A15F3ED;
	Wed,  5 Jun 2024 21:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622617; cv=none; b=M5ZUeiT20L84p7F4cl4SxXJrtHn8leBWytacdTkCqFbgwl+iX9vVwHMc2zyH6JFJFucSZX9v53o8p19W6nvnC/88kMEvf3tZ6K4bNU4ti94wUaUThgzhsLWcYA8i/yd/GyfhCdpEAkeddRRuWwnzfeE255g81ifNtxYHn7Z3VYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622617; c=relaxed/simple;
	bh=yUz/ROMGEoe6+SLnrmcPZvLaUjxobW2ydVpNVylcngM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tTzR8/ivrusnSpgfx5H3qWGl/Y5t01lZD+JYftA89nz1SdV7yqrC27KMytzWx6nE9Za+WqZS0eqWqWN3ucSVPzXqvKaoQDudP+5w86yZC0jMmha+3SVbfyOS7JcgAduQWwVS/ooof2Irz3g1WIE/DgJ+QoKprum3aXCvplLQErU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=YVdz2aft; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455KKjTo025753;
	Wed, 5 Jun 2024 21:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=5eeoXCbaU56E8ifND9k7gRXOpAZyJwysFP2rCDv7kG0=;
 b=YVdz2aftBMryZIQ7m9AHhESDlRVisCt7tgFSuXcqtwHTHoAQ4ArMfUgh9Y4pmiIwDeRb
 RvHPspileR7Lfj8h4fpmsxr/gcZCliF/SLS2thk2M+/1mEN1DEwyO3THr9Dl+7dbGuj7
 bmmwvRFcJkxBtLhkUQ2LBoD8lyNdrbqtvWoHdUp4BRb2hb8ktE1Cf0xEDGGn1ffA+Stt
 muuCD90oSIR+e9Pa+gtjy17Sy0wBDZBrE1KJ4Li6+HSWbbcjCAjUJDFcL8m10iKTs+mp
 08tUEO8Gn+IY7cc8yuIJzIgjWkTtrc5odfyH5Pt9lk2luHTVETv+4BDkkA1BERPrkd8y Ag== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjuwr0qbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:19 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455JBRYQ031204;
	Wed, 5 Jun 2024 21:23:18 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygeyppnsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:18 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNFJV34603530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:17 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50E3E58067;
	Wed,  5 Jun 2024 21:23:15 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11AB658061;
	Wed,  5 Jun 2024 21:23:15 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.121.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jun 2024 21:23:15 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: eajames@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        broonie@kernel.org, andi.shyti@kernel.org, joel@jms.id.au,
        alistair@popple.id.au, jk@ozlabs.org, andrew@codeconstruct.com.au,
        linux-aspeed@lists.ozlabs.org, ninad@linux.ibm.com,
        lakshmiy@us.ibm.com
Subject: [PATCH v4 06/40] fsi: core: Improve master read/write/error traces
Date: Wed,  5 Jun 2024 16:22:38 -0500
Message-Id: <20240605212312.349188-7-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: _O1ZRDGMxSsC5kg47PdcNM1eU2IYsdJp
X-Proofpoint-GUID: _O1ZRDGMxSsC5kg47PdcNM1eU2IYsdJp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 mlxlogscore=886
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050160

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


