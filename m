Return-Path: <linux-i2c+bounces-1986-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2128867CFA
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 17:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A726B2C7A1
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 16:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A5712CDBF;
	Mon, 26 Feb 2024 16:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="BYC6Dak5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302BE12F36D;
	Mon, 26 Feb 2024 16:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966426; cv=none; b=e+Kk1I23NQQKVbuoFtKhBBQHEtJMVIXZp/zSSdJ2Sm9kUYBqOu+1RjNZUWF+4jg1NT5nRl4bAuVtnWKqmS5O3AY+rhHeTzAaleQfgKi12g0v1vRGJqoMIEvFMT2Ros8wVXvpLDOli52cDuGDFvb3vAN72EC26HsXc/JzXkgjcqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966426; c=relaxed/simple;
	bh=E9DUSZacmzJzG+m5rC6gn1HLC7/p/P7CDzyfAfbiWSw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IyrAlsLHhc33juFEnOkinsIpMwradb53yqA1+1NvO9t8RQlgM7halVUJfVvUSIGQ6x5DFkCWG0IKWUyW300g/Rllos/wgjC/Q7+73MPjnyxd1Xllgq2rrMKyAgxGBP9t08sGUjfhpJA6sRMaG3mpwJU6kjxQj4Ed40fFjl1ma90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=BYC6Dak5; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41QGTbIC025113;
	Mon, 26 Feb 2024 16:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=C+pRu+K3OrSWU2t4zv85kwDoRmh4FsLurjQWkBINbDU=;
 b=BYC6Dak57p54aIjkrX7HzLtPuHE9P1qN+oTIAFB2wPfuGBeeC53hZ1VwZp5NSA3hNV5m
 Mh96Z94QT8IsiUHC3HCtgK4f9/MqJNI3/v30CD8WfHvIghjT4+GUYMLGFyoFf3fCfy5s
 9mRUA4Pv++7HhJS3lx6OdPaGR8LRhCjfLuKPRkPyiDBuojvRhi/bNRNnNzR4K+PnfZNU
 eIuWRvulBnxen4ypLj/ZFMXlATAK2Z5E2QTqJQCU5CU/qXJ0W2c9EP6SH4dNTMI2RFCd
 jhjd5+Aw/0vedS3fIE/ytQRWKx7Gs5dgiml3qYf0Hl0d0Ed8H0qGpcGyOquYKq+rm6a7 KA== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wgwr21p39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:33 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41QFAIRw024127;
	Mon, 26 Feb 2024 16:53:32 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfw0k23f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 16:53:32 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QGrTmU2753176
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 16:53:31 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BDA858059;
	Mon, 26 Feb 2024 16:53:29 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78EE658053;
	Mon, 26 Feb 2024 16:53:28 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.57.130])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 16:53:28 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, andi.shyti@kernel.org,
        eajames@linux.ibm.com, alistair@popple.id.au, joel@jms.id.au,
        jk@ozlabs.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, lakshmiy@us.ibmcom
Subject: [PATCH v2 08/31] dt-bindings: fsi: Add AST2700 compatible
Date: Mon, 26 Feb 2024 10:52:58 -0600
Message-Id: <20240226165321.91976-9-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: OQWHMRcYdZ6ItXPMThOEgRPKc-sx-VhL
X-Proofpoint-GUID: OQWHMRcYdZ6ItXPMThOEgRPKc-sx-VhL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=901 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402260128

Document the 2700 FSI master compatible string.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt b/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
index 9853fefff5d8..5bfe10abbaa5 100644
--- a/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
+++ b/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
@@ -5,7 +5,7 @@ The AST2600 contains two identical FSI masters. They share a clock and have a
 separate interrupt line and output pins.
 
 Required properties:
- - compatible: "aspeed,ast2600-fsi-master"
+ - compatible: "aspeed,ast2600-fsi-master" or "aspeed,ast2700-fsi-master"
  - reg: base address and length
  - clocks: phandle and clock number
  - interrupts: platform dependent interrupt description
-- 
2.39.3


