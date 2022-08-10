Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A266F58E7C7
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Aug 2022 09:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbiHJHVu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Aug 2022 03:21:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbiHJHVb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Aug 2022 03:21:31 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8980B65CB
        for <linux-i2c@vger.kernel.org>; Wed, 10 Aug 2022 00:21:27 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id k13-20020a056902024d00b0066fa7f50b97so11431107ybs.6
        for <linux-i2c@vger.kernel.org>; Wed, 10 Aug 2022 00:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=pnFnFHNpmd0n2hgyZvckPaNbwAr0ZSVFKcbnQPJ5x8w=;
        b=sA1g04We2jt7VZVagMNzZw/38n91pyYFMtE/ynaUC0CI9osMREq/nMAc1LCn40O4IB
         1koXTPp3dKGehhA60ML9kwAbNAN8EKfKPryvizinw2XmjZIw7TjGAiC/2BQx2MTPDkN1
         OhDBzoQtq00tTfrez5fmwtF+pJMdkAEZpOE5bBYSU6aFcGuPgnXBasr89IZ3fQdz22Ji
         fNH2LvOnhAr/TfhutgP5jD/duh/puieER5XHuZrUTu4rC8UtusTuR5iclTLxzDmDbUaS
         AsMAqjw5zXWCOZ4PVEreueyFLC/Os+zEkd1Bh3ERI6sJ4y770xt6bLkfJjwgMp2dosud
         gqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=pnFnFHNpmd0n2hgyZvckPaNbwAr0ZSVFKcbnQPJ5x8w=;
        b=wWO7ViF6mEUM/4nJG5g3wrFD/fOdmxJsA3yMffA2PfN1maQaIllhQRF27eyflQNpU3
         0MXyOtO6Ztxdm9xYET8iObh6++ogtihpc9IUm1TdFO7XRZZwsrNrfP4CrkoVilkVEu2j
         KQMdytjrlPOSQL3yT5UkkZTEoaX+sZ/y3TAtjoZlvmi7O2m1nXUIN9w6E6ZXY8Y3g323
         6I5SP2TSz/SFQc5dyu4bmYkugXSlKg9n0eEe2VhoehYmeTT5cbpgoIv0pTNyP273M7Aj
         hK4uuCu0oDoOla4nnIjwbVS8c6OQRPXn+UIkabZoqKidUNbmpuC2MuwQ9E5d3YYNHf0B
         QsRA==
X-Gm-Message-State: ACgBeo0lCAY1sEBdXdp+5mSv+0hQ9AYOqL5baZwUjozqN49Evw10nAw1
        F0HE3y1QhJ4nDST3qHu5e5G8XxQc05pz
X-Google-Smtp-Source: AA6agR5EHCMdHU7aWVMBOdciZ1pbVfeNp4dB5Gb3k3vNfxa2/C9DX2Jd7nlZN5yA6yCsb7fc2Q5TF7KAAYUS
X-Received: from suichen.svl.corp.google.com ([2620:15c:2c5:13:820:de6:2fcc:8636])
 (user=suichen job=sendgmr) by 2002:a25:311:0:b0:67c:3358:c4e5 with SMTP id
 17-20020a250311000000b0067c3358c4e5mr4727632ybd.396.1660116086811; Wed, 10
 Aug 2022 00:21:26 -0700 (PDT)
Date:   Wed, 10 Aug 2022 00:20:41 -0700
In-Reply-To: <20220810072041.57055-1-suichen@google.com>
Message-Id: <20220810072041.57055-2-suichen@google.com>
Mime-Version: 1.0
References: <20220810072041.57055-1-suichen@google.com>
X-Mailer: git-send-email 2.37.1.559.g78731f0fdb-goog
Subject: [RFC Patch v5 Resend 1/1] i2c debug counters as sysfs attributes
From:   Sui Chen <suichen@google.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        wsa@kernel.org, openbmc@lists.ozlabs.org, tali.perry1@gmail.com
Cc:     joel@jms.id.au, andrew@aj.id.au, benjaminfair@google.com,
        krellan@google.com, Sui Chen <suichen@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This change renames the I2C debug counters as suggested, and makes them
