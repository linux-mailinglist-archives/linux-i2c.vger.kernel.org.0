Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28FB552C496
	for <lists+linux-i2c@lfdr.de>; Wed, 18 May 2022 22:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242728AbiERUls (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 May 2022 16:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242730AbiERUlq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 May 2022 16:41:46 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 465316EC40;
        Wed, 18 May 2022 13:41:43 -0700 (PDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24IKDiOW017312;
        Wed, 18 May 2022 20:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=nvXa8af2siriVChrnEyvk2247HQGR9mvpKnd8nb1hxo=;
 b=rRq2hMeKB7kjfMHkKWXgNQz7oEgaYj5AFVa9s2q0Bno/4cyu5DI+dKgXYONBPYEhOpu2
 iWgZKjukXAlL2vgqVMi1U4wYsWJ56ZqOZyA2aKB9nfGcZVuv+qq8X2PX1MY/mr8zhcZA
 0XtRXSFQDruMw5FhSF+S669tHA5XhwTsJe8sQ0PkSt3uFW5o1+gZJId0fKhmYPZcNdmc
 wxpcPnyNONmNJCFjL6FLEgPhDGfWalhr3JyXddE/AI9v1L171eeJI0finBeKGwgpSK8d
 igL76ei/HaUkA4xbcvihKxpk1OrJWz2iKf/MsJ66mawSreKvhhLY6mP/V6Wiqr2naj9l og== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g57n8gk88-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 May 2022 20:41:27 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
        by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24IKcgbq006781;
        Wed, 18 May 2022 20:41:27 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
        by ppma04wdc.us.ibm.com with ESMTP id 3g4wp5bq81-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 May 2022 20:41:27 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24IKfQVg15991110
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 18 May 2022 20:41:26 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 071E1C6055;
        Wed, 18 May 2022 20:41:26 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 96F1EC6059;
        Wed, 18 May 2022 20:41:25 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.6.139])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed, 18 May 2022 20:41:25 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        jic23@kernel.org, lars@metafoo.de, wsa@kernel.org,
        milton@us.ibm.com, peda@axentia.se,
        Eddie James <eajames@linux.ibm.com>
Subject: [RFC 2/2] iio: humidity: si7020: Use core transfer callback to sleep after reset
Date:   Wed, 18 May 2022 15:41:19 -0500
Message-Id: <20220518204119.38943-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220518204119.38943-1-eajames@linux.ibm.com>
References: <20220518204119.38943-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hFpAPwzKJH4bwj4G3KwS1VeByDcTB9vV
X-Proofpoint-GUID: hFpAPwzKJH4bwj4G3KwS1VeByDcTB9vV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_06,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 mlxscore=0 adultscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205180119
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

While the SI7020 is starting up after power on or reset, any I2C commands
on the bus can potentially upset the startup sequence. Therefore, the host
needs to wait for the startup sequence to finish before issuing further
i2c commands. This is impractical in cases where the SI7020 is on a shared
bus or behind a mux, which may switch channels at any time (potentially
generating I2C traffic). To resolve this, use the new transfer callback
on the adapter to sleep the required interval.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/iio/humidity/si7020.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/humidity/si7020.c b/drivers/iio/humidity/si7020.c
index ab6537f136ba..f19e88818bd6 100644
--- a/drivers/iio/humidity/si7020.c
+++ b/drivers/iio/humidity/si7020.c
@@ -103,6 +103,13 @@ static const struct iio_info si7020_info = {
 	.read_raw = si7020_read_raw,
 };
 
+static void si7020_xfer_callback(void *data, int xfer_rc)
+{
+	/* Wait the maximum power-up time after software reset. */
+	if (!xfer_rc)
+		msleep(15);
+}
+
 static int si7020_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
@@ -115,12 +122,13 @@ static int si7020_probe(struct i2c_client *client,
 				     I2C_FUNC_SMBUS_READ_WORD_DATA))
 		return -EOPNOTSUPP;
 
+	i2c_lock_bus(client->adapter, I2C_LOCK_ROOT_ADAPTER);
+	i2c_adapter_xfer_callback(client->adapter, si7020_xfer_callback, NULL);
 	/* Reset device, loads default settings. */
 	ret = i2c_smbus_write_byte(client, SI7020CMD_RESET);
+	i2c_unlock_bus(client->adapter, I2C_LOCK_ROOT_ADAPTER);
 	if (ret < 0)
 		return ret;
-	/* Wait the maximum power-up time after software reset. */
-	msleep(15);
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
 	if (!indio_dev)
-- 
2.27.0

