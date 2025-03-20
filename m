Return-Path: <linux-i2c+bounces-9932-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F17A69EEC
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 04:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53E7D1899C40
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 03:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64831F0982;
	Thu, 20 Mar 2025 03:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="NITwdWqf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF9B1EDA3D;
	Thu, 20 Mar 2025 03:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742443001; cv=none; b=R/EiOk2yqZkc+ez0CHLMs1rKhv2HLC4WcUOPh8by6YUb/hNKBwjHIY9S8+sPsvhaZUx5dxHbuVhNc+9c5as3IIyExGdzzbn45ijUsmr6bgFgFF5mGqN0Fr5+BWxt35bPsf8iw4Uf034pz9lZ9Ht4iJ2HLTqDJ/UxLGpIAqFNpFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742443001; c=relaxed/simple;
	bh=fmCT0v90oyzA0aTZ1Tgr9IqU4H0CNGKyD8bu5XayWpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FS602a4Ajw7dFQwzZHsG67pt0w8Dl458gOatMxG+j7hRY3Hw00WyNrs1oYXYyijmLufxy9vC39LHBQ1UuKGrTdhxZloyHoEX5dXFBVNYj6Xq+MX1DIYs4HgNpACm5vNpnCvdKMiDHTObk2lMP4mqT1cuPVi7EcceNhI6Ja8w7Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=NITwdWqf; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K3Y40E024288;
	Wed, 19 Mar 2025 23:56:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=DVJBb
	wTtnbTkbd8lrroOGNiPdsk7fe9QMtgaYRzi35I=; b=NITwdWqfZXX3aWw9FvRO3
	MceJMS7K751kxkOHK6p6dg2lMxH2B8j8mn0jODIitfYEJRebK+IIlfW+Jg9UPmq6
	mnCz8AzS+mhCJFLs1M5zzGqLkfKTnXmYwC+qA4nA7AFGcGSKN3K/TYsicY/+lBkJ
	J1b7eXjXxWC+VsGNSae6j552nKedtqBkJQiO2R+llIxfFUbv4XhEahnctSXkOYmh
	C5muqhqkbfUbbGCapJie4aoJYo4dcZFJ/0tQ2POUaXxCxMbAF9GzaN3J4Ifz66Xp
	LS3Yuh/INN/yQhau4lda1NxorL2QsQ+3Dmu1Frv9vZW0kIaJ8fuaA+7dlTDyLf+F
	A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 45gb7sr2kj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 23:56:19 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 52K3uIMW044216
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Mar 2025 23:56:18 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Wed, 19 Mar 2025 23:56:18 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Wed, 19 Mar 2025 23:56:18 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 19 Mar 2025 23:56:18 -0400
Received: from ATORRENO-L02.ad.analog.com (ATORRENO-L02.ad.analog.com [10.117.223.3])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 52K3tvie030363;
	Wed, 19 Mar 2025 23:56:08 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Thu, 20 Mar 2025 11:55:47 +0800
Subject: [PATCH 1/2] hwmon: (pmbus/max34440): Fix support for max34451
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250320-dev_adpm12160-v1-1-8f7b975eac75@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742442957; l=8613;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=fmCT0v90oyzA0aTZ1Tgr9IqU4H0CNGKyD8bu5XayWpA=;
 b=UzP9X2aAwDs+RMAFYkUYqNjqAtLWSGkNE0+EK97Z/A0DEfJyk0wwajXYpD8yAxxPSMnfoozBl
 iXojP7H8Z67A4OcXrvyynDj+XCPz7mKdHI6dFwkgzK78JmxVhJUiGcp
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=SuiQ6OO0 c=1 sm=1 tr=0 ts=67db91e4 cx=c_pps a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=gAnH3GRIAAAA:8 a=pZbETZ21HzVX83SInWEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: dtXnBP5vau4yLjNSqgCTIX1q3RDjDIuN
X-Proofpoint-ORIG-GUID: dtXnBP5vau4yLjNSqgCTIX1q3RDjDIuN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 clxscore=1011 spamscore=0
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200023

The max344** family has an issue with some PMBUS address being switched.
This includes max34451 however version MAX34451-NA6 and later has this
issue fixed and this commit supports that update.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 Documentation/hwmon/max34440.rst |   8 ++-
 drivers/hwmon/pmbus/max34440.c   | 102 ++++++++++++++++++++++++++-------------
 2 files changed, 74 insertions(+), 36 deletions(-)

diff --git a/Documentation/hwmon/max34440.rst b/Documentation/hwmon/max34440.rst
index 162d289f08140341e8e76ab7033834ba07a8b935..b1f3f75091bb8e233e766c24913194dd62b0cd90 100644
--- a/Documentation/hwmon/max34440.rst
+++ b/Documentation/hwmon/max34440.rst
@@ -35,7 +35,7 @@ Supported chips:
 
     PMBus 16-Channel V/I Monitor and 12-Channel Sequencer/Marginer
 
