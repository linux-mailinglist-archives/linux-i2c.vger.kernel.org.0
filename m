Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F16BCFF36
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2019 18:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728929AbfJHQrD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Oct 2019 12:47:03 -0400
Received: from smtpo.poczta.interia.pl ([217.74.65.208]:60086 "EHLO
        smtpo.poczta.interia.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfJHQrD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Oct 2019 12:47:03 -0400
X-Greylist: delayed 423 seconds by postgrey-1.27 at vger.kernel.org; Tue, 08 Oct 2019 12:47:02 EDT
X-Interia-R: Interia
X-Interia-R-IP: 188.121.19.19
X-Interia-R-Helo: <t480s.localdomain>
Received: from t480s.localdomain (unknown [188.121.19.19])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
        Tue,  8 Oct 2019 18:39:57 +0200 (CEST)
Date:   Tue, 8 Oct 2019 18:39:56 +0200
From:   Slawomir Stepien <sst@poczta.fm>
To:     wsa@the-dreams.de, linux-i2c@vger.kernel.org
Cc:     krzysztof.adamski@nokia.com, jakub.lewalski@nokia.com,
        slawomir.stepien@nokia.com, alexander.sverdlin@nokia.com
Subject: [RFCv3] i2c: hold the core_lock for the whole execution of
 i2c_register_adapter()
Message-ID: <20191008163956.GB566933@t480s.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Interia-Antivirus: OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1570552798;
        bh=Ru037CYVk4jxGVkuH0AXV7tPn1HrzGzug+c1azLIwxk=;
        h=X-Interia-R:X-Interia-R-IP:X-Interia-R-Helo:Date:From:To:Cc:
         Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
         Content-Transfer-Encoding:User-Agent:X-Interia-Antivirus;
        b=FfgwspXdps2abPigvH3UfG5h8BurNj4tN5hl1CmSyAtOJD0LWbIIoh8vUnLsx2JRV
         zwHWMBAPbSbk/n1JMtmxKWD3h7s4Rn1F3Ei35T/+rpU1PWjT26AP6JmdzOMx90onfd
         XQsKwl4CqZo8/5Bzpt2qes8ZrXz4KZSvYRCMjy78=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Sławomir Stępień <slawomir.stepien@nokia.com>

There is a race condition between the i2c_get_adapter() and the
i2c_add_adapter() if this mutex isn't hold for the whole execution of
i2c_register_adapter().

If the mutex isn't locked, it is possible to find idr that points to
adapter that hasn't been registered yet (i.e. it's
kobj.state_initialized is still false), which will end up with warning
message:

"... is not initialized, yet kobject_get() is being called."

This patch will change how the locking is arranged around
i2c_register_adapter() call and will prevent such situations. The part
of the i2c_register_adapter() that do not need to be under the lock has
been moved to a new function i2c_process_adapter.

Signed-off-by: Sławomir Stępień <slawomir.stepien@nokia.com>
---
v1 -> v2:
* added return 0; just before out_reg label.
v2 -> v3
* email and server change, so it's not in base64 encoding.
---
 drivers/i2c/i2c-core-base.c | 63 +++++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5f6a4985f2bc..cf9c5d18a24c 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1352,6 +1352,23 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 
 	dev_dbg(&adap->dev, "adapter [%s] registered\n", adap->name);
 
+	return 0;
+
+out_reg:
+	init_completion(&adap->dev_released);
+	device_unregister(&adap->dev);
+	wait_for_completion(&adap->dev_released);
+out_list:
+	idr_remove(&i2c_adapter_idr, adap->nr);
+	return res;
+}
+
+static void i2c_process_adapter(struct i2c_adapter *adap)
+{
+#ifdef CONFIG_I2C_COMPAT
+	int res;
+#endif
+
 	pm_runtime_no_callbacks(&adap->dev);
 	pm_suspend_ignore_children(&adap->dev, true);
 	pm_runtime_enable(&adap->dev);
@@ -1378,18 +1395,6 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	mutex_lock(&core_lock);
 	bus_for_each_drv(&i2c_bus_type, NULL, adap, __process_new_adapter);
 	mutex_unlock(&core_lock);
-
-	return 0;
-
-out_reg:
-	init_completion(&adap->dev_released);
-	device_unregister(&adap->dev);
-	wait_for_completion(&adap->dev_released);
-out_list:
-	mutex_lock(&core_lock);
-	idr_remove(&i2c_adapter_idr, adap->nr);
-	mutex_unlock(&core_lock);
-	return res;
 }
 
 /**
@@ -1401,15 +1406,24 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
  */
 static int __i2c_add_numbered_adapter(struct i2c_adapter *adap)
 {
-	int id;
+	int id, ret;
 
 	mutex_lock(&core_lock);
 	id = idr_alloc(&i2c_adapter_idr, adap, adap->nr, adap->nr + 1, GFP_KERNEL);
-	mutex_unlock(&core_lock);
-	if (WARN(id < 0, "couldn't get idr"))
+	if (WARN(id < 0, "couldn't get idr")) {
+		mutex_unlock(&core_lock);
 		return id == -ENOSPC ? -EBUSY : id;
+	}
+
+	ret = i2c_register_adapter(adap);
+	mutex_unlock(&core_lock);
+
+	if (ret < 0)
+		return ret;
 
-	return i2c_register_adapter(adap);
+	i2c_process_adapter(adap);
+
+	return 0;
 }
 
 /**
@@ -1429,7 +1443,7 @@ static int __i2c_add_numbered_adapter(struct i2c_adapter *adap)
 int i2c_add_adapter(struct i2c_adapter *adapter)
 {
 	struct device *dev = &adapter->dev;
-	int id;
+	int id, ret;
 
 	if (dev->of_node) {
 		id = of_alias_get_id(dev->of_node, "i2c");
@@ -1442,13 +1456,22 @@ int i2c_add_adapter(struct i2c_adapter *adapter)
 	mutex_lock(&core_lock);
 	id = idr_alloc(&i2c_adapter_idr, adapter,
 		       __i2c_first_dynamic_bus_num, 0, GFP_KERNEL);
-	mutex_unlock(&core_lock);
-	if (WARN(id < 0, "couldn't get idr"))
+	if (WARN(id < 0, "couldn't get idr")) {
+		mutex_unlock(&core_lock);
 		return id;
+	}
 
 	adapter->nr = id;
 
-	return i2c_register_adapter(adapter);
+	ret = i2c_register_adapter(adapter);
+	mutex_unlock(&core_lock);
+
+	if (ret < 0)
+		return ret;
+
+	i2c_process_adapter(adapter);
+
+	return 0;
 }
 EXPORT_SYMBOL(i2c_add_adapter);
 
-- 
Slawomir Stepien