available to i2c_adapter's and i2c_client's:

 - bus_errors
 - transfers (only applicable to i2c_adapter)
 - messages (only applicable to i2c_client)
 - nacks
 - timeouts
 - recovery_successes (only applicable to i2c_adapter)
 - recovery_failures (only applicable to i2c_adapter)

The above stats are located in the sysfs path "stats". The kobj for
"stats" for a i2c-device or an i2c-adapter are added as children of
the device's and adapter's kobj.

Did some quick tests with QEMU using a program that saves/replays I2C
trace by reading hwmon sensors (the program is located at
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/52527)

(normal read)
root@gsj:~# cat /sys/class/i2c-adapter/i2c-1/stats/{transfers,nacks}\
/sys/class/i2c-adapter/i2c-1/1-005c/stats/{messages,nacks} && \
sleep 1 && ./i2c_bmk_bmc 0
46
0
92
0
/sys/class/hwmon/hwmon0/temp1_input: 0
[FindTraceEntries] t0=111.000000 t1=113.000000
Found 4 interesting I2C trace entries:
 i2c_write: i2c-1 #0 a=05c f=0000 l=1 [00]
 i2c_read: i2c-1 #1 a=05c f=0001 l=2
 i2c_reply: i2c-1 #1 a=05c f=0001 l=2 [00-00]
 i2c_result: i2c-1 n=2 ret=2

root@gsj:~# cat /sys/class/i2c-adapter/i2c-1/stats/{transfers,nacks} \
/sys/class/i2c-adapter/i2c-1/1-005c/stats/{messages,nacks}
47  <-- 1 more transfer on i2c-1
0
94  <-- 2 more messages sent to 1-005c
0

(deliberately nack)
root@gsj:~# sleep 1 && ./i2c_bmk_bmc 0
(injects 1 NACK using QEMU)
/sys/class/hwmon/hwmon0/temp1_input: 0
[FindTraceEntries] t0=116.000000 t1=118.000000
Found 3 interesting I2C trace entries:
 i2c_write: i2c-1 #0 a=05c f=0000 l=1 [00]
 i2c_read: i2c-1 #1 a=05c f=0001 l=2
 i2c_result: i2c-1 n=2 ret=-6

root@gsj:~# cat /sys/class/i2c-adapter/i2c-1/stats/{transfers,nacks} \
/sys/class/i2c-adapter/i2c-1/1-005c/stats/{messages,nacks}
47
1   <-- 1 more NACK on i2c-1
94
1   <-- 1 more NACK attributed to 1-005c

Signed-off-by: Sui Chen <suichen@google.com>
---
 drivers/i2c/i2c-core-base.c | 240 +++++++++++++++++++++++++++++++++++-
 drivers/i2c/i2c-dev.c       |  94 ++++++++++++++
 include/linux/i2c.h         |  41 ++++++
 3 files changed, 374 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 84f12bf90644..4e7bd849f127 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -270,11 +270,22 @@ EXPORT_SYMBOL_GPL(i2c_generic_scl_recovery);
 
 int i2c_recover_bus(struct i2c_adapter *adap)
 {
+	if (!adap->stats)
+		i2c_adapter_create_stats_directory(adap);
+
 	if (!adap->bus_recovery_info)
 		return -EBUSY;
 
 	dev_dbg(&adap->dev, "Trying i2c bus recovery\n");
-	return adap->bus_recovery_info->recover_bus(adap);
+	int ret = adap->bus_recovery_info->recover_bus(adap);
+
+	if (ret == 0)
+		++(adap->stats->recovery_successes);
+	else
+		++(adap->stats->recovery_failures);
+
+	return ret;
+
 }
 EXPORT_SYMBOL_GPL(i2c_recover_bus);
 
@@ -993,6 +1004,78 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
 	return 0;
 }
 