-    Prefixes: 'max34451'
+    Prefixes: 'max34451', 'max34451_na6'
 
     Addresses scanned: -
 
@@ -93,6 +93,10 @@ attribute is set to a positive value. Power measurement is only enabled if
 channel 1 (3) is configured for voltage measurement, and channel 2 (4) is
 configured for current measurement.
 
+For MAX34451, version MAX34451ETNA6+ and later are denoted with prefix
+'max34451_na6'. The previous versions contains some errors on the PMBUS
+addresses and these are fixed on the later versions.
+
 
 Platform data support
 ---------------------
@@ -192,4 +196,4 @@ temp[1-8]_reset_history	Write any value to reset history.
    - MAX34451 supports attribute groups in[1-16] (or curr[1-16] based on
      input pins) and temp[1-5].
    - MAX34460 supports attribute groups in[1-12] and temp[1-5].
-   - MAX34461 supports attribute groups in[1-16] and temp[1-5].
+   - MAX34461 supports attribute groups in[1-16] and temp[1-5].
\ No newline at end of file
diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index c9dda33831ff24e7b5e2fd1956a65e6bd2bfcbb9..d483c01f256c96f048c9da5981f10f52402d981c 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -14,7 +14,15 @@
 #include <linux/i2c.h>
 #include "pmbus.h"
 
-enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
+enum chips {
+	max34440,
+	max34441,
+	max34446,
+	max34451,
+	max34451_na6,
+	max34460,
+	max34461,
+};
 
 #define MAX34440_MFR_VOUT_PEAK		0xd4
 #define MAX34440_MFR_IOUT_PEAK		0xd5
@@ -34,6 +42,7 @@ enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
 /*
  * The whole max344* family have IOUT_OC_WARN_LIMIT and IOUT_OC_FAULT_LIMIT
  * swapped from the standard pmbus spec addresses.
+ * For max34451, version MAX34451ETNA6+ and later has this issue fixed.
  */
 #define MAX34440_IOUT_OC_WARN_LIMIT	0x46
 #define MAX34440_IOUT_OC_FAULT_LIMIT	0x4A
