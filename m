Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C178710558A
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2019 16:27:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbfKUP1f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Nov 2019 10:27:35 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:41955 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbfKUP1f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Nov 2019 10:27:35 -0500
Received: from orion.localdomain ([95.115.120.75]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MJW18-1iITLJ3m6i-00JrJT; Thu, 21 Nov 2019 16:27:34 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     wsa@the-dreams.de, linux-i2c@vger.kernel.org
Subject: [PATCH] drivers: i2c: introduce devm_i2c_add_adapter()
Date:   Thu, 21 Nov 2019 16:27:16 +0100
Message-Id: <20191121152716.23940-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:ET/rQWaaj+bqgKvzzHm7j0cGhbypk2slAUvAcx1PA1h6UOx75CS
 83ugTIkteaXVtIZ8MkFAQqji9tgVzfKMzE3jeJei1t5nUyPoS9evulJSKjo28CKUyeFIIjw
 IJ8XEDVPRAhvsWLJoKtcA5SNkiGda7QLVhTdy5DHJDDgEef2SLC7RR0GJ0HQ7sI5SR9J4C4
 FtXG3nM7l50b/N7BVPIbg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eqiHgmuKDfY=:dcngmJbBwN6ZZbI2T8T+p2
 /pQhvjNvZx6Cu/klqM/4P1KusslymmESqTZR4q1v3OKj4QWGIlogJvPVyLb1Z+skoGisWwjWa
 Gk1fwghyyjxGGrGy4IImKTl+rCWTmSudPK7uN27MSo2eAJUqPI+xAVE2bg46x+Ep2r2vaAHHs
 nCQ925PCFUsIF5gQr498o4utANXKMQslF+BGF54+gu9WH4hmZHYEWVlvgEMBKTFHHGCY8y108
 Rj372EdfIMxNH++U7yTBsyturCDn+pso+5kYEudbNY8MfeCbtFXMUqgp6Vktkl95mTJQwoS0z
 l2N46jw1NhIV0hX5L4sAuWu+s2ymoTJDwmGp1Uqbdja0RjDHba5jU3BoQJHCasnTpClqr9xFg
 rodEzvb7RXjUWFDtnfwr4fLZ1XdISTGheRyFQbeYXIleWKz/QFxZ3cms/Nm2eWbUCz0euc+uj
 +elDsd/Ranq0ik/0fLxcBzjcZoX6YH7FpSXUg12u5+/S2AVjoiwvETVIpkgPCkB5aGKSl4mB6
 s0Q6U9xiVn9OYyoLWUaQ5quPYfWTBg1Q4inNnGy1gu5d1SR48BzeMIgyTQrHUKiJOd0Zua2GF
 iK5x0qnGV8Mu28y7OchXT96DXr3cgcD9m1VFDWv7AFPfTjHwDLdn9PEQgSIIZg8evVMQM3jgB
 5j9JQWMd1C0vcxHcb0z5OfL6gQfeHbGhhDIqpy/tnjWVKQdwKstwYz4IJiErTjSFJ7faH1x8f
 +QQIfw5emE/Vqt+KQpv5fG8pfbAgl6fyEX0ZMLM69Tnru4KEYUXADzPEwGiwfIYIYE3LsjJOZ
 uaDygzLYLII4MBbRzsfm5YIk5EH+P8lhN36ChZ/d+18XI2FS0SgZS8196LB/IIO1NmCx91QZl
 CxL+JCGvk66R3fok2Ntg==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Introduce devm'ed version of i2c_add_adapter() which triggers
i2c_del_adapter() to be called when parent device is removed.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/i2c/i2c-core-base.c | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/i2c.h         |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5f6a4985f2bc..bd713e451633 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1452,6 +1452,44 @@ int i2c_add_adapter(struct i2c_adapter *adapter)
 }
 EXPORT_SYMBOL(i2c_add_adapter);
 
+static void devm_i2c_adapter_release(struct device *dev, void *res)
+{
+	i2c_del_adapter(*(struct i2c_adapter**)res);
+}
+
+/**
+ * devm_i2c_add_adapter - devm version of i2c_add_adapter()
+ * @adapter: the adapter to add
+ * @data: private data to attach (if non-NULL)
+ * Context: can sleep
+ */
+int devm_i2c_add_adapter(struct device *parent,
+			 struct i2c_adapter *adap,
+			 void *data)
+{
+	struct i2c_adapter **dr;
+	int rc;
+
+	dr = devres_alloc(devm_i2c_adapter_release, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return -ENOMEM;
+
+	rc = i2c_add_adapter(adap);
+	if (rc) {
+		devres_free(dr);
+		return rc;
+	}
+
+	if (data)
+		i2c_set_adapdata(adap, data);
+
+	*dr = adap;
+	devres_add(parent, dr);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_i2c_add_adapter);
+
 /**
  * i2c_add_numbered_adapter - declare i2c adapter, use static bus number
  * @adap: the adapter to register (with adap->nr initialized)
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 1361637c369d..8dc07d03a502 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -834,6 +834,8 @@ static inline void i2c_mark_adapter_resumed(struct i2c_adapter *adap)
  */
 #if IS_ENABLED(CONFIG_I2C)
 extern int i2c_add_adapter(struct i2c_adapter *adap);
+extern int devm_i2c_add_adapter(struct device *parent,
+				struct i2c_adapter *adap, void *data);
 extern void i2c_del_adapter(struct i2c_adapter *adap);
 extern int i2c_add_numbered_adapter(struct i2c_adapter *adap);
 
-- 
2.11.0