+ssize_t i2c_client_stats_messages_show(struct kobject *kobj, struct kobj_attribute *addr,
+				       char *buf)
+{
+	return sysfs_emit(buf, "%llu\n",
+		container_of(kobj, struct i2c_client_stats, kobj)->messages);
+}
+
+struct kobj_attribute i2c_client_stats_messages_attr = {
+	.attr = { .name = "messages", .mode = 0444 },
+	.show = i2c_client_stats_messages_show,
+};
+
+ssize_t i2c_client_stats_bus_errors_show(struct kobject *kobj, struct kobj_attribute *addr,
+					 char *buf)
+{
+	return sysfs_emit(buf, "%llu\n",
+		container_of(kobj, struct i2c_client_stats, kobj)->bus_errors);
+}
+
+struct kobj_attribute i2c_client_stats_bus_errors_attr = {
+	.attr = { .name = "bus_errors", .mode = 0444 },
+	.show = i2c_client_stats_bus_errors_show,
+};
+
+ssize_t i2c_client_stats_nacks_show(struct kobject *kobj, struct kobj_attribute *addr,
+				    char *buf)
+{
+	return sysfs_emit(buf, "%llu\n",
+		container_of(kobj, struct i2c_client_stats, kobj)->nacks);
+}
+
+struct kobj_attribute i2c_client_stats_nacks_attr = {
+	.attr = { .name = "nacks", .mode = 0444 },
+	.show = i2c_client_stats_nacks_show,
+};
+
+ssize_t i2c_client_stats_timeouts_show(struct kobject *kobj, struct kobj_attribute *addr,
+				       char *buf)
+{
+	return sysfs_emit(buf, "%llu\n",
+		container_of(kobj, struct i2c_client_stats, kobj)->timeouts);
+}
+
+struct kobj_attribute i2c_client_stats_timeouts_attr = {
+	.attr = { .name = "timeouts", .mode = 0444 },
+	.show = i2c_client_stats_timeouts_show,
+};
+
+static struct attribute *i2c_client_stats_attrs[] = {
+	&i2c_client_stats_messages_attr.attr,
+	&i2c_client_stats_bus_errors_attr.attr,
+	&i2c_client_stats_nacks_attr.attr,
+	&i2c_client_stats_timeouts_attr.attr,
+	NULL
+};
+
+static struct kobj_type i2c_client_stats_ktype = {
+	.sysfs_ops = &kobj_sysfs_ops,
+	.default_attrs = i2c_client_stats_attrs,
+};
+
+/**
+ * Functions for maintaining the adapter -> client stats lookup structure
+ */
+static struct i2c_client_stats *__get_i2c_client_stats(struct i2c_adapter_stats *stats,
+						       int i2c_addr);
+static void __insert_i2c_client_stats(struct i2c_adapter_stats *stats,
+				      struct i2c_client_stats *client_stats,
+				      int i2c_addr);
+static void __remove_i2c_client_stats(struct i2c_adapter_stats *stats, int i2c_addr);
+static int __count_i2c_client_stats(struct i2c_adapter_stats *stats);
+
 /**
  * i2c_new_client_device - instantiate an i2c device
  * @adap: the adapter managing the device
@@ -1014,6 +1097,7 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 {
 	struct i2c_client	*client;
 	int			status;
+	struct i2c_client_stats *client_stats;
 
 	client = kzalloc(sizeof *client, GFP_KERNEL);
 	if (!client)
@@ -1069,6 +1153,20 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	dev_dbg(&adap->dev, "client [%s] registered with bus id %s\n",
 		client->name, dev_name(&client->dev));
 
+	client_stats = kzalloc(sizeof(*client_stats), GFP_KERNEL);
+	client->stats = client_stats;
+	client_stats->address = info->addr;
+
+	kobject_init_and_add(&client_stats->kobj, &i2c_client_stats_ktype,
+			     &client->dev.kobj, "stats");
+
+	if (!adap->stats)
+		i2c_adapter_create_stats_directory(adap);
+
+	__insert_i2c_client_stats(adap->stats, client_stats, info->addr);
+	dev_info(&adap->dev, "Added i2c_client_stats, adapter has %d client stats now",
+		 __count_i2c_client_stats(adap->stats));
+
 	return client;
 
 out_remove_swnode:
@@ -1103,6 +1201,12 @@ void i2c_unregister_device(struct i2c_client *client)
 	if (ACPI_COMPANION(&client->dev))
 		acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev));
 	device_remove_software_node(&client->dev);
+
+	__remove_i2c_client_stats(client->adapter->stats, client->addr);
+	dev_info(&client->adapter->dev, "Removed i2c_client_stats, adapter has %d client stats now",
+		 __count_i2c_client_stats(client->adapter->stats));
+	kfree(client->stats);
+
 	device_unregister(&client->dev);
 }
 EXPORT_SYMBOL_GPL(i2c_unregister_device);
@@ -2176,6 +2280,8 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 {
 	unsigned long orig_jiffies;
 	int ret, try;
+	int i, j, addr;
+	struct i2c_client_stats *cs;
 
 	if (WARN_ON(!msgs || num < 1))
 		return -EINVAL;
@@ -2223,6 +2329,50 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		trace_i2c_result(adap, num, ret);
 	}
 
+	// Per-adapter I2C stats
+	if (!adap->stats)
+		i2c_adapter_create_stats_directory(adap);
+	if (ret < 0) {
+		if (ret == -ENXIO)
+			++(adap->stats->nacks);
+		else if (ret == -ETIMEDOUT)
+			++(adap->stats->timeouts);
+		else
+			++(adap->stats->bus_errors);
+	} else if (num > 0) {
+		++(adap->stats->transfers);
+	}
+
+	// Per-address I2C stats
+	// If no errors, incerement the message count per client
+	if (ret >= 0) {
+		for (i = 0; i < ret; ++i) {
+			addr = msgs[i].addr;
+			cs = __get_i2c_client_stats(adap->stats, addr);
+			if (!cs)  // For muxed devices, their stats are at the leaf level
+				continue;
+			if (num > 0)
+				++(cs->messages);
+		}
+	} else {  // Otherwise, attribute the error to each of the distinct addresses
+		for (i = 0; i < num; ++i) {
+			for (j = 0; j < i; ++j) {  // de-duplicate
+				if (msgs[i].addr == msgs[j].addr)
+					goto done;
+			}
+			cs = __get_i2c_client_stats(adap->stats, msgs[i].addr);
+			if (!cs)
+				continue;
+			if (ret == -ENXIO)
+				++(cs->nacks);
+			else if (ret == -ETIMEDOUT)
+				++(cs->timeouts);
+			else
+				++(cs->bus_errors);
+done:
+			{}
+		}
+	}
 	return ret;
 }
 EXPORT_SYMBOL(__i2c_transfer);
@@ -2619,6 +2769,94 @@ void i2c_put_dma_safe_msg_buf(u8 *buf, struct i2c_msg *msg, bool xferred)
 }
 EXPORT_SYMBOL_GPL(i2c_put_dma_safe_msg_buf);
 
+static struct i2c_client_stats *__get_i2c_client_stats(struct i2c_adapter_stats *stats,
+						       int i2c_addr)
+{
+	int addr;
+	struct rb_node *n, *parent;
+	struct i2c_client_stats_rbnode *cs_node;
+
+	n = stats->i2c_client_stats_root.rb_node;
+	parent = NULL;
+	while (n) {
+		parent = n;
+		cs_node = rb_entry(parent, struct i2c_client_stats_rbnode, rb_node);
+		addr = cs_node->stats->address;
+		if (addr > i2c_addr)
+			n = n->rb_left;
+		else if (addr < i2c_addr)
+			n = n->rb_right;
+		else
+			return cs_node->stats;
+	}
+	return NULL;
+}
+
+static void __insert_i2c_client_stats(struct i2c_adapter_stats *stats,
+				      struct i2c_client_stats *client_stats, int i2c_addr)
+{
+	char buf[32];
+	int ret, addr;
+	struct rb_node **link, *parent;
+	struct i2c_client_stats_rbnode *cs_node;
+
+	ret = 1;
+	link = &stats->i2c_client_stats_root.rb_node;
+	parent = NULL;
+	while (*link) {
+		parent = *link;
+		cs_node = rb_entry(parent, struct i2c_client_stats_rbnode, rb_node);
+		addr = cs_node->stats->address;
+		if (addr > i2c_addr)
+			link = &(*link)->rb_left;
+		else if (addr < i2c_addr)
+			link = &(*link)->rb_right;
+		else
+			return; // Already exists
+	}
+
+	cs_node = kzalloc(sizeof(*cs_node), GFP_KERNEL);
+
+	cs_node->stats = client_stats;
+	rb_link_node(&cs_node->rb_node, parent, link);
+	rb_insert_color(&cs_node->rb_node, &stats->i2c_client_stats_root);
+}
+
+static void __remove_i2c_client_stats(struct i2c_adapter_stats *stats, int i2c_addr)
+{
+	int addr;
+	struct rb_node *n, *parent;
+	struct i2c_client_stats_rbnode *cs_node;
+
+	n = stats->i2c_client_stats_root.rb_node;
+	parent = NULL;
+	while (n) {
+		parent = n;
+		cs_node = rb_entry(parent, struct i2c_client_stats_rbnode, rb_node);
+		addr = cs_node->stats->address;
+		if (addr > i2c_addr) {
+			n = n->rb_left;
+		} else if (addr < i2c_addr) {
+			n = n->rb_right;
+		} else {
+			rb_erase(&cs_node->rb_node, &stats->i2c_client_stats_root);
+			return;
+		}
+	}
+}
+
+static int __count_i2c_client_stats(struct i2c_adapter_stats *stats)
+{
+	struct rb_node *n = stats->i2c_client_stats_root.rb_node;
+	int ret = 0;
+
+	while (n) {
+		++ret;
+		n = rb_next(n);
+	}
+	return ret;
+}
+
 MODULE_AUTHOR("Simon G. Vogl <simon@tk.uni-linz.ac.at>");
 MODULE_DESCRIPTION("I2C-Bus main module");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index 77f576e51652..50141dd42796 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -767,6 +767,100 @@ static void __exit i2c_dev_exit(void)
 	unregister_chrdev_region(MKDEV(I2C_MAJOR, 0), I2C_MINORS);
 }
 
+static struct i2c_adapter *kobj_to_adapter(struct device *pdev)
+{
+	struct kobject *dev_kobj;
+	struct device *dev;
+
+	dev_kobj = ((struct kobject *)pdev)->parent;
+	dev = container_of(dev_kobj, struct device, kobj);
+	return to_i2c_adapter(dev);
+}
+
+ssize_t bus_errors_show(struct device *pdev,
+			struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->bus_errors);
+}
+DEVICE_ATTR_RO(bus_errors);
+
+ssize_t transfers_show(struct device *pdev,
+		       struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->transfers);
+}
+DEVICE_ATTR_RO(transfers);
+
+ssize_t nacks_show(struct device *pdev,
+		   struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->nacks);
+}
+DEVICE_ATTR_RO(nacks);
+
+ssize_t recovery_successes_show(struct device *pdev,
+				struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->recovery_successes);
+}
+DEVICE_ATTR_RO(recovery_successes);
+
+ssize_t recovery_failures_show(struct device *pdev,
+			       struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->recovery_failures);
+}
+DEVICE_ATTR_RO(recovery_failures);
+
+ssize_t timeouts_show(struct device *pdev,
+		      struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->timeouts);
+}
+DEVICE_ATTR_RO(timeouts);
+
+/**
+ * i2c_adapter_create_stats_directory - creates folder for I2C statistics.
+ * @adapter: the i2c_adapter to create the stats directory for.
+ *
+ * Return: 0 if successful, 1 if failed.
+ */
+int i2c_adapter_create_stats_directory(struct i2c_adapter *adapter)
+{
+	struct i2c_adapter_stats *stats;
+	int ret = 1;
+
+	stats = kzalloc(sizeof(*stats), GFP_KERNEL);
+	if (!stats) {
+		adapter->stats = NULL;
+		return ret;
+	}
+	adapter->stats = stats;
+	adapter->stats->kobj = kobject_create_and_add("stats", &adapter->dev.kobj);
+
+	ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_transfers.attr);
+	if (ret)
+		dev_warn(&adapter->dev, "Failed to create sysfs file for tx_complete_cnt\n");
+
+	ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_bus_errors.attr);
+	if (ret)
+		dev_warn(&adapter->dev, "Failed to create sysfs file for bus_errors\n");
+
+	ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_nacks.attr);
+	if (ret)
+		dev_warn(&adapter->dev, "Failed to create sysfs file for nacks\n");
+
+	ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_recovery_successes.attr);
+	if (ret)
+		dev_warn(&adapter->dev, "Failed to create sysfs file for recovery_successes\n");
+
+	ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_recovery_failures.attr);
+	if (ret)
+		dev_warn(&adapter->dev, "Failed to create sysfs file for recovery_failures\n");
+
+	return ret;
+}
+
 MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl>");
 MODULE_AUTHOR("Simon G. Vogl <simon@tk.uni-linz.ac.at>");
 MODULE_DESCRIPTION("I2C /dev entries driver");
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 3eb60a2e9e61..4547c4c782b6 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -20,6 +20,7 @@
 #include <linux/irqdomain.h>		/* for Host Notify IRQ */
 #include <linux/of.h>		/* for struct device_node */
 #include <linux/swab.h>		/* for swab16 */
