Return-Path: <linux-i2c+bounces-1775-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC5F856FE7
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 23:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D5BA283EF0
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Feb 2024 22:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B1B14690F;
	Thu, 15 Feb 2024 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="MiCYFWaE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B72145B31;
	Thu, 15 Feb 2024 22:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708034906; cv=none; b=Y2D7jY9CJaCSTK5kTQvMLRubRdNbxVfpPlIOy8xE6NRNl1il8/VDPvlZnCAPvDcIaMZe5poxK7bbs7Apy0W8rpfdjReQjbjCZ6ZG4+40FKrr14IasgP/zhngadxGZOOydfVx/ozhtx7zJ3HxFf21Za/WLrAcxXV9l2i9dVXGqro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708034906; c=relaxed/simple;
	bh=F2EI8CjKMR5+W0auTiL1ZfI3q7DIl9lL0XVfiof8NJw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MNuweObTpd75vHV7hdUcd8j9RWUOhCSDk+LXZaL4MU7KVSG26lu6zxn7IrO0FmP12pGJBT6HCl+p+GjvzrdYnqbo0KmOtaCeGYDPf5/3KVhY+qdDSzsLPf3WELkGTr7V4TfMr2gcrw2Ibbtf7zZmCwC96lFYak1LvSS73wUohro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=MiCYFWaE; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FLX1T3019287;
	Thu, 15 Feb 2024 22:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CbVBtI9wWX/Vle86BDnixujDHBg2fVH5tOyNC480SYk=;
 b=MiCYFWaEMiJz9u050bK9Ky+XFQ9cps906GqUsuxLU0lc1W+nJ2+OTK8J1AvQ0zIcNuot
 QILQVEmTVxIXkV9H7PXx/frVP/G3GSggo9/XcByI7btD8rPt1XWiK1jW7W6jVPyPDufy
 2KcjTx38E2mI8aR8L0GGa3fRPeQ2L0rtz50Q4CoZZ5v1rgnsaNZmaIhlq34SBbcfZtQH
 bdWYvE3FhtJV1fkNsyWnwRLmAEV8VW20hW66t1LH5mbeLS0NX7kf32CDFyNK/nu9MX5G
 1IXydwpYToZToM8B/PrCCerevvJjedcHL5Oc3Pk8H1NfEhho0ZLYywZKygiIGl5JdTOd Eg== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9tmf8mx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:08 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FLB5ue010083;
	Thu, 15 Feb 2024 22:08:07 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6npm7812-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 22:08:07 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FM854o46596566
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 22:08:07 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27C0E58075;
	Thu, 15 Feb 2024 22:08:05 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D1A3358081;
	Thu, 15 Feb 2024 22:08:04 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.14.18])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 22:08:04 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        andi.shyti@kernel.org, eajames@linux.ibm.com, alistair@popple.id.au,
        joel@jms.id.au, jk@ozlabs.org, sboyd@kernel.org,
        mturquette@baylibre.com, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: [PATCH 09/33] fsi: core: Add slave error trace
Date: Thu, 15 Feb 2024 16:07:35 -0600
Message-Id: <20240215220759.976998-10-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: wWQh76vqmlatYEeFJLW8EAXOCTTuDROz
X-Proofpoint-ORIG-GUID: wWQh76vqmlatYEeFJLW8EAXOCTTuDROz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_20,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 mlxlogscore=983 adultscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402150171

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


