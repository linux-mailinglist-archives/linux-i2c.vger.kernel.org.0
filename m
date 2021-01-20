Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3EF82FC899
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Jan 2021 04:17:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbhATDQx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 22:16:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728418AbhATCpg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Jan 2021 21:45:36 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75794C061575
        for <linux-i2c@vger.kernel.org>; Tue, 19 Jan 2021 18:44:56 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id 19so24103520qkm.8
        for <linux-i2c@vger.kernel.org>; Tue, 19 Jan 2021 18:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B0tdbWtBLQzW0aD7nmNNgDF7fO3gzDl1mmsnw5wwg1k=;
        b=uWmOGl92Cw9atnOXEy6/heTg4B4FoiORVTaYb+J8Z2iSDH85DGSvr37uUP+yc95BA5
         apcqXl9pl+K7K7fY7qtU0nkSSfezXw56Tr2liZjtuHG7SWkrZKwJ0BzOYWl9Pao+zp3O
         4zWMZzDtnZNRqQwSkA6sG3MT/5of5DWKOjl+qGS8QA++Uo7WMlwogjR+lVXtZpcfz7yp
         hNHtudKkT5QDSdsX2tG1DATZYL7RIQfFNrdKqjjoVdy7Q/bhGqiD18jfZHGDJUvZ9RB0
         Tuv2OpZxT/EgBkk3ka1VDpFYpN5XulBYMin9RGohdFMhW3ekY6h8h0r60iFPJV0aS27o
         b//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B0tdbWtBLQzW0aD7nmNNgDF7fO3gzDl1mmsnw5wwg1k=;
        b=YpoStgurkmn22l0CZXJxpByUIzdIuhi1lzIE1y4RsFDHSvEnT16tcYHyZjYrZorYzI
         QK8XKtHEgjVNaw+oZ2LG1t+oxBP0jSt8ZPv4mzDqBm6UuuxGZoBDKnDN4EbldINN4zup
         MLR3mhdVUbS6oYMvp2H6mPBxJ9oBhX+svhCLtoico8+mp5vNjklPtJ9sXS3leaWcfdO8
         B19w+cTAPLtkH9CBEkozQOcb+ZyqPvI6TGMzJqRPEfN+x9gAvvxpn1m0GcWBnLD+1SON
         SKXOJEdj+2muIsa8bMU36OtFQGsnKEiVTBPgtEXGloVWdtQYGDlEQJ+bxFQbpiVRjpeP
         Zsag==
X-Gm-Message-State: AOAM530m2zdwfWgz0/CFJal/0f+CQOxZc5kRDgz4J8fI6ysIra/YHhl6
        nkHeuQGl6j1nyzXyYuiUGHs=
X-Google-Smtp-Source: ABdhPJxaFQhEfjo4jnzDfFwSvfIY++UHRLVKvnFcK6xdsTE+9Gkz0yRZjrn3ar9BDr9gsoRFYrj9wA==
X-Received: by 2002:a05:620a:126a:: with SMTP id b10mr7546462qkl.354.1611110695685;
        Tue, 19 Jan 2021 18:44:55 -0800 (PST)
Received: from localhost.localdomain ([177.194.79.136])
        by smtp.gmail.com with ESMTPSA id w132sm485860qkb.61.2021.01.19.18.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 18:44:54 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     linux@rempel-privat.de
Cc:     s.hauer@pengutronix.de, kernel@pengutronix.de,
        linux-i2c@vger.kernel.org, wsa@kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <sha@pengutronix.de>
Subject: [PATCH] Revert "i2c: imx: Remove unused .id_table support"
Date:   Tue, 19 Jan 2021 23:41:23 -0300
Message-Id: <20210120024123.2534329-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Coldfire platforms are non-DT users of this driver, so
keep the .id_table support.

This reverts commit c610199cd392e6e2d41811ef83d85355c1b862b3.

Fixes: c610199cd392 (i2c: imx: Remove unused .id_table support")
Reported-by: Sascha Hauer <sha@pengutronix.de>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 149e2898cd2f..ca47e4041ca5 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -241,6 +241,19 @@ static struct imx_i2c_hwdata vf610_i2c_hwdata = {
 
 };
 
+static const struct platform_device_id imx_i2c_devtype[] = {
+	{
+		.name = "imx1-i2c",
+		.driver_data = (kernel_ulong_t)&imx1_i2c_hwdata,
+	}, {
+		.name = "imx21-i2c",
+		.driver_data = (kernel_ulong_t)&imx21_i2c_hwdata,
+	}, {
+		/* sentinel */
+	}
+};
+MODULE_DEVICE_TABLE(platform, imx_i2c_devtype);
+
 static const struct of_device_id i2c_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx1-i2c", .data = &imx1_i2c_hwdata, },
 	{ .compatible = "fsl,imx21-i2c", .data = &imx21_i2c_hwdata, },
@@ -1330,7 +1343,11 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	match = device_get_match_data(&pdev->dev);
-	i2c_imx->hwdata = match;
+	if (match)
+		i2c_imx->hwdata = match;
+	else
+		i2c_imx->hwdata = (struct imx_i2c_hwdata *)
+				platform_get_device_id(pdev)->driver_data;
 
 	/* Setup i2c_imx driver structure */
 	strlcpy(i2c_imx->adapter.name, pdev->name, sizeof(i2c_imx->adapter.name));
@@ -1498,6 +1515,7 @@ static struct platform_driver i2c_imx_driver = {
 		.of_match_table = i2c_imx_dt_ids,
 		.acpi_match_table = i2c_imx_acpi_ids,
 	},
+	.id_table = imx_i2c_devtype,
 };
 
 static int __init i2c_adap_imx_init(void)
-- 
2.25.1

