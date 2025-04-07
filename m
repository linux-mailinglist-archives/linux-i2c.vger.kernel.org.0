Return-Path: <linux-i2c+bounces-10119-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAF0A7D29B
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 05:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA2673ADC7B
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 03:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA65D221F3F;
	Mon,  7 Apr 2025 03:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="fwkfETgh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E73A221F23;
	Mon,  7 Apr 2025 03:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743997726; cv=none; b=eEjsr5QeXf+vD+MR3i0xA399U/ph//uI1gOG50zrm+oLFCl+auM+/eBr864LyBiAJI5RviZD8IMiYBX68IitkwKAAzoDdbRyNKd2u1xCWMYInoBF/aJNLUHkpl2340hSH8pqFpS+KyeG+lsr+kxK2Lj9fn5zaF272OABSQDEboE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743997726; c=relaxed/simple;
	bh=OwYIkWNWMrgEBKm2TOb8sNIYOgMGeKiujBKc7/tLSFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gZLyftljpuj7G4iOqPoXINphdBQDTRUyMlezfNwgHPwi70RTTKrfxfKLArKEleHUZS/KQF3MWX6Y2hhOcwUMVv4V8YlUfsxIAswjPp3Tz6a8c+h+TJ7WmqwQYLEAvcbakMwyB4YFEd0e4lQ7EqObDuc+S7HUjknvKL5h4ftMECc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=fwkfETgh; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5371nvH7000932;
	Sun, 6 Apr 2025 23:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=6XFh4
	TksOMoW4rVxmGY2IYyywFvhJXtN72CGc6gQu2w=; b=fwkfETghk0Zo9yWTEjRWp
	4WTOjDgxwbncQJRf6fRSpkAlwjiYeSsIeY8oZrUSvjeLVIBQXNyQMyE+zFDR6kFq
	qx9VNje7JBJEsj9xXRsv7tuh8XrebM8zoJo3O6e8s/oHexncxsT0i8NL1sEoBhfW
	gy0G2/DAtnGnAOcDl9Pm5QaxxoTAylw4suVLtNI5yOTm3+aeGNE+qlAdVE6IBp9B
	iJnVa5cLaP4VVASKVvk71lmcCnK9jmhxlp+T3KVTLY2SP2LB/5dVoCzhs2aHKTdn
	TUaVjxXh6yDF8JGeCNQ6rsdlAnYijE5fgE1gXhinHZbmUHEarcx21aqjWWgkpKhC
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 45ujugby6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Apr 2025 23:48:24 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 5373mMmM042640
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 6 Apr 2025 23:48:22 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Sun, 6 Apr 2025 23:48:22 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Sun, 6 Apr 2025 23:48:22 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Sun, 6 Apr 2025 23:48:22 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.117.223.24])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5373m1a5015369;
	Sun, 6 Apr 2025 23:48:15 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Mon, 7 Apr 2025 11:47:25 +0800
Subject: [PATCH v3 2/2] hwmon: (pmbus/max34440): add support adpm12160
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250407-dev_adpm12160-v3-2-9cd3095445c8@analog.com>
References: <20250407-dev_adpm12160-v3-0-9cd3095445c8@analog.com>
In-Reply-To: <20250407-dev_adpm12160-v3-0-9cd3095445c8@analog.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Delphine CC Chiu
	<Delphine_CC_Chiu@Wiwynn.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        "Alexis Czezar
 Torreno" <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743997681; l=6870;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=OwYIkWNWMrgEBKm2TOb8sNIYOgMGeKiujBKc7/tLSFM=;
 b=sv3pFqq6pnfevQcUBX4QWAnrccxI8H5HTF53gQ06eA51ifawceioQ8uB4GxWjH5ZXJq998EHj
 DBQHosQAvZVBESwQ0ky9QJaB+ecuJYF/IJl8LePn5jjBrchBEcwVedV
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 2GbKmM5JBk9oeuqAv-cVtrfc5ViQwrhR
X-Authority-Analysis: v=2.4 cv=KKJaDEFo c=1 sm=1 tr=0 ts=67f34b08 cx=c_pps a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gAnH3GRIAAAA:8 a=_jlGtV7tAAAA:8 a=jS6xk1c62BX-HoiQEUMA:9 a=QEXdDO2ut3YA:10
 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-ORIG-GUID: 2GbKmM5JBk9oeuqAv-cVtrfc5ViQwrhR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_01,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070025