+#include <linux/rbtree.h>
 #include <uapi/linux/i2c.h>
 
 extern struct bus_type i2c_bus_type;
@@ -297,6 +298,20 @@ struct i2c_driver {
 };
 #define to_i2c_driver(d) container_of(d, struct i2c_driver, driver)
 
+int i2c_adapter_create_stats_directory(struct i2c_adapter *adapter);
+
+void i2c_adapter_stats_register_counter(struct i2c_adapter *adapter,
+					const char *counter_name, void *data_source);
+
+struct i2c_client_stats {
+	struct kobject kobj;
+	int address;
+	u64 messages;
+	u64 bus_errors;
+	u64 nacks;
+	u64 timeouts;
+};
+
 /**
  * struct i2c_client - represent an I2C slave device
  * @flags: see I2C_CLIENT_* for possible flags
@@ -342,6 +357,7 @@ struct i2c_client {
 	i2c_slave_cb_t slave_cb;	/* callback for slave mode	*/
 #endif
 	void *devres_group_id;		/* ID of probe devres group	*/
+	struct i2c_client_stats *stats; /* i2c client stats             */
 };
 #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
 
@@ -684,6 +700,30 @@ struct i2c_adapter_quirks {
 	u16 max_comb_2nd_msg_len;
 };
 
+/**
+ * I2C adapter statistics
+ */
+struct i2c_adapter_stats {
+	struct kobject *kobj;
+
+	u64 transfers;
+	u64 bus_errors;
+	u64 nacks;
+	u64 recovery_successes;
+	u64 recovery_failures;
+	u64 timeouts;
+
+	struct rb_root i2c_client_stats_root;
+};
+
+struct i2c_client_stats_rbnode {
+	struct i2c_client_stats *stats;
+	struct rb_node rb_node;
+};
+
+struct i2c_client_stats *__get_or_create_i2c_client_stats(struct i2c_adapter_stats *stats,
+							  int i2c_addr);
+
 /* enforce max_num_msgs = 2 and use max_comb_*_len for length checks */
 #define I2C_AQ_COMB			BIT(0)
 /* first combined message must be write */
@@ -738,6 +778,7 @@ struct i2c_adapter {
 
 	struct irq_domain *host_notify_domain;
 	struct regulator *bus_regulator;
+	struct i2c_adapter_stats *stats;
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
-- 
2.37.1.559.g78731f0fdb-goog

