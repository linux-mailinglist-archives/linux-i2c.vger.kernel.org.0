Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6F52209AA5
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jun 2020 09:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390325AbgFYHkH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Jun 2020 03:40:07 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:44334 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2390205AbgFYHkE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Jun 2020 03:40:04 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05P7djCN018742;
        Thu, 25 Jun 2020 09:39:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=B7ajrBgreKK0clsVTdK1y2OSMqOBYMm31F6kF44CZ5o=;
 b=GXcV/xxt2JzujKSKEJ0cvS4GVLXnValQ9eUM/YNJcX1/MIp2koy0Wy7ruATMxQX6VG+O
 Qle7wIkSzPgyy37Sr23EKRV/jhCez4rEzgxjuwofIFa1+NkI8H/SATGI95nOqTwFhjlt
 uz2aoBF362cXjfznk29L6ZdgOchNNP4b3lKYJZ2Fbfdx9ceQvHenhDMuFthP8awxCAjO
 0gY9YHotmS41uYxhJz+8LYHFSMQd7NJ8rdmvxmF/0kEQmJ91GA2SX0Z8lZrF9eKX9mx6
 qDf2gSA7qK9qZRmjuJcuMe4u0gwqaEem5vgciyNMHENutrGob6IvS6vuwdka598oFlCj 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31uuumghkn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Jun 2020 09:39:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 31E71100038;
        Thu, 25 Jun 2020 09:39:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 267142A82E2;
        Thu, 25 Jun 2020 09:39:51 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 25 Jun 2020 09:39:50
 +0200
From:   Alain Volmat <alain.volmat@st.com>
To:     <wsa@kernel.org>, <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <pierre-yves.mordret@st.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>,
        <alain.volmat@st.com>
Subject: [PATCH v2 2/4] i2c: addition of client hnotify reg/unreg callbacks
Date:   Thu, 25 Jun 2020 09:39:27 +0200
Message-ID: <1593070769-9106-3-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593070769-9106-1-git-send-email-alain.volmat@st.com>
References: <1593070769-9106-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-25_03:2020-06-25,2020-06-25 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Addition of two callbacks reg_hnotify_cli and unreg_hnotify_cli
that can be implemented by adapter drivers in order to take action
whenever a client with HOST_NOTIFY flag is being registered to it.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
v2: replace generic client reg/unreg callbacks with host-notify
    client reg/unreg callbacks

 drivers/i2c/i2c-core-base.c | 18 ++++++++++++++++--
 include/linux/i2c.h         |  8 ++++++++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 26f03a14a478..46745e403e98 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -319,6 +319,14 @@ static int i2c_device_probe(struct device *dev)
 	if (!client)
 		return 0;
 
+	if (client->flags & I2C_CLIENT_HOST_NOTIFY) {
+		if (client->adapter->algo->reg_hnotify_cli) {
+			status = client->adapter->algo->reg_hnotify_cli(client);
+			if (status)
+				return status;
+		}
+	}
+
 	driver = to_i2c_driver(dev->driver);
 
 	client->irq = client->init_irq;
@@ -415,8 +423,11 @@ static int i2c_device_probe(struct device *dev)
 	dev_pm_clear_wake_irq(&client->dev);
 	device_init_wakeup(&client->dev, false);
 put_sync_adapter:
-	if (client->flags & I2C_CLIENT_HOST_NOTIFY)
+	if (client->flags & I2C_CLIENT_HOST_NOTIFY) {
 		pm_runtime_put_sync(&client->adapter->dev);
+		if (client->adapter->algo->unreg_hnotify_cli)
+			client->adapter->algo->unreg_hnotify_cli(client);
+	}
 
 	return status;
 }
@@ -442,8 +453,11 @@ static int i2c_device_remove(struct device *dev)
 	device_init_wakeup(&client->dev, false);
 
 	client->irq = 0;
-	if (client->flags & I2C_CLIENT_HOST_NOTIFY)
+	if (client->flags & I2C_CLIENT_HOST_NOTIFY) {
 		pm_runtime_put(&client->adapter->dev);
+		if (client->adapter->algo->unreg_hnotify_cli)
+			client->adapter->algo->unreg_hnotify_cli(client);
+	}
 
 	return status;
 }
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index b8b8963f8bb9..35ad108adc68 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -507,6 +507,10 @@ i2c_register_board_info(int busnum, struct i2c_board_info const *info,
  *   so e.g. PMICs can be accessed very late before shutdown. Optional.
  * @functionality: Return the flags that this algorithm/adapter pair supports
  *   from the ``I2C_FUNC_*`` flags.
+ * @reg_hnotify_cli: Callback informing that a new client with HOST_NOTIFY flag
+ *   is being registered
+ * @unreg_hnotify_cli: Callback informing that a client with HOST_NOTIFY flag
+ *   is being removed
  * @reg_slave: Register given client to I2C slave mode of this adapter
  * @unreg_slave: Unregister given client from I2C slave mode of this adapter
  *
@@ -543,6 +547,10 @@ struct i2c_algorithm {
 	/* To determine what the adapter supports */
 	u32 (*functionality)(struct i2c_adapter *adap);
 
+	/* To inform the adapter of the probe/remove of a HOST_NOTIFY client */
+	int (*reg_hnotify_cli)(struct i2c_client *client);
+	void (*unreg_hnotify_cli)(struct i2c_client *client);
+
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	int (*reg_slave)(struct i2c_client *client);
 	int (*unreg_slave)(struct i2c_client *client);
-- 
2.7.4

