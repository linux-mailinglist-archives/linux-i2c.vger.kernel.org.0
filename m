Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBC6374AEA
	for <lists+linux-i2c@lfdr.de>; Wed,  5 May 2021 23:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbhEEWAd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 May 2021 18:00:33 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24134 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229691AbhEEWAd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 May 2021 18:00:33 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 145LXXMc096764;
        Wed, 5 May 2021 17:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=5n16Lr4irRHn2RTYf8qsRFdWffSnxtE2XVgh3riOTHE=;
 b=hUurmxTjSBddE0TOEZayPlyGEZrVJAB53z5M8qxaGtP3nspKHgbvHhkyJVglnQ28Gda7
 hPs+Ur63tcK0LooJw0YEl+paJXngoLuQOzoW5AVgYU3w/wDHPxXj2f8T9UfMvmCAfMlN
 6xQkA7jtIX+h37lsQtOutxpAgl4e4oEyqy16olFXzfDyxrJunmi+LRG3lRgXypsd4LqP
 y4CxIgBgE3iNrMHvXMWB2tcqQ4001dAJKFGLI/CUoToHMSrwl7YRRvSJNgPSYdZ9L9Dt
 0YxuCeHmb026O9mEdyn+j6adgum1AvbPEyqADe+M4pK3urhwE6b60FV81tp8qfK/k+S/ tA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
        by mx0b-001b2d01.pphosted.com with ESMTP id 38c2ng9h8w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 May 2021 17:59:32 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
        by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 145LvjNp021920;
        Wed, 5 May 2021 21:59:31 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
        by ppma04wdc.us.ibm.com with ESMTP id 38bedty9kw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 May 2021 21:59:31 +0000
Received: from b03ledav001.gho.boulder.ibm.com (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
        by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 145LxUXq51184132
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 5 May 2021 21:59:30 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B83366E052;
        Wed,  5 May 2021 21:59:30 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 731E26E054;
        Wed,  5 May 2021 21:59:30 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.152.162])
        by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed,  5 May 2021 21:59:30 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, peda@axentia.se, joel@jms.id.au,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH] i2c: mux: pca954x: Support multiple devices on a single reset line
Date:   Wed,  5 May 2021 16:59:18 -0500
Message-Id: <20210505215918.45720-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8R1oiNaCGpcx2vp05rhhpkhN2d62127H
X-Proofpoint-ORIG-GUID: 8R1oiNaCGpcx2vp05rhhpkhN2d62127H
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-05_10:2021-05-05,2021-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105050147
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some systems connect several PCA954x devices to a single reset GPIO. For
these devices to get out of reset and probe successfully, only the first
device probed should change the GPIO. Add this functionality by checking
for EBUSY when getting the GPIO fails. Then, retry getting the GPIO with
the non-exclusive flag and wait for the reset line to drop. This prevents
the later probes from proceding while the device is still reset.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 43 +++++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 4ad665757dd8..840667a82f71 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -39,6 +39,7 @@
 #include <linux/i2c-mux.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/ktime.h>
 #include <linux/module.h>
 #include <linux/pm.h>
 #include <linux/property.h>
@@ -414,6 +415,8 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
 static int pca954x_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
+	enum gpiod_flags flags = GPIOD_OUT_HIGH;
+	const char *reset_gpio_name = "reset";
 	struct i2c_adapter *adap = client->adapter;
 	struct device *dev = &client->dev;
 	struct gpio_desc *gpio;
@@ -435,9 +438,43 @@ static int pca954x_probe(struct i2c_client *client,
 	data->client = client;
 
 	/* Reset the mux if a reset GPIO is specified. */
-	gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(gpio))
-		return PTR_ERR(gpio);
+	gpio = devm_gpiod_get_optional(dev, reset_gpio_name, flags);
+	if (IS_ERR(gpio)) {
+		ret = PTR_ERR(gpio);
+		/*
+		 * In the case that multiple muxes share a single reset line,
+		 * only one should toggle the reset. The other muxes should
+		 * continue probing, waiting for the reset line to drop.
+		 */
+		if (ret == -EBUSY) {
+			ktime_t exp;
+
+			flags |= GPIOD_FLAGS_BIT_NONEXCLUSIVE;
+			gpio = gpiod_get(dev, reset_gpio_name, flags);
+			if (IS_ERR(gpio))
+				return PTR_ERR(gpio);
+
+			exp = ktime_add_us(ktime_get(), 1000);
+			do {
+				ret = gpiod_get_value_cansleep(gpio);
+				if (ret <= 0)
+					break;
+				usleep_range(5, 50);
+			} while (ktime_before(ktime_get(), exp));
+
+			gpiod_put(gpio);
+			if (ret) {
+				if (ret > 0)
+					ret = -ETIMEDOUT;
+
+				return ret;
+			}
+
+			gpio = NULL;
+		} else {
+			return ret;
+		}
+	}
 	if (gpio) {
 		udelay(1);
 		gpiod_set_value_cansleep(gpio, 0);
-- 
2.27.0

