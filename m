Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9FD7BECAB
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Oct 2023 23:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378377AbjJIVQs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Oct 2023 17:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234630AbjJIVQc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Oct 2023 17:16:32 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B42C1A4;
        Mon,  9 Oct 2023 14:15:20 -0700 (PDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 399Kvc5s027474;
        Mon, 9 Oct 2023 21:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HbxznNioXWK3XuoMnW/amQ7dEI8hCNvIG4U+oLz3Udo=;
 b=UoHwYlBzJdt+6fh1aWnHWJKm7Qa9gzlTP7KMbTcwcpd7pB0VbR/DVHo8ISdd5jxbB+oK
 YQ7Gc1dve3sfdi2QKxSNzYMp5Slzo0ZVWj3sJankAZjjjLmyHkjpyWhIGZts5zMHnmmU
 NxMu5YdwaBtA3eCGxOVydezATtCOqontVJUmnc7Q0PLkMQsNXyjNHPcl6mrY8BD6spkU
 zRWy3cJQUFXmeTNRPG7ok1lZ10H0G7nH7H6wlL5uhFER5ckgwuK/EpxZMo9cPFzj9YLi
 93ucsP6whDeqtqyTZ9GCZCwVnbWmT8U9c7DBp03XlyUuVgfFq+ZteA3dP+xfsZ/Awxg2 9A== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tms0srung-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Oct 2023 21:14:55 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
        by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 399KTkfW000643;
        Mon, 9 Oct 2023 21:14:54 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
        by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkk5kbm5e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Oct 2023 21:14:54 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
        by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 399LErRs35127672
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 9 Oct 2023 21:14:53 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 411275805E;
        Mon,  9 Oct 2023 21:14:53 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1F8AB5805A;
        Mon,  9 Oct 2023 21:14:53 +0000 (GMT)
Received: from gfwa600.aus.stglabs.ibm.com (unknown [9.3.84.101])
        by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTPS;
        Mon,  9 Oct 2023 21:14:53 +0000 (GMT)
Received: by gfwa600.aus.stglabs.ibm.com (Postfix, from userid 181152)
        id CB5E6740051; Mon,  9 Oct 2023 16:14:52 -0500 (CDT)
From:   Lakshmi Yadlapati <lakshmiy@us.ibm.com>
To:     linux@roeck-us.net, wsa@kernel.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com, jdelvare@suse.com, joel@jms.id.au,
        andrew@aj.id.au, eajames@linux.ibm.com, ninad@linux.ibm.com
Cc:     Lakshmi Yadlapati <lakshmiy@us.ibm.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v1 1/2] i2c: smbus: Allow throttling of transfers to client devices
Date:   Mon,  9 Oct 2023 16:14:19 -0500
Message-Id: <20231009211420.3454026-2-lakshmiy@us.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009211420.3454026-1-lakshmiy@us.ibm.com>
References: <20231009211420.3454026-1-lakshmiy@us.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uWQ9OEZwDOKJccXRMyVZhg7KGQeIWtzJ
X-Proofpoint-GUID: uWQ9OEZwDOKJccXRMyVZhg7KGQeIWtzJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_19,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310090169
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Signed-off-by: Lakshmi Yadlapati <lakshmiy@us.ibm.com>
---
 drivers/i2c/i2c-core-base.c  |   8 +-
 drivers/i2c/i2c-core-smbus.c | 143 ++++++++++++++++++++++++++++-------
 drivers/i2c/i2c-core.h       |  23 ++++++
 include/linux/i2c.h          |   2 +
 4 files changed, 145 insertions(+), 31 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 60746652fd52..c27cb054d462 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -931,13 +931,17 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
 struct i2c_client *
 i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
 {
+	struct i2c_client_priv	*priv;
 	struct i2c_client	*client;
 	int			status;
 
-	client = kzalloc(sizeof *client, GFP_KERNEL);
-	if (!client)
+	priv = kzalloc(sizeof *priv, GFP_KERNEL);
+	if (!priv)
 		return ERR_PTR(-ENOMEM);
 
+	mutex_init(&priv->throttle_lock);
+	client = &priv->client;
+
 	client->adapter = adap;
 
 	client->dev.platform_data = info->platform_data;
diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index e3b96fc53b5c..bcf1b15d6bd2 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -10,6 +10,7 @@
  * SMBus 2.0 support by Mark Studebaker <mdsxyz123@yahoo.com> and
  * Jean Delvare <jdelvare@suse.de>
  */
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
@@ -22,6 +23,9 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/smbus.h>
 
+static s32 i2c_smbus_throttle_xfer(const struct i2c_client *client,
+				   char read_write, u8 command, int protocol,
+				   union i2c_smbus_data *data);
 
 /* The SMBus parts */
 
@@ -104,9 +108,8 @@ s32 i2c_smbus_read_byte(const struct i2c_client *client)
 	union i2c_smbus_data data;
 	int status;
 
-	status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-				I2C_SMBUS_READ, 0,
-				I2C_SMBUS_BYTE, &data);
+	status = i2c_smbus_throttle_xfer(client, I2C_SMBUS_READ, 0,
+					 I2C_SMBUS_BYTE, &data);
 	return (status < 0) ? status : data.byte;
 }
 EXPORT_SYMBOL(i2c_smbus_read_byte);
