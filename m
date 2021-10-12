Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6564429AC7
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Oct 2021 03:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbhJLBK1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 21:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230074AbhJLBK1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Oct 2021 21:10:27 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2003C06161C
        for <linux-i2c@vger.kernel.org>; Mon, 11 Oct 2021 18:08:24 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id j5so80777703lfg.8
        for <linux-i2c@vger.kernel.org>; Mon, 11 Oct 2021 18:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=TwOeLnfWWv7fat9oyQdft7/MoLdXXciyS6TClTMDJ9w=;
        b=JaZ79AYYL7b6mmQgx31ARu0GMTLokVxT6kbH8SBj2AxS/eu52gsFrxPxDaFEZUZFmr
         dyD0OvIJNvITCLVns/8upeu9onJdgKAFEBomfL+YYpnJcEUqOAjv5XlT84piop7ilzuv
         GKFeQOKbuBBiOWQ18Imk2/6Uh/1oooX1jZ8n3j8jc63H0r3h0aD5x6DVVudFp6a0lSM0
         ameAhEZm1XIpnBmf42SOCKkVqbUaClBtqI2hqQ1NNdbhqa5C+s2hOcH4dBhqDmlBzl6i
         97rle4qNRn9gwcTvBSWLOXW63maNScylaDRcUkscmxcA+JHom8DGzOgkYEfuJUFydw23
         LRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=TwOeLnfWWv7fat9oyQdft7/MoLdXXciyS6TClTMDJ9w=;
        b=EXNyWZZ9Li7wXAI9mic8xNScnxNvTLMaDHgVPzMrUW5bFF9nTJc29QsqW8ef8pKv12
         Xl6nVeHOG0seguloM0G6QiNp3AOvUGQKf1dJDkkIGPMXHKKfqP/u4pe3KBVnuuaSMGvq
         zebb6LAMr/xDisch45nkz/er28Vspkil517ut7Ln/YSoIJrSMNMExOBuPLs7IrDh2J7Z
         OYew0fKGmkLIxwub0gQy4F0qKbvk3nBt83XBh6b4AIgyJ/gqQKFIewSc45vsr5CmXKkK
         sEhxoOajOb64+LGgvM4MZZyfnJCpJ8BP/VC+OMYZW391Uh5xfdjXmM6vM6kSaNGfEzTQ
         8W1A==
X-Gm-Message-State: AOAM531vhZKDGRLFTzopKjftlDYzXkz7EwBMptyviCfAaJjsh7OKeNGY
        TIerE0dgqD64zlQaVGCUHAct7hwzSZoexIDZPsf8kpC8W2c9/A==
X-Google-Smtp-Source: ABdhPJzTqv/qZ777zf0gw//q5BDpSAbcPtykoNv8BSKvuAp8hJ5OevDHkgRwsOipASnguHWN7TeHgSEz/u0c3T/6tDE=
X-Received: by 2002:a05:6512:ea1:: with SMTP id bi33mr12669706lfb.287.1634000888784;
 Mon, 11 Oct 2021 18:08:08 -0700 (PDT)
MIME-Version: 1.0
From:   Sui Chen <suichen@google.com>
Date:   Mon, 11 Oct 2021 18:07:56 -0700
Message-ID: <CAJOps0uL=AJ2ZQZxdurSNbMG19zOrQ6+OJAQPFrx6uekVKzhLQ@mail.gmail.com>
Subject: [RFC Patch 1/2] i2c debug counters as sysfs attributes
To:     linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This change adds a few example I2C debug counters as sysfs attributes:
- ber_cnt (bus error count)
- nack_cnt (NACK count)
- rec_fail_cnt, rec_succ_cnt (recovery failure/success count)
- timeout_cnt (timeout count)
- i2c_speed (bus frequency)

The function i2c_adapter_create_stats_folder creates a stats directory
in the device's sysfs directory to hold the debug counters. The platform
drivers will instantiate the counters in the stats directory if
available.

