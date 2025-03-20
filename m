Return-Path: <linux-i2c+bounces-9931-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C81A69EE9
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 04:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3F594273A3
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 03:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0981EEA48;
	Thu, 20 Mar 2025 03:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="rKZTisgn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEFA1EDA3B;
	Thu, 20 Mar 2025 03:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742443001; cv=none; b=XvzgHzMgNJ4c3kFkT8VlU6jfyepXtgFkjRSwxvbL+vOlyY11rjkyTZ5YSWobL+B6MLNr7ZxQ1OHW7n8092+laXBKjUbXifWJkr54pB+6MPsL4hG1sW0yH+qer9YDvqBtvSvMSPB460rj250NiUpEod9oJNvBJmkm0iw3EcO4Atw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742443001; c=relaxed/simple;
	bh=CXV04TlxekKR/bTBoGcWZhfgq3TJzR9cfIhLGbDNdsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nz7K6ELYSG6NWYL/CWFMNrQa41j7as/A/IKzqP5v04EVd70GwMHihtK3o6zkA3DlDIZdIEAtXwAnKCLSuK6UY/h/sinbzJbWVtg6b4kpdiA2Fm0iac74cSj4gpY6Cuhdfk6x2IhScv7DKN9VLoebBd+0Fd9q/Rg7mCAvV6iaS2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=rKZTisgn; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K3Y40G024288;
	Wed, 19 Mar 2025 23:56:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=faItO
	toLkHyW2FMW/OhFXyD/aqnxepV8oYjEmgATTEU=; b=rKZTisgnnZvFizHRmMJ6C
	WgjS1jJlROJ0Z9TIDrs5k6/GlRHkDOtgLlStzqTY5cuT6+U2unKRc1BozF1O6CI9
	Y56Bq5YU6TxfSJzCV2zn0qFNq0NlYyGMzeANYBm+6yz0AbmJ+zM82aCSyOZA6zIy
	xGdo0YKIa968UzQ8NTqCfUag2QIGP0L4adp3+CjVywAoOrt091jLzBca3ndzQt5I
	hcpq+66GQNHW0QSry/e/e9cmMXDrNsl3HDwEcEFvNekKP2VOf4/Xyu5JP7JtmA3y
	vvL/JVoJ/UOFUMZKIM5Tg2Ozijm3Hw1QPMROUG51a2q/44vccBtKbvqRU7OOwnFv
	g==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 45gb7sr2kr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 23:56:24 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 52K3uLJA044224
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Mar 2025 23:56:21 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Wed, 19 Mar 2025 23:56:21 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Wed, 19 Mar 2025 23:56:21 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 19 Mar 2025 23:56:21 -0400
Received: from ATORRENO-L02.ad.analog.com (ATORRENO-L02.ad.analog.com [10.117.223.3])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 52K3tvif030363;
	Wed, 19 Mar 2025 23:56:12 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Thu, 20 Mar 2025 11:55:48 +0800
Subject: [PATCH 2/2] hwmon: (pmbus/max3440): add support adpm12160
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250320-dev_adpm12160-v1-2-8f7b975eac75@analog.com>
References: <20250320-dev_adpm12160-v1-0-8f7b975eac75@analog.com>
In-Reply-To: <20250320-dev_adpm12160-v1-0-8f7b975eac75@analog.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        "Alexis Czezar
 Torreno" <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742442957; l=8633;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=CXV04TlxekKR/bTBoGcWZhfgq3TJzR9cfIhLGbDNdsg=;
 b=i7a31jhbqMoSNcbaTmgNwVCfqtubkD38YORHCvPXFPMv2cI9cBhusAlQB/oI6nOatX0k19EHV
 ZmUGLBKeiNbBfBvsgoD6cbi/TZxN2zr1GAebg+mppflNwOenPGZhUhy
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=SuiQ6OO0 c=1 sm=1 tr=0 ts=67db91e9 cx=c_pps a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=gAnH3GRIAAAA:8 a=_jlGtV7tAAAA:8 a=vkGcfZK4uBsIXNnpU_sA:9 a=QEXdDO2ut3YA:10
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-GUID: 6wkUh4D5ynwylyreFizCociTIzcC2IoP
X-Proofpoint-ORIG-GUID: 6wkUh4D5ynwylyreFizCociTIzcC2IoP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 clxscore=1011 spamscore=0
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200023

ASPM12160 is a quarter brick DC/DC Power Module. It is a high
power non-isolated converter capable of delivering a fully
regulated 12V, with continuous power level of 1600W with peak
power at 2400W for a limited time. Uses PMBus Configuration.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 Documentation/hwmon/max34440.rst | 31 +++++++++++++++++--------
 drivers/hwmon/pmbus/Kconfig      |  1 +
 drivers/hwmon/pmbus/max34440.c   | 49 +++++++++++++++++++++++++++++++++++-----
 3 files changed, 66 insertions(+), 15 deletions(-)

