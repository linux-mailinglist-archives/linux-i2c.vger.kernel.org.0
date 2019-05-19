Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63045228CC
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2019 22:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbfESUkY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 May 2019 16:40:24 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42934 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730135AbfESUkX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 May 2019 16:40:23 -0400
Received: by mail-wr1-f68.google.com with SMTP id l2so12280625wrb.9
        for <linux-i2c@vger.kernel.org>; Sun, 19 May 2019 13:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6x9tLLZyCwnCAX+GJk12XwSqLElSQBbeJyIsX2nc458=;
        b=XJRiVciIsUWVDrNMrW1f6XsyFamquHktXNRmVL8EIZI2YAzvQnUvOeGSGU2TzpMbrb
         xsnJq/ZjFKG1RVOcK/b0+ym4gq4gwZvCVPkkgAhZRKnU+EOMoz8RB/XL8qzAZtvqYAev
         TyKuQFHXkSQpa7+haxju9gLhRxCFoedS4N5M3darfbp6KTf6BjUd2OFBVygsF3lIZJYS
         P5ZA8UaubWL2QCCfdijan0JlXRCLNo4TaVhpQNgHT/1y1gpzv++O8SPyJNpYu4koCGPN
         SR7CgLldgqlnLj3iJaSBvMm24sfS5FK+Lu60FRxmj7qTNo6PbNIBF2tyU6Oa338+Zunk
         Zd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6x9tLLZyCwnCAX+GJk12XwSqLElSQBbeJyIsX2nc458=;
        b=GUWR3gI4ZaIuv5GJsBrzJfysD2zLUSjekMKgiuITG3YxHUomPMJPnyaLMYQ5u6W+l9
         FhANwj+ITUTf5iYgUVrqs82ja6hxbfteD1qIXB5VsSU6GHWebtwk0z1jax+87Rpy/aqr
         /WYEczi9YRYjJt56f3WEgEAY01UG+jzjK+UmEKQj+qN2diENq+YdRkIJPvYjteZAIAgN
         CcyuNASKGAfTRji8BoPI+xyDVkKVCDRVRGKeLC1QAelo7Z6Rix9O8FDUFyYSktCDWjEA
         8gosbySsK1kVFTJSvQ06hLkRZkPQDpI3hpBBdHQKRDtDNbu9Ys5j6cJzAp+Xd8jNa9aa
         3iTg==
X-Gm-Message-State: APjAAAWZAiq4c0Fxx+ZZZ7E+Nnk6BF4DIKaxpfzTF1EuAyLXfFBQRvkw
        xUm3yx3dRiHCd5gwq+fDZio+12tdjGA=
X-Google-Smtp-Source: APXvYqxlnep6mwSqRSFVcg68NOG3PJCftzlPi3kkT2LB4iSiI8vMltNEDTJ0UDW/W7VIBKewVaUVqA==
X-Received: by 2002:adf:cd0d:: with SMTP id w13mr42171181wrm.38.1558298421471;
        Sun, 19 May 2019 13:40:21 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id d17sm8710814wrw.18.2019.05.19.13.40.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 May 2019 13:40:20 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/2] eeprom: at24: drop unnecessary label
Date:   Sun, 19 May 2019 22:40:12 +0200
Message-Id: <20190519204012.31861-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190519204012.31861-1-brgl@bgdev.pl>
References: <20190519204012.31861-1-brgl@bgdev.pl>
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
index 9ea196f0749f..0bc0a45fb98e 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -689,23 +689,6 @@ static int at24_probe(struct i2c_client *client)
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
@@ -721,9 +704,24 @@ static int at24_probe(struct i2c_client *client)
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
@@ -731,11 +729,6 @@ static int at24_probe(struct i2c_client *client)
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

