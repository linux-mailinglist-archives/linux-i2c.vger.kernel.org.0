Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD84A5BF663
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 08:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbiIUGbG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 02:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiIUGa5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 02:30:57 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01E0E792FA
        for <linux-i2c@vger.kernel.org>; Tue, 20 Sep 2022 23:30:55 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id g12so3456795qts.1
        for <linux-i2c@vger.kernel.org>; Tue, 20 Sep 2022 23:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=mlVGPwO+07kuJrM0Nnjb7s2sOnMb8GPVRLx94R4E7gs=;
        b=fss57bJBh8c6SOblTfdjH+G8dANT8AsNUqFiBVhincgz2iiJ7tJd4WjjAJEEb196yr
         mdwywb8Ht7PGWW7WKcyQUWLtjUKd6mFidItRpE//Pk5M97b90IKaFivGAFXfNwg3gVLs
         tN/S49ou0vNvS1iuF3N/+dOSTFTjnNUVeFc4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=mlVGPwO+07kuJrM0Nnjb7s2sOnMb8GPVRLx94R4E7gs=;
        b=aU+jUluw26uZaX184yye2cwBSIA8hKgBomJjGoDPjgV7IlnNAu8GVJf+YK7Um823B7
         QfXdNvA1HyH9oY4xzHlJUvOUSvtL+cyNGVY9CMPhnAmXyNkVPoUc2wDDe1OmNlcqhcBF
         b/0yQ31qbbV18j9Oh3uJXSqvVW+EeZNDOk6sX4e/JcQjv01GVrORSEw5Vn7okNtfBA8f
         S4wEaeR2WHH7ZBPo4c0v5n33eAdHe56dTs4ycUztEPV2tnseei3CNToW4NTfQRhW2w2K
         rBqxXUJVIH+GAb/OerXB44MDyffWGhiNOzxGidIPxq4NJ/PP57ePa/kCXJVxBWYGU0dg
         l6Xg==
X-Gm-Message-State: ACrzQf1R/pxS3FoMsQFQ7hFCWeJBJ7sk8OdWxhRXuzQBitC/aPAq0MG2
        ZEMiyku5EoI65bX7yE6CjHXpzA==
X-Google-Smtp-Source: AMsMyM7lbGdMehRb5bQh41Qks9Goqd8Dg/VM4CIatKvSGNd+3cB3ygfNk9A9OokMRtpnYYjDz8f4SA==
X-Received: by 2002:a05:622a:44b:b0:35c:e129:a1b with SMTP id o11-20020a05622a044b00b0035ce1290a1bmr15021109qtx.78.1663741854798;
        Tue, 20 Sep 2022 23:30:54 -0700 (PDT)
Received: from localhost.localdomain ([164.92.70.235])
        by smtp.gmail.com with ESMTPSA id m10-20020ac807ca000000b00342f05defd1sm1060855qth.66.2022.09.20.23.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 23:30:54 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     gupt21@gmail.com, jic23@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v4 4/5] HID: mcp2221: switch i2c registration to devm functions
Date:   Tue, 20 Sep 2022 23:30:25 -0700
Message-Id: <20220921063026.89619-5-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220921063026.89619-1-matt.ranostay@konsulko.com>
References: <20220921063026.89619-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Switch from i2c_add_adapter() to resource managed devm_i2c_add_adapter()
for matching rest of driver initialization, and more concise code.

Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/hid/hid-mcp2221.c | 45 +++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 26 deletions(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index de52e9f7bb8c..7ba63bcd66de 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -824,6 +824,14 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 	return 1;
 }
 
+static void mcp2221_hid_remove(void *ptr)
+{
+	struct hid_device *hdev = ptr;
+
+	hid_hw_close(hdev);
+	hid_hw_stop(hdev);
+}
+
 static int mcp2221_probe(struct hid_device *hdev,
 					const struct hid_device_id *id)
 {
@@ -849,7 +857,8 @@ static int mcp2221_probe(struct hid_device *hdev,
 	ret = hid_hw_open(hdev);
 	if (ret) {
 		hid_err(hdev, "can't open device\n");
-		goto err_hstop;
+		hid_hw_stop(hdev);
+		return ret;
 	}
 
 	mutex_init(&mcp->lock);
@@ -857,6 +866,10 @@ static int mcp2221_probe(struct hid_device *hdev,
 	hid_set_drvdata(hdev, mcp);
 	mcp->hdev = hdev;
 
+	ret = devm_add_action_or_reset(&hdev->dev, mcp2221_hid_remove, hdev);
+	if (ret)
+		return ret;
+
 	/* Set I2C bus clock diviser */
 	if (i2c_clk_freq > 400)
 		i2c_clk_freq = 400;
@@ -873,19 +886,17 @@ static int mcp2221_probe(struct hid_device *hdev,
 			"MCP2221 usb-i2c bridge on hidraw%d",
 			((struct hidraw *)hdev->hidraw)->minor);
 
-	ret = i2c_add_adapter(&mcp->adapter);
+	ret = devm_i2c_add_adapter(&hdev->dev, &mcp->adapter);
 	if (ret) {
 		hid_err(hdev, "can't add usb-i2c adapter: %d\n", ret);
-		goto err_i2c;
+		return ret;
 	}
 	i2c_set_adapdata(&mcp->adapter, mcp);
 
 	/* Setup GPIO chip */
 	mcp->gc = devm_kzalloc(&hdev->dev, sizeof(*mcp->gc), GFP_KERNEL);
-	if (!mcp->gc) {
-		ret = -ENOMEM;
-		goto err_gc;
-	}
+	if (!mcp->gc)
+		return -ENOMEM;
 
 	mcp->gc->label = "mcp2221_gpio";
 	mcp->gc->direction_input = mcp_gpio_direction_input;
@@ -900,26 +911,9 @@ static int mcp2221_probe(struct hid_device *hdev,
 
 	ret = devm_gpiochip_add_data(&hdev->dev, mcp->gc, mcp);
 	if (ret)
-		goto err_gc;
+		return ret;
 
 	return 0;
-
-err_gc:
-	i2c_del_adapter(&mcp->adapter);
-err_i2c:
-	hid_hw_close(mcp->hdev);
-err_hstop:
-	hid_hw_stop(mcp->hdev);
-	return ret;
-}
-
-static void mcp2221_remove(struct hid_device *hdev)
-{
-	struct mcp2221 *mcp = hid_get_drvdata(hdev);
-
-	i2c_del_adapter(&mcp->adapter);
-	hid_hw_close(mcp->hdev);
-	hid_hw_stop(mcp->hdev);
 }
 
 static const struct hid_device_id mcp2221_devices[] = {
@@ -932,7 +926,6 @@ static struct hid_driver mcp2221_driver = {
 	.name		= "mcp2221",
 	.id_table	= mcp2221_devices,
 	.probe		= mcp2221_probe,
-	.remove		= mcp2221_remove,
 	.raw_event	= mcp2221_raw_event,
 };
 
-- 
2.37.2

