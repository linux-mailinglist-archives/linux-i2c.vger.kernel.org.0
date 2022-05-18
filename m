Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCD7752C48F
	for <lists+linux-i2c@lfdr.de>; Wed, 18 May 2022 22:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242711AbiERUlo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 May 2022 16:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242701AbiERUln (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 May 2022 16:41:43 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 763016D973;
        Wed, 18 May 2022 13:41:42 -0700 (PDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24IKW81u021315;
        Wed, 18 May 2022 20:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6Wb1PTNRCtiyiy1UokxHKChzuywEapNSam8gp2jnpt0=;
 b=Vl3k4om3rUSgWcvytmRPd8gy42NxeB3ArLfct+5Ln++rYLxB/BznjNTyq48ElfJowrEh
 XbsZGJiBQJADTjsjwDfvQpkPuQrXgTs/INlr2UV5+7/+Al6HV2DMYPkO8TpamxAUBJ91
 GjXnL0Z91ckJv1jWWaHJovhGYVfI3rBGihb7hwUvs3hrsCNjp7iW4fCU3Z+fj8LVJ7B6
 mqu0oy+RBKwwVseA0gE6DRbXQIusIHV7IDUTsGZfKmxwmu4Zzr6ocFidLtz5O3fuQeCB
 BpWcmZpBd6LqGiC/jayO2fbHLKemfe4Yak2MjH97pkoFz/KkHpV2Ew8ffmRC4WKL9Uq3 nQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g57x0r7yw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 May 2022 20:41:26 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24IKcb8N003416;
        Wed, 18 May 2022 20:41:25 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
        by ppma01dal.us.ibm.com with ESMTP id 3g242beprn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 May 2022 20:41:25 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24IKfOnX8782234
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 18 May 2022 20:41:24 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 60794C6055;
        Wed, 18 May 2022 20:41:24 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id F153EC6059;
        Wed, 18 May 2022 20:41:23 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.6.139])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed, 18 May 2022 20:41:23 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        jic23@kernel.org, lars@metafoo.de, wsa@kernel.org,
        milton@us.ibm.com, peda@axentia.se,
        Eddie James <eajames@linux.ibm.com>
Subject: [RFC 1/2] i2c: core: Add adapter transfer callback
Date:   Wed, 18 May 2022 15:41:18 -0500
Message-Id: <20220518204119.38943-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220518204119.38943-1-eajames@linux.ibm.com>
References: <20220518204119.38943-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: S_9GnWowkBKxopX2J-FT3fRZw8U_kvar
X-Proofpoint-ORIG-GUID: S_9GnWowkBKxopX2J-FT3fRZw8U_kvar
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_06,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=894
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205180119
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a callback function pointer to be executed after the adapter
performs a transfer. The purpose of such a callback is for a client
to execute some code while "owning" the bus entirely. Holding the
adapter lock is insufficient in the case where the client is behind a
mux, as the mux driver could perform mux selection operations on the
bus while locked.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/i2c/i2c-core-base.c |  3 +++
 include/linux/i2c.h         | 25 +++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index d43db2c3876e..a46bfee2d845 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2128,6 +2128,9 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		trace_i2c_result(adap, num, ret);
 	}
 
+	if (adap->xfer_callback)
+		adap->xfer_callback(adap->xfer_data, ret);
+
 	return ret;
 }
 EXPORT_SYMBOL(__i2c_transfer);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index fbda5ada2afc..ea773f2ee9c8 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -747,6 +747,9 @@ struct i2c_adapter {
 
 	struct irq_domain *host_notify_domain;
 	struct regulator *bus_regulator;
+
+	void (*xfer_callback)(void *data, int xfer_rc);
+	void *xfer_data;
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
@@ -814,6 +817,7 @@ i2c_trylock_bus(struct i2c_adapter *adapter, unsigned int flags)
 static inline void
 i2c_unlock_bus(struct i2c_adapter *adapter, unsigned int flags)
 {
+	adapter->xfer_callback = NULL;
 	adapter->lock_ops->unlock_bus(adapter, flags);
 }
 
@@ -849,6 +853,27 @@ static inline void i2c_mark_adapter_resumed(struct i2c_adapter *adap)
 	i2c_unlock_bus(adap, I2C_LOCK_ROOT_ADAPTER);
 }
 
+/**
+ * i2c_adapter_xfer_callback - Register a callback function that is executed
+ *			       when a transfer completes.
+ * @adap: Adapter to which the callback function will be registered
+ * @cb: The callback function pointer
+ * @data: The data to pass to the callback function
+ *
+ * This function should be called with the adapter locked with
+ * I2C_LOCK_ROOT_ADAPTER to ensure that the whole bus is idle while the
+ * callback executes.
+ * The callback is automatically removed when the bus is unlocked to avoid
+ * spurious executions of the callback.
+ */
+static inline void i2c_adapter_xfer_callback(struct i2c_adapter *adap,
+					     void (*cb)(void *data, int rc),
+					     void *data)
+{
+	adap->xfer_callback = cb;
+	adap->xfer_data = data;
+}
+
 /* i2c adapter classes (bitmask) */
 #define I2C_CLASS_HWMON		(1<<0)	/* lm_sensors, ... */
 #define I2C_CLASS_DDC		(1<<3)	/* DDC bus on graphics adapters */
-- 
2.27.0

