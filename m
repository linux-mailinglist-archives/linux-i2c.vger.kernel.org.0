Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307552B528E
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Nov 2020 21:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732591AbgKPU3e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Nov 2020 15:29:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730751AbgKPU3d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Nov 2020 15:29:33 -0500
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C542C0613CF
        for <linux-i2c@vger.kernel.org>; Mon, 16 Nov 2020 12:29:32 -0800 (PST)
Received: by mail-qk1-x741.google.com with SMTP id q22so18249476qkq.6
        for <linux-i2c@vger.kernel.org>; Mon, 16 Nov 2020 12:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=IaB0DFhzc/5KDrNFZumai2eiYNxkTar/KQWukG/PG5U=;
        b=GwzTAM3vG9/vCPviYVlm9b8IyvGfUY7N0b1Ky96QnoqEKJ2i2A6z/iup98gwvqq3+t
         5FCVngny8P2IbEFjdIDtH+4nHOZw46LQ8p8KHev8KPpYF20WNobOcEcnq7If0Hp0i/ZF
         5BlQ4l2h7yzkG6/2Z61VtWLNBO+Kz5l4paEIhTpnkHBf6GCmfGoN4nDoSvbbWSqKjdhi
         mutdun6N6rxj2h3JK/UNcGu6Pg/Wywlvb0Z4lJHzJPqds09+f8xJTbDBWC3BvUBJm4ok
         xwLVsvPisICq0Hq9uqMXcDZiYIv1DK/DWwqU3Hxt//2cB0Zhxyz6V91jPlbwRq8OdczL
         +xZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IaB0DFhzc/5KDrNFZumai2eiYNxkTar/KQWukG/PG5U=;
        b=G6mq9CwXgsM3jASEAOR2+K/pbTe/AhJjsuuQhvbqbuJb95rkyBYM+mW+WJ2/5yFq/n
         CBHB62kYXPUY3V7XD+cTKj3iLEwN6wEr8nf7UJtDJwApVaz4XoTmxwjobGM3OtEvl6bI
         pl+lrOKLCzItxA9T5R0//A+6J9qXMag7OZSbQkNZvNjvaYCWY270LHLZIpLJUSvOgtfZ
         lC69pktnxRNqyr9qYEhflzexs6AcYbK3e1eJQvGj9q9QavIH2728uqIqVj3593HJtLyj
         86N/tcNHB6mVFB53SEEGFgedhUVZbDRe7W2sTQ6u3B+NAk68UvBO5YGSDbLSHkpU08lW
         R0Qw==
X-Gm-Message-State: AOAM532KOjzTf//hU/2Llnnspd89og5GNdeQlKr3cINl1HilMkNykjoX
        hVk6SaEE7z1CvK8gTNNk7tc=
X-Google-Smtp-Source: ABdhPJyoagSMx/Uj/uFW5uDbzCcbSvzjpOwIL5MHGjgfE3f9Gn6k9KgvLbP9ruuaNvHj37LxpO8wxg==
X-Received: by 2002:a37:517:: with SMTP id 23mr8087174qkf.333.1605558571708;
        Mon, 16 Nov 2020 12:29:31 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:997:213a:a240:fc07:36c8])
        by smtp.gmail.com with ESMTPSA id w27sm12375326qtv.29.2020.11.16.12.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 12:29:31 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     wsa@the-dreams.de
Cc:     kernel@pengutronix.de, shawnguo@kernel.org,
        linux-i2c@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] i2c: imx: Remove unused .id_table support
Date:   Mon, 16 Nov 2020 17:29:10 -0300
Message-Id: <20201116202910.30061-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since 5.10-rc1 i.MX is a devicetree-only platform and the existing
.id_table support in this driver was only useful for old non-devicetree
platforms.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index c98529c76348..ebf66120c51e 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -233,19 +233,6 @@ static struct imx_i2c_hwdata vf610_i2c_hwdata = {
 
 };
 
-static const struct platform_device_id imx_i2c_devtype[] = {
-	{
-		.name = "imx1-i2c",
-		.driver_data = (kernel_ulong_t)&imx1_i2c_hwdata,
-	}, {
-		.name = "imx21-i2c",
-		.driver_data = (kernel_ulong_t)&imx21_i2c_hwdata,
-	}, {
-		/* sentinel */
-	}
-};
-MODULE_DEVICE_TABLE(platform, imx_i2c_devtype);
-
 static const struct of_device_id i2c_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx1-i2c", .data = &imx1_i2c_hwdata, },
 	{ .compatible = "fsl,imx21-i2c", .data = &imx21_i2c_hwdata, },
@@ -1141,11 +1128,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	match = device_get_match_data(&pdev->dev);
-	if (match)
-		i2c_imx->hwdata = match;
-	else
-		i2c_imx->hwdata = (struct imx_i2c_hwdata *)
-				platform_get_device_id(pdev)->driver_data;
+	i2c_imx->hwdata = match;
 
 	/* Setup i2c_imx driver structure */
 	strlcpy(i2c_imx->adapter.name, pdev->name, sizeof(i2c_imx->adapter.name));
@@ -1316,7 +1299,6 @@ static struct platform_driver i2c_imx_driver = {
 		.of_match_table = i2c_imx_dt_ids,
 		.acpi_match_table = i2c_imx_acpi_ids,
 	},
-	.id_table = imx_i2c_devtype,
 };
 
 static int __init i2c_adap_imx_init(void)
-- 
2.17.1

