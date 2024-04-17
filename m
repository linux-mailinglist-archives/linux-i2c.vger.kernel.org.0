Return-Path: <linux-i2c+bounces-2989-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD088A79A0
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 02:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1C081C2239C
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 00:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF29015CE;
	Wed, 17 Apr 2024 00:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="t5BAvNKF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F61A10FF;
	Wed, 17 Apr 2024 00:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713312488; cv=none; b=tdMjFz1tIn9NLh0F1zKV7O5RWw1yAzniCcOTSZMpi6Pd7SSlQwCVtfuVWYDNUJvScerdXWao4Yx3HY8MZ4egKjd1sDNvSw9fMRReyhw2P9aQW3Ysly+9G1bLU7HRlIvigPQ7KGH8CJfsSJEUPjSYSdw3IzaOFR+wCEaLXNamesU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713312488; c=relaxed/simple;
	bh=h8f3C0pqKvZF5OBGbZVOyvItLI7chRTuMZ7jBF3oIiQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ew0xlj3cPNeB+jC+JN6fOMT6UwwSwRkep9s/npZ6FMKsJLvpjH2MXKG0J2LEjvct4YT5UDoecCcFT2wRoD5OC3Pa/GAGFNuXgfDWEcxtZNJvuzeZWyV0kuufcgJGk1UJSTLImuS0y4uooxgU2RnKaubVDGFa+3cmrzNIJklyguk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=t5BAvNKF; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43GN70Wr000884;
	Tue, 16 Apr 2024 20:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=DKIM;
	 bh=dvyTqmRENz0Ln0o4/FJTlo8kr7TK6NwLjtG54O6JmPc=; b=t5BAvNKFFmc8
	sKVcV3TAn1eJO7voEnBc+7KO/Pi+w8xV64mL+tvOpSx7eTU535Z3uSnXy5Z8x4oB
	I0dG8NMrSdKM4v9VTs5PE5SEubnOFdghxUByO8wm7Nw9sR7hsFtX9C9wVQLptUoY
	3HPaIRpUJdurjqjHxLOcZv3vwflNtgjPXh6UQAtV8nEEwx98/mjVK5q8Xjqngfk4
	pi/a/yqp0kTwrPBz5rZFuoN9a6TQmE9Uui81hs9JVnlMnYzwOviZhyu8YQWVANu5
	3aTxUb4lBl9WT8sU2h6WXnM2BFs4kqsaKPZsIJjqsv/2A2WCt1xZJogwG0waL3BU
	CL6GPONJ4w==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3xhvv99fqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 20:07:51 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 43H07ott027700
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Apr 2024 20:07:50 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 16 Apr 2024 20:07:49 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 16 Apr 2024 20:07:49 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 16 Apr 2024 20:07:49 -0400
Received: from JSANBUEN-L01.ad.analog.com (JSANBUEN-L01.ad.analog.com [10.117.220.64])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 43H07T2u022696;
	Tue, 16 Apr 2024 20:07:43 -0400
From: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>
To: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Delphine CC
 Chiu" <Delphine_CC_Chiu@Wiwynn.com>,
        Jose Ramon San Buenaventura
	<jose.sanbuenaventura@analog.com>
Subject: [PATCH 1/2] dt-bindings: hwmon: adm1275: add adm1281
Date: Wed, 17 Apr 2024 08:07:21 +0800
Message-ID: <20240417000722.919-2-jose.sanbuenaventura@analog.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240417000722.919-1-jose.sanbuenaventura@analog.com>
References: <20240417000722.919-1-jose.sanbuenaventura@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: iS-MoceEMYwhdC_TdPzVeCi-R78xxaVF
X-Proofpoint-ORIG-GUID: iS-MoceEMYwhdC_TdPzVeCi-R78xxaVF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_19,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404160158

Add support for the adm1281 Hot-Swap Controller and Digital Power
and Energy Monitor

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


