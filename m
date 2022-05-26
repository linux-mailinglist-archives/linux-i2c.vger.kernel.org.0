Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB8553551D
	for <lists+linux-i2c@lfdr.de>; Thu, 26 May 2022 22:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232635AbiEZUx7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 May 2022 16:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbiEZUx7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 May 2022 16:53:59 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAAED67D1E;
        Thu, 26 May 2022 13:53:57 -0700 (PDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24QKLimd002637;
        Thu, 26 May 2022 20:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tZWBd9uDfN7eBp6FxFNCshQrwCuBJZvA8XVxAG6t838=;
 b=OlGUJveswGJ39ODh6Q0/oRjpVhSVRb5TooVJshOz4xtpcGe+2Acy2lU5CLB/lVmPM8ct
 17uDixqUZOdsTDR0TU8zTbiQduofgaEPKBAvZi6wJM++iqpKcXOQqrA4Iyk/UofIFJBO
 I/aA58T4z25WNdP1aG0H/UCXs6s5ogPh/h53ohVC6WAnArZuPj4yo8qpFfS9r+UF9cyb
 HcbNGgkvl/7FOuJB8ykK+GWZzeGqWbwfVCeeu/8TEsjqgrqaw1Fpcnl/4awjQ+oCTG70
 /cOg3iu7cWLtGHhB0OPddm6VqbZfN3afetqyNv+4A0FxcyseBeI1R+6vUPW59skjscRa 1Q== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gaggvggu0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 26 May 2022 20:53:37 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24QKr2Lm027947;
        Thu, 26 May 2022 20:53:37 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
        by ppma02wdc.us.ibm.com with ESMTP id 3gagpkr2bq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 26 May 2022 20:53:37 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24QKra7U20119952
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 26 May 2022 20:53:36 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 06D896A054;
        Thu, 26 May 2022 20:53:36 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 813776A051;
        Thu, 26 May 2022 20:53:35 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.46.254])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
        Thu, 26 May 2022 20:53:35 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        wsa@kernel.org, peda@axentia.se, jic23@kernel.org, lars@metafoo.de,
        eajames@linux.ibm.com, miltonm@us.ibm.com, joel@jms.id.au
Subject: [PATCH 1/2] i2c: core: Add mux root adapter operations
Date:   Thu, 26 May 2022 15:53:33 -0500
Message-Id: <20220526205334.64114-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220526205334.64114-1-eajames@linux.ibm.com>
References: <20220526205334.64114-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Sz_QaotiDhXEVzWw2UM8W9OEnTnaS82F
X-Proofpoint-GUID: Sz_QaotiDhXEVzWw2UM8W9OEnTnaS82F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-26_10,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205260095
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
---
 drivers/i2c/i2c-core-base.c | 38 ++++++++++++++++++++++++++++
 drivers/i2c/i2c-mux.c       | 50 +++++++++++++++++++++++++++++++++++++
 include/linux/i2c.h         | 42 +++++++++++++++++++++++++++++++
 3 files changed, 130 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index d43db2c3876e..e2c365348e1f 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1357,6 +1357,41 @@ static const struct i2c_lock_operations i2c_adapter_lock_ops = {
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
@@ -1452,6 +1487,9 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
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
index fbda5ada2afc..a3596f61b417 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -583,6 +583,26 @@ struct i2c_lock_operations {
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
@@ -725,6 +745,7 @@ struct i2c_adapter {
 
 	/* data fields that are valid for all devices	*/
 	const struct i2c_lock_operations *lock_ops;
+	const struct i2c_mux_root_operations *mux_root_ops;
 	struct rt_mutex bus_lock;
 	struct rt_mutex mux_lock;
 
@@ -817,6 +838,27 @@ i2c_unlock_bus(struct i2c_adapter *adapter, unsigned int flags)
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
+ * i2c_unlock_deslect_bus - Release exclusive access to the root I2C bus
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
2.27.0

