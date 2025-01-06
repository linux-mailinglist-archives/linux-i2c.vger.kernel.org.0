Return-Path: <linux-i2c+bounces-8929-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C803A02805
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 15:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 401E01650EF
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2025 14:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBE91DED49;
	Mon,  6 Jan 2025 14:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="bkx5skYo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F377E1DE3A6;
	Mon,  6 Jan 2025 14:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736173817; cv=none; b=tEkEXDT48/EFOfD+baUOhH/WIs+ZfzWuBEg+eF3iIciO4Dx3iITJmooAwcOta+a7fDnf1csEDbm0jG8nzqoovvg1PVnXhNs+KUjDPPv7K34jXAWtPT7s/MeA/n9Yvlw+j3gP+SG17p9qnXngC3Cde8Rw6NndcMNkdGdWjm9YywI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736173817; c=relaxed/simple;
	bh=r3U+ElYv0Q/lO3c2LGWoLkqmOyVudtci8LerzAAkUiU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wgf/gewHAssB9oqBoAOyEWbWMqGWkRtn//GzkHBqABx4IH8yKggugI+bgvQRTo92fSow9SMAiAWRSHirUWoLOcp3PtwtnhMsN6j/r6DSpfTb3FwsmRjZ7arHs3hGFyl+csQMxCL3TfQqazQjSYpBuwnDwYgQExAxBiHc94ZUrm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=bkx5skYo; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506C8h69008190;
	Mon, 6 Jan 2025 08:18:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Zrl78
	azyM1CRd4VbkGiAPhxsvhiFxZwrqSWNDV5eHjM=; b=bkx5skYo+2QUrB5SAzIaa
	619CkNpMmD9Inrq4o2wK/mKUmh0nF6YTfB3LSsPkem+GVfHTow4CNyNCDXXJnLLw
	2TC4je3umRMoSrXKWS9l89CU6/+GWIlMbLoPZoN3cYGFNFJCqotAh2wis2j8uSiK
	bCTBF9gSjvY+FeXQ/K/pP6sIGhzp0U20eGw2fAVzwW+2yWRiN0OsdKU77HDWbewV
	XCREuvEwSkzNj9Jc8p++IFqqDe8aLdWOk8spkuGHEIVh5WOqx1QK5nstkM0E9Oxb
	2oxfQ21xhcEMBXn/PzR0ClmAE6GcKOCAqwVhtd/J8F4hv4JpaZdEXME0ZpFtATLK
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4409wg1cb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 08:18:14 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 506DIDFi036672
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jan 2025 08:18:13 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 6 Jan 2025
 08:18:12 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 6 Jan 2025 08:18:12 -0500
Received: from JGERONI2-L01.ad.analog.com (JGERONI2-L01.ad.analog.com [10.117.223.41])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 506DHlGS001854;
	Mon, 6 Jan 2025 08:18:04 -0500
From: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
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
        Wolfram Sang
	<wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] hwmon: (pmbus/adm1275) add adm1273 support
Date: Mon, 6 Jan 2025 21:17:40 +0800
Message-ID: <20250106131740.305988-3-johnerasmusmari.geronimo@analog.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250106131740.305988-1-johnerasmusmari.geronimo@analog.com>
References: <20250106131740.305988-1-johnerasmusmari.geronimo@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: srkDgvY3hNKjhpE7swCO8rMWpuP33TxO
X-Proofpoint-GUID: srkDgvY3hNKjhpE7swCO8rMWpuP33TxO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 adultscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060117

Add support for adm1273 which is similar to adm1275 and other chips
of the series.

Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
---
 Documentation/hwmon/adm1275.rst | 28 ++++++++++++++++++----------
 drivers/hwmon/pmbus/Kconfig     |  2 +-
 drivers/hwmon/pmbus/adm1275.c   | 10 ++++++----
 3 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/Documentation/hwmon/adm1275.rst b/Documentation/hwmon/adm1275.rst
index 467daf8ce..57bd7a850 100644
--- a/Documentation/hwmon/adm1275.rst
+++ b/Documentation/hwmon/adm1275.rst
@@ -19,6 +19,14 @@ Supported chips:
 
     Datasheet: www.analog.com/static/imported-files/data_sheets/ADM1272.pdf
 
+  * Analog Devices ADM1273
+
+    Prefix: 'adm1273'
+
+    Addresses scanned: -
+
+    Datasheet: Not yet publicly available
+
   * Analog Devices ADM1275
 
     Prefix: 'adm1275'