Signed-off-by: Sui Chen <suichen@google.com>
---
 drivers/i2c/i2c-core-base.c |  3 ++
 drivers/i2c/i2c-dev.c       | 99 +++++++++++++++++++++++++++++++++++++
 include/linux/i2c.h         | 21 ++++++++
 3 files changed, 123 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 84f12bf90644a..ca4ef4d8b1799 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1610,6 +1610,9 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
  bus_for_each_drv(&i2c_bus_type, NULL, adap, __process_new_adapter);
  mutex_unlock(&core_lock);

+ /* Create a statistics folder for this i2c-adapter */
+ i2c_adapter_create_stats_folder(adap);
+
  return 0;

 out_reg:
diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index 77f576e516522..1f29beb7b8eab 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -767,6 +767,105 @@ static void __exit i2c_dev_exit(void)
  unregister_chrdev_region(MKDEV(I2C_MAJOR, 0), I2C_MINORS);
 }

+
+static struct i2c_adapter* kobj_to_adapter(struct device* pdev) {
+ struct kobject* dev_kobj = ((struct kobject*)pdev)->parent;
+ struct device* dev = container_of(dev_kobj, struct device, kobj);
+ return to_i2c_adapter(dev);
+}
+
+static ssize_t ber_cnt_show(struct device* pdev,
+ struct device_attribute* attr, char* buf) {
+ u64* ber_cnt = kobj_to_adapter(pdev)->stats->ber_cnt;
+ if (ber_cnt == NULL) return 0;
+ ssize_t ret = sprintf(buf, "%llu\n", *ber_cnt);
+ return ret;
+}
+DEVICE_ATTR_RO(ber_cnt);
+
+ssize_t nack_cnt_show(struct device* pdev,
+ struct device_attribute* attr, char* buf) {
+ u64* nack_cnt = kobj_to_adapter(pdev)->stats->nack_cnt;
+ if (nack_cnt == NULL) return 0;
+ ssize_t ret = sprintf(buf, "%llu\n", *nack_cnt);
+ return ret;
+}
+DEVICE_ATTR_RO(nack_cnt);
+
+ssize_t rec_succ_cnt_show(struct device* pdev,
+ struct device_attribute* attr, char* buf) {
+ u64* rec_succ_cnt = kobj_to_adapter(pdev)->stats->rec_succ_cnt;
+ if (rec_succ_cnt == NULL) return 0;
+ ssize_t ret = sprintf(buf, "%llu\n", *rec_succ_cnt);
+ return ret;
+}
+DEVICE_ATTR_RO(rec_succ_cnt);
+
+ssize_t rec_fail_cnt_show(struct device* pdev,
+ struct device_attribute* attr, char* buf) {
+ u64* rec_fail_cnt = kobj_to_adapter(pdev)->stats->rec_fail_cnt;
+ if (rec_fail_cnt == NULL) return 0;
+ ssize_t ret = sprintf(buf, "%llu\n", *rec_fail_cnt);
+ return ret;
+}
+DEVICE_ATTR_RO(rec_fail_cnt);
+
+ssize_t timeout_cnt_show(struct device* pdev,
+ struct device_attribute* attr, char* buf) {
+ u64* timeout_cnt = kobj_to_adapter(pdev)->stats->timeout_cnt;
+ if (timeout_cnt == NULL) return 0;
+ ssize_t ret = sprintf(buf, "%llu\n", *timeout_cnt);
+ return ret;
+}
+DEVICE_ATTR_RO(timeout_cnt);
+
+ssize_t i2c_speed_show(struct device* pdev,
+ struct device_attribute* attr, char* buf) {
+ u64* i2c_speed = kobj_to_adapter(pdev)->stats->i2c_speed;
+ if (i2c_speed == NULL) return 0;
+ ssize_t ret = sprintf(buf, "%llu\n", *i2c_speed);
+ return ret;
+}
+DEVICE_ATTR_RO(i2c_speed);
+
+void i2c_adapter_create_stats_folder(struct i2c_adapter* adapter) {
+ adapter->stats = kzalloc(sizeof(struct i2c_adapter_stats), GFP_KERNEL);
+ adapter->stats->kobj = kobject_create_and_add("stats", &adapter->dev.kobj);;
+}
+
+void i2c_adapter_stats_register_counter(struct i2c_adapter* adapter,
+ const char* counter_name, void* data_source) {
+ int ret;
+ if (adapter->stats == NULL) {
+ i2c_adapter_create_stats_folder(adapter);
+ }
+
+ if (!strcmp(counter_name, "ber_cnt")) {
+ adapter->stats->ber_cnt = data_source;
+ ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_ber_cnt.attr);
+ } else if (!strcmp(counter_name, "nack_cnt")) {
+ adapter->stats->nack_cnt = data_source;
+ ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_nack_cnt.attr);
+ } else if (!strcmp(counter_name, "rec_succ_cnt")) {
+ adapter->stats->rec_succ_cnt = data_source;
+ ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_rec_succ_cnt.attr);
+ } else if (!strcmp(counter_name, "rec_fail_cnt")) {
+ adapter->stats->rec_fail_cnt = data_source;
+ ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_rec_fail_cnt.attr);
+ } else if (!strcmp(counter_name, "timeout_cnt")) {
+ adapter->stats->timeout_cnt = data_source;
+ ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_timeout_cnt.attr);
+ } else if (!strcmp(counter_name, "i2c_speed")) {
+ adapter->stats->i2c_speed = data_source;
+ ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_i2c_speed.attr);
+ }
+
+ if (ret) {
+ printk("Failed to create sysfs file for %s", counter_name);
+ }
+}
+
+
 MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl>");
 MODULE_AUTHOR("Simon G. Vogl <simon@tk.uni-linz.ac.at>");
 MODULE_DESCRIPTION("I2C /dev entries driver");
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 3eb60a2e9e618..4267541660074 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -21,6 +21,7 @@
 #include <linux/of.h> /* for struct device_node */
 #include <linux/swab.h> /* for swab16 */
 #include <uapi/linux/i2c.h>