diff --git a/Documentation/hwmon/max34440.rst b/Documentation/hwmon/max34440.rst
index b1f3f75091bb8e233e766c24913194dd62b0cd90..65522efa57563389fce54b51829964d62f970c27 100644
--- a/Documentation/hwmon/max34440.rst
+++ b/Documentation/hwmon/max34440.rst
@@ -3,6 +3,14 @@ Kernel driver max34440
 
 Supported chips:
 
+  * ADI ADPM12160
+
+    Prefixes: 'adpm12160'
+
+    Addresses scanned: -
+
+    Datasheet: -
+
   * Maxim MAX34440
 
     Prefixes: 'max34440'
@@ -67,13 +75,14 @@ Author: Guenter Roeck <linux@roeck-us.net>
 Description
 -----------
 
-This driver supports hardware monitoring for Maxim MAX34440 PMBus 6-Channel
-Power-Supply Manager, MAX34441 PMBus 5-Channel Power-Supply Manager
-and Intelligent Fan Controller, and MAX34446 PMBus Power-Supply Data Logger.
-It also supports the MAX34451, MAX34460, and MAX34461 PMBus Voltage Monitor &
-Sequencers. The MAX34451 supports monitoring voltage or current of 12 channels
-based on GIN pins. The MAX34460 supports 12 voltage channels, and the MAX34461
-supports 16 voltage channels.
+This driver supports multiple devices: hardware monitoring for Maxim MAX34440
+PMBus 6-Channel Power-Supply Manager, MAX34441 PMBus 5-Channel Power-Supply
+Manager and Intelligent Fan Controller, and MAX34446 PMBus Power-Supply Data
+Logger; PMBus Voltage Monitor and Sequencers for MAX34451, MAX34460, and
+MAX34461; PMBus DC/DC Power Module ADPM12160. The MAX34451 supports monitoring
+voltage or current of 12 channels based on GIN pins. The MAX34460 supports 12
+voltage channels, and the MAX34461 supports 16 voltage channels. The ADPM1260
+also monitors both input and output of voltage and current.
 
 The driver is a client driver to the core PMBus driver. Please see
 Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
@@ -97,7 +106,6 @@ For MAX34451, version MAX34451ETNA6+ and later are denoted with prefix
 'max34451_na6'. The previous versions contains some errors on the PMBUS
 addresses and these are fixed on the later versions.
 
-
 Platform data support
 ---------------------
 
@@ -132,7 +140,10 @@ in[1-6]_highest		Historical maximum voltage.
 in[1-6]_reset_history	Write any value to reset history.
 ======================= =======================================================
 
-.. note:: MAX34446 only supports in[1-4].
+.. note::
+
+    - MAX34446 only supports in[1-4].
+    - ADPM12160 only supports in[1-2]. Label is "vin1" and "vout1" respectively.
 
 Curr
 ~~~~
@@ -154,6 +165,7 @@ curr[1-6]_reset_history	Write any value to reset history.
 
     - in6 and curr6 attributes only exist for MAX34440.
     - MAX34446 only supports curr[1-4].
+    - For ADPM12160, curr[1] is "iin1" and curr[2-6] are "iout[1-5].
 
 Power
 ~~~~~
@@ -189,6 +201,7 @@ temp[1-8]_reset_history	Write any value to reset history.
 .. note::
    - temp7 and temp8 attributes only exist for MAX34440.
    - MAX34446 only supports temp[1-3].
+   - ADPM12160 only supports temp[1].
 
 
 .. note::
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index c9b3c314998234e639db1770c18c6f75fa037d25..b50bb6eceaa1419a928ff5b2153260738978f9a8 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -324,6 +324,7 @@ config SENSORS_MAX34440
 	help
 	  If you say yes here you get hardware monitoring support for Maxim
 	  MAX34440, MAX34441, MAX34446, MAX34451, MAX34460, and MAX34461.
