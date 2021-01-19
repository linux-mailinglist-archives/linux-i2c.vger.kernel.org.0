Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF8F92FAE14
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 01:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732448AbhASAe4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 19:34:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730466AbhASAez (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 19:34:55 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B19C061573
        for <linux-i2c@vger.kernel.org>; Mon, 18 Jan 2021 16:34:15 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id h19so12579162qtq.13
        for <linux-i2c@vger.kernel.org>; Mon, 18 Jan 2021 16:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IaB0DFhzc/5KDrNFZumai2eiYNxkTar/KQWukG/PG5U=;
        b=IcTVK1c10DY9BGIQUQC1x4LUd2C+idra0A9DsvXu/lnLB5jbSm+rLxCxOV/Bt4VAUK
         l4b9QBqXViRV6g7E5OghqwObMMoIsDoVPkoSwXyFKsWM74fXi1JtKdm20oaEYUn6lci8
         +d2i6P9TIU0miKTFuew0iSLmQoRlLTd/JvPgKXdqFOIQ1Q6QBPIOiwsrdgDD2Jsj1MY/
         YE3BjLlHKwTFUKXRw3f53XkE4fmb0vm+v76Le4NR7qPVbupkkR7UwAfeHPB9KTb5V51D
         dxa0UvKRNRtVP6Ps17CjY/fD8gwcncm+ba5oYAk3S12U+K5EJAu0LdLAc4/8omG94gKQ
         QIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IaB0DFhzc/5KDrNFZumai2eiYNxkTar/KQWukG/PG5U=;
        b=LxVSkkCpe/gTKbI7Mh1pAtT3YKAJXIU75Bu/T6r5doIWARr3WKZIqFwKwHBvnNT6zu
         Jb9iBev7int/KqH8TK9+kWVOOF+dCQlsR8B3CH12rexT2hQCN0abexwq5t77dCb7T0+X
         qu/r/kNfB4hfdsyeBJ4GyC6eebe+hJU2gYdY4AUPBGDgKlVuiCG/0E16JDhkqb6p6e/M
         1nFRUdEfHEFXKnAf3kEdmC33+5PuB9IMvV9teVQYlQIkRpjUtJRkFl4kPRqyDQzU8wax
         YobONHN9ykNK3+KM0b4KcEo689XHmjfUtrB/zvSbOfl1xpC2NbqpgrUJkO/cSNEYRw5y
         BSMw==
X-Gm-Message-State: AOAM532aGLrraqSWu9fMNS8fC8ktSVNF/0HX/5e0iua5x9o4qj0AwDmG
        /ljpYG0hfM7Lx78s6nVgQ4Y=
X-Google-Smtp-Source: ABdhPJz0A1wdQ4mmg15zm7gAl2ZWv0pUjD162qMXI6G+hTEme27e5w8h5TWIx3uQTUBwWop9A1qLbw==
X-Received: by 2002:ac8:4c99:: with SMTP id j25mr2119437qtv.390.1611016454710;
        Mon, 18 Jan 2021 16:34:14 -0800 (PST)
Received: from localhost.localdomain ([177.194.79.136])
        by smtp.gmail.com with ESMTPSA id r15sm11791050qke.55.2021.01.18.16.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 16:34:13 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     linux@rempel-privat.de
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de, wsa@kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] i2c: imx: Remove unused .id_table support
Date:   Mon, 18 Jan 2021 21:31:47 -0300
Message-Id: <20210119003148.1793614-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