+#include <linux/slab.h> /* for kzalloc */

 extern struct bus_type i2c_bus_type;
 extern struct device_type i2c_adapter_type;
@@ -684,6 +685,21 @@ struct i2c_adapter_quirks {
  u16 max_comb_2nd_msg_len;
 };

+/**
+ * I2C statistics
+ * The list of statistics are currently copied from npcm7xx.
+ * Perhaps a more universal set of statistics can be used.
+ */
+struct i2c_adapter_stats {
+ struct kobject* kobj;
+ u64* ber_cnt;
+ u64* nack_cnt;
+ u64* rec_succ_cnt;
+ u64* rec_fail_cnt;
+ u64* timeout_cnt;
+ u64* i2c_speed;
+};
+
 /* enforce max_num_msgs = 2 and use max_comb_*_len for length checks */
 #define I2C_AQ_COMB BIT(0)
 /* first combined message must be write */
@@ -735,12 +751,17 @@ struct i2c_adapter {

  struct i2c_bus_recovery_info *bus_recovery_info;
  const struct i2c_adapter_quirks *quirks;
+ struct i2c_adapter_stats* stats;

  struct irq_domain *host_notify_domain;
  struct regulator *bus_regulator;
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)

+void i2c_adapter_create_stats_folder(struct i2c_adapter* adapter);
+void i2c_adapter_stats_register_counter(struct i2c_adapter* adapter,
+ const char* counter_name, void* data_source);
+
 static inline void *i2c_get_adapdata(const struct i2c_adapter *adap)
 {
  return dev_get_drvdata(&adap->dev);
-- 
2.33.0.882.g93a45727a2-goog
