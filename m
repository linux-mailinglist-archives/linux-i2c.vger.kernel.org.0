Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88D28239EE8
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Aug 2020 07:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbgHCFS6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Aug 2020 01:18:58 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:56759 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728013AbgHCFS4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Aug 2020 01:18:56 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0735H6eL031639;
        Mon, 3 Aug 2020 07:18:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=phmgcBwjcV7clYPigq48ZGfYIZjUmWnJrfbPJw1gODw=;
 b=RX7vALAly2808Hpr3zDVbIQuszCSeqUieC3JZRTF64opqbO0vnOlZlTdShmuJRmy2utf
 yGi4eZgDYwhc1/d645Gtah0m2j59IXN5eNtQeXBogfQIwsDvhO8H997ahjjqWFQ1Srvo
 Dh+5y4NpE211BLjGxelKXMPnnCaOchLU5U15D8P6Xt9zazuwV9dZKr9Ck9QfxZ4VgpOl
 uGtORDRnmCJKI1Tmgc2i1If1fIPCEYNd83zKLZpYHZrTLV2oRnf7MHhN1c4sVeVkrpeU
 c+oUD6DeiNt0FIqlAYBGFiUaGjOTxCaUv1tmUda3+gI9Ju7cn1CskNyAlDVLZb8N4v+c ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 32n6th4vfg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 03 Aug 2020 07:18:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BA92B100034;
        Mon,  3 Aug 2020 07:18:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9EA4C20F451;
        Mon,  3 Aug 2020 07:18:43 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 3 Aug 2020 07:18:43
 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@st.com>
CC:     <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <alain.volmat@st.com>
Subject: [PATCH v3 1/2] i2c: smbus: add core function handling SMBus host-notify
Date:   Mon, 3 Aug 2020 07:17:55 +0200
Message-ID: <1596431876-24115-2-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596431876-24115-1-git-send-email-alain.volmat@st.com>
References: <1596431876-24115-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-03_04:2020-07-31,2020-08-03 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SMBus Host-Notify protocol, from the adapter point of view
consist of receiving a message from a client, including the
client address and some other data.

It can be simply handled by creating a new slave device
and registering a callback performing the parsing of the
message received from the client.

This commit introduces two new core functions
  * i2c_new_slave_host_notify_device
  * i2c_free_slave_host_notify_device
that take care of registration of the new slave device and
callback and will call i2c_handle_smbus_host_notify once a
Host-Notify event is received.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 v3: move smbus host-notify slave code into i2c-smbus.c file
     rework slave callback index handling
     add sanity check in slave free function
 v2: identical to v1
 drivers/i2c/i2c-smbus.c   | 107 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/i2c-smbus.h |  12 ++++++
 2 files changed, 119 insertions(+)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index dc0108287ccf..d3d06e3b4f3b 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -197,6 +197,113 @@ EXPORT_SYMBOL_GPL(i2c_handle_smbus_alert);
 
 module_i2c_driver(smbalert_driver);
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+#define SMBUS_HOST_NOTIFY_LEN	3
+struct i2c_slave_host_notify_status {
+	u8 index;
+	u8 addr;
+};
+
+static int i2c_slave_host_notify_cb(struct i2c_client *client,
+				    enum i2c_slave_event event, u8 *val)
+{
+	struct i2c_slave_host_notify_status *status = client->dev.platform_data;
+
+	switch (event) {
+	case I2C_SLAVE_WRITE_RECEIVED:
+		/* We only retrieve the first byte received (addr)
+		 * since there is currently no support to retrieve the data
+		 * parameter from the client.
+		 */
+		if (status->index == 0)
+			status->addr = *val;
+		if (status->index < U8_MAX)
+			status->index++;
+		break;
+	case I2C_SLAVE_STOP:
+		if (status->index == SMBUS_HOST_NOTIFY_LEN)
+			i2c_handle_smbus_host_notify(client->adapter,
+						     status->addr);
+		fallthrough;
+	case I2C_SLAVE_WRITE_REQUESTED:
+		status->index = 0;
+		break;
+	case I2C_SLAVE_READ_REQUESTED:
+	case I2C_SLAVE_READ_PROCESSED:
+		*val = 0xff;
+		break;
+	}
+
+	return 0;
+}
+
+/**
+ * i2c_new_slave_host_notify_device - get a client for SMBus host-notify support
+ * @adapter: the target adapter
+ * Context: can sleep
+ *
+ * Setup handling of the SMBus host-notify protocol on a given I2C bus segment.
+ *
+ * Handling is done by creating a device and its callback and handling data
+ * received via the SMBus host-notify address (0x8)
+ *
+ * This returns the client, which should be ultimately freed using
+ * i2c_free_slave_host_notify_device(); or an ERRPTR to indicate an error.
+ */
+struct i2c_client *i2c_new_slave_host_notify_device(struct i2c_adapter *adapter)
+{
+	struct i2c_board_info host_notify_board_info = {
+		I2C_BOARD_INFO("smbus_host_notify", 0x08),
+		.flags  = I2C_CLIENT_SLAVE,
+	};
+	struct i2c_slave_host_notify_status *status;
+	struct i2c_client *client;
+	int ret;
+
+	status = kzalloc(sizeof(struct i2c_slave_host_notify_status),
+			 GFP_KERNEL);
+	if (!status)
+		return ERR_PTR(-ENOMEM);
+
+	host_notify_board_info.platform_data = status;
+
+	client = i2c_new_client_device(adapter, &host_notify_board_info);
+	if (IS_ERR(client)) {
+		kfree(status);
+		return client;
+	}
+
+	ret = i2c_slave_register(client, i2c_slave_host_notify_cb);
+	if (ret) {
+		i2c_unregister_device(client);
+		kfree(status);
+		return ERR_PTR(ret);
+	}
+
+	return client;
+}
+EXPORT_SYMBOL_GPL(i2c_new_slave_host_notify_device);
+
+/**
+ * i2c_free_slave_host_notify_device - free the client for SMBus host-notify
+ * support
+ * @client: the client to free
+ * Context: can sleep
+ *
+ * Free the i2c_client allocated via i2c_new_slave_host_notify_device
+ */
+void i2c_free_slave_host_notify_device(struct i2c_client *client)
+{
+	if (IS_ERR_OR_NULL(client))
+		return;
+
+	i2c_slave_unregister(client);
+	kfree(client->dev.platform_data);
+	i2c_unregister_device(client);
+}
+EXPORT_SYMBOL_GPL(i2c_free_slave_host_notify_device);
+#endif
+
 /*
  * SPD is not part of SMBus but we include it here for convenience as the
  * target systems are the same.
diff --git a/include/linux/i2c-smbus.h b/include/linux/i2c-smbus.h
index 1e4e0de4ef8b..1ef421818d3a 100644
--- a/include/linux/i2c-smbus.h
+++ b/include/linux/i2c-smbus.h
@@ -38,6 +38,18 @@ static inline int of_i2c_setup_smbus_alert(struct i2c_adapter *adap)
 	return 0;
 }
 #endif
+#if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_I2C_SLAVE)
+struct i2c_client *i2c_new_slave_host_notify_device(struct i2c_adapter *adapter);
+void i2c_free_slave_host_notify_device(struct i2c_client *client);
+#else
+static inline struct i2c_client *i2c_new_slave_host_notify_device(struct i2c_adapter *adapter)
+{
+	return ERR_PTR(-ENOSYS);
+}
+static inline void i2c_free_slave_host_notify_device(struct i2c_client *client)
+{
+}
+#endif
 
 #if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_DMI)
 void i2c_register_spd(struct i2c_adapter *adap);
-- 
2.7.4