@@ -121,8 +124,8 @@ EXPORT_SYMBOL(i2c_smbus_read_byte);
  */
 s32 i2c_smbus_write_byte(const struct i2c_client *client, u8 value)
 {
-	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-	                      I2C_SMBUS_WRITE, value, I2C_SMBUS_BYTE, NULL);
+	return i2c_smbus_throttle_xfer(client, I2C_SMBUS_WRITE, value,
+				       I2C_SMBUS_BYTE, NULL);
 }
 EXPORT_SYMBOL(i2c_smbus_write_byte);
 
@@ -139,9 +142,8 @@ s32 i2c_smbus_read_byte_data(const struct i2c_client *client, u8 command)
 	union i2c_smbus_data data;
 	int status;
 
-	status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-				I2C_SMBUS_READ, command,
-				I2C_SMBUS_BYTE_DATA, &data);
+	status = i2c_smbus_throttle_xfer(client, I2C_SMBUS_READ, command,
+					 I2C_SMBUS_BYTE_DATA, &data);
 	return (status < 0) ? status : data.byte;
 }
 EXPORT_SYMBOL(i2c_smbus_read_byte_data);
@@ -160,9 +162,8 @@ s32 i2c_smbus_write_byte_data(const struct i2c_client *client, u8 command,
 {
 	union i2c_smbus_data data;
 	data.byte = value;
-	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-			      I2C_SMBUS_WRITE, command,
-			      I2C_SMBUS_BYTE_DATA, &data);
+	return i2c_smbus_throttle_xfer(client, I2C_SMBUS_WRITE, command,
+				       I2C_SMBUS_BYTE_DATA, &data);
 }
 EXPORT_SYMBOL(i2c_smbus_write_byte_data);
 
@@ -179,9 +180,8 @@ s32 i2c_smbus_read_word_data(const struct i2c_client *client, u8 command)
 	union i2c_smbus_data data;
 	int status;
 
-	status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-				I2C_SMBUS_READ, command,
-				I2C_SMBUS_WORD_DATA, &data);
+	status = i2c_smbus_throttle_xfer(client, I2C_SMBUS_READ, command,
+					 I2C_SMBUS_WORD_DATA, &data);
 	return (status < 0) ? status : data.word;
 }
 EXPORT_SYMBOL(i2c_smbus_read_word_data);
@@ -200,9 +200,8 @@ s32 i2c_smbus_write_word_data(const struct i2c_client *client, u8 command,
 {
 	union i2c_smbus_data data;
 	data.word = value;
-	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-			      I2C_SMBUS_WRITE, command,
-			      I2C_SMBUS_WORD_DATA, &data);
+	return i2c_smbus_throttle_xfer(client, I2C_SMBUS_WRITE, command,
+				       I2C_SMBUS_WORD_DATA, &data);
 }
 EXPORT_SYMBOL(i2c_smbus_write_word_data);
 
@@ -227,9 +226,8 @@ s32 i2c_smbus_read_block_data(const struct i2c_client *client, u8 command,
 	union i2c_smbus_data data;
 	int status;
 
-	status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-				I2C_SMBUS_READ, command,
-				I2C_SMBUS_BLOCK_DATA, &data);
+	status = i2c_smbus_throttle_xfer(client, I2C_SMBUS_READ, command,
+					 I2C_SMBUS_BLOCK_DATA, &data);
 	if (status)
 		return status;
 
@@ -257,9 +255,8 @@ s32 i2c_smbus_write_block_data(const struct i2c_client *client, u8 command,
 		length = I2C_SMBUS_BLOCK_MAX;
 	data.block[0] = length;
 	memcpy(&data.block[1], values, length);
-	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-			      I2C_SMBUS_WRITE, command,
-			      I2C_SMBUS_BLOCK_DATA, &data);
+	return i2c_smbus_throttle_xfer(client, I2C_SMBUS_WRITE, command,
+				       I2C_SMBUS_BLOCK_DATA, &data);
 }
 EXPORT_SYMBOL(i2c_smbus_write_block_data);
 
@@ -273,9 +270,8 @@ s32 i2c_smbus_read_i2c_block_data(const struct i2c_client *client, u8 command,
 	if (length > I2C_SMBUS_BLOCK_MAX)
 		length = I2C_SMBUS_BLOCK_MAX;
 	data.block[0] = length;
-	status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-				I2C_SMBUS_READ, command,
-				I2C_SMBUS_I2C_BLOCK_DATA, &data);
+	status = i2c_smbus_throttle_xfer(client, I2C_SMBUS_READ, command,
+					 I2C_SMBUS_I2C_BLOCK_DATA, &data);
 	if (status < 0)
 		return status;
 
