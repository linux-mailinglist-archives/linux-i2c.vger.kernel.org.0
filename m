Return-Path: <linux-i2c+bounces-9181-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE6FA1B93F
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 16:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79EDD3B29AC
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 15:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8A5225796;
	Fri, 24 Jan 2025 15:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="mIhoFZqR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAAA22540B;
	Fri, 24 Jan 2025 15:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737731936; cv=none; b=Cka2IAdvqLGEXT8lYnwrkAXapLVh2WFFh2U6y2fvoVflioRZMBc65tEBSYDxYS5MxghvNJknmO7ZQGcQV/drp7gm1sTeodn9B3iYPkafPzYecCD/p47HNiw+P6KK1grx6J6PZSud1Qzm2ZBZILFqquDeo9b532Pr0tKs/mH4790=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737731936; c=relaxed/simple;
	bh=wCowbZEygihfMN+QHh+uHBJ2mCDuZdzQHDbRVaUhRJ4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SrP8+LnpJarIZpfrx+KPrHx4/lwRWqx0ZidwGDp3TkWZaXxXL3JE1+9Szv3/Mw1t1d7+EGcTSf9u9GKsa9WaexYPO2Dlc10KQ8eUb6KYv7KiL443sHkfmy3x73BDRtC4dAIfVKiQVCjoemXaRjwsrYDsizewB5KuFdKBrFHwPPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=mIhoFZqR; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OAl6Wn028037;
	Fri, 24 Jan 2025 10:18:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=IMKVP
	a+eh+39Rw+daXMPXvyxZ6HO1RR9NriETyhiJvs=; b=mIhoFZqRVNFgRtrovx+YG
	rqDfRLVjiZYxBH9pWnnIEkNEKzjKwtk4UVU2ZHenoYafI4jn1IL31PcE4nxSEeAC
	PsiWRXh0tGtEbT3TihmJj14cYmUxNfD7mesHfrKYYbaGQmPbTVIpuGnwuKH58Pvd
	w9dh07N69p7LNX41BQtTYbRBcn8Q0z/tMX78yVEx2ooaAmI+Xw3PbhJh+xt7wmrX
	9T+tcqDQwp/pEiRwv+r1OjWtkFqt0U5znuuaz07r1UHN88oeWRHbWQIzf21nSiRP
	IxKQEVGvPC0y9C7gfB/3IfHhYUcDM9d5dnaUfZZlbdelAa98tkTzM4F9g9n8zlDv
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 44c9dfs245-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:18:31 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 50OFIUmg035240
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Jan 2025 10:18:30 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 24 Jan
 2025 10:18:30 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 24 Jan 2025 10:18:30 -0500
Received: from CENCARNA-L02.ad.analog.com (CENCARNA-L02.ad.analog.com [10.117.116.131])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 50OFHp0P031715;
	Fri, 24 Jan 2025 10:18:21 -0500
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
Subject: [PATCH v4 3/3] hwmon: (pmbus/adp1050): Add regulator support for ltp8800
Date: Fri, 24 Jan 2025 23:17:46 +0800
Message-ID: <20250124151746.1130-4-cedricjustine.encarnacion@analog.com>
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
X-Proofpoint-ORIG-GUID: WObp_gDEiwDgj_zhQm_UrK2X07wZoMeA
X-Proofpoint-GUID: WObp_gDEiwDgj_zhQm_UrK2X07wZoMeA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240108

Add regulator support for the single-channel LTP8800-1A/-2/-4A
150A/135A/200A DC/DC µModule Regulator.

Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
---
 drivers/hwmon/pmbus/Kconfig   |  9 +++++++++
 drivers/hwmon/pmbus/adp1050.c | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 419469f40ba0..a890cf3aef91 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -67,6 +67,15 @@ config SENSORS_ADP1050
 	  This driver can also be built as a module. If so, the module will
 	  be called adp1050.
 
+config SENSORS_ADP1050_REGULATOR
+	bool "Regulator support for ADP1050 and compatibles"
+	depends on SENSORS_ADP1050 && REGULATOR
+	help
+	  If you say yes here you get regulator support for Analog Devices
+	  LTP8800-1A, LTP8800-4A, and LTP8800-2. LTP8800 is a family of DC/DC
+	  µModule regulators that can provide microprocessor power from 54V
+	  power distribution architecture.
+
 config SENSORS_BEL_PFE
 	tristate "Bel PFE Compatible Power Supplies"
 	help
diff --git a/drivers/hwmon/pmbus/adp1050.c b/drivers/hwmon/pmbus/adp1050.c
index 2f75e8f1424d..a835ecf5c7fc 100644
--- a/drivers/hwmon/pmbus/adp1050.c
+++ b/drivers/hwmon/pmbus/adp1050.c
@@ -11,6 +11,12 @@
 
 #include "pmbus.h"
 
+#if IS_ENABLED(CONFIG_SENSORS_ADP1050_REGULATOR)
+static const struct regulator_desc adp1050_reg_desc[] = {
+	PMBUS_REGULATOR_ONE("vout"),
+};
+#endif /* CONFIG_SENSORS_ADP1050_REGULATOR */
+
 static struct pmbus_driver_info adp1050_info = {
 	.pages = 1,
 	.format[PSC_VOLTAGE_IN] = linear,
@@ -65,6 +71,10 @@ static struct pmbus_driver_info ltp8800_info = {
 		| PMBUS_HAVE_STATUS_VOUT
 		| PMBUS_HAVE_STATUS_INPUT
 		| PMBUS_HAVE_STATUS_TEMP,
+#if IS_ENABLED(CONFIG_SENSORS_ADP1050_REGULATOR)
+	.num_regulators = 1,
+	.reg_desc = adp1050_reg_desc,
+#endif
 };
 
 static int adp1050_probe(struct i2c_client *client)
-- 
2.39.5


