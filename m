Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0DA22CAD
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 09:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730262AbfETHKu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 03:10:50 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52695 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730199AbfETHKt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 May 2019 03:10:49 -0400
Received: by mail-wm1-f67.google.com with SMTP id y3so12054069wmm.2
        for <linux-i2c@vger.kernel.org>; Mon, 20 May 2019 00:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/y0BcjbxNLOCLb9hbRxzwv5nwlsZS0rceTzNYj/C23A=;
        b=q9vf8/DZLLRxX2kNMP3SnHQ91uW4YvneY0c8FSNL0z8ut1+yrieV56iNJtgdruNQfL
         uJoqsIojrINVtoeNKZ8ApA9q57W6mXvIQqypGepxQPVju2IItJl3UyaAgnYafzwDzOeA
         JhgjP+e4lvE8a9LRACc84BwFEmIgF8KfJZ6aiQ011ObiQpvlj2qnFMxFG7DRXLmKve+8
         HY56qEEO/4+lidEZ68pdyVbs1MvDfQH0CogqR2mGvN6vIJMkpAgI5G1a5mOKKduJAmm9
         xBo+2CLkZyeOz8Oc2/Nq898GckZuB/0pcVZ0mKoi5ZTF7yCZw1KQuDX9scOLB1XZY4uN
         LHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/y0BcjbxNLOCLb9hbRxzwv5nwlsZS0rceTzNYj/C23A=;
        b=kmxoY8/rbsWVculwQ3zhd+pYymJTI76GoSl41OC/USyD9ebHfiVEbdNQFhcUqhFYhi
         nZ3s/sKdVyKq2vGaXVTQcTtKmTBqwHB5FRqsDpC60jOmkWyi7SSSMBsuojoSIgs0gjDE
         v7K9TJzFRhEdPXt+UvLHVC+r/UA3YeKayf+3SaDWY/THyK8f08CwXy1c73luCIMYLL/C
         mRTM1G3PW1vlYMl4qPbI/Mhgpys9L4L/6xVnZ3RrtbQ3IQbatQ9Ap4q9BnVKNCflNUmB
         3eY2LIulxE/cU6rboAMYz8/STuoPi4AMtiWv5t0E0h/xrA+E902E1HJI+1p6O3fkQmE5
         japw==
X-Gm-Message-State: APjAAAXHmMO+Uu/+2diJT8AGN8n1h+gkBYn1zOmZh5x0PVRZOBiT7WXr
        U5oKNVE2CwYvm2GX8LkJQ69pGhQW2bY=
X-Google-Smtp-Source: APXvYqxS68lU2W0geS1uLVLh/mdOSoDJjsGDUOfVAKJwEko+8QdppkRdHZdblYo2asYpNxTLIyu0Ug==
X-Received: by 2002:a1c:414:: with SMTP id 20mr38445228wme.84.1558336247924;
        Mon, 20 May 2019 00:10:47 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id y132sm24017306wmd.35.2019.05.20.00.10.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 00:10:47 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 2/2] eeprom: at24: drop unnecessary label
Date:   Mon, 20 May 2019 09:10:42 +0200
Message-Id: <20190520071042.21072-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520071042.21072-1-brgl@bgdev.pl>
References: <20190520071042.21072-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

If we move the nvmem registration above the pm enable calls and the
test read, we can drop the error label and make the code more readable
as there's now only a single place where we must call
pm_runtime_disable() in error path.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/misc/eeprom/at24.c | 43 ++++++++++++++++----------------------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index bdeec0777029..ba8e73812644 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -685,23 +685,6 @@ static int at24_probe(struct i2c_client *client)
 			return err;
 	}
 
-	i2c_set_clientdata(client, at24);
-
-	/* enable runtime pm */
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
-
-	/*
-	 * Perform a one-byte test read to verify that the
-	 * chip is functional.
-	 */
-	err = at24_read(at24, 0, &test_byte, 1);
-	pm_runtime_idle(dev);
-	if (err) {
-		err = -ENODEV;
-		goto err_runtime_pm;
-	}
-
 	nvmem_config.name = dev_name(dev);
 	nvmem_config.dev = dev;
 	nvmem_config.read_only = !writable;
@@ -717,9 +700,24 @@ static int at24_probe(struct i2c_client *client)
 	nvmem_config.size = byte_len;
 
 	at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
-	if (IS_ERR(at24->nvmem)) {
-		err = PTR_ERR(at24->nvmem);
-		goto err_runtime_pm;
+	if (IS_ERR(at24->nvmem))
+		return PTR_ERR(at24->nvmem);
+
+	i2c_set_clientdata(client, at24);
+
+	/* enable runtime pm */
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
+	/*
+	 * Perform a one-byte test read to verify that the
+	 * chip is functional.
+	 */
+	err = at24_read(at24, 0, &test_byte, 1);
+	pm_runtime_idle(dev);
+	if (err) {
+		pm_runtime_disable(dev);
+		return -ENODEV;
 	}
 
 	dev_info(dev, "%u byte %s EEPROM, %s, %u bytes/write\n",
@@ -727,11 +725,6 @@ static int at24_probe(struct i2c_client *client)
 		 writable ? "writable" : "read-only", at24->write_max);
 
 	return 0;
-
-err_runtime_pm:
-	pm_runtime_disable(dev);
-
-	return err;
 }
 
 static int at24_remove(struct i2c_client *client)
-- 
2.21.0

