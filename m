Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB4D5B4B3E
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Sep 2022 03:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbiIKBlO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Sep 2022 21:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiIKBlN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Sep 2022 21:41:13 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5163732DA4
        for <linux-i2c@vger.kernel.org>; Sat, 10 Sep 2022 18:41:12 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id q11so820123qkc.12
        for <linux-i2c@vger.kernel.org>; Sat, 10 Sep 2022 18:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=oqYENd/2txABU+QCOqmWhZqh5LDN7sKRoTIhe4ZzfVA=;
        b=DZCYgj2stF5GjFI8rseFm8XHv9/HzWyX8k93XPPfIEZZOEHbLkliP4KHvxCd4vlTIG
         213J16NhmLJ7Hd/SNgy09ixa0tJbH5wBcsn5hhaGrhzTiswBHBGXQl/8FulErsjD2Vwc
         xB3i79WfVqR4yZa1gVKBkx0CL5hBc8uCyT4QM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=oqYENd/2txABU+QCOqmWhZqh5LDN7sKRoTIhe4ZzfVA=;
        b=V1o6tSpO6oROk8CwyITcnmAZCIuB6FRQxlRaJgaLJWqR88R2EEsRc5p7SAZAHQ/mxJ
         ZRlRIVnTeuDKcjsG1n+ZPIK4cHDXp5s5li2suqptLDib6xekxoLLG9JweitYevBE9c/M
         bIBTdBFx+v6S9KTfG75GN9HrRYsYJfIdDvtXgYnRki3BWFlXxm9BybNQRYFZhktakB9y
         AjPB/sRP72DKdt8Lhc7iUznl+RTgoIytu9AKUCNVQuBZRs/whhPmBIzwmAD/qUr1lheD
         5Hun5PcyLAlfae07HgOMcaHVo/FCpJGs58mBHY8oTZDJbcVV075TicV8cEH20N3+XfYz
         /s2A==
X-Gm-Message-State: ACgBeo0M0PVn/ceaoNkTkIM0IEchDTgfRkTXG3Yvh7cNz4cDix+Hy5Go
        hAwrNYfSZTlKphWYKA2wsP8VkQ==
X-Google-Smtp-Source: AA6agR6ywEfecacYTGqZQjCYhDu06PIROl6pvp5Fhx4NxaV5HOMVhE9MSPdDttwtZYdJy+3slTZkIQ==
X-Received: by 2002:a05:620a:458a:b0:6bb:c0f:c0ff with SMTP id bp10-20020a05620a458a00b006bb0c0fc0ffmr15455535qkb.78.1662860471535;
        Sat, 10 Sep 2022 18:41:11 -0700 (PDT)
Received: from localhost.localdomain ([159.65.38.31])
        by smtp.gmail.com with ESMTPSA id q26-20020ac8451a000000b003438a8e842fsm3542973qtn.44.2022.09.10.18.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 18:41:11 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     jic23@kernel.org, gupt21@gmail.com
Cc:     linux-input@vger.kernel.org, linux-i2c@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v2 4/5] HID: mcp2221: switch i2c registration to devm functions
Date:   Sat, 10 Sep 2022 18:40:47 -0700
Message-Id: <20220911014048.64235-5-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220911014048.64235-1-matt.ranostay@konsulko.com>
References: <20220911014048.64235-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Switch from i2c_add_adapter() to resource managed devm_i2c_add_adapter()
for matching rest of driver initialization, and more concise code.

Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/hid/hid-mcp2221.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index de52e9f7bb8c..29e69576c3d4 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -873,7 +873,7 @@ static int mcp2221_probe(struct hid_device *hdev,
 			"MCP2221 usb-i2c bridge on hidraw%d",
 			((struct hidraw *)hdev->hidraw)->minor);
 
-	ret = i2c_add_adapter(&mcp->adapter);
+	ret = devm_i2c_add_adapter(&hdev->dev, &mcp->adapter);
 	if (ret) {
 		hid_err(hdev, "can't add usb-i2c adapter: %d\n", ret);
 		goto err_i2c;
@@ -884,7 +884,7 @@ static int mcp2221_probe(struct hid_device *hdev,
 	mcp->gc = devm_kzalloc(&hdev->dev, sizeof(*mcp->gc), GFP_KERNEL);
 	if (!mcp->gc) {
 		ret = -ENOMEM;
-		goto err_gc;
+		goto err_i2c;
 	}
 
 	mcp->gc->label = "mcp2221_gpio";
@@ -900,12 +900,10 @@ static int mcp2221_probe(struct hid_device *hdev,
 
 	ret = devm_gpiochip_add_data(&hdev->dev, mcp->gc, mcp);
 	if (ret)
-		goto err_gc;
+		goto err_i2c;
 
 	return 0;
 
-err_gc:
-	i2c_del_adapter(&mcp->adapter);
 err_i2c:
 	hid_hw_close(mcp->hdev);
 err_hstop:
@@ -917,7 +915,6 @@ static void mcp2221_remove(struct hid_device *hdev)
 {
 	struct mcp2221 *mcp = hid_get_drvdata(hdev);
 
-	i2c_del_adapter(&mcp->adapter);
 	hid_hw_close(mcp->hdev);
 	hid_hw_stop(mcp->hdev);
 }
-- 
2.37.2

