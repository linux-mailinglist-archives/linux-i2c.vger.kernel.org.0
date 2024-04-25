Return-Path: <linux-i2c+bounces-3172-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E6E8B2B13
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 23:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFDF92821FF
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 21:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20847156643;
	Thu, 25 Apr 2024 21:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="gRJs8bO9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F632156238;
	Thu, 25 Apr 2024 21:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081114; cv=none; b=AmsXeFk2iDJRp/Du/qXmRz/335YoiUJ1neZWrmndBnkjNHCLAsBC/QZ+c0LrSxoNf3y372uc5EcUbSw4W0Ue3j2G6mnie3YJZrQ5YN8dHSIHYzZmOt1HWWMPLUI/4ghBZf+02fKdh9tyzb1H/+t2ecO8G8uXl1xYgu5BDbsZh3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081114; c=relaxed/simple;
	bh=ZzZpuf30gm9fgPJpUej7zSiJrVWdAqhvGLJs2wKAa5U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HhoaWR3CjFoC9TJmmbV3KMAcBcydLfU8myyAdO1pkJgZqYiQUx+qr0siKfchxrKh6Wh+551Xrq4cxhQHhfBcg6es0nhbKkbiOYsPjXuvTFjhDrXh8pcOdCi6ZDF9viCI3RGnOoLDOLetJIa4WieHPsfwFD74gDC5BviE0QWN78M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=gRJs8bO9; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43PLKQol026603;
	Thu, 25 Apr 2024 21:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hD+3oKEwrdglUs74wBoHtIHvwJ7T5xADfEPIoMQkUzk=;
 b=gRJs8bO9794MWStUVFS9KuyRt8ta1WyhVuqS0WqfKKBFjfLU15ctMk7SZpzwL0tXiSk8
 yM8Iq2m7ExiSOsewoh3D2vTzT+T5CV57oR2hGhAF5uZiFyOaDQJ2FrFFvLBCBb5cUvvF
 fp8z9QOPEoS6ExmEaDfiJyRAluZxiVhXlTPzBjflT9QDQFjXro2VrnhIEp3fwlYd7Cyy
 +jf/261yMB0j+iTFmamcvwtcslAKIPhIhNnkO0NCU3gKzPl/1ewQM0IG0PyU/sA7tY3O
 9bmu+T9BviHnOo+hdw3DlSM9tSx3gDNvjj7W1DoPoRcRN07O//a3ThEfRLyEgIN9zNuw BQ== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xqxyxg15k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:38:21 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43PLPW11023065;
	Thu, 25 Apr 2024 21:37:07 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xms1pc5g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:37:07 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43PLb4v240567366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Apr 2024 21:37:06 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8625858061;
	Thu, 25 Apr 2024 21:37:04 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C886258045;
	Thu, 25 Apr 2024 21:37:03 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.133.34])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Apr 2024 21:37:03 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        lakshmiy@us.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au
Subject: [PATCH v3 02/14] dt-bindings: fsi: fsi2spi: Document SPI controller child nodes
Date: Thu, 25 Apr 2024 16:36:49 -0500
Message-Id: <20240425213701.655540-3-eajames@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: vcEMAkgwmyUnsQI6xNliCHreWVege3uw
X-Proofpoint-GUID: vcEMAkgwmyUnsQI6xNliCHreWVege3uw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 clxscore=1015 mlxlogscore=999 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404250157

The FSI2SPI bridge has several SPI controllers behind it, which
should be documented. Also, therefore the node needs to specify
address and size cells.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 .../devicetree/bindings/fsi/ibm,fsi2spi.yaml          | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/fsi/ibm,fsi2spi.yaml b/Documentation/devicetree/bindings/fsi/ibm,fsi2spi.yaml
index e2ca0b000471..512d6d4dff3c 100644
--- a/Documentation/devicetree/bindings/fsi/ibm,fsi2spi.yaml
+++ b/Documentation/devicetree/bindings/fsi/ibm,fsi2spi.yaml
@@ -24,6 +24,17 @@ properties:
     items:
       - description: FSI slave address
 
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^spi@[0-9a-f]+$":
+    $ref: /schemas/spi/ibm,p10-spi.yaml
+    description: Child node describing underlying SPI controller
+
 required:
   - compatible
   - reg
-- 
2.39.3


