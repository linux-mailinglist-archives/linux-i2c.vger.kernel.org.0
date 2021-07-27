Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD7503D7A8F
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Jul 2021 18:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhG0QJp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Jul 2021 12:09:45 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:27279 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229658AbhG0QJo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Jul 2021 12:09:44 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16RG4ctn129513;
        Tue, 27 Jul 2021 12:09:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tHitE0CZyHx+5CmS/wzGU1uVXS4acUw969HBGjcmvCs=;
 b=DCqrVLjmDC/bxHUGYEcT4lVFX33tr5A93B8BMBC+WzdKixo0Rqy82C6eJFdz8XAdYy8q
 xuQHycIVtJi+QowzXry25yyBETSivZDSZeMIXLlyvvPof9nsf3b0tAmTbqv224J2GmGK
 tB5IwfSDtzHheo9TPMp00se0TOAo/FdPvXIYburSE/mnXwsWJ/ZC3WR3xrLYTE8aCPf9
 cQZO/mqlJRYodTEg5bzR0JT+IUJK7ha3NW2s6ydMeDc8GFUn4rxEJdOd2RLlm76H/Vnw
 Ik2YMq5Jw/wf0JScX8PyGQqdJGGtuAvtKzob70YXV9mUn4e8RWXh0OagoXPyjsWTpK1B SA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3a2kbd5qe7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 27 Jul 2021 12:09:39 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16RG49tq019697;
        Tue, 27 Jul 2021 16:04:38 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
        by ppma02dal.us.ibm.com with ESMTP id 3a2362j0qt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 27 Jul 2021 16:04:38 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
        by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 16RG3M1o46924260
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 27 Jul 2021 16:03:22 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3B597BE063;
        Tue, 27 Jul 2021 16:03:22 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E23DBBE04F;
        Tue, 27 Jul 2021 16:03:21 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.139.59])
        by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
        Tue, 27 Jul 2021 16:03:21 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        peda@axentia.se, robh+dt@kernel.org,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v2 2/2] i2c: mux: pca954x: Support multiple devices on a single reset line
Date:   Tue, 27 Jul 2021 11:03:15 -0500
Message-Id: <20210727160315.15575-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210727160315.15575-1-eajames@linux.ibm.com>
References: <20210727160315.15575-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y39omJr1lIcXvIhVYrA1oL_7PyHTQ8jo
X-Proofpoint-GUID: y39omJr1lIcXvIhVYrA1oL_7PyHTQ8jo
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-27_10:2021-07-27,2021-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270097
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some systems connect several PCA954x devices to a single reset GPIO. For
these devices to get out of reset and probe successfully, each device must
defer the probe until the GPIO has been hogged. Accomplish this by
attempting to grab a new "reset-shared-hogged" devicetree property, but
expect it to fail with EPROBE_DEFER or EBUSY.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 46 +++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 4ad665757dd8..376b54ffb590 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -434,15 +434,43 @@ static int pca954x_probe(struct i2c_client *client,
 	i2c_set_clientdata(client, muxc);
 	data->client = client;
 
-	/* Reset the mux if a reset GPIO is specified. */
-	gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(gpio))
-		return PTR_ERR(gpio);
-	if (gpio) {
-		udelay(1);
-		gpiod_set_value_cansleep(gpio, 0);
-		/* Give the chip some time to recover. */
-		udelay(1);
+	/*
+	 * Grab the shared, hogged gpio that controls the mux reset. We expect
+	 * this to fail with either EPROBE_DEFER or EBUSY. The only purpose of
+	 * trying to get it is to make sure the gpio controller has probed up
+	 * and hogged the line to take the mux out of reset, meaning that the
+	 * mux is ready to be probed up. Don't try and set the line any way; in
+	 * the event we actually successfully get the line (if it wasn't
+	 * hogged) then we immediately release it, since there is no way to
+	 * sync up the line between muxes.
+	 */
+	gpio = gpiod_get_optional(dev, "reset-shared-hogged", 0);
+	if (IS_ERR(gpio)) {
+		ret = PTR_ERR(gpio);
+		if (ret != -EBUSY)
+			return ret;
+	} else {
+		if (gpio) {
+			/* This is really a problem since now we don't know the
+			 * state of the gpio. Log a warning and keep trying to
+			 * probe the mux just in case it works.
+			 */
+			dev_warn(dev, "got hogged reset line, expect error\n");
+			gpiod_put(gpio);
+		} else {
+			/* Reset the mux if a reset GPIO is specified. */
+			gpio = devm_gpiod_get_optional(dev, "reset",
+						       GPIOD_OUT_HIGH);
+			if (IS_ERR(gpio))
+				return PTR_ERR(gpio);
+
+			if (gpio) {
+				udelay(1);
+				gpiod_set_value_cansleep(gpio, 0);
+				/* Give the chip some time to recover. */
+				udelay(1);
+			}
+		}
 	}
 
 	data->chip = device_get_match_data(dev);
-- 
2.27.0

