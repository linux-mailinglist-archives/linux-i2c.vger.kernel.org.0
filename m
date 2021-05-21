Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65D138D078
	for <lists+linux-i2c@lfdr.de>; Sat, 22 May 2021 00:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbhEUWEY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 18:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbhEUWEX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 May 2021 18:04:23 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D97C061574
        for <linux-i2c@vger.kernel.org>; Fri, 21 May 2021 15:02:58 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id a4so22423858wrr.2
        for <linux-i2c@vger.kernel.org>; Fri, 21 May 2021 15:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L8uLCdU/NMXcFqDXSgUVLHn3slv/4+xqb9/zrfJ2wPo=;
        b=Y2IM/L8rAxNYm39IbgeyETSdLLLRNIkCsU0DO02jc+rxoXUfoLFPlawBUKXuihB5wI
         pxfqQOpkI1efwxfKb507yAaswTd60Vb/b5p4ys7pzPHYs+lxxnj/yfi4wWXc+PV2xBZz
         Qmd4pkcdj2kuP30JhjHj4xS5LaYwo95sbfAipIFYIKCogZ364APir1nwRsSrV8zLkqJW
         gUf7clMWO6mBk5yhaNPHhyiUNLqFzCwgG+Ev7DVFT+fRJsfsZawvH37k/bGdUrT8k+im
         BRH1p48sT6SYqluo2XpmbODx0kPVWSjaK4ZkiaP68zinGS3+1Desa2Mo9i9rS4l37Kjw
         AAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L8uLCdU/NMXcFqDXSgUVLHn3slv/4+xqb9/zrfJ2wPo=;
        b=mHQWpFK8r2/gmsxe89fTxYvmHc5feIK3A64SMuKuxfEjWEXrwkU1i7LQltEGo+NjzZ
         u+TwEQeseK3TQUNljGVXMT+FugD9qalevFJOy/7DaJToc4ByY5m4xcRjTw3IXy0BACpY
         X7btqpsc1Z6tb4OFIjyD6uhsaWVByeewfmyyyEXQjsYNaoK/nZiiq+n6Fb7Sv/eC+EKf
         QmC2wRa6y4CvqwNEEh+0Py0w0XjaUZFPGf5qb0/ZkuMu3qhYk4m278bteAd0+9FQ9X9b
         rk1+r6vUWn4fnV3uh6qflYyzdqvhqNrYHjQ+FcZ+UfbWop3p+2UsboeI7EBkFCN6yeZb
         +7mw==
X-Gm-Message-State: AOAM533/Z+BFhgTb3sEWkTXVlIi+uBl8Dcut2ADSCS9yemxhIXIm51nu
        i/hj+/KmQ4ctJ3KIl37ScWk0lkq/uf0=
X-Google-Smtp-Source: ABdhPJyfsIumFs4b9cCRxAp6Nx2O0liiLOycOTdn79w2Suk4aDmIsuq5/aOfiKnigBYJwLjFdVP/Cg==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr11555982wrn.337.1621634576587;
        Fri, 21 May 2021 15:02:56 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f38:4600:84e0:e04f:ac50:5090? (p200300ea8f38460084e0e04fac505090.dip0.t-ipconnect.de. [2003:ea:8f38:4600:84e0:e04f:ac50:5090])
        by smtp.googlemail.com with ESMTPSA id 198sm297124wme.15.2021.05.21.15.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 15:02:56 -0700 (PDT)
Subject: [PATCH 2/2] i2c: i801: Replace waitqueue with completion API
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <561b74ab-b020-b0c7-c1ad-b7c3326245e3@gmail.com>
Message-ID: <1d1054de-8b47-a6bb-a264-8456705e5875@gmail.com>
Date:   Sat, 22 May 2021 00:02:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <561b74ab-b020-b0c7-c1ad-b7c3326245e3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Using the completion API is more intuitive and it allows to simplify
the code. Note that we don't have to set priv->status = 0 any longer
with the completion API.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 48 ++++++++++++++---------------------
 1 file changed, 19 insertions(+), 29 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index bfea94d02..738204d77 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -103,7 +103,7 @@
 #include <linux/dmi.h>
 #include <linux/slab.h>
 #include <linux/string.h>
