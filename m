Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFA895AF5D7
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Sep 2022 22:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbiIFU24 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Sep 2022 16:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbiIFU2w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Sep 2022 16:28:52 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 355861E3D7;
        Tue,  6 Sep 2022 13:28:50 -0700 (PDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 286JVVgQ018702;
        Tue, 6 Sep 2022 20:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BJoIJp6wvjVZ+f2nHzu8pCJktSo3EhbquH+1b+nnu2I=;
 b=oFWbuK+Z5BdQEiMoIMn1HBEL9bIPTIHmzhLu1T+cXH/k0tOKAKBfindOM/46L60NVVo/
 VweAfSU/9UVIB84FeGne1v2g2787b8iMnOGlV17YUAT9rgQ059aEjtxXs1CVRz8St454
 wnheQF8kEiRfwcDsLnac2XjanEucf+Rn9tU0yc/2GMoOoUgQ3ixebqDlWqQ2vIxBnfoE
 e/+gbvhyxe6NZjS4Ta9Gvv2BGpDAlaoLqB0S9YXctnvDsyqjZqbHjhxaU417Jq3g7Yvx
 aVvv2UULUG5iQfJZgVucdpLdsi/Tb7hngxsD4gcslxP/57mOE1SrsJoIT6FDAZ0HNHv4 sQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jecek9f5p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Sep 2022 20:28:33 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 286KKpwj013464;
        Tue, 6 Sep 2022 20:28:32 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
        by ppma02wdc.us.ibm.com with ESMTP id 3jbxj9dr6a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Sep 2022 20:28:32 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 286KSW7U59048254
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 6 Sep 2022 20:28:32 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DD96DB2065;
        Tue,  6 Sep 2022 20:28:31 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 29F0CB2064;
        Tue,  6 Sep 2022 20:28:31 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.74.237])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue,  6 Sep 2022 20:28:31 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-iio@vger.kernel.org, wsa@kernel.org, peda@axentia.se,
        jic23@kernel.org, lars@metafoo.de, miltonm@us.ibm.com,
        joel@jms.id.au, eajames@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] i2c: core: Add mux root adapter operations
Date:   Tue,  6 Sep 2022 15:28:28 -0500
Message-Id: <20220906202829.1921114-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220906202829.1921114-1-eajames@linux.ibm.com>
References: <20220906202829.1921114-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -shRQ9tfLptfra0eQAIhHJWtwGvcTWTI
X-Proofpoint-GUID: -shRQ9tfLptfra0eQAIhHJWtwGvcTWTI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_09,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209060093
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some I2C clients need the ability to control the root I2C bus even if the
endpoint device is behind a mux. For example, a driver for a chip that
can't handle any I2C traffic on the bus while coming out of reset
(including an I2C-driven mux switching channels) may need to lock the root
bus with the mux selection fixed for the entire time the device is in
reset.
For this purpose, add a new structure containing two function pointers to
the adapter structure. These functions pointers should be defined for
every adapter. The lock_select operation, for a mux adapter, locks the
parent adpaters up to the root and selects the adapter's channel. The
unlock_deselect operation deselects the mux channel and unlocks all the
adapters. For a non-mux adapter, the operations lock and unlock the
adapters up to the root. This scheme should work with multiple levels of
muxes and regular adapters in between.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 drivers/i2c/i2c-core-base.c | 38 ++++++++++++++++++++++++++++
 drivers/i2c/i2c-mux.c       | 50 +++++++++++++++++++++++++++++++++++++
 include/linux/i2c.h         | 42 +++++++++++++++++++++++++++++++
 3 files changed, 130 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 8c7e3494ca5f..b1a1e88ef478 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1347,6 +1347,41 @@ static const struct i2c_lock_operations i2c_adapter_lock_ops = {
 	.unlock_bus =  i2c_adapter_unlock_bus,
 };
 
