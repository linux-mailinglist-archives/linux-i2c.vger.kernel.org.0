Return-Path: <linux-i2c+bounces-2990-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0593A8A79A5
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 02:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 106DE1C221CF
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 00:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2A2620;
	Wed, 17 Apr 2024 00:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="E+xQTdlg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20278196;
	Wed, 17 Apr 2024 00:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713312498; cv=none; b=mCjZrHuVo8xigH3RkvXtg/VyXJMUejIdUtclPNvi+/twjK3s4hkc/21oN7pxKiTEXs03aZ4nIR9lhWEFDfreY/5fA8lI0kjAOZXmh1DQk+53TkgjbIAMlqt1goEQrXjH0YDXeGQt8qSlCc1QlNbj7x88bV+uEd2soPPx6bgimrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713312498; c=relaxed/simple;
	bh=+jUzp1bNrppkFVGvwAAgqu7F5lxjI42n3A9YZFyhLz8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sNi7KanLsQyUz9km+tDAr+Gc2N9AxXjFP768zg9+gWTe0jcmLkaXK139ruWgs46zMx8Bx749MOR3b53UkkA3dgJZ6zZ3xji3BE6dXaqQ87gn4eC+NIGPzo9tERgt1gKKD4iiofUTpXlPDilZkHkRaNMseihlygKUCV9fdwoiW6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=E+xQTdlg; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43GMaV8H000850;
	Tue, 16 Apr 2024 20:08:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=DKIM;
	 bh=Qfl8TBKy6/Mk7LZt1wFhTqwLNUtzAsXi2jLnFnIJkSM=; b=E+xQTdlgt3iL
	zsdwOIKtLztVwmdBYbhyX3Ovcbx5bFRCLxykjFH7L0V9TUZjAupczmGbOUToR0Hy
	2ggkphv2v7wLGby4JNHTqEqz2Iz9YXkRrs8pmgLSgbb7im/x9Oz7UWow1GncDYwQ
	SFpV5rteqk6Rdj9WT3SxorQw5Wgyvd+BRxXvYOc3UAJ6sY3wCNGDHwoN49q5QkkR
	z2uJ+Y9G2/8Q19/bAnbWStQUUqrrQ9UwKeExYPhy5Bttb6B/U7Di13tBcyuuR0KD
	p9Ehs75JyeqUh14GTrAwfAsrghIotdcgcma+mjepUP9XscRBG3n87bDTv0TZc8NR
	UpVBSQ0AxQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3xhvv99fr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 20:07:59 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 43H07woP061335
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Apr 2024 20:07:58 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 16 Apr 2024 20:07:57 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 16 Apr 2024 20:07:57 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 16 Apr 2024 20:07:57 -0400
Received: from JSANBUEN-L01.ad.analog.com (JSANBUEN-L01.ad.analog.com [10.117.220.64])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 43H07T2v022696;
	Tue, 16 Apr 2024 20:07:48 -0400
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
Subject: [PATCH 2/2] hwmon: pmbus: adm1275: add adm1281 support
Date: Wed, 17 Apr 2024 08:07:22 +0800
Message-ID: <20240417000722.919-3-jose.sanbuenaventura@analog.com>
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
X-Proofpoint-GUID: doD88ns1HBWcBkuhAO1tGxY4xxjJ1QA8
X-Proofpoint-ORIG-GUID: doD88ns1HBWcBkuhAO1tGxY4xxjJ1QA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_19,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404160158

Adding support for adm1281 which is similar to adm1275

ADM1281 has STATUS_CML read support which is also being added.

Signed-off-by: Jose Ramon San Buenaventura <jose.sanbuenaventura@analog.com>
---
 Documentation/hwmon/adm1275.rst | 14 +++++++++++---
 drivers/hwmon/pmbus/Kconfig     |  4 ++--
 drivers/hwmon/pmbus/adm1275.c   | 27 +++++++++++++++++++++++++--
 3 files changed, 38 insertions(+), 7 deletions(-)

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
index e2c61d6fa..6c3e8840f 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -18,7 +18,7 @@
 #include <linux/log2.h>
 #include "pmbus.h"
 
-enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1293, adm1294 };
+enum chips { adm1075, adm1272, adm1275, adm1276, adm1278, adm1281, adm1293, adm1294 };
 
 #define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
 #define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
@@ -101,6 +101,7 @@ struct adm1275_data {
 	bool have_pin_max;
 	bool have_temp_max;
 	bool have_power_sampling;
+	bool have_status_cml;
 	struct pmbus_driver_info info;
 };
 
@@ -469,6 +470,22 @@ static int adm1275_read_byte_data(struct i2c_client *client, int page, int reg)
 				ret |= PB_VOLTAGE_UV_WARNING;
 		}
 		break;
+	case PMBUS_STATUS_CML:
+		if (!data->have_status_cml)
+			return -ENXIO;
+
+		ret = pmbus_read_byte_data(client, page, PMBUS_STATUS_BYTE);
+		if (ret < 0)
+			break;
+
+		if (ret & PB_STATUS_CML) {
+			ret = pmbus_read_byte_data(client, page, PMBUS_STATUS_CML);
+			if (ret < 0)
+				break;
+		} else {
+			ret = 0;
+		}
+		break;
 	default:
 		ret = -ENODATA;
 		break;
@@ -482,6 +499,7 @@ static const struct i2c_device_id adm1275_id[] = {
 	{ "adm1275", adm1275 },
 	{ "adm1276", adm1276 },
 	{ "adm1278", adm1278 },
+	{ "adm1281", adm1281 },
 	{ "adm1293", adm1293 },
 	{ "adm1294", adm1294 },
 	{ }
@@ -555,7 +573,8 @@ static int adm1275_probe(struct i2c_client *client)
 			   client->name, mid->name);
 
 	if (mid->driver_data == adm1272 || mid->driver_data == adm1278 ||
-	    mid->driver_data == adm1293 || mid->driver_data == adm1294)
+	    mid->driver_data == adm1281 || mid->driver_data == adm1293 ||
+	    mid->driver_data == adm1294)
 		config_read_fn = i2c_smbus_read_word_data;
 	else
 		config_read_fn = i2c_smbus_read_byte_data;
@@ -703,6 +722,10 @@ static int adm1275_probe(struct i2c_client *client)
 			  PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
 		break;
 	case adm1278:
+	case adm1281:
+		if (data->id == adm1281)
+			data->have_status_cml = true;
+
 		data->have_vout = true;
 		data->have_pin_max = true;
 		data->have_temp_max = true;
-- 
2.39.2


