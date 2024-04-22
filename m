Return-Path: <linux-i2c+bounces-3033-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9838AC2D4
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 04:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 061C928136E
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Apr 2024 02:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95CFD2FF;
	Mon, 22 Apr 2024 02:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="dn9W/xNh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827AA46BA;
	Mon, 22 Apr 2024 02:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713754336; cv=none; b=ijBbL7BI2onaN2DNRNYTlKGr/Mb9Rgdg04HQn7oW6l03y7312TFSBoQhcKF3QEXFkkYqQHMEZxfYEN3Be5QoZsnl5eZuuxddayZgSCb6r1jlekikeHCaTRAy4IthoDg13+Hg7I1TnE9DeiDkYTMtx5XRx/xp/7pEcyojMZkZj3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713754336; c=relaxed/simple;
	bh=kVdanrygML7WMWCF+U4FROQEQJChZ6vP0VXIWpnlWN8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=faRQQzJYMg3OxFYp+IpSB5IdE08IWMpgaGUkFQO6uPRYkQoKjj3R0sCvj6Kw+bRzzjc4Y26jSPwRzr8DVLMcy4aFo2L7lmehVtAXPMir2EVMUAHMfcxdOzxTUUgSkWsZY8cAfefP7VTLbeWNRYFI0eF1V2hbvS4OB79YRd4KmdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=dn9W/xNh; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43M16mTC021712;
	Sun, 21 Apr 2024 22:51:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=DKIM;
	 bh=vZE3dDYjiNiwBmKcRBw52oa20oOecqUXbqZevdQvLd8=; b=dn9W/xNhAOIC
	qw1NXZcM7gZKlUzSyog2G0l3kOaOLladPyJnWNpW9Q3jq1rkMwBJ4/vhM77669uT
	sodcYveLymB5y+b34SarJdzSj0juyLtKBoyj1v99tTacVyxnrMftxq5gSa/41VWs
	Sfo3aIb5ktu2kFMM5AJBnhCoWy7ll2Hae+0pLtfvBYj1VtM+btLQHqCiGarns115
	g4hvfqsw/pHrnDZEbwdCelmvNYtPNwtqfZShneHupA7P9BdXUysEbxPi47/O2E1J
	b3d6uL1MTMBY/i9PDMjRUmZab314NuC3gZqVxzTJdbNwjnBav9A0mBD+6B3FpvOG
	y4GdTNGLDQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3xm7j2vvqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 21 Apr 2024 22:51:52 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 43M2pphB065364
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 21 Apr 2024 22:51:51 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Sun, 21 Apr
 2024 22:51:50 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Sun, 21 Apr 2024 22:51:50 -0400
Received: from JSANBUEN-L01.ad.analog.com (JSANBUEN-L01.ad.analog.com [10.117.220.64])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 43M2pS5P027847;
	Sun, 21 Apr 2024 22:51:41 -0400
From: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>
To: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Delphine CC
 Chiu <Delphine_CC_Chiu@Wiwynn.com>,
        Jose Ramon San Buenaventura
	<jose.sanbuenaventura@analog.com>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: adm1275: add adm1281
Date: Mon, 22 Apr 2024 10:51:22 +0800
Message-ID: <20240422025123.29770-2-jose.sanbuenaventura@analog.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240422025123.29770-1-jose.sanbuenaventura@analog.com>
References: <20240422025123.29770-1-jose.sanbuenaventura@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: sG5BiraLPFkGDbCR7Xyx5qmZ6yipbwwH
X-Proofpoint-ORIG-GUID: sG5BiraLPFkGDbCR7Xyx5qmZ6yipbwwH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-21_22,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 phishscore=0 mlxlogscore=972 spamscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404220013

Add support for the adm1281 Hot-Swap Controller and Digital Power
and Energy Monitor

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>
---
 Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml b/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
index b68061294..5b076d677 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
@@ -5,7 +5,7 @@
 $id: http://devicetree.org/schemas/hwmon/adi,adm1275.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Analog Devices ADM1075/ADM127x/ADM129x digital power monitors
+title: Analog Devices ADM1075/ADM127x/ADM1281/ADM129x digital power monitors
 
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
@@ -27,6 +27,7 @@ properties:
       - adi,adm1275
       - adi,adm1276
       - adi,adm1278
+      - adi,adm1281
       - adi,adm1293
       - adi,adm1294
 
@@ -91,6 +92,7 @@ allOf:
           contains:
             enum:
               - adi,adm1278
+              - adi,adm1281
               - adi,adm1293
               - adi,adm1294
     then:
-- 
2.39.2


