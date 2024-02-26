Return-Path: <linux-i2c+bounces-1981-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47704867CD6
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9220C1F261AE
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 16:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F27412F388;
	Mon, 26 Feb 2024 16:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="rnEwNad2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8376112E1E4;
	Mon, 26 Feb 2024 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966425; cv=none; b=JCKiP9Al3F6q/6IUnjVA6jtghImo04dYja87TGYV09UcPRAbqdBQ5gk99isWDt3KABoSAp/pudZ+W846fxzCrw8HsgQERZiHGgdrHygILYkJtU181BOcEltA3i3mTmpWHJfEHIKrVosBl9AY2vhGuhMnhbqCa+D0t3yiPzgAdKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966425; c=relaxed/simple;
	bh=F2EI8CjKMR5+W0auTiL1ZfI3q7DIl9lL0XVfiof8NJw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XC4ST3nDtmY6UyK9c+X4LjP/g8IE2epr2C1tF8dBHnVu/VYwgBt1CE8et7cRMYTpHV11NoepAq3GU0JACuo08AoAZCfIwCH+bcnK9tK2/eqH+PwjikQqha8pWWo7dwKNsPZ1gV4xNj+jhVNA3CsQ5b6X4wq7Qdyuy6Lvuo+ndVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=rnEwNad2; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QFvKor020290;
	Mon, 26 Feb 2024 16:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CbVBtI9wWX/Vle86BDnixujDHBg2fVH5tOyNC480SYk=;
 b=rnEwNad2q1ytYuwp4i1lFkEklJ6zGt/JHwFQQSeMn2AhV13IAVVvJqjs6d5RNzYnV7rm
 3dG795cv1cxNF3CyOZIbyatKGZ5TJPn/WSkCXd72Kk8LK4SX1SHaFiBMDVf+1NPaLUZl
 sA/GF95YRpoSyIYIMD+/DMd5i6xwAj+l9u+spKV0kk7oDm3620UQKWhBpPHqjVkJvu8d
 qapfOzAnN3beS2tC/sYM2bG0ZnDygsYWzeoK6F1I9JISp5vgQmu8R1a9gXqgmU+1H0cQ
 zvAJsCoc7sz2dbh2E2nkvi4A03cINrLdIvW+4SgZkvSs3QkeAJ6aCA+DzDFG8Jjqs1qJ ZQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgwr21p2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:32 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QGbYFY008808;
	Mon, 26 Feb 2024 16:53:31 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wftstaray-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:31 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrSGT42467804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:30 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 626595805D;
	Mon, 26 Feb 2024 16:53:28 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A93A258053;
	Mon, 26 Feb 2024 16:53:27 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:27 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 07/31] fsi: core: Add slave error trace
Date: Mon, 26 Feb 2024 10:52:57 -0600
Message-Id: <20240226165321.91976-8-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: G92xxlVDLy_CfAvpbOtXZ6YdNreWMvrh
X-Proofpoint-GUID: G92xxlVDLy_CfAvpbOtXZ6YdNreWMvrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402260128

Trace out the FSI slave status and interrupt status.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c     |  1 +
 include/trace/events/fsi.h | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index a989a2007c0f..e6ed2d0773b6 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -185,6 +185,7 @@ static int fsi_slave_report_and_clear_errors(struct fsi_slave *slave)
 
 	dev_dbg(&slave->dev, "status: 0x%08x, sisc: 0x%08x\n",
 			be32_to_cpu(stat), be32_to_cpu(irq));
+	trace_fsi_slave_error(slave, be32_to_cpu(irq), be32_to_cpu(stat));
 
 	/* clear interrupts */
 	return fsi_master_write(master, link, id, FSI_SLAVE_BASE + FSI_SISC,
diff --git a/include/trace/events/fsi.h b/include/trace/events/fsi.h
index fed8835f438e..5509afc98ee8 100644
--- a/include/trace/events/fsi.h
+++ b/include/trace/events/fsi.h
@@ -115,6 +115,25 @@ TRACE_EVENT(fsi_master_unregister,
 	TP_printk("fsi%d (%d links)", __entry->master_idx, __entry->n_links)
 );
 
+TRACE_EVENT(fsi_slave_error,
+	TP_PROTO(const struct fsi_slave *slave, uint32_t sisc, uint32_t sstat),
+	TP_ARGS(slave, sisc, sstat),
+	TP_STRUCT__entry(
+		__field(int, master_idx)
+		__field(int, link)
+		__field(uint32_t, sisc)
+		__field(uint32_t, sstat)
+	),
+	TP_fast_assign(
+		__entry->master_idx = slave->master->idx;
+		__entry->link = slave->link;
+		__entry->sisc = sisc;
+		__entry->sstat = sstat;
+	),
+	TP_printk("fsi%d:%02d sisc:%08x sstat:%08x", __entry->master_idx, __entry->link,
+		  __entry->sisc, __entry->sstat)
+);
+
 TRACE_EVENT(fsi_slave_init,
 	TP_PROTO(const struct fsi_slave *slave),
 	TP_ARGS(slave),
-- 
2.39.3