@@ -66,14 +74,14 @@ Description
 -----------
 
 This driver supports hardware monitoring for Analog Devices ADM1075, ADM1272,
-ADM1275, ADM1276, ADM1278, ADM1281, ADM1293, and ADM1294 Hot-Swap Controller and
-Digital Power Monitors.
+ADM1273, ADM1275, ADM1276, ADM1278, ADM1281, ADM1293, and ADM1294 Hot-Swap
+Controller and Digital Power Monitors.
 
-ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1281, ADM1293, and ADM1294 are hot-swap
-controllers that allow a circuit board to be removed from or inserted into
-a live backplane. They also feature current and voltage readback via an
-integrated 12 bit analog-to-digital converter (ADC), accessed using a
-PMBus interface.
+ADM1075, ADM1272, ADM1273, ADM1275, ADM1276, ADM1278, ADM1281, ADM1293, and
+ADM1294 are hot-swap controllers that allow a circuit board to be removed from
+or inserted into a live backplane. They also feature current and voltage
+readback via an integrated 12 bit analog-to-digital converter (ADC), accessed
+using a PMBus interface.
 
 The driver is a client driver to the core PMBus driver. Please see
 Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
@@ -141,7 +149,7 @@ power1_input_highest	Highest observed input power.
 power1_reset_history	Write any value to reset history.
 
 			Power attributes are supported on ADM1075, ADM1272,
-			ADM1276, ADM1293, and ADM1294.
+			ADM1273, ADM1276, ADM1293, and ADM1294.
 
 temp1_input		Chip temperature.
 temp1_max		Maximum chip temperature.
@@ -151,6 +159,6 @@ temp1_crit_alarm	Critical temperature high alarm.
 temp1_highest		Highest observed temperature.
 temp1_reset_history	Write any value to reset history.
 
-			Temperature attributes are supported on ADM1272 and
-			ADM1278, and ADM1281.
+			Temperature attributes are supported on ADM1272,
+			ADM1273, ADM1278, and ADM1281.
 ======================= =======================================================
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 43b6df04e..233533e28 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -51,7 +51,7 @@ config SENSORS_ADM1275
 	tristate "Analog Devices ADM1275 and compatibles"
 	help
 	  If you say yes here you get hardware monitoring support for Analog
-	  Devices ADM1075, ADM1272, ADM1275, ADM1276, ADM1278, ADM1281,
+	  Devices ADM1075, ADM1272, ADM1273, ADM1275, ADM1276, ADM1278, ADM1281,
 	  ADM1293, and ADM1294 Hot-Swap Controller and Digital Power Monitors.
 
 	  This driver can also be built as a module. If so, the module will
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 127593e10..7d175baa5 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -18,7 +18,7 @@
 #include <linux/log2.h>
 #include "pmbus.h"
 
-enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1281, adm1293, adm1294 };
+enum chips { adm1075, adm1272, adm1273, adm1275, adm1276, adm1278, adm1281, adm1293, adm1294 };
 
 #define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
 #define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
@@ -479,6 +479,7 @@ static int adm1275_read_byte_data(struct i2c_client *client, int page, int reg)
 static const struct i2c_device_id adm1275_id[] = {
 	{ "adm1075", adm1075 },
 	{ "adm1272", adm1272 },
+	{ "adm1273", adm1273 },
 	{ "adm1275", adm1275 },
 	{ "adm1276", adm1276 },
 	{ "adm1278", adm1278 },
@@ -555,9 +556,9 @@ static int adm1275_probe(struct i2c_client *client)
 			   "Device mismatch: Configured %s, detected %s\n",
 			   client->name, mid->name);
 
-	if (mid->driver_data == adm1272 || mid->driver_data == adm1278 ||
-	    mid->driver_data == adm1281 || mid->driver_data == adm1293 ||
-	    mid->driver_data == adm1294)
+	if (mid->driver_data == adm1272 || mid->driver_data == adm1273 ||
+	    mid->driver_data == adm1278 || mid->driver_data == adm1281 ||
+	    mid->driver_data == adm1293 || mid->driver_data == adm1294)
 		config_read_fn = i2c_smbus_read_word_data;
 	else
 		config_read_fn = i2c_smbus_read_byte_data;
@@ -630,6 +631,7 @@ static int adm1275_probe(struct i2c_client *client)
 			  PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
 		break;
 	case adm1272:
+	case adm1273:
 		data->have_vout = true;
 		data->have_pin_max = true;
 		data->have_temp_max = true;
-- 
2.34.1


