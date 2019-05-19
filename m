Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E947228D0
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2019 22:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730135AbfESUkY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 May 2019 16:40:24 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39692 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfESUkW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 May 2019 16:40:22 -0400
Received: by mail-wr1-f68.google.com with SMTP id w8so12291719wrl.6
        for <linux-i2c@vger.kernel.org>; Sun, 19 May 2019 13:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UooUaXL2Sqm5XmPHx+kyjXtSn9qjvEx6duezW6FeIgw=;
        b=0nnq4zMi2VD+iWt+eEQ/49TXPPCiBeXwPMFlGoMAfV8ZcNtiSOvG2wozg17WbnICMk
         5vZDK2FS4RmLDOUx3JydW4v4/uEB9G+4JDaX4zmVRpnJHuzeNTaOV0ZnSmeo5lJovZsd
         MDN7gNc7rqgDTzGkuI6YYMliWi0qOE1KE7PjSYJyC3CfyXM/sWz52EUHAsEQnCttFjm8
         R3sDhdDIDZffXnqhDpLkrJB0xuzbJ98JNqiP/7ev53TdUBNp4SQMgfcV8vSpII80c7oN
         mM0jUARnz1I5+J4uZA/7TDxcuuG6iUotEr5DHSUZrVqBsGprMyhRbK7yPSDZkff9wdYg
         uaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UooUaXL2Sqm5XmPHx+kyjXtSn9qjvEx6duezW6FeIgw=;
        b=dzssToBpLPmrNtxwkfSw+xfxaTy7Wy0tSlIJ0i7+k9l9nSwWVT5Fb5ZF91GsKntAl7
         LlH2ZIuIS1S9bDS4MBHFsnuNVpKONbGc1LNl96E+hl/xjpWh1I3Hnc9rrLjQuKS15VOB
         G4S7pvVI1cIhHWvcWFNfH8EFxoNuJqvTNLnA+iCXYzSSsRKkJxszvDwtFpUb4qDzxYOz
         p4gLeqGKRHy+IPX5ciXrWa0/ZpO7UCFTnEFXW8FVyNcCfZPjIY1jz+tf+aZveBN7Gi7m
         x/YdAEf3b+hebHFN/lwERZQ4Zo5hsc0FeXRH6flCkiGJOzzoEn7ayNyNT8hSMeez+xnf
         LO7g==
X-Gm-Message-State: APjAAAXgNrOzGBDX7sMxFMSVPGzd4rxM08hjIgSUJ5mQL5jd8joP7S8J
        7M27oSJH3qp9uFRfAORaemG1UinthY8=
X-Google-Smtp-Source: APXvYqwUtNocXFJFFHcWvp9TPyyDKdoNGMpiBUYbofA3MZFqSlQg3pS0tDBtzhwrIhzmr1e1Q/Wp3g==
X-Received: by 2002:adf:8367:: with SMTP id 94mr17329865wrd.179.1558298420607;
        Sun, 19 May 2019 13:40:20 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id d17sm8710814wrw.18.2019.05.19.13.40.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 May 2019 13:40:20 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/2] eeprom: at24: use devm_i2c_new_dummy_device()
Date:   Sun, 19 May 2019 22:40:11 +0200
Message-Id: <20190519204012.31861-2-brgl@bgdev.pl>
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

Now that it's upstream, use the resource managed version
of i2c_new_dummy().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/misc/eeprom/at24.c | 28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 63aa541c9608..9ea196f0749f 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -507,14 +507,6 @@ static const struct at24_chip_data *at24_get_chip_data(struct device *dev)
 	return cdata;
 }
 
-static void at24_remove_dummy_clients(struct at24_data *at24)
-{
-	int i;
-
-	for (i = 1; i < at24->num_addresses; i++)
-		i2c_unregister_device(at24->client[i].client);
-}
-
 static int at24_make_dummy_client(struct at24_data *at24, unsigned int index,
 				  struct regmap_config *regmap_config)
 {
@@ -527,8 +519,8 @@ static int at24_make_dummy_client(struct at24_data *at24, unsigned int index,
 	dev = &base_client->dev;
 	addr = base_client->addr + index;
 
-	dummy_client = i2c_new_dummy(base_client->adapter,
-				     base_client->addr + index);
+	dummy_client = devm_i2c_new_dummy_device(dev, base_client->adapter,
+						 base_client->addr + index);
 	if (!dummy_client) {
 		dev_err(dev, "address 0x%02x unavailable\n", addr);
 		return -EADDRINUSE;
@@ -693,10 +685,8 @@ static int at24_probe(struct i2c_client *client)
 	/* use dummy devices for multiple-address chips */
 	for (i = 1; i < num_addresses; i++) {
 		err = at24_make_dummy_client(at24, i, &regmap_config);
-		if (err) {
-			at24_remove_dummy_clients(at24);
+		if (err)
 			return err;
-		}
 	}
 
 	i2c_set_clientdata(client, at24);
@@ -713,7 +703,7 @@ static int at24_probe(struct i2c_client *client)
 	pm_runtime_idle(dev);
 	if (err) {
 		err = -ENODEV;
-		goto err_clients;
+		goto err_runtime_pm;
 	}
 
 	nvmem_config.name = dev_name(dev);
@@ -733,7 +723,7 @@ static int at24_probe(struct i2c_client *client)
 	at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
 	if (IS_ERR(at24->nvmem)) {
 		err = PTR_ERR(at24->nvmem);
-		goto err_clients;
+		goto err_runtime_pm;
 	}
 
 	dev_info(dev, "%u byte %s EEPROM, %s, %u bytes/write\n",
@@ -742,8 +732,7 @@ static int at24_probe(struct i2c_client *client)
 
 	return 0;
 
-err_clients:
-	at24_remove_dummy_clients(at24);
+err_runtime_pm:
 	pm_runtime_disable(dev);
 
 	return err;
@@ -751,11 +740,6 @@ static int at24_probe(struct i2c_client *client)
 
 static int at24_remove(struct i2c_client *client)
 {
-	struct at24_data *at24;
-
-	at24 = i2c_get_clientdata(client);
-
-	at24_remove_dummy_clients(at24);
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
 
-- 
2.21.0

