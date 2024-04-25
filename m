Return-Path: <linux-i2c+bounces-3173-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C198B2B1E
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 23:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3612280A99
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 21:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B739C155A37;
	Thu, 25 Apr 2024 21:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="n4VmuqvZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A96155723;
	Thu, 25 Apr 2024 21:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081254; cv=none; b=omMVg4YDPCSWjkMX7CvJ9mv4hyzsndPTtRffGdQXS1dU94K1V2xIVIe2D2gsL316E6aJLP4I3i7z2EO/jR9f4FoFXVMmmp5jE1PzBuJzFs3coJ5NN05Z+DmEvjbdeDeMRJEBHl+qerUU79zSJTA9wi3tCF7aEKjR2vRZm3TIock=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081254; c=relaxed/simple;
	bh=uMNxfX+GEEKoMW2qGddydxuWlodXB83dAaL6SmnjQPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S0ffeo33X4fI/RCYi7NbNtQENHDPAN781AY+PK+9ABNGdMz7LvxV7v/F4IqFSVj/RTjxhbVmOHxFx2h5Z77TV0zSDU1KcWFWMM9jc9c1kkhhDDEdbFO9ApFEP6IvrEYDXbMdw7EQiS+6pQCYeOPDkFkRWII8ET521khPZrw11No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=n4VmuqvZ; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43PLei9O022133;
	Thu, 25 Apr 2024 21:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XzmMdGVryVoj3t3zEWUQlItlF0K6YsZcMSILr1dtu7g=;
 b=n4VmuqvZwTNBum3DVKQcZ86IEYpNoepPlOGh9R79ei6UbzdEViSyRhxkzZg8nbs+bY5C
 htC2MDIvu3GxFJhTZUeJSl9TZ5zahkuG+mJKOyXvXBkjMRB7R6aiaTMLQ81G0KnM2ea6
 BaoHmxzYcCTPjaryg7oEbRFvas0v+KDkxxGPdL92xA1fZXwHPxSDHrRgh8DDniglWEPk
 ngaRCkOHCq25Z5ctHV0v6B/eqP5SacQdzKffVu9fQCMeZXRQZvs+KCgZDxyqCVg7sbhD
 HHb39J1ScSB3l9KPWDUspSN7N/cmzjPIQjtNmEeAFmf/a7iz31KeRFYuyYEdKLZbed1t vA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xqy3qg0f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:40:43 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43PIxoi5023068;
	Thu, 25 Apr 2024 21:37:14 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xms1pc5gj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:37:14 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43PLbBjD35062438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Apr 2024 21:37:13 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78AC958050;
	Thu, 25 Apr 2024 21:37:11 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF02158045;
	Thu, 25 Apr 2024 21:37:10 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.133.34])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Apr 2024 21:37:10 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        lakshmiy@us.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au
Subject: [PATCH v3 11/14] dt-bindings: arm: aspeed: add IBM P11 BMC boards
Date: Thu, 25 Apr 2024 16:36:58 -0500
Message-Id: <20240425213701.655540-12-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240425213701.655540-1-eajames@linux.ibm.com>
References: <20240425213701.655540-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6dJv7kl7F5AxIhMIK8UTZwl5FkTMeY9c
X-Proofpoint-ORIG-GUID: 6dJv7kl7F5AxIhMIK8UTZwl5FkTMeY9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 clxscore=1015 phishscore=0
 suspectscore=0 adultscore=0 mlxlogscore=903 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404250157

Document two new AST2600 BMC boards for IBM P11 systems.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9a47c4ed4d17..2df91dd1b6a7 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -86,7 +86,9 @@ properties:
               - facebook,harma-bmc
               - facebook,minerva-cmc
               - facebook,yosemite4-bmc
+              - ibm,blueridge-bmc
               - ibm,everest-bmc
+              - ibm,fuji-bmc
               - ibm,rainier-bmc
               - ibm,system1-bmc
               - ibm,tacoma-bmc
-- 
2.39.3