@@ -59,12 +68,20 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
 
 	switch (reg) {
 	case PMBUS_IOUT_OC_FAULT_LIMIT:
-		ret = pmbus_read_word_data(client, page, phase,
-					   MAX34440_IOUT_OC_FAULT_LIMIT);
+		if (data->id == max34451_na6)
+			ret = pmbus_read_word_data(client, page, phase,
+						   PMBUS_IOUT_OC_FAULT_LIMIT);
+		else
+			ret = pmbus_read_word_data(client, page, phase,
+						   MAX34440_IOUT_OC_FAULT_LIMIT);
 		break;
 	case PMBUS_IOUT_OC_WARN_LIMIT:
-		ret = pmbus_read_word_data(client, page, phase,
-					   MAX34440_IOUT_OC_WARN_LIMIT);
+		if (data->id == max34451_na6)
+			ret = pmbus_read_word_data(client, page, phase,
+						   PMBUS_IOUT_OC_WARN_LIMIT);
+		else
+			ret = pmbus_read_word_data(client, page, phase,
+						   MAX34440_IOUT_OC_WARN_LIMIT);
 		break;
 	case PMBUS_VIRT_READ_VOUT_MIN:
 		ret = pmbus_read_word_data(client, page, phase,
@@ -75,7 +92,8 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
 					   MAX34440_MFR_VOUT_PEAK);
 		break;
 	case PMBUS_VIRT_READ_IOUT_AVG:
-		if (data->id != max34446 && data->id != max34451)
+		if (data->id != max34446 && data->id != max34451 &&
+		    data->id != max34451_na6)
 			return -ENXIO;
 		ret = pmbus_read_word_data(client, page, phase,
 					   MAX34446_MFR_IOUT_AVG);
@@ -133,12 +151,20 @@ static int max34440_write_word_data(struct i2c_client *client, int page,
 
 	switch (reg) {
 	case PMBUS_IOUT_OC_FAULT_LIMIT:
-		ret = pmbus_write_word_data(client, page, MAX34440_IOUT_OC_FAULT_LIMIT,
-					    word);
+		if (data->id == max34451_na6)
+			ret = pmbus_write_word_data(client, page, PMBUS_IOUT_OC_FAULT_LIMIT,
+						    word);
+		else
+			ret = pmbus_write_word_data(client, page, MAX34440_IOUT_OC_FAULT_LIMIT,
+						    word);
 		break;
 	case PMBUS_IOUT_OC_WARN_LIMIT:
-		ret = pmbus_write_word_data(client, page, MAX34440_IOUT_OC_WARN_LIMIT,
-					    word);
+		if (data->id == max34451_na6)
+			ret = pmbus_write_word_data(client, page, PMBUS_IOUT_OC_WARN_LIMIT,
+						    word);
+		else
+			ret = pmbus_write_word_data(client, page, MAX34440_IOUT_OC_WARN_LIMIT,
+						    word);
 		break;
 	case PMBUS_VIRT_RESET_POUT_HISTORY:
 		ret = pmbus_write_word_data(client, page,
@@ -159,7 +185,8 @@ static int max34440_write_word_data(struct i2c_client *client, int page,
 	case PMBUS_VIRT_RESET_IOUT_HISTORY:
 		ret = pmbus_write_word_data(client, page,
 					    MAX34440_MFR_IOUT_PEAK, 0);
-		if (!ret && (data->id == max34446 || data->id == max34451))
+		if (!ret && (data->id == max34446 || data->id == max34451 ||
+			     data->id == max34451_na6))
 			ret = pmbus_write_word_data(client, page,
 					MAX34446_MFR_IOUT_AVG, 0);
 
@@ -270,6 +297,29 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
 	return 0;
 }
 
+#define MAX34451_COMMON_INFO \
+	.pages = 21, \
+	.format[PSC_VOLTAGE_OUT] = direct, \
+	.format[PSC_TEMPERATURE] = direct, \
+	.format[PSC_CURRENT_OUT] = direct, \
+	.m[PSC_VOLTAGE_OUT] = 1, \
+	.b[PSC_VOLTAGE_OUT] = 0, \
+	.R[PSC_VOLTAGE_OUT] = 3, \
+	.m[PSC_CURRENT_OUT] = 1, \
+	.b[PSC_CURRENT_OUT] = 0, \
+	.R[PSC_CURRENT_OUT] = 2, \
+	.m[PSC_TEMPERATURE] = 1, \
+	.b[PSC_TEMPERATURE] = 0, \
+	.R[PSC_TEMPERATURE] = 2, \
+	/* func 0-15 is set dynamically before probing */ \
+	.func[16] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP, \
+	.func[17] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP, \
+	.func[18] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP, \
+	.func[19] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP, \
+	.func[20] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP, \
+	.read_word_data = max34440_read_word_data, \
+	.write_word_data = max34440_write_word_data,
+
 static struct pmbus_driver_info max34440_info[] = {
 	[max34440] = {
 		.pages = 14,
@@ -394,27 +444,10 @@ static struct pmbus_driver_info max34440_info[] = {
 		.write_word_data = max34440_write_word_data,
 	},
 	[max34451] = {
-		.pages = 21,
-		.format[PSC_VOLTAGE_OUT] = direct,
-		.format[PSC_TEMPERATURE] = direct,
-		.format[PSC_CURRENT_OUT] = direct,
-		.m[PSC_VOLTAGE_OUT] = 1,
-		.b[PSC_VOLTAGE_OUT] = 0,
-		.R[PSC_VOLTAGE_OUT] = 3,
-		.m[PSC_CURRENT_OUT] = 1,
-		.b[PSC_CURRENT_OUT] = 0,
-		.R[PSC_CURRENT_OUT] = 2,
-		.m[PSC_TEMPERATURE] = 1,
-		.b[PSC_TEMPERATURE] = 0,
-		.R[PSC_TEMPERATURE] = 2,
-		/* func 0-15 is set dynamically before probing */
-		.func[16] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
-		.func[17] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
-		.func[18] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
-		.func[19] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
-		.func[20] = PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
-		.read_word_data = max34440_read_word_data,
-		.write_word_data = max34440_write_word_data,
+		MAX34451_COMMON_INFO,
+	},
+	[max34451_na6] = {
+		MAX34451_COMMON_INFO,
 	},
 	[max34460] = {
 		.pages = 18,
@@ -495,7 +528,7 @@ static int max34440_probe(struct i2c_client *client)
 	data->id = i2c_match_id(max34440_id, client)->driver_data;
 	data->info = max34440_info[data->id];
 
-	if (data->id == max34451) {
+	if (data->id == max34451 || data->id == max34451_na6) {
 		rv = max34451_set_supported_funcs(client, data);
 		if (rv)
 			return rv;
@@ -509,6 +542,7 @@ static const struct i2c_device_id max34440_id[] = {
 	{"max34441", max34441},
 	{"max34446", max34446},
 	{"max34451", max34451},
+	{"max34451_na6", max34451_na6},
 	{"max34460", max34460},
 	{"max34461", max34461},
 	{}
@@ -529,4 +563,4 @@ module_i2c_driver(max34440_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for Maxim MAX34440/MAX34441");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS("PMBUS");
+MODULE_IMPORT_NS(PMBUS);

-- 
2.34.1


