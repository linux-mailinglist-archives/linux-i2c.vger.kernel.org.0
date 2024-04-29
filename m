Return-Path: <linux-i2c+bounces-3322-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 951608B646E
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 23:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C68141C21517
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 21:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149D0181CF0;
	Mon, 29 Apr 2024 21:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="rRl7DYhs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98864181CEA;
	Mon, 29 Apr 2024 21:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714425520; cv=none; b=KpCfQCC6HFxyrKbwUxQUSadVsiDsTT4aRLrHL6VDXFAmFcNAdyj/kEKZcHd+o3sbyCuhisFZtFi5b+cGX+Z8shvkmKXKl0sKI6i+ATHxrVbQ/G20DyljPjxVIot1AzSYYU9hEnGJtJuTgT9uqslbb41cQfujVToDErP1/nMmlAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714425520; c=relaxed/simple;
	bh=uMNxfX+GEEKoMW2qGddydxuWlodXB83dAaL6SmnjQPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rIMO9i7tH1ixTI5G4us6jH3D3csxfr6/gX11qrZO5L+1XXDNKP98u37TAJ+ontUTzHQyX3rfrDzmvPIDNIU+wVGnZ8SekELdDv+mGFEx2GY0u6Bf3lTGpRdAmL0YPUT4NpSRwlsN6rihyis0cuMMwK6JkFBxBd3PHbzOUzIk6K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=rRl7DYhs; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43TLIHae016654;
	Mon, 29 Apr 2024 21:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XzmMdGVryVoj3t3zEWUQlItlF0K6YsZcMSILr1dtu7g=;
 b=rRl7DYhsum9B4jIOs+6JzefChm01DFwi1jW61YaAqx1ryop08G/gDXifAdJhnwYqajR7
 nUanOireLD++3K9IvR6SZyFVqa/plv+/M8AfrqF7KxqEGsyoH/qs3hS/sgpuVxpMbLcC
 7gX81iQAKubqaX11hxJWxr7JI2vCIKiOaO3C5yFv7Mym5w1uQC+AeU5HIQ29hYoQFoy4
 aGMK4y547u4npKIOP8qFh3dOhEpi1iT8+J0zOIBxI9HCibL7wYUYKBZ+2AbFBm1ZlaEP
 NtVN6F1AGejR8qimS8ih2l+t/ls1eu5tWkIydGfZg2mjaxahkaSlswJpMucIcGJwtvlN aQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xtkb0g01a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:18:29 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43TKUDk3001443;
	Mon, 29 Apr 2024 21:01:45 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xsbptsqyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 21:01:45 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43TL1g2348300426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 21:01:44 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A6555806A;
	Mon, 29 Apr 2024 21:01:42 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ACDBD5804B;
	Mon, 29 Apr 2024 21:01:41 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.151.254])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Apr 2024 21:01:41 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-aspeed@lists.ozlabs.org
Cc: eajames@linux.ibm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        lakshmiy@us.ibm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
        andi.shyti@kernel.org
Subject: [PATCH v4 11/17] dt-bindings: arm: aspeed: add IBM P11 BMC boards
Date: Mon, 29 Apr 2024 16:01:25 -0500
Message-Id: <20240429210131.373487-12-eajames@linux.ibm.com>
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
X-Proofpoint-GUID: jbMYt5hSmYHd7cT3eLxMTeh1fANKh5Dr
X-Proofpoint-ORIG-GUID: jbMYt5hSmYHd7cT3eLxMTeh1fANKh5Dr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_18,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 mlxlogscore=903
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404290140

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


