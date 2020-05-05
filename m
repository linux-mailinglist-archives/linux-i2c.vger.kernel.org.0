Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40DBF1C4DD2
	for <lists+linux-i2c@lfdr.de>; Tue,  5 May 2020 07:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgEEFwg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 May 2020 01:52:36 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:53708 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726635AbgEEFwf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 May 2020 01:52:35 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0455l5X6027087;
        Tue, 5 May 2020 07:52:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Tkcg9s1uDu/OOadkPkeZF9B5T6AZFP5XkTZX0ihRw8k=;
 b=CI9ezifyJBfwqbQsaqh8o4ZvjtLehvt6i+UNxWZruakeg+8UXPU8iIljCfAl2KVQJ1/I
 b7KdHpzD+ozDtarb4Ou6q1PF0xZwyYg6pZ44B4FGtb7Y+FcvtXgHsTeBYkpWqCO9xvwn
 uhqvf3cOHrc9JjHnOvbrbUocT261I/IjtHTNis2kjzCbjRCyS0A41bAUs2Fl5w72Q7zD
 4bbzJ+We2jRW6vq99a977sOBtW2x4rrvzBlioYSo68LpaATZ9ifQW3M0whIjxxOpGbGn
 aUksql+sktcTaYKQYzYFh62CrDq/eb1PzSCT3OK74teuej2K11aEqZdIxA5dVrwuftU2 yQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 30rxb1wy0p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 05 May 2020 07:52:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1E57100039;
        Tue,  5 May 2020 07:52:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3EA721CA81;
        Tue,  5 May 2020 07:52:20 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 5 May 2020 07:52:20
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
Subject: [PATCH 2/4] i2c: addition of client reg/unreg callbacks
Date:   Tue, 5 May 2020 07:51:09 +0200
Message-ID: <1588657871-14747-3-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-05-05_02:2020-05-04,2020-05-05 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Addition of two callbacks reg_client and unreg_client that can be
implemented by adapter drivers in order to take action whenever a
client is being registered to it.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 drivers/i2c/i2c-core-base.c | 11 +++++++++++
 include/linux/i2c.h         |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 2e4560671183..4c84c6264314 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -319,6 +319,12 @@ static int i2c_device_probe(struct device *dev)
 	if (!client)
 		return 0;
 
+	if (client->adapter->algo->reg_client) {
+		status = client->adapter->algo->reg_client(client);
+		if (status)
+			return status;
+	}
+
 	driver = to_i2c_driver(dev->driver);
 
 	client->irq = client->init_irq;
@@ -417,6 +423,8 @@ static int i2c_device_probe(struct device *dev)
 put_sync_adapter:
 	if (client->flags & I2C_CLIENT_HOST_NOTIFY)
 		pm_runtime_put_sync(&client->adapter->dev);
+	if (client->adapter->algo->reg_client)
+		client->adapter->algo->unreg_client(client);
 
 	return status;
 }
@@ -445,6 +453,9 @@ static int i2c_device_remove(struct device *dev)
 	if (client->flags & I2C_CLIENT_HOST_NOTIFY)
 		pm_runtime_put(&client->adapter->dev);
 
+	if (client->adapter->algo->unreg_client)
+		client->adapter->algo->unreg_client(client);
+
 	return status;
 }
 
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 45d36ba4826b..61b838caf454 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -509,6 +509,8 @@ i2c_register_board_info(int busnum, struct i2c_board_info const *info,
  *   so e.g. PMICs can be accessed very late before shutdown. Optional.
  * @functionality: Return the flags that this algorithm/adapter pair supports
  *   from the ``I2C_FUNC_*`` flags.
+ * @reg_client: Callback informing that a new client is being registered
+ * @unreg_client: Callback informing that a client is being removed
  * @reg_slave: Register given client to I2C slave mode of this adapter
  * @unreg_slave: Unregister given client from I2C slave mode of this adapter
  *
@@ -545,6 +547,10 @@ struct i2c_algorithm {
 	/* To determine what the adapter supports */
 	u32 (*functionality)(struct i2c_adapter *adap);
 
+	/* To inform the adapter of the probe/remove of a client */
+	int (*reg_client)(struct i2c_client *client);
+	void (*unreg_client)(struct i2c_client *client);
+
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	int (*reg_slave)(struct i2c_client *client);
 	int (*unreg_slave)(struct i2c_client *client);
-- 
2.17.1

