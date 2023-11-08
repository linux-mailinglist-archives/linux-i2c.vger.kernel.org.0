Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 606EF7E5069
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 07:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjKHGmr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 01:42:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjKHGmq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 01:42:46 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3411010C0
        for <linux-i2c@vger.kernel.org>; Tue,  7 Nov 2023 22:42:44 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9becde9ea7bso93082366b.0
        for <linux-i2c@vger.kernel.org>; Tue, 07 Nov 2023 22:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699425762; x=1700030562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tl1BoFyFat/YPj7jHXUpauZB0FjfxxNwha3nl0C1ing=;
        b=H92LqE1/pH0xplVEXOlZxNee0JlSdny3ZP9RkADdlPbSyyr8ZsfRzhCz6A1szk0YuO
         lZ1+NUDyU5YnGxwuNzutpkAX2iAigq+J3QxV1lEMi/h+jYqpoSBdkyVC/1yWErE397Id
         YLkkDzCmV3s5n9UCB/uww2KIDdrtJmMagE8f4wPMblZl/lZn/grlwx8LxgonYtDCoLtv
         CzUR9kdoUL6XySX/f1sBgiiNa0q8qW6rLgET2ALz56GU75IF08X5sl5OpRFd+ZXWRxNk
         E7Evjna0wQw4sGNAtgrPH1GQAvJsWwXmo7glNcWL1896jgNT8BeH04eJFBw60NF95gRd
         qzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699425762; x=1700030562;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tl1BoFyFat/YPj7jHXUpauZB0FjfxxNwha3nl0C1ing=;
        b=d6gCwP3UMjtOXdogwSwHp/lWSBtK6xWBx9ilfg0msDDD3s2iaox6DkaVd+x4l0HxmG
         gbl1t59Y7zxJP8ZFjW0oceF6l+G7HQ8f+1wTEcFNpkZvafFSqcihZvMt9xn5O6UmhnR1
         4SyV35MljvK/6yz0AFwS0sHbpFTiD51DGNNYZ520VRRYtboi1c/8VVbKnFgXraA8zff4
         4/BUveJcFpTn9omRAQCRHn4k5j5KrTEFaiMB5JvcBAFiEWUEanIDE4vLzq+sF59GghHj
         IHfA4/iHKv+j4jtc0NE9ONIttFx8Z5c9lJk+wKYrXd2AqCPwyrU2VcxW8dJXBOdvuNhU
         CKMw==
X-Gm-Message-State: AOJu0YxshoKno2kJuFl0tEOgUP75kXUstFkFPBkCVDpR1tSVipce3FSI
        sVQ6/AnOcQOrexYVYg716Vs=
X-Google-Smtp-Source: AGHT+IHOrQfc2KNxwDFMn6UXWx5BnfRYFvqasfqvJ8ACpXqHJiHkTqcmJ2WMMjwDDOKGjNrpf4hWfQ==
X-Received: by 2002:a17:907:7ba8:b0:9ae:614e:4560 with SMTP id ne40-20020a1709077ba800b009ae614e4560mr887877ejc.29.1699425762224;
        Tue, 07 Nov 2023 22:42:42 -0800 (PST)
Received: from ?IPV6:2a01:c23:c56e:b200:75f2:d482:5d42:c8a0? (dynamic-2a01-0c23-c56e-b200-75f2-d482-5d42-c8a0.c23.pool.telefonica.de. [2a01:c23:c56e:b200:75f2:d482:5d42:c8a0])
        by smtp.googlemail.com with ESMTPSA id m15-20020a1709060d8f00b0099297782aa9sm533338eji.49.2023.11.07.22.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 22:42:41 -0800 (PST)
Message-ID: <69f19443-f2ca-4158-9d25-160db55bfb57@gmail.com>
Date:   Wed, 8 Nov 2023 07:38:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: mux: reg: Remove class-based device auto-detection
 support
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
To:     Peter Rosin <peda@axentia.se>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Legacy class-based device auto-detection shouldn't be used in new code.
Therefore remove support in i2c-mux-reg as long as we don't have a
user of this feature yet.

Link: https://lore.kernel.org/linux-i2c/a22978a4-88e4-46f4-b71c-032b22321599@gmail.com/
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/muxes/i2c-mux-reg.c           | 4 +---
 include/linux/platform_data/i2c-mux-reg.h | 2 --
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-reg.c b/drivers/i2c/muxes/i2c-mux-reg.c
index 9efc1ed01..8489971ba 100644
--- a/drivers/i2c/muxes/i2c-mux-reg.c
+++ b/drivers/i2c/muxes/i2c-mux-reg.c
@@ -159,7 +159,6 @@ static int i2c_mux_reg_probe(struct platform_device *pdev)
 	struct regmux *mux;
 	struct i2c_adapter *parent;
 	struct resource *res;
-	unsigned int class;
 	int i, ret, nr;
 
 	mux = devm_kzalloc(&pdev->dev, sizeof(*mux), GFP_KERNEL);
@@ -213,9 +212,8 @@ static int i2c_mux_reg_probe(struct platform_device *pdev)
 
 	for (i = 0; i < mux->data.n_values; i++) {
 		nr = mux->data.base_nr ? (mux->data.base_nr + i) : 0;
-		class = mux->data.classes ? mux->data.classes[i] : 0;
 
-		ret = i2c_mux_add_adapter(muxc, nr, mux->data.values[i], class);
+		ret = i2c_mux_add_adapter(muxc, nr, mux->data.values[i], 0);
 		if (ret)
 			goto err_del_mux_adapters;
 	}
diff --git a/include/linux/platform_data/i2c-mux-reg.h b/include/linux/platform_data/i2c-mux-reg.h
index 2543c2a1c..e2e895768 100644
--- a/include/linux/platform_data/i2c-mux-reg.h
+++ b/include/linux/platform_data/i2c-mux-reg.h
@@ -17,7 +17,6 @@
  * @n_values: Number of multiplexer channels
  * @little_endian: Indicating if the register is in little endian
  * @write_only: Reading the register is not allowed by hardware
- * @classes: Optional I2C auto-detection classes
  * @idle: Value to write to mux when idle
  * @idle_in_use: indicate if idle value is in use
  * @reg: Virtual address of the register to switch channel
@@ -30,7 +29,6 @@ struct i2c_mux_reg_platform_data {
 	int n_values;
 	bool little_endian;
 	bool write_only;
-	const unsigned int *classes;
 	u32 idle;
 	bool idle_in_use;
 	void __iomem *reg;
-- 
2.42.1

