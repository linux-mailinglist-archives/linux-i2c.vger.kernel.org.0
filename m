Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B1821396A
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jul 2020 13:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbgGCLgj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jul 2020 07:36:39 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:22372 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726022AbgGCLgj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Jul 2020 07:36:39 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 063BXNEr020096;
        Fri, 3 Jul 2020 13:36:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=wiVlmgo0Tb74d3HUpAS/XiyBrtMN3zkK8doatuW4pxM=;
 b=dxpAm0t5uaBu9xBQIRgSJqeS1FEkVGKm4mQ2HD9uaeWum7rToo7Y8TI+j6xDWWpy2eIA
 ypMs7b0Rpq//rFewbXl1NDQ08Nz3jJdQxbE6nvGUyGobJKYEzNzWn4dxF8w4GlvHlqBz
 PDj49WNKOoyR6srbwRaGme12h24gLTdupaJGHlM+GskNy4f3N/uaRBv7uzmLkBlTZP98
 XXcpo9HDx43dBmryjkzqI1ipSg4p2rXzgAqlcwLp3cy0301//y58XbOH1YV8mroHDa4A
 nWYftR2/SXs1t6TPspPAcFW9N7VHpolrxr+xIihSO5vSmzsluOFf8ij4w0WyhttOmjXC WA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31wu8a6vju-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 03 Jul 2020 13:36:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 28FCE100034;
        Fri,  3 Jul 2020 13:36:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1ACF32C750E;
        Fri,  3 Jul 2020 13:36:27 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 3 Jul 2020 13:36:26
 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@kernel.org>, <pierre-yves.mordret@st.com>
CC:     <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <alain.volmat@st.com>
Subject: [PATCH v2 1/2] i2c: smbus: add core function handling SMBus host-notify
Date:   Fri, 3 Jul 2020 13:36:07 +0200
Message-ID: <1593776168-17867-2-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593776168-17867-1-git-send-email-alain.volmat@st.com>
References: <1593776168-17867-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-03_06:2020-07-02,2020-07-03 signatures=0
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
 v2: identical to v1

 drivers/i2c/i2c-core-smbus.c | 114 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/i2c-smbus.h    |  12 +++++
 2 files changed, 126 insertions(+)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index f5c9787992e9..23ab9dc5ac85 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -715,3 +715,117 @@ int of_i2c_setup_smbus_alert(struct i2c_adapter *adapter)
 }
 EXPORT_SYMBOL_GPL(of_i2c_setup_smbus_alert);
 #endif
+
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
+	int ret;
+
+	switch (event) {
+	case I2C_SLAVE_WRITE_REQUESTED:
+		status->index = 0;
+		break;
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
+		/* Handle host-notify if whole message received only */
+		if (status->index != SMBUS_HOST_NOTIFY_LEN) {
+			status->index = U8_MAX;
+			break;
+		}
+
+		ret = i2c_handle_smbus_host_notify(client->adapter,
+						   status->addr);
+		if (ret < 0)
+			return ret;
+		status->index = U8_MAX;
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
+	status->index = U8_MAX;
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
+	i2c_slave_unregister(client);
+	kfree(client->dev.platform_data);
+	i2c_unregister_device(client);
+}
+EXPORT_SYMBOL_GPL(i2c_free_slave_host_notify_device);
+#endif
diff --git a/include/linux/i2c-smbus.h b/include/linux/i2c-smbus.h
index 1e4e0de4ef8b..52e62f398f1c 100644
--- a/include/linux/i2c-smbus.h
+++ b/include/linux/i2c-smbus.h
@@ -38,6 +38,18 @@ static inline int of_i2c_setup_smbus_alert(struct i2c_adapter *adap)
 	return 0;
 }
 #endif
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+struct i2c_client *i2c_new_slave_host_notify_device(struct i2c_adapter *adapter);
+void i2c_free_slave_host_notify_device(struct i2c_client *client);
+#else
+static inline struct i2c_client *i2c_new_slave_host_notify_device(struct i2c_adapter *adapter)
+{
+	return NULL;
+}
+static inline void i2c_free_slave_host_notify_device(struct i2c_client *client)
+{
+}
+#endif
 
 #if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_DMI)
 void i2c_register_spd(struct i2c_adapter *adap);
-- 
2.7.4