+/*
+ * For a non-mux adapter, the lock_select operation locks the chain of
+ * adapters upwards, returning the root. If there's a mux above this adapter
+ * somehow, it should also get locked and the desired channel selected.
+ */
+static struct i2c_adapter *i2c_adapter_lock_select(struct i2c_adapter *adapter)
+{
+	struct i2c_adapter *ret = adapter;
+	struct i2c_adapter *parent = i2c_parent_is_i2c_adapter(adapter);
+
+	if (parent) {
+		ret = parent->mux_root_ops->lock_select(parent);
+		if (IS_ERR(ret))
+			return ret;
+	}
+
+	adapter->lock_ops->lock_bus(adapter, I2C_LOCK_ROOT_ADAPTER);
+	return ret;
+}
+
+static void i2c_adapter_unlock_deselect(struct i2c_adapter *adapter)
+{
+	struct i2c_adapter *parent = i2c_parent_is_i2c_adapter(adapter);
+
+	adapter->lock_ops->unlock_bus(adapter, I2C_LOCK_ROOT_ADAPTER);
+
+	if (parent)
+		parent->mux_root_ops->unlock_deselect(parent);
+}
+
+static const struct i2c_mux_root_operations i2c_adapter_mux_root_ops = {
+	.lock_select = i2c_adapter_lock_select,
+	.unlock_deselect = i2c_adapter_unlock_deselect,
+};
+
 static void i2c_host_notify_irq_teardown(struct i2c_adapter *adap)
 {
 	struct irq_domain *domain = adap->host_notify_domain;
@@ -1442,6 +1477,9 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	if (!adap->lock_ops)
 		adap->lock_ops = &i2c_adapter_lock_ops;
 
+	if (!adap->mux_root_ops)
+		adap->mux_root_ops = &i2c_adapter_mux_root_ops;
+
 	adap->locked_flags = 0;
 	rt_mutex_init(&adap->bus_lock);
 	rt_mutex_init(&adap->mux_lock);
diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 774507b54b57..c7db770e4198 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -210,6 +210,49 @@ static void i2c_parent_unlock_bus(struct i2c_adapter *adapter,
 	rt_mutex_unlock(&parent->mux_lock);
 }
 
+/*
+ * For a mux adapter, the lock_select operation first locks just like the
+ * lock_bus operation. Then it selects the channel for this adapter and
+ * returns the root adapter. If there is another mux above this one, calling
+ * the parent lock_select should ensure that the channel is correctly
+ * selected.
+ */
+static struct i2c_adapter *i2c_mux_lock_select(struct i2c_adapter *adapter)
+{
+	int ret;
+	struct i2c_mux_priv *priv = adapter->algo_data;
+	struct i2c_mux_core *muxc = priv->muxc;
+	struct i2c_adapter *parent = muxc->parent;
+
+	rt_mutex_lock_nested(&parent->mux_lock, i2c_adapter_depth(adapter));
+
+	adapter = parent->mux_root_ops->lock_select(parent);
+	if (IS_ERR(adapter))
+		return adapter;
+
+	ret = muxc->select(muxc, priv->chan_id);
+	if (ret < 0) {
+		parent->mux_root_ops->unlock_deselect(parent);
+		rt_mutex_unlock(&parent->mux_lock);
+		return ERR_PTR(ret);
+	}
+
+	return adapter;
+}
+
+static void i2c_mux_unlock_deselect(struct i2c_adapter *adapter)
+{
+	struct i2c_mux_priv *priv = adapter->algo_data;
+	struct i2c_mux_core *muxc = priv->muxc;
+	struct i2c_adapter *parent = muxc->parent;
+
+	if (muxc->deselect)
+		muxc->deselect(muxc, priv->chan_id);
+
+	parent->mux_root_ops->unlock_deselect(parent);
+	rt_mutex_unlock(&parent->mux_lock);
+}
+
 struct i2c_adapter *i2c_root_adapter(struct device *dev)
 {
 	struct device *i2c;
@@ -279,6 +322,11 @@ static const struct i2c_lock_operations i2c_parent_lock_ops = {
 	.unlock_bus =  i2c_parent_unlock_bus,
 };
 
+static const struct i2c_mux_root_operations i2c_mux_root_ops = {
+	.lock_select = i2c_mux_lock_select,
+	.unlock_deselect = i2c_mux_unlock_deselect,
+};
+
 int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 			u32 force_nr, u32 chan_id,
 			unsigned int class)
@@ -339,6 +387,8 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 	else
 		priv->adap.lock_ops = &i2c_parent_lock_ops;
 
+	priv->adap.mux_root_ops = &i2c_mux_root_ops;
+
 	/* Sanity check on class */
 	if (i2c_mux_parent_classes(parent) & class)
 		dev_err(&parent->dev,
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index f7c49bbdb8a1..51342a0c03e9 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -584,6 +584,26 @@ struct i2c_lock_operations {
 	void (*unlock_bus)(struct i2c_adapter *adapter, unsigned int flags);
 };
 
+/**
+ * struct i2c_mux_root_operations - represent operations to lock and select
+ * the adapter's mux channel (if a mux is present)
+ * @lock_select: Get exclusive access to the root I2C bus adapter with the
+ *   correct mux channel selected for the adapter
+ * @unlock_deslect: Release exclusive access to the root I2C bus adapter and
+ *   deselect the mux channel for the adapter
+ *
+ * Some I2C clients need the ability to control the root I2C bus even if the
+ * endpoint device is behind a mux. For example, a driver for a chip that
+ * can't handle any I2C traffic on the bus while coming out of reset (including
+ * an I2C-driven mux switching channels) may need to lock the root bus with
+ * the mux selection fixed for the entire time the device is in reset.
+ * These operations are for such a purpose.
+ */
+struct i2c_mux_root_operations {
+	struct i2c_adapter *(*lock_select)(struct i2c_adapter *adapter);
+	void (*unlock_deselect)(struct i2c_adapter *adapter);
+};
+
 /**
  * struct i2c_timings - I2C timing information
  * @bus_freq_hz: the bus frequency in Hz
@@ -726,6 +746,7 @@ struct i2c_adapter {
 
 	/* data fields that are valid for all devices	*/
 	const struct i2c_lock_operations *lock_ops;
+	const struct i2c_mux_root_operations *mux_root_ops;
 	struct rt_mutex bus_lock;
 	struct rt_mutex mux_lock;
 
@@ -818,6 +839,27 @@ i2c_unlock_bus(struct i2c_adapter *adapter, unsigned int flags)
 	adapter->lock_ops->unlock_bus(adapter, flags);
 }
 
+/**
+ * i2c_lock_select_bus - Get exclusive access to the root I2C bus with the
+ *   target's mux channel (if a mux is present) selected.
+ * @adapter: Target I2C bus
+ *
+ * Return the root I2C bus if mux selection succeeds, an ERR_PTR otherwise
+ */
+static inline struct i2c_adapter *i2c_lock_select_bus(struct i2c_adapter *adapter)
+{
+	return adapter->mux_root_ops->lock_select(adapter);
+}
+
+/**
+ * i2c_unlock_deselect_bus - Release exclusive access to the root I2C bus
+ * @adapter: Target I2C bus
+ */
+static inline void i2c_unlock_deselect_bus(struct i2c_adapter *adapter)
+{
+	adapter->mux_root_ops->unlock_deselect(adapter);
+}
+
 /**
  * i2c_mark_adapter_suspended - Report suspended state of the adapter to the core
  * @adap: Adapter to mark as suspended
-- 
2.31.1