@@ -293,9 +289,8 @@ s32 i2c_smbus_write_i2c_block_data(const struct i2c_client *client, u8 command,
 		length = I2C_SMBUS_BLOCK_MAX;
 	data.block[0] = length;
 	memcpy(data.block + 1, values, length);
-	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-			      I2C_SMBUS_WRITE, command,
-			      I2C_SMBUS_I2C_BLOCK_DATA, &data);
+	return i2c_smbus_throttle_xfer(client, I2C_SMBUS_WRITE, command,
+				       I2C_SMBUS_I2C_BLOCK_DATA, &data);
 }
 EXPORT_SYMBOL(i2c_smbus_write_i2c_block_data);
 
@@ -550,6 +545,71 @@ s32 i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 }
 EXPORT_SYMBOL(i2c_smbus_xfer);
 
+static int i2c_smbus_throttle_enter(const struct i2c_client *client)
+		__acquires(&priv->throttle_lock)
+{
+	struct i2c_client_priv *priv;
+	ktime_t earliest;
+	int rc;
+
+	priv = to_i2c_client_priv(client);
+
+	if (i2c_in_atomic_xfer_mode()) {
+		if (!mutex_trylock(&priv->throttle_lock))
+			return -EAGAIN;
+	} else {
+		rc = mutex_lock_interruptible(&priv->throttle_lock);
+		if (rc)
+			return rc;
+	}
+	earliest = ktime_add_us(priv->last, priv->delay_us);
+
+	if (priv->delay_us && ktime_before(ktime_get(), earliest)) {
+		if (i2c_in_atomic_xfer_mode()) {
+			mutex_unlock(&priv->throttle_lock);
+			return -EAGAIN;
+		}
+
+		usleep_range(priv->delay_us, 2 * priv->delay_us);
+	}
+
+	return 0;
+}
+
+static void i2c_smbus_throttle_exit(const struct i2c_client *client)
+		__releases(&priv->throttle_lock)
+{
+	struct i2c_client_priv *priv;
+
+	priv = to_i2c_client_priv(client);
+
+	if (priv->delay_us)
+		priv->last = ktime_get();
+	mutex_unlock(&priv->throttle_lock);
+}
+
+static s32 i2c_smbus_throttle_xfer(const struct i2c_client *client,
+				   char read_write, u8 command, int protocol,
+				   union i2c_smbus_data *data)
+{
+	s32 res;
+
+	res = i2c_smbus_throttle_enter(client);
+	if (res)
+		return res;
+
+	res = __i2c_lock_bus_helper(client->adapter);
+	if (!res)
+		res = __i2c_smbus_xfer(client->adapter, client->addr,
+				       client->flags, read_write, command,
+				       protocol, data);
+	i2c_unlock_bus(client->adapter, I2C_LOCK_SEGMENT);
+
+	i2c_smbus_throttle_exit(client);
+
+	return res;
+}
+
 s32 __i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 		     unsigned short flags, char read_write,
 		     u8 command, int protocol, union i2c_smbus_data *data)
@@ -721,3 +781,28 @@ int i2c_setup_smbus_alert(struct i2c_adapter *adapter)
 	return PTR_ERR_OR_ZERO(i2c_new_smbus_alert_device(adapter, NULL));
 }
 #endif
+
+
+int i2c_smbus_throttle_client(struct i2c_client *client,
+			       unsigned long delay_us)
+{
+	struct i2c_client_priv *priv;
+	int rc;
+
+	priv = to_i2c_client_priv(client);
+
+	if (i2c_in_atomic_xfer_mode()) {
+		if (!mutex_trylock(&priv->throttle_lock))
+			return -EAGAIN;
+	} else {
+		rc = mutex_lock_interruptible(&priv->throttle_lock);
+		if (rc)
+			return rc;
+	}
+	priv->delay_us = delay_us;
+	priv->last = ktime_get();
+	mutex_unlock(&priv->throttle_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(i2c_smbus_throttle_client);
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 1247e6e6e975..4aebcd5a3dc3 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -4,6 +4,29 @@
  */
 
 #include <linux/rwsem.h>
+#include <linux/i2c.h>
+#include <linux/timekeeping.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+
+struct i2c_client_priv {
+	struct i2c_client client;
+
+	/*
+	 * Per-client access throttling, described in terms of microsecond
+	 * delay between the end of the nth transfer and the start of the
+	 * (n+1)th transfer. Used to manage devices which respond poorly to
+	 * rapid back-to-back commands.
+	 *
+	 * Do it in a wrapper struct to preserve const-ness of the i2c_smbus_*
+	 * interfaces.
+	 */
+	struct mutex throttle_lock;
+	unsigned long delay_us;
+	ktime_t last;
+};
+#define to_i2c_client_priv(c) container_of(c, struct i2c_client_priv, client)
+
 
 struct i2c_devinfo {
 	struct list_head	list;
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 0dae9db27538..b6a317e679ca 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -187,6 +187,8 @@ s32 i2c_smbus_write_i2c_block_data(const struct i2c_client *client,
 s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
 					      u8 command, u8 length,
 					      u8 *values);
+int i2c_smbus_throttle_client(struct i2c_client *client,
+			      unsigned long delay_us);
 int i2c_get_device_id(const struct i2c_client *client,
 		      struct i2c_device_identity *id);
 const struct i2c_device_id *i2c_client_get_device_id(const struct i2c_client *client);
-- 
2.39.2