-#include <linux/wait.h>
+#include <linux/completion.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/itco_wdt.h>
@@ -270,7 +270,7 @@ struct i801_priv {
 	unsigned int features;
 
 	/* isr processing */
-	wait_queue_head_t waitq;
+	struct completion done;
 	u8 status;
 
 	/* Command state used by isr for byte-by-byte block transactions */
@@ -496,24 +496,19 @@ static int i801_wait_byte_done(struct i801_priv *priv)
 static int i801_transaction(struct i801_priv *priv, int xact)
 {
 	int status;
-	int result;
+	unsigned long result;
 	const struct i2c_adapter *adap = &priv->adapter;
 
-	result = i801_check_pre(priv);
-	if (result < 0)
-		return result;
+	status = i801_check_pre(priv);
+	if (status < 0)
+		return status;
 
 	if (priv->features & FEATURE_IRQ) {
+		reinit_completion(&priv->done);
 		outb_p(xact | SMBHSTCNT_INTREN | SMBHSTCNT_START,
 		       SMBHSTCNT(priv));
-		result = wait_event_timeout(priv->waitq,
-					    (status = priv->status),
-					    adap->timeout);
-		if (!result)
-			status = -ETIMEDOUT;
-
-		priv->status = 0;
-		return i801_check_post(priv, status);
+		result = wait_for_completion_timeout(&priv->done, adap->timeout);
+		return i801_check_post(priv, result ? priv->status : -ETIMEDOUT);
 	}
 
 	/* the current contents of SMBHSTCNT can be overwritten, since PEC,
@@ -638,7 +633,7 @@ static irqreturn_t i801_host_notify_isr(struct i801_priv *priv)
  *      DEV_ERR - Invalid command, NAK or communication timeout
  *      BUS_ERR - SMI# transaction collision
  *      FAILED - transaction was canceled due to a KILL request
- *    When any of these occur, update ->status and wake up the waitq.
+ *    When any of these occur, update ->status and signal completion.
  *    ->status must be cleared before kicking off the next transaction.
  *
  * 2) For byte-by-byte (I2C read/write) transactions, one BYTE_DONE interrupt
@@ -675,7 +670,7 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
 	if (status) {
 		outb_p(status, SMBHSTSTS(priv));
 		priv->status = status;
-		wake_up(&priv->waitq);
+		complete(&priv->done);
 	}
 
 	return IRQ_HANDLED;
@@ -694,15 +689,15 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 	int i, len;
 	int smbcmd;
 	int status;
-	int result;
+	unsigned long result;
 	const struct i2c_adapter *adap = &priv->adapter;
 
 	if (command == I2C_SMBUS_BLOCK_PROC_CALL)
 		return -EOPNOTSUPP;
 
-	result = i801_check_pre(priv);
-	if (result < 0)
-		return result;
+	status = i801_check_pre(priv);
+	if (status < 0)
+		return status;
 
 	len = data->block[0];
 
@@ -726,15 +721,10 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 		priv->count = 0;
 		priv->data = &data->block[1];
 
+		reinit_completion(&priv->done);
 		outb_p(priv->cmd | SMBHSTCNT_START, SMBHSTCNT(priv));
-		result = wait_event_timeout(priv->waitq,
-					    (status = priv->status),
-					    adap->timeout);
-		if (!result)
-			status = -ETIMEDOUT;
-
-		priv->status = 0;
-		return i801_check_post(priv, status);
+		result = wait_for_completion_timeout(&priv->done, adap->timeout);
+		return i801_check_post(priv, result ? priv->status : -ETIMEDOUT);
 	}
 
 	for (i = 1; i <= len; i++) {
@@ -1889,7 +1879,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	}
 
 	if (priv->features & FEATURE_IRQ) {
-		init_waitqueue_head(&priv->waitq);
+		init_completion(&priv->done);
 
 		err = devm_request_irq(&dev->dev, dev->irq, i801_isr,
 				       IRQF_SHARED,
-- 
2.31.1


