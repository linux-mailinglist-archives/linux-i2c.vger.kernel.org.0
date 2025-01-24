Return-Path: <linux-i2c+bounces-9180-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5EFA1B927
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 16:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB7201717C0
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 15:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC4122540E;
	Fri, 24 Jan 2025 15:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="IzusW+vC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817BA224B0E;
	Fri, 24 Jan 2025 15:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731934; cv=none; b=uO84+TMuBjudzVMSFsa0zj8KlJAV7uBCjtw1BW9Cg6id1Xg89Bp457ZUTGTaPStDrGvB7BlU3z4/ue66ofMtlVc9fZLvmtojG4Xdhz/4TPqFaNZTvE+4NFHOdlirNP2inxqZJVLm56bNVikGqsJ9sKgVBjw0yOIZ6257uaP2dI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731934; c=relaxed/simple;
	bh=CUX9b8/ixlHfMw1a8fls3zPyyrdUglzGImrCyVbZQ6w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o6cXlypi3qeO2VU2iBx0obdGpKhHHmRIT6YCDlBTgju5j4JYVS1cOav6y2l1L5IRvX1o6kdjnGO+PDggATNqsuBouK5CKByLUOQoj3QGExZxOMg1kHLhCnLf1mzwIDhqZW7RAdo18+24Vm+FjQ/zyGaulMphRUcVCUMsz7+UYUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=IzusW+vC; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O9xSXG025606;
	Fri, 24 Jan 2025 10:18:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ySvFB
	9ksuj96qreRx2BJ5cXyCE94emxCvM2Hr2FEmfk=; b=IzusW+vCg+acqNgfNls1e
	h8xGpiBi6rXED333hE/U3N+wM/YTJF3xkAZ03HI+gcskNemQKxSVdj60uo3KfZS1
	s/vB7b8fFdjEVLCA+O9sq7tZ82i906XnbHy4XTahjH8bApwIISCrFYtcvrcVvwvD
	V6v/yXtznX0PoiSgaf70vCQ137onG5MdScwWN48kOoYurFN0YFABjyed2fu8007F
	xexrbkwq96oLnnkHFV0cIKf1nn9PLkqA2Z046hb4mxXfszfPjKFrxxBN3wDuZAkw
	5XlhsUCQoDs9WRs4RgOwCLLnwXdk9UgrP887nrrtaiL355qHixUFipb+Lu08vlJf
	Q==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 44c8qcs6sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:18:22 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 50OFIL5v063289
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Jan 2025 10:18:21 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 24 Jan 2025 10:18:21 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 24 Jan 2025 10:18:21 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 24 Jan 2025 10:18:21 -0500
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.117.116.131])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 50OFHp0N031715;
	Fri, 24 Jan 2025 10:18:11 -0500
From: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Radu
 Sabau" <radu.sabau@analog.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>,
        Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>,
        Cedric Encarnacion
	<cedricjustine.encarnacion@analog.com>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 1/3] dt-bindings: hwmon: (pmbus/adp1050): Add adp1051, adp1055 and ltp8800
Date: Fri, 24 Jan 2025 23:17:44 +0800
Message-ID: <20250124151746.1130-2-cedricjustine.encarnacion@analog.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250124151746.1130-1-cedricjustine.encarnacion@analog.com>
References: <20250124151746.1130-1-cedricjustine.encarnacion@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: MW_c1c9DfkAu3rd_ub8xuNL0NGeo4zm9
X-Proofpoint-ORIG-GUID: MW_c1c9DfkAu3rd_ub8xuNL0NGeo4zm9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240108

Add support for adp1051, adp1055, and ltp8800.
    ADP1051: 6 PWM for I/O Voltage, I/O Current, Temperature
    ADP1055: 6 PWM for I/O Voltage, I/O Current, Power, Temperature
    LTP8800-1A/-2/-4A: 150A/135A/200A DC/DC µModule Regulator

Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
---
 .../bindings/hwmon/pmbus/adi,adp1050.yaml         | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
index 10c2204bc3df..af7530093942 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml
@@ -10,16 +10,27 @@ maintainers:
   - Radu Sabau <radu.sabau@analog.com>
 
 description: |
-   The ADP1050 is used to monitor system voltages, currents and temperatures.
+   The ADP1050 and similar devices are used to monitor system voltages,
+   currents, power, and temperatures.
+
    Through the PMBus interface, the ADP1050 targets isolated power supplies
    and has four individual monitors for input/output voltage, input current
    and temperature.
    Datasheet:
      https://www.analog.com/en/products/adp1050.html
+     https://www.analog.com/en/products/adp1051.html
+     https://www.analog.com/en/products/adp1055.html
+     https://www.analog.com/en/products/ltp8800-1a.html
+     https://www.analog.com/en/products/ltp8800-2.html
+     https://www.analog.com/en/products/ltp8800-4a.html
 
 properties:
   compatible:
-    const: adi,adp1050
+    enum:
+      - adi,adp1050
+      - adi,adp1051
+      - adi,adp1055
+      - adi,ltp8800
 
   reg:
     maxItems: 1
-- 
2.39.5


