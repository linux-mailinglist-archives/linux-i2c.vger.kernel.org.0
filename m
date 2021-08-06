Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C96953E30E2
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Aug 2021 23:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238155AbhHFVTo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Aug 2021 17:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238016AbhHFVTn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Aug 2021 17:19:43 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D914C0613CF
        for <linux-i2c@vger.kernel.org>; Fri,  6 Aug 2021 14:19:26 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id n12so2616028wrr.2
        for <linux-i2c@vger.kernel.org>; Fri, 06 Aug 2021 14:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k+H9Qy6AVSQfmzCVSq6PZRXdQZcZaCG04yQUbjpoH7w=;
        b=mB5209/k84mATchksY3tGTM+p+bS08KRMFOqWTH45WT0pZ5xjZs+1xZukxmJmVgkrT
         SX2Wmnmk9jvR+eZhwrIVOwheugbG2uiibbasekQqFk9YSPh63JIEFYUxTYIJZ9wfoXlC
         Hwz2RHbstCDZdcp7TALwolHceKprMkB/51J88ob1R651fVKXfUia0YZvtZ3/TAbR6yQA
         QoOc6y+7zoTkugrBXu0pst/92bjOEvhsKuteiUkr36O4ku1J2WY40WTq0dGr7DsK5qCZ
         L7cRFsTiT6u3pHGJMHnSCcZr0C8xSYC+7AbNjzREhVmelrC9qA5SvVNn4On+H6WefphV
         Zxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k+H9Qy6AVSQfmzCVSq6PZRXdQZcZaCG04yQUbjpoH7w=;
        b=PxVLqv22XJjRMcrVyFp0VaMGvYLyNuWvfB3L8YwP09PsjoxOCDofa3xaQJmxB5o2T7
         Mmdun5ur0G/8OcGwibdUSFmWx8DBynovlC4ieug2WTY6gApMwVAsE4sa3m44XzL8OBKF
         PkNw0LJhNkNmDSyGHbuARH7HqZujq20Hhkq8kO6T2l8LccOg/OhzfV+owNuZuK8e97ja
         VfyieAYBfMa7cGIUlgvzC9fb12ae3U3G6K3tF1bNecFci8A2n4sIpIyWWgIJEFcaTvC9
         Mq7e2dzmGblhloz4mHjYImkqNT9sjtEZbeE2dHQIF+Owqlkl5C7qw8wj6siSVqcLy9rJ
         aBDg==
X-Gm-Message-State: AOAM530Fdn/r/B8OCTQ2bJJ4tG5OmAQwOGuluCQD4/hH8otwqZ979AGP
        FPSUWHT2layNLOoXYmwb6aua3YIuMiAT5g==
X-Google-Smtp-Source: ABdhPJxdr7JtohA893+zdSrUeFlWuloq0gfLYjHScddaeZrLY7USZE94LYQG53vHH816hYVU1oBlQQ==
X-Received: by 2002:adf:d087:: with SMTP id y7mr12535051wrh.323.1628284765118;
        Fri, 06 Aug 2021 14:19:25 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:cc6d:4891:c067:bf7b? (p200300ea8f10c200cc6d4891c067bf7b.dip0.t-ipconnect.de. [2003:ea:8f10:c200:cc6d:4891:c067:bf7b])
        by smtp.googlemail.com with ESMTPSA id q5sm10997601wrx.33.2021.08.06.14.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 14:19:24 -0700 (PDT)
Subject: [PATCH v2 8/9] i2c: i801: Improve register_dell_lis3lv02d_i2c_device
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
Message-ID: <3ce2ea87-809e-5999-e920-07ddd5fcc035@gmail.com>
Date:   Fri, 6 Aug 2021 23:18:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

- Use an initializer for struct i2c_board_info info
- Use dmi_match()
- Simplify loop logic

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
  - move definition of struct i2c_board_info info to inner loop
  - add missing curly braces to outer for loop
---
 drivers/i2c/busses/i2c-i801.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 6e9aca81b..88745e3bc 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1247,28 +1247,22 @@ static const struct {
 
 static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
 {
-	struct i2c_board_info info;
-	const char *dmi_product_name;
 	int i;
 
-	dmi_product_name = dmi_get_system_info(DMI_PRODUCT_NAME);
 	for (i = 0; i < ARRAY_SIZE(dell_lis3lv02d_devices); ++i) {
-		if (strcmp(dmi_product_name,
-			   dell_lis3lv02d_devices[i].dmi_product_name) == 0)
-			break;
-	}
-
-	if (i == ARRAY_SIZE(dell_lis3lv02d_devices)) {
-		dev_warn(&priv->pci_dev->dev,
-			 "Accelerometer lis3lv02d is present on SMBus but its"
-			 " address is unknown, skipping registration\n");
-		return;
+		if (dmi_match(DMI_PRODUCT_NAME, dell_lis3lv02d_devices[i].dmi_product_name)) {
+			struct i2c_board_info info = {
+				.type = "lis3lv02d",
+				.addr = dell_lis3lv02d_devices[i].i2c_addr,
+			};
+
+			i2c_new_client_device(&priv->adapter, &info);
+			return;
+		}
 	}
 
-	memset(&info, 0, sizeof(struct i2c_board_info));
-	info.addr = dell_lis3lv02d_devices[i].i2c_addr;
-	strlcpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
-	i2c_new_client_device(&priv->adapter, &info);
+	pci_warn(priv->pci_dev,
+		 "Accelerometer lis3lv02d is present on SMBus but its address is unknown, skipping registration\n");
 }
 
 /* Register optional slaves */
-- 
2.32.0


