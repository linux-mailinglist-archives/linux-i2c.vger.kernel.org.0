Return-Path: <linux-i2c+bounces-3124-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 510A78B1BA5
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 09:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62174B24A86
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 07:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3623E811F1;
	Thu, 25 Apr 2024 07:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="JmqSWEwV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7977D78C68;
	Thu, 25 Apr 2024 07:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714029046; cv=none; b=nY2cwvS7qVvoD3kDdQ7SeDKaEPb/ThH9B6mNWORWuh6paBS8UtA2CLEfkAd+uiDJV87fo4TGTq/cHGsXRaCn5lo5tJ6hMuOqwSe8Z4y3U3KIu4pnlLWdMTrlVlMF6483ToPP9ZKDMei9sYcH5kKUU+0j58WamuYGfx7zrYjT8uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714029046; c=relaxed/simple;
	bh=kVdanrygML7WMWCF+U4FROQEQJChZ6vP0VXIWpnlWN8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZnydIqG7WtGTsAi7k5sDIWyXCVuAcAJ5jkJkZXMpiMOltk/IUA3l4iiatplNMhpymF1PCDrK5k4FK2NhHave7QD3u0m0hOYaafnrbWM2eGhrA+5PSkyYTfgrYrjk/Xz9mzAXEtruLN8bKu8QPvrAopWjwMLngTPqCEIvldZaLhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=JmqSWEwV; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P5JN18001017;
	Thu, 25 Apr 2024 03:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=DKIM;
	 bh=vZE3dDYjiNiwBmKcRBw52oa20oOecqUXbqZevdQvLd8=; b=JmqSWEwVFv95
	mJ2Is+3vx3Di9i0b/8zdsobp4ypCrHWyPVxGVtBatETuzfTXL1GpXXHML3nbO6zp
	UNgYLyF9NJnBRmbkd9hMzII6dAbnLM3nPatCa36LDn27f/aF9IEHZjruEclrxYbS
	a1VzNTZgiBV+hPPdVpAOPHu2dp6ieMU/j+b03wX68B5yqeYZ+gSXOhOU42fyve4B
	9UCcE93iZSySBKthMekEdDnaUSqkBdsJiq65tgYGk1KeOMAAujx3NTb55O1LH+NN
	L5oKPy0XoZDRV2ZKw61CZtb4YPFNlVn81rgUmBwsUiid9xh7bjpfBUNNmAtWWnCz
	xLSA9ToxLQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3xq3qmbcj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 03:10:18 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 43P7AHUr023012
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Apr 2024 03:10:17 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Thu, 25 Apr
 2024 03:10:16 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 25 Apr 2024 03:10:16 -0400
Received: from JSANBUEN-L01.ad.analog.com (JSANBUEN-L01.ad.analog.com [10.117.220.64])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 43P79tHk006908;
	Thu, 25 Apr 2024 03:10:08 -0400
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
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: hwmon: adm1275: add adm1281
Date: Thu, 25 Apr 2024 15:09:47 +0800
Message-ID: <20240425070948.25788-2-jose.sanbuenaventura@analog.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240425070948.25788-1-jose.sanbuenaventura@analog.com>
References: <20240425070948.25788-1-jose.sanbuenaventura@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: fUYlksadv3bjdOQOiHa1OidhndxUoYIX
X-Proofpoint-ORIG-GUID: fUYlksadv3bjdOQOiHa1OidhndxUoYIX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_06,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=971 adultscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 mlxscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250050

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


