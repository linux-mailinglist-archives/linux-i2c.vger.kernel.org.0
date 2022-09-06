Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7FE25AF5D6
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Sep 2022 22:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbiIFU2z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Sep 2022 16:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbiIFU2v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Sep 2022 16:28:51 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B44269F18D;
        Tue,  6 Sep 2022 13:28:50 -0700 (PDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 286JmtXV016743;
        Tue, 6 Sep 2022 20:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=TK3b0tJx6JSyAg3t0OkpsOqvqcKBzy/Y5y1x6PmUG3Y=;
 b=mmjn7EMJg3QlWiRLYTrx3qxZwbQUABdbxa5yqqxy1K425mqBFmOIygqDiJ6Mm2atzHCZ
 waI+q2a9DpQi91j2/4CDbpge3HlItJ01bnMfUnZG39eVDaLVTlRZtvHH/bN2ohm9rWAE
 s2hJOcwH4MC7ZDbkDoYBfT6VXuBVoXR7aP0aLR+ExZK/bs0eEOrzQm6QM22ju44OgTWB
 jKpa91CPd9N0k6UHwAm0JroG7d5029phcVYUtMpzju0C3lbCF6JpFHZwAtdw8myPXnx7
 e7IQC1Ot+iW0wg+PcKtFsEmi1QfH+1+1LgeY037yDhL4cBIYm/TZNKcgM0yOwkvcwjEK RQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jecpq10xw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Sep 2022 20:28:34 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 286KM2pw004922;
        Tue, 6 Sep 2022 20:28:33 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
        by ppma03wdc.us.ibm.com with ESMTP id 3jbxj9dpq5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Sep 2022 20:28:33 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 286KSWm564029126
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 6 Sep 2022 20:28:32 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BD3FAB205F;
        Tue,  6 Sep 2022 20:28:32 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 06495B2064;
        Tue,  6 Sep 2022 20:28:32 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.74.237])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue,  6 Sep 2022 20:28:31 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-iio@vger.kernel.org, wsa@kernel.org, peda@axentia.se,
        jic23@kernel.org, lars@metafoo.de, miltonm@us.ibm.com,
        joel@jms.id.au, eajames@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] iio: si7020: Lock root adapter to wait for reset
Date:   Tue,  6 Sep 2022 15:28:29 -0500
Message-Id: <20220906202829.1921114-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220906202829.1921114-1-eajames@linux.ibm.com>
References: <20220906202829.1921114-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: F1s0qnT7hEyeGhvNn2CNWwTC5NdotSJs
X-Proofpoint-ORIG-GUID: F1s0qnT7hEyeGhvNn2CNWwTC5NdotSJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_09,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209060093
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
2.31.1

