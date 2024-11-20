Return-Path: <linux-i2c+bounces-8070-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D736E9D32CF
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 04:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D6872840C7
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 03:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F8E156669;
	Wed, 20 Nov 2024 03:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="U2r/mlmj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDE243179;
	Wed, 20 Nov 2024 03:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732075177; cv=none; b=I2UhmcZSHNSUO5Mdh3yL6hgE9fXLdcgUUGjPRRObB+BK59W2aW426CDs7KvpCjhuGCuIuRB+GKJERGcIVdnx7jEGra0y6ba3NrGESznrkvXF12nYWrMYXlVIa2ftg2soRgJHoDOAeK7/PdqOwgadv1vob8ZZmtHVAOJKMAFwJwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732075177; c=relaxed/simple;
	bh=dwQD5PiPjmvNB4xBLjwVEgDTENZ1YHqqS7aXgbXU1Sc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WBvIBC3cLn34Iea9ZqPre1MZ5E25OwneKVgc9a9N5yHIyDa8I86CYbb5OsNaHwOpG+VYoLhyy3zgAFurHRVzXpx6CBUP12QC1li9f9tK2aExl3OuYF3DKFHH5a3hDdJJ2AcwF+iGKs6lbErezLQZzbkdSYXvf7BpRV3C/Ekz61E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=U2r/mlmj; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK2RDx5015516;
	Tue, 19 Nov 2024 22:59:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=G1cAy
	/USucuQvgQhGsPIV7Nf+joe8pU5htvjOJTf24U=; b=U2r/mlmjTPWvSLjtvCbKV
	XltF+d7fgnsxSWOWZqHPIbQAL0CqOHFxH56TDxNso6va1QsViTcbJ3jDFC0PQ40T
	5OCxdP52MtvqmgmhUCndhE/r/D0iRnM/ERbpRm5FvkmWobvR1wYmkYYHdiqMaffB
	jqt+SQ8+jV+HnP1QQX555ILya/aK7Mj86UH9z1pqZQir7/GPrz8oxeyreVsCuTtV
	cwCj/shm+zfFoUB6dhQ3/66rGks+lyrf13BAerm2AzQzvXOVbTbp1dFtgH9dU3Ig
	ZdwO1zKexgBM2JBX76KH02PEuIWra1aq12idHROWpRoOvioCHc8+l3XP03MXzowy
	w==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 43170framh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 22:59:06 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 4AK3x5L3029651
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Nov 2024 22:59:05 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 19 Nov
 2024 22:59:05 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 19 Nov 2024 22:59:05 -0500
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.116.39.203])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 4AK3wWZk027365;
	Tue, 19 Nov 2024 22:58:53 -0500
From: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Radu
 Sabau <radu.sabau@analog.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>,
        Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>,
        Cedric Encarnacion
	<cedricjustine.encarnacion@analog.com>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
Subject: [PATCH 1/2] dt-bindings: hwmon: (pmbus/adp1050): Add bindings for adp1051, adp1055 and ltp8800
Date: Wed, 20 Nov 2024 11:58:25 +0800
Message-ID: <20241120035826.3920-2-cedricjustine.encarnacion@analog.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
References: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: rm8orIlgiTXAtLX57RSmLljpxBPU-A4O
X-Proofpoint-ORIG-GUID: rm8orIlgiTXAtLX57RSmLljpxBPU-A4O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411200028

add dt-bindings for adp1051, adp1055, and ltp8800 pmbus.
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


