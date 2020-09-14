Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFAA226931A
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 19:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgINRXp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 13:23:45 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:47771 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726458AbgINM2v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Sep 2020 08:28:51 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 937B85C00DF;
        Mon, 14 Sep 2020 08:28:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 14 Sep 2020 08:28:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=RWdG3igRn+As4
        Qu/WKR51RueOA9kAsjc50H1IKMF3/M=; b=kdODESEl+TUUIqsBZzUwxywJ0L9QB
        UXRl17QAWRT5+9Jd9xY9cZXD89nAGOnnw5r2/UnlOs9hXO2FSVyfzV5eaazMRcbf
        nNASi0jq58rQcF0Hx8tZGZ1dT62snqX3+14XSMigVTHA5Pu8sM3W5OmpNjIu6p07
        ZEn1u1L3S0tJ3TVfqP6LOkvdyUvVbwZ6wVdSlcjmvOfOyPlfRWOHIvMnqi94lFup
        b97XNsx0iIXo5TZ7/4bzNaG2uU4f74vMWaSitWrO+v2tasVrScv0WfWhZlxwzN9Q
        6h+ElFUBcGYCNJFM3qI6nMeWwlQqt3EV4oZheA1jW8g+kUptsFASu7NQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=RWdG3igRn+As4Qu/WKR51RueOA9kAsjc50H1IKMF3/M=; b=EEPsHmGW
        iMdNmoo9VquMaBKbRUtULa3U2VObWlJf4lqTm3Nx1y3mKuWLuvN3bQcgF8OhJpEh
        9HUWhI+n0vO951pdKwImxRgdtGGfhBXphK7exquR2mNTI7SxyDM6p171DQaJwXOU
        5q/dIHLopz4vksoyNPWowMBch9aOF+hjkyGScNfnN8IOzT8ll2IFK1kZktubn9F1
        shbnX4dIOkk6HMR4ALZ7vWEB64Q1WWlGOOYjpI3QyaYziPAHbtF4eq6+rljyzqwQ
        TTIQnMdJQdcHKtXygpZ9k/t5px8Jzh2hHJ6CDgmogDc8jkuPVvRCKP9fm4ZbtE6x
        3/YjWqm9LVUCow==
X-ME-Sender: <xms:AGJfX-TnjTezrBwRFnXqEb1u0_PFWoNlfTRJOf86NQ75MW-bkIgE0g>
    <xme:AGJfXzyw6OuVvVcIbxhiYpSOXnqwkovVZy4K6SwSyQqSguA2qkibBdMOC6Ke9ak2t
    bAhbjVdeEdMq6tP1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeiiedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
    jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
    etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddruddtledrkeehnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
    ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:AGJfX71JGfe0MDNxHGzVA6MxEqKR7PDDPdKtkqAAYfulGtvpWSQgfw>
    <xmx:AGJfX6CfIxNLy9G7DfoZDMp09ieimahdXPOom_HLdHeWIFcTdpoQyQ>
    <xmx:AGJfX3h7WEsA06CtEPFiFB667ORb7v0EFfXPVJzvMtpa6Z_A_EFUng>
    <xmx:AGJfX3ccGykSqZn13fX5DTH8lOV_BEVHIZRJhAGiltNj_KW_H-t_5g>
Received: from localhost.localdomain (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
        by mail.messagingengine.com (Postfix) with ESMTPA id B26BD306468E;
        Mon, 14 Sep 2020 08:28:45 -0400 (EDT)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, wsa@kernel.org,
        joel@jms.id.au, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] i2c: smbus: Allow throttling of transfers to client devices
Date:   Mon, 14 Sep 2020 21:58:10 +0930
Message-Id: <20200914122811.3295678-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200914122811.3295678-1-andrew@aj.id.au>
References: <20200914122811.3295678-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some devices fail to cope in disastrous ways with the small command
turn-around times enabled by in-kernel device drivers.

Introduce per-client throttling of transfers to avoid these issues.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/i2c/i2c-core-base.c  |   8 +-
 drivers/i2c/i2c-core-smbus.c | 149 ++++++++++++++++++++++++++++-------
 drivers/i2c/i2c-core.h       |  22 ++++++
 include/linux/i2c.h          |   3 +
 4 files changed, 151 insertions(+), 31 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5ec082e2039d..d5a519bcadf9 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -867,13 +867,17 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
 struct i2c_client *
 i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
 {
+	struct i2c_client_priv	*priv;
 	struct i2c_client	*client;
 	int			status;
 
-	client = kzalloc(sizeof *client, GFP_KERNEL);
-	if (!client)
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
 		return ERR_PTR(-ENOMEM);
 
+	mutex_init(&priv->throttle_lock);
+	client = &priv->client;
+
 	client->adapter = adap;
 
 	client->dev.platform_data = info->platform_data;
diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index f5c9787992e9..4a9692a37e1e 100644
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
@@ -21,6 +22,9 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/smbus.h>
 
+static s32 i2c_smbus_throttle_xfer(const struct i2c_client *client,
+				   char read_write, u8 command, int protocol,
+				   union i2c_smbus_data *data);
 
 /* The SMBus parts */
 
@@ -95,9 +99,9 @@ s32 i2c_smbus_read_byte(const struct i2c_client *client)
 	union i2c_smbus_data data;
 	int status;
 
-	status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-				I2C_SMBUS_READ, 0,
-				I2C_SMBUS_BYTE, &data);
+	status = i2c_smbus_throttle_xfer(client, I2C_SMBUS_READ, 0,
+					 I2C_SMBUS_BYTE, &data);
+
 	return (status < 0) ? status : data.byte;
 }
 EXPORT_SYMBOL(i2c_smbus_read_byte);