+	  Other compatible includes ADPM12160.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called max34440.
diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index d483c01f256c96f048c9da5981f10f52402d981c..48e459252391048c90f373b3b73de6871392880c 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -15,6 +15,7 @@
 #include "pmbus.h"
 
 enum chips {
+	adpm12160,
 	max34440,
 	max34441,
 	max34446,
@@ -68,7 +69,7 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
 
 	switch (reg) {
 	case PMBUS_IOUT_OC_FAULT_LIMIT:
-		if (data->id == max34451_na6)
+		if (data->id == max34451_na6 || data->id == adpm12160)
 			ret = pmbus_read_word_data(client, page, phase,
 						   PMBUS_IOUT_OC_FAULT_LIMIT);
 		else
@@ -76,7 +77,7 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
 						   MAX34440_IOUT_OC_FAULT_LIMIT);
 		break;
 	case PMBUS_IOUT_OC_WARN_LIMIT:
-		if (data->id == max34451_na6)
+		if (data->id == max34451_na6 || data->id == adpm12160)
 			ret = pmbus_read_word_data(client, page, phase,
 						   PMBUS_IOUT_OC_WARN_LIMIT);
 		else
@@ -93,7 +94,7 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
 		break;
 	case PMBUS_VIRT_READ_IOUT_AVG:
 		if (data->id != max34446 && data->id != max34451 &&
-		    data->id != max34451_na6)
+		    data->id != max34451_na6 && data->id != adpm12160))
 			return -ENXIO;
 		ret = pmbus_read_word_data(client, page, phase,
 					   MAX34446_MFR_IOUT_AVG);
@@ -151,7 +152,7 @@ static int max34440_write_word_data(struct i2c_client *client, int page,
 
 	switch (reg) {
 	case PMBUS_IOUT_OC_FAULT_LIMIT:
-		if (data->id == max34451_na6)
+		if (data->id == max34451_na6 || data->id == adpm12160)
 			ret = pmbus_write_word_data(client, page, PMBUS_IOUT_OC_FAULT_LIMIT,
 						    word);
 		else
@@ -159,7 +160,7 @@ static int max34440_write_word_data(struct i2c_client *client, int page,
 						    word);
 		break;
 	case PMBUS_IOUT_OC_WARN_LIMIT:
-		if (data->id == max34451_na6)
+		if (data->id == max34451_na6 || data->id == adpm12160)
 			ret = pmbus_write_word_data(client, page, PMBUS_IOUT_OC_WARN_LIMIT,
 						    word);
 		else
@@ -186,7 +187,7 @@ static int max34440_write_word_data(struct i2c_client *client, int page,
 		ret = pmbus_write_word_data(client, page,
 					    MAX34440_MFR_IOUT_PEAK, 0);
 		if (!ret && (data->id == max34446 || data->id == max34451 ||
-			     data->id == max34451_na6))
+			     data->id == max34451_na6 || data->id == adpm12160))
 			ret = pmbus_write_word_data(client, page,
 					MAX34446_MFR_IOUT_AVG, 0);
 
@@ -321,6 +322,41 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
 	.write_word_data = max34440_write_word_data,
 
 static struct pmbus_driver_info max34440_info[] = {
+	[adpm12160] = {
+		.pages = 19,
+		.format[PSC_VOLTAGE_IN] = direct,
+		.format[PSC_VOLTAGE_OUT] = direct,
+		.format[PSC_CURRENT_IN] = direct,
+		.format[PSC_CURRENT_OUT] = direct,
+		.format[PSC_TEMPERATURE] = direct,
+		.m[PSC_VOLTAGE_IN] = 1,
+		.b[PSC_VOLTAGE_IN] = 0,
+		.R[PSC_VOLTAGE_IN] = 0,
+		.m[PSC_VOLTAGE_OUT] = 1,
+		.b[PSC_VOLTAGE_OUT] = 0,
+		.R[PSC_VOLTAGE_OUT] = 0,
+		.m[PSC_CURRENT_IN] = 1,
+		.b[PSC_CURRENT_IN] = 0,
+		.R[PSC_CURRENT_IN] = 2,
+		.m[PSC_CURRENT_OUT] = 1,
+		.b[PSC_CURRENT_OUT] = 0,
+		.R[PSC_CURRENT_OUT] = 2,
+		.m[PSC_TEMPERATURE] = 1,
+		.b[PSC_TEMPERATURE] = 0,
+		.R[PSC_TEMPERATURE] = 2,
+		/* absent func below [18] are not for monitoring */
+		.func[2] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT,
+		.func[4] = PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[5] = PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[6] = PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[7] = PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[8] = PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT,
+		.func[9] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT,
+		.func[10] = PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT,
+		.func[18] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
+		.read_word_data = max34440_read_word_data,
+		.write_word_data = max34440_write_word_data,
+	},
 	[max34440] = {
 		.pages = 14,
 		.format[PSC_VOLTAGE_IN] = direct,
@@ -538,6 +574,7 @@ static int max34440_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max34440_id[] = {
+	{"adpm12160", adpm12160},
 	{"max34440", max34440},
 	{"max34441", max34441},
 	{"max34446", max34446},

-- 
2.34.1


