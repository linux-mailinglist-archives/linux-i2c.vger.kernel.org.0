Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 467BB535523
	for <lists+linux-i2c@lfdr.de>; Thu, 26 May 2022 22:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348965AbiEZUyD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 May 2022 16:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241700AbiEZUyC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 May 2022 16:54:02 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 957FC6898A;
        Thu, 26 May 2022 13:54:01 -0700 (PDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24QKe0B5018508;
        Thu, 26 May 2022 20:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=OnXCdfCYseIt6Yhu7uE81bN07J9tc87Liz31HWBtdVo=;
 b=p4C+Cwqze6mfZZMXnLU6BHSE7Bd5tYyId3r3yRHKSLuxRLVvGu9V7xcxw2YqOZA4Vepn
 lXQc0kka2XyPBEG94JIfjW6j+dXQC/tlvoKTWdX9/4WrD0Fcwhyu6pPDEvxSCsLO3Yxd
 rF8ddZZoH7K+JkV/F721n44wGpIft86rjuJkJUZ4W3U8o1Gce0Zr4WwmZnTzS4WlKP+3
 ggKKvxD45Jlg1VqZT3lHGA+x8RgrCZFCy8pIWKf9rDt4Y8MGRltxThPuc3CVnB2Aw2kd
 gu/y/E+AbdyS8/Wxs2TL1BSzR9QWIFfUIHa9gEVdksvI3EYeL2IbkA9JyBTF6FaGd+20 qg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gag42ry4m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 26 May 2022 20:53:39 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
        by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24QKoQUn001887;
        Thu, 26 May 2022 20:53:38 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
        by ppma04dal.us.ibm.com with ESMTP id 3g93uub1cn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 26 May 2022 20:53:38 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24QKraTe17629512
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 26 May 2022 20:53:36 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8B8BD6A054;
        Thu, 26 May 2022 20:53:36 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 16DB96A058;
        Thu, 26 May 2022 20:53:36 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.46.254])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
        Thu, 26 May 2022 20:53:36 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        wsa@kernel.org, peda@axentia.se, jic23@kernel.org, lars@metafoo.de,
        eajames@linux.ibm.com, miltonm@us.ibm.com, joel@jms.id.au
Subject: [PATCH 2/2] iio: si7020: Lock root adapter to wait for reset
Date:   Thu, 26 May 2022 15:53:34 -0500
Message-Id: <20220526205334.64114-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220526205334.64114-1-eajames@linux.ibm.com>
References: <20220526205334.64114-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LAtFz80v3tw9pt45GmV-_BiaE1K_fk3S
X-Proofpoint-ORIG-GUID: LAtFz80v3tw9pt45GmV-_BiaE1K_fk3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-26_10,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205260095
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the new mux root operations to lock the root adapter while waiting for
the reset to complete. I2C commands issued after the SI7020 is starting up
or after reset can potentially upset the startup sequence. Therefore, the
host needs to wait for the startup sequence to finish before issuing
further I2C commands.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/iio/humidity/si7020.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/humidity/si7020.c b/drivers/iio/humidity/si7020.c
index ab6537f136ba..76ca7863f35b 100644
--- a/drivers/iio/humidity/si7020.c
+++ b/drivers/iio/humidity/si7020.c
@@ -106,6 +106,7 @@ static const struct iio_info si7020_info = {
 static int si7020_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
+	struct i2c_adapter *root;
 	struct iio_dev *indio_dev;
 	struct i2c_client **data;
 	int ret;
@@ -115,13 +116,24 @@ static int si7020_probe(struct i2c_client *client,
 				     I2C_FUNC_SMBUS_READ_WORD_DATA))
 		return -EOPNOTSUPP;
 
+	root = i2c_lock_select_bus(client->adapter);
+	if (IS_ERR(root))
+		return PTR_ERR(root);
+
 	/* Reset device, loads default settings. */
-	ret = i2c_smbus_write_byte(client, SI7020CMD_RESET);
-	if (ret < 0)
+	ret = __i2c_smbus_xfer(root, client->addr, client->flags,
+			       I2C_SMBUS_WRITE, SI7020CMD_RESET,
+			       I2C_SMBUS_BYTE, NULL);
+	if (ret < 0) {
+		i2c_unlock_deselect_bus(client->adapter);
 		return ret;
+	}
+
 	/* Wait the maximum power-up time after software reset. */
 	msleep(15);
 
+	i2c_unlock_deselect_bus(client->adapter);
+
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
 	if (!indio_dev)
 		return -ENOMEM;
-- 
2.27.0

