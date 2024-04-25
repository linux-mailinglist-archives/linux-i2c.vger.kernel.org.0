Return-Path: <linux-i2c+bounces-3123-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E98258B1B9E
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 09:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7EB52862F7
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 07:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B72978C7F;
	Thu, 25 Apr 2024 07:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="qAiszG6n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9924F6F06D;
	Thu, 25 Apr 2024 07:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714029044; cv=none; b=B8+d/leG1SCOAdASBXe5ZLTsJrWQH0BzDX3MiQVyHUnR6MUmyPeaKbDF76lUVRSD0MSBipxjdUquUst8ou7F/igZiKoB24vd/bPmBKVR/txUV+AHKvnoY7iJIWFo2vett+gbbmTuSGfxDwsml/1xIr1eCk7R6I+EXLXqjHg6aRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714029044; c=relaxed/simple;
	bh=qfzy2c+zXk/cPUkUbNebr6FQtTLjdbmMKboKcleeKKk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZxPMRaJDBrz5JNi8ceV87yVIp4BJEAv1lx3lLidRkoHjFkPup2A6SD74FOBgEnwQCsfc9lXMf1vHgYRrn82FlItVxjDUhzQL1OV0Y55RR3LyyrupcFfjLft0i7zN2tVh/TRi94N8b3vLX5bj4JbGwSUnaeJKWj7U739Em/FAm6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=qAiszG6n; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P5ss9X001033;
	Thu, 25 Apr 2024 03:10:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=DKIM;
	 bh=5+Aikj5kSEi+2qQ6QFsL+0wtIRLT+xDhtujqoHvM/5E=; b=qAiszG6ngrOI
	oQD6+M0bkq9SsU2VfOkMenK93ba7AggOx3rl1Fi/jucDmQjBsSnALAslwctsCQPg
	6TLbFJOHtWK837ENcMqu2TZ/Vo10fK/LztShvX6uQmxhx7SUGYZTOhlA3/ZfPVfS
	v5EpvlaRd0YIdlyECCMNU8mijP6hvnWp2ZgmDBRNYNjJAPSjRyk+ssRky19aIRC4
	iQllBnqVgZakNO/iaHon2u7ohyWTcyBKIj5W6nU9E25dZln2wScL6T4EMG9Ckxa4
	bhS4JpBxqntpTT11UKE06fjH+uhM3U1DYKoblYu2pzSBu+PPd23MhzDWn1XRlGjC
	3CwFwhRYDQ==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3xq3qmbcjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 03:10:22 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 43P7ALPW053969
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Apr 2024 03:10:21 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 25 Apr 2024 03:10:20 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 25 Apr 2024 03:10:20 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 25 Apr 2024 03:10:20 -0400
Received: from JSANBUEN-L01.ad.analog.com (JSANBUEN-L01.ad.analog.com [10.117.220.64])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 43P79tHl006908;
	Thu, 25 Apr 2024 03:10:12 -0400
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
 Chiu" <Delphine_CC_Chiu@Wiwynn.com>
Subject: [PATCH v3 2/2] hwmon: pmbus: adm1275: add adm1281 support
Date: Thu, 25 Apr 2024 15:09:48 +0800
Message-ID: <20240425070948.25788-3-jose.sanbuenaventura@analog.com>
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
X-Proofpoint-GUID: MK6N6urHKuwhvGwYap2MkelzAH8lyo8J
X-Proofpoint-ORIG-GUID: MK6N6urHKuwhvGwYap2MkelzAH8lyo8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_06,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 mlxscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250050

Adding support for adm1281 which is similar to adm1275

Signed-off-by: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>
---
 Documentation/hwmon/adm1275.rst | 14 +++++++++++---
 drivers/hwmon/pmbus/Kconfig     |  4 ++--
 drivers/hwmon/pmbus/adm1275.c   |  7 +++++--
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/Documentation/hwmon/adm1275.rst b/Documentation/hwmon/adm1275.rst
index 804590eea..467daf8ce 100644
--- a/Documentation/hwmon/adm1275.rst
+++ b/Documentation/hwmon/adm1275.rst
@@ -43,6 +43,14 @@ Supported chips:
 
     Datasheet: www.analog.com/static/imported-files/data_sheets/ADM1278.pdf
 
+  * Analog Devices ADM1281
+
+    Prefix: 'adm1281'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/adm1281.pdf
+
   * Analog Devices ADM1293/ADM1294
 
     Prefix: 'adm1293', 'adm1294'
@@ -58,10 +66,10 @@ Description
 -----------
 
 This driver supports hardware monitoring for Analog Devices ADM1075, ADM1272,
-ADM1275, ADM1276, ADM1278, ADM1293, and ADM1294 Hot-Swap Controller and
+ADM1275, ADM1276, ADM1278, ADM1281, ADM1293, and ADM1294 Hot-Swap Controller and
 Digital Power Monitors.
 
-ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1293, and ADM1294 are hot-swap
+ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1281, ADM1293, and ADM1294 are hot-swap
 controllers that allow a circuit board to be removed from or inserted into
 a live backplane. They also feature current and voltage readback via an
 integrated 12 bit analog-to-digital converter (ADC), accessed using a
@@ -144,5 +152,5 @@ temp1_highest		Highest observed temperature.
 temp1_reset_history	Write any value to reset history.
 
 			Temperature attributes are supported on ADM1272 and
-			ADM1278.
+			ADM1278, and ADM1281.
 ======================= =======================================================
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 557ae0c41..9c1d0d7d5 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -51,8 +51,8 @@ config SENSORS_ADM1275
 	tristate "Analog Devices ADM1275 and compatibles"
 	help
 	  If you say yes here you get hardware monitoring support for Analog
-	  Devices ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1293,
-	  and ADM1294 Hot-Swap Controller and Digital Power Monitors.
+	  Devices ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1281,
+	  ADM1293, and ADM1294 Hot-Swap Controller and Digital Power Monitors.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called adm1275.
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index e2c61d6fa..59ffc0828 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -18,7 +18,7 @@
 #include <linux/log2.h>
 #include "pmbus.h"
 
-enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1293, adm1294 };
+enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1281, adm1293, adm1294 };
 
 #define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
 #define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
@@ -482,6 +482,7 @@ static const struct i2c_device_id adm1275_id[] = {
 	{ "adm1275", adm1275 },
 	{ "adm1276", adm1276 },
 	{ "adm1278", adm1278 },
+	{ "adm1281", adm1281 },
 	{ "adm1293", adm1293 },
 	{ "adm1294", adm1294 },
 	{ }
@@ -555,7 +556,8 @@ static int adm1275_probe(struct i2c_client *client)
 			   client->name, mid->name);
 
 	if (mid->driver_data == adm1272 || mid->driver_data == adm1278 ||
-	    mid->driver_data == adm1293 || mid->driver_data == adm1294)
+	    mid->driver_data == adm1281 || mid->driver_data == adm1293 ||
+	    mid->driver_data == adm1294)
 		config_read_fn = i2c_smbus_read_word_data;
 	else
 		config_read_fn = i2c_smbus_read_byte_data;
@@ -703,6 +705,7 @@ static int adm1275_probe(struct i2c_client *client)
 			  PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
 		break;
 	case adm1278:
+	case adm1281:
 		data->have_vout = true;
 		data->have_pin_max = true;
 		data->have_temp_max = true;
-- 
2.39.2


