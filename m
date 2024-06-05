Return-Path: <linux-i2c+bounces-3843-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8360F8FD86D
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 23:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2228A283E7A
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 21:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9FD15FD10;
	Wed,  5 Jun 2024 21:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Tv0vp0wd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B981715F416;
	Wed,  5 Jun 2024 21:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717622618; cv=none; b=XTq3cZJlvIIVuaar3j+9OKBbNf+6S7wgWqxfbQk5ybg2MK8ixYyerFCUBGpTiGWwzyBHAK6sbrcBYW5pU7aV7EtBxLKr0QwgfWcEvjM72uTP8NelCPMjoLN4Z+Ho/GaWEJnO6EFhnPRSQAp6OESLPE+cZ3GRBel87JdbKAoCNJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717622618; c=relaxed/simple;
	bh=LAd7Fl8eb8f+PoK+Joq8lwmFZ5yAW+ThBAA+WrvtsPw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MtqstvQ/PSGTyZp4OGvwGvELpUnItJF3OvWifOKWs0yHqkYKFCTd091tjTZsStGOZbq/EbeEO1b13UZEguY+STygMgDY5n/hAy9mPsfpuCVjPXctEwXGMlXcDUC5kK87XABoYW/4r3n5StOpbMhAeOP4MQTcoWQDc772YUPtfjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Tv0vp0wd; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 455Kuo58001530;
	Wed, 5 Jun 2024 21:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=wnARRSgz2Wy63EPYwjGONgg7SPU8BXAI/uH83DK3Sg4=;
 b=Tv0vp0wd0eqmVE0hkiSd8CmwqcAy0YtaIwAgg8sLVvXb6RRGaFKaZx6J84QCtNJ0PnBQ
 qc3STfh6ZUf0gySXJkAv0VJiagAxXF8wTKh0seJegU/X6po4rS3MYT6FVwRmbycv0h4w
 QOKODYHyq4kvKqalE0rCBWPZ16DuMblYNMvu5MWD1EpGPQLfHVOkFOresI9y40Oj1FTW
 g6vkCRCPkNNnjG+o/pJnNyXP1ZAb6aAm3zgTJVIMy9caMzsr4xGHY6R0u1DJMpRrEbkm
 KLSdYRGM2igERa7PIZ+xh9J2S+nvKBVTNhI8arlK3viT1r6krcS6rdyFI1FRD1ZoGd+9 oA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yjwppgcfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:19 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 455L18Jw026513;
	Wed, 5 Jun 2024 21:23:18 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yggp366e9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 21:23:18 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 455LNFX435717638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 21:23:17 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96B4358061;
	Wed,  5 Jun 2024 21:23:15 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57F505805E;
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
Subject: [PATCH v4 07/40] fsi: core: Add slave error trace
Date: Wed,  5 Jun 2024 16:22:39 -0500
Message-Id: <20240605212312.349188-8-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: cfnKhuf6fK2KVIF9IAq3qiTP39R9ZFOj
X-Proofpoint-GUID: cfnKhuf6fK2KVIF9IAq3qiTP39R9ZFOj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 mlxlogscore=947 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406050160

Trace out the FSI slave status and interrupt status.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c     |  1 +
 include/trace/events/fsi.h | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index b3029f9c05e4a..93bbdcf50a89a 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -185,6 +185,7 @@ static int fsi_slave_report_and_clear_errors(struct fsi_slave *slave)
 
 	dev_dbg(&slave->dev, "status: 0x%08x, sisc: 0x%08x\n",
 			be32_to_cpu(stat), be32_to_cpu(irq));
+	trace_fsi_slave_error(slave, be32_to_cpu(irq), be32_to_cpu(stat));
 
 	/* clear interrupts */
 	return fsi_master_write(master, link, id, FSI_SLAVE_BASE + FSI_SISC,
diff --git a/include/trace/events/fsi.h b/include/trace/events/fsi.h
index fed8835f438e5..5509afc98ee8b 100644
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