ASPM12160 is a quarter brick DC/DC Power Module. It is a high power
non-isolated converter capable of delivering a fully regulated 12V,
with continuous power level of 1600W with peak power at 2400W for
a limited time. Uses PMBus Configuration.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 Documentation/hwmon/max34440.rst | 30 ++++++++++++++++------
 drivers/hwmon/pmbus/max34440.c   | 55 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 74 insertions(+), 11 deletions(-)

diff --git a/Documentation/hwmon/max34440.rst b/Documentation/hwmon/max34440.rst
index 162d289f08140341e8e76ab7033834ba07a8b935..8591a7152ce580a04b6965301f9bacd9b0a1a661 100644
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
@@ -128,7 +137,10 @@ in[1-6]_highest		Historical maximum voltage.
 in[1-6]_reset_history	Write any value to reset history.
 ======================= =======================================================
 
-.. note:: MAX34446 only supports in[1-4].
+.. note::
+
+    - MAX34446 only supports in[1-4].
+    - ADPM12160 only supports in[1-2]. Label is "vin1" and "vout1" respectively.
 
 Curr
 ~~~~
@@ -150,6 +162,7 @@ curr[1-6]_reset_history	Write any value to reset history.
 
     - in6 and curr6 attributes only exist for MAX34440.
     - MAX34446 only supports curr[1-4].
+    - For ADPM12160, curr[1] is "iin1" and curr[2-6] are "iout[1-5].
 
 Power
 ~~~~~
@@ -185,6 +198,7 @@ temp[1-8]_reset_history	Write any value to reset history.
 .. note::
    - temp7 and temp8 attributes only exist for MAX34440.
    - MAX34446 only supports temp[1-3].
+   - ADPM12160 only supports temp[1].
 
 
 .. note::
diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index d6d556b0138532f0a55ffe73eae760cf41aa4ab8..3d70c454efb50ac0def27b4214e0c26d2786f349 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -14,7 +14,15 @@
 #include <linux/i2c.h>
 #include "pmbus.h"
 
-enum chips { max34440, max34441, max34446, max34451, max34460, max34461 };
+enum chips {
+	adpm12160,
+	max34440,
+	max34441,
+	max34446,
+	max34451,
+	max34460,
+	max34461,
+};
 
 #define MAX34440_MFR_VOUT_PEAK		0xd4
 #define MAX34440_MFR_IOUT_PEAK		0xd5
@@ -80,7 +88,8 @@ static int max34440_read_word_data(struct i2c_client *client, int page,
 					   MAX34440_MFR_VOUT_PEAK);
 		break;
 	case PMBUS_VIRT_READ_IOUT_AVG:
-		if (data->id != max34446 && data->id != max34451)
+		if (data->id != max34446 && data->id != max34451 &&
+		    data->id != adpm12160)
 			return -ENXIO;
 		ret = pmbus_read_word_data(client, page, phase,
 					   MAX34446_MFR_IOUT_AVG);
@@ -164,7 +173,8 @@ static int max34440_write_word_data(struct i2c_client *client, int page,
 	case PMBUS_VIRT_RESET_IOUT_HISTORY:
 		ret = pmbus_write_word_data(client, page,
 					    MAX34440_MFR_IOUT_PEAK, 0);
-		if (!ret && (data->id == max34446 || data->id == max34451))
+		if (!ret && (data->id == max34446 || data->id == max34451 ||
+			     data->id == adpm12160))
 			ret = pmbus_write_word_data(client, page,
 					MAX34446_MFR_IOUT_AVG, 0);
 
@@ -309,6 +319,41 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
 }
 
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
@@ -539,12 +584,16 @@ static int max34440_probe(struct i2c_client *client)
 		rv = max34451_set_supported_funcs(client, data);
 		if (rv)
 			return rv;
+	} else if (data->id == adpm12160) {
+		data->iout_oc_fault_limit = PMBUS_IOUT_OC_FAULT_LIMIT;
+		data->iout_oc_warn_limit = PMBUS_IOUT_OC_WARN_LIMIT;
 	}
 
 	return pmbus_do_probe(client, &data->info);
 }
 
 static const struct i2c_device_id max34440_id[] = {
+	{"adpm12160", adpm12160},
 	{"max34440", max34440},
 	{"max34441", max34441},
 	{"max34446", max34446},

-- 
2.34.1