@@ -112,8 +116,8 @@ EXPORT_SYMBOL(i2c_smbus_read_byte);
  */
 s32 i2c_smbus_write_byte(const struct i2c_client *client, u8 value)
 {
-	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-	                      I2C_SMBUS_WRITE, value, I2C_SMBUS_BYTE, NULL);
+	return i2c_smbus_throttle_xfer(client, I2C_SMBUS_WRITE, value,
+				       I2C_SMBUS_BYTE, NULL);
 }
 EXPORT_SYMBOL(i2c_smbus_write_byte);
 
@@ -130,9 +134,9 @@ s32 i2c_smbus_read_byte_data(const struct i2c_client *client, u8 command)
 	union i2c_smbus_data data;
 	int status;
 
-	status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-				I2C_SMBUS_READ, command,
-				I2C_SMBUS_BYTE_DATA, &data);
+	status = i2c_smbus_throttle_xfer(client, I2C_SMBUS_READ, command,
+					 I2C_SMBUS_BYTE_DATA, &data);
+
 	return (status < 0) ? status : data.byte;
 }
 EXPORT_SYMBOL(i2c_smbus_read_byte_data);
@@ -150,10 +154,10 @@ s32 i2c_smbus_write_byte_data(const struct i2c_client *client, u8 command,
 			      u8 value)
 {
 	union i2c_smbus_data data;
+
 	data.byte = value;
-	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-			      I2C_SMBUS_WRITE, command,
-			      I2C_SMBUS_BYTE_DATA, &data);
+	return i2c_smbus_throttle_xfer(client, I2C_SMBUS_WRITE, command,
+				       I2C_SMBUS_BYTE_DATA, &data);
 }
 EXPORT_SYMBOL(i2c_smbus_write_byte_data);
 
@@ -170,9 +174,9 @@ s32 i2c_smbus_read_word_data(const struct i2c_client *client, u8 command)
 	union i2c_smbus_data data;
 	int status;
 
-	status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-				I2C_SMBUS_READ, command,
-				I2C_SMBUS_WORD_DATA, &data);
+	status = i2c_smbus_throttle_xfer(client, I2C_SMBUS_READ, command,
+					 I2C_SMBUS_WORD_DATA, &data);
+
 	return (status < 0) ? status : data.word;
 }
 EXPORT_SYMBOL(i2c_smbus_read_word_data);
@@ -190,10 +194,10 @@ s32 i2c_smbus_write_word_data(const struct i2c_client *client, u8 command,
 			      u16 value)
 {
 	union i2c_smbus_data data;
+
 	data.word = value;
-	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-			      I2C_SMBUS_WRITE, command,
-			      I2C_SMBUS_WORD_DATA, &data);
+	return i2c_smbus_throttle_xfer(client, I2C_SMBUS_WRITE, command,
+				       I2C_SMBUS_WORD_DATA, &data);
 }
 EXPORT_SYMBOL(i2c_smbus_write_word_data);
 
@@ -218,9 +222,9 @@ s32 i2c_smbus_read_block_data(const struct i2c_client *client, u8 command,
 	union i2c_smbus_data data;
 	int status;
 
-	status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-				I2C_SMBUS_READ, command,
-				I2C_SMBUS_BLOCK_DATA, &data);
+	status = i2c_smbus_throttle_xfer(client, I2C_SMBUS_READ, command,
+					 I2C_SMBUS_BLOCK_DATA, &data);
+
 	if (status)
 		return status;
 
@@ -248,9 +252,8 @@ s32 i2c_smbus_write_block_data(const struct i2c_client *client, u8 command,
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
 
@@ -264,9 +267,9 @@ s32 i2c_smbus_read_i2c_block_data(const struct i2c_client *client, u8 command,
 	if (length > I2C_SMBUS_BLOCK_MAX)
 		length = I2C_SMBUS_BLOCK_MAX;
 	data.block[0] = length;
-	status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-				I2C_SMBUS_READ, command,
-				I2C_SMBUS_I2C_BLOCK_DATA, &data);
+	status = i2c_smbus_throttle_xfer(client, I2C_SMBUS_READ, command,
+					 I2C_SMBUS_I2C_BLOCK_DATA, &data);
+
 	if (status < 0)
 		return status;
 
@@ -284,9 +287,8 @@ s32 i2c_smbus_write_i2c_block_data(const struct i2c_client *client, u8 command,
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
 
@@ -547,6 +549,71 @@ s32 i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
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
@@ -715,3 +782,27 @@ int of_i2c_setup_smbus_alert(struct i2c_adapter *adapter)
 }
 EXPORT_SYMBOL_GPL(of_i2c_setup_smbus_alert);
 #endif
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
index 8ce261167a2d..c763c6c431f9 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -4,6 +4,28 @@
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
 
 struct i2c_devinfo {
 	struct list_head	list;
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index fc55ea41d323..adc91587d7fa 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -181,8 +181,11 @@ s32 i2c_smbus_write_i2c_block_data(const struct i2c_client *client,
 s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
 					      u8 command, u8 length,
 					      u8 *values);
+int i2c_smbus_throttle_client(struct i2c_client *client,
+			       unsigned long delay_us);
 int i2c_get_device_id(const struct i2c_client *client,
 		      struct i2c_device_identity *id);
+
 #endif /* I2C */
 
 /**
-- 
2.25.1

