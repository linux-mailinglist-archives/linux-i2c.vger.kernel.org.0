Return-Path: <linux-i2c+bounces-3312-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F208B6410
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 23:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBAFD282278
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 21:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D0317B507;
	Mon, 29 Apr 2024 21:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="nS17dyj1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA125178CC9;
	Mon, 29 Apr 2024 21:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714424515; cv=none; b=jDRjAj187D/gIrcp1cUncn0hdfmIHYLdcqArJLwyo7PXMgXFfGdC5bZkw+h4i5l++vkM2w1NnpIQxffFahsug/o9v2UnEfDU2zMnGPIGBxEaUreLWbOJI1PoZxSRqfhLSwFgXwb4XCpsyi6PpA/EbvcRuPHLqsskbelYmXoJKPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714424515; c=relaxed/simple;
	bh=ELNdq1jV9Vz1DRkadgRU/PEKcABpbdUwlchjH3lAg50=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=scNie8sW/YHwdguHIGfm+khL73z/dYK6GBLXLrdEGL5nTsxILMl6jUHryq7ZJswPZ5C2e4s2CE23aHZdX7u0tpXK7RrcJDjiGACRmzsIGUe3d0BnQbnv8ZGixDV5Bmio//KYWVTV41EIERKNVCvYw3crty7JtcAaBlUXIZg3rgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=nS17dyj1; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TKlIxx014892;
	Mon, 29 Apr 2024 21:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=27N1NxpRjm0ig5EC1X7yOxmwmVydfN4IvC5b8b/9cQk=;
 b=nS17dyj1qjgym0uNK+/R7SlhT0CxCBmCIsfBDHJG2rBeNHLMs2J9/GKTgeQzDbdWPEAr
 zeU51KOkg+Q9ae8Idly+k+PP474Mmg6zWev8yI1DEXvdZtXXn11Odjx7nUSoh2SvCpXY
 4nvruVA0uIVcBZiIswIzxOiyK777JTdAwxj2GFvAP61YmGr1GUNVcgiaC9MPHiSEVKbf
 Ieen17j9mq9TLvf8nLCyXeylVSg4jkRwP6iSistMrBYBufzlMxo1642iQx+z2ustmPdj
 DSMUvMbawhu41BzEzX0XVzTM3BiOtf7RCU4DfN91zd8uiJsqli8fEHi/b8r6/QQqPPOE xg== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xtjw1019v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:43 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43THhCea027539;
	Mon, 29 Apr 2024 21:01:42 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xsc309np6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:42 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43TL1dr619661422
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 21:01:41 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1AD4D5806E;
	Mon, 29 Apr 2024 21:01:39 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E2215805B;
	Mon, 29 Apr 2024 21:01:38 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.151.254])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Apr 2024 21:01:38 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        lakshmiy@us.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        andi.shyti@kernel.org
Subject: [PATCH v4 07/17] dt-bindings: fsi: ibm,i2cr-fsi-master: Reference common FSI controller
Date: Mon, 29 Apr 2024 16:01:21 -0500
Message-Id: <20240429210131.373487-8-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240429210131.373487-1-eajames@linux.ibm.com>
References: <20240429210131.373487-1-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DnhDZxPO5iOaEGkwdsR_X-4jp8fADAB4
X-Proofpoint-GUID: DnhDZxPO5iOaEGkwdsR_X-4jp8fADAB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_18,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404290138

Remove the common properties from the I2CR documentation and instead
point to the common FSI controller documentation.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v3:
 - Re-order allOf to below required

 .../devicetree/bindings/fsi/ibm,i2cr-fsi-master.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/fsi/ibm,i2cr-fsi-master.yaml b/Documentation/devicetree/bindings/fsi/ibm,i2cr-fsi-master.yaml
index 442cecdc57cb..e49ace3ca339 100644
--- a/Documentation/devicetree/bindings/fsi/ibm,i2cr-fsi-master.yaml
+++ b/Documentation/devicetree/bindings/fsi/ibm,i2cr-fsi-master.yaml
@@ -26,7 +26,10 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+allOf:
+  - $ref: fsi-controller.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.39.3


