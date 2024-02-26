Return-Path: <linux-i2c+bounces-1982-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5329F867CD7
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF80B1F23C97
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 16:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B1512F386;
	Mon, 26 Feb 2024 16:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="hfcSVrKb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8379912E1E5;
	Mon, 26 Feb 2024 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966425; cv=none; b=gjZXvEWufbIf71xFwxL8uxFIGg6hXbSCE1qroFu0aS+wtPaNfQG5D305ONU0PwkA6TaNe3WBEvY3FbgHRJFdBylCV/CWAsPL8BSac4UfN7Ao+rFss44ON1a+LzC48yHEqjRKbbf8ftmQ5pk/oj9jsqjkJtx30aJjEmmNln7HI6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966425; c=relaxed/simple;
	bh=inaKuQeiyTMX0KtjdTI4EyJ9/PXUVO4eL0aHOzMV/Co=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lKjqteiGnYVzDirP8ZZjCqawj/okvVOSd5bYXNbEOJrBl3JGN0d90AhCsha2jbl9AYVEIhyR7VNHlGfJGraGiwW4RUE1TIk1vKD1bJvMFZFl5/b7WUhhsWR6bGrRvaRb5ChrIz1vRe/AmjxSmYM0mFC95XpGR3y5IUrXLG0ixps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=hfcSVrKb; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QGgXK9003017;
	Mon, 26 Feb 2024 16:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=m8S+2xLwMphNFY1D6Sp8VRqoMTm6aplbC8DM8AmNxec=;
 b=hfcSVrKb5d/XXm0IKvULClB4yGftAFsimV9rJNoEGwo0jrWKl5CypQigu1PDACBy9Tb7
 Go2FdEWq6/4ROhrdHqlbwNF9aUF1hLTw4HfDAkaNJW6z7emJ3N96yMMmWWa82He3JOEK
 X0qD2Lj6KHhrgotLgqvISfGnlwkkSjDw63lhVQdooh2qVJUIuiZYlOhB2dcN+XCE49Bs
 6xv7oLnjbQBANerbsxDVzNJO+deosO9UXDh6gKo6Q2XpG5DbGtj+/PbJDW1q7JQoBbCY
 drlyeFFgeyqZiJHNLErEz2HU2E/+++f1RlC5rnPd1dQ2KCn8JOEYLZXuQxgW1tbMIp1a Mw== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgxd4g9sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:31 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QFUXdZ023777;
	Mon, 26 Feb 2024 16:53:30 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfw0k23f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:30 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrRko50594534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:30 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 927DA58043;
	Mon, 26 Feb 2024 16:53:27 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D8BF75805F;
	Mon, 26 Feb 2024 16:53:26 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:26 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 06/31] fsi: core: Improve master read/write/error traces
Date: Mon, 26 Feb 2024 10:52:56 -0600
Message-Id: <20240226165321.91976-7-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240226165321.91976-1-eajames@linux.ibm.com>
References: <20240226165321.91976-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wYkkACTCDT0BuXCoho42MRpwo3eINX7v
X-Proofpoint-ORIG-GUID: wYkkACTCDT0BuXCoho42MRpwo3eINX7v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxlogscore=949 spamscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402260128

Consolidate the master read and write traces into one trace and
change the result trace into an error trace for less spam.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c     |  26 +++++----
 include/trace/events/fsi.h | 112 ++++++++++++-------------------------
 2 files changed, 51 insertions(+), 87 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 9610b5948550..a989a2007c0f 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1110,14 +1110,15 @@ static int fsi_master_read(struct fsi_master *master, int link,
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
@@ -1127,14 +1128,15 @@ static int fsi_master_write(struct fsi_master *master, int link,
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
index 5ff15126ad9d..fed8835f438e 100644
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


