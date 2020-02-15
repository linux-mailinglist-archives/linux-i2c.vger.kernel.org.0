Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C17015FD82
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Feb 2020 09:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgBOIgs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Feb 2020 03:36:48 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39890 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbgBOIgs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Feb 2020 03:36:48 -0500
Received: by mail-pg1-f193.google.com with SMTP id j15so6324659pgm.6;
        Sat, 15 Feb 2020 00:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=gdlMMEdpJPxo5mVfKeyoDxcxbBxcFHKvQ3B9vt6XO6A=;
        b=fePvSzGDdD2OcKHA5afExkEARWEWj+vMtD5dXPGP5Tz/GZCjIfAqbBLGxBPLDq9PLd
         lmqSjRNGNva5+5dZyPZmeuzgcc7dSkqiRJFRnGK7OyLdsS6r7tZwuNHwD/6wZcwWaaMr
         FXJK2bnUAt0sS9Kv58qlE2PxNz/BA6PCz2r+F5T5NkImWRLZPNQVWzmoF66Dpdpo/hx+
         Bdpgfypmo6NflDQvQfqlmkG/iuBd4uLn00rRqjRGtdVqwxdFR0wY9BacUAOEGmop8bwt
         qmeTkkKWHYcoiRRhoG/KPN9Fy8Qz6BvFsmobuEtRTPkJ4KRcSBSFvRx4rohjZbXY2KrY
         4x3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gdlMMEdpJPxo5mVfKeyoDxcxbBxcFHKvQ3B9vt6XO6A=;
        b=F3VY4fC6vWdzfzSCyr7DVNbxQ71nPXGdM9Q3WFNoHRbeWNu7vARgIMUoI2ycfVFuLf
         TgRRDG/ll2h2JHQU+3A2zPhZHSjFRJkJPNQ0pKWb2A8n+qvz7x63FoVoQ61dE7leAq1N
         chQLerPJ1tIHBSYNP+9A2gXomx/ulItns/o1IHn6TFsDmjwkLqToRWScGR/FM9AbvIQ7
         1HMmai/ulNwAds+PWCHsHm7hZ/4+0MmQvOhqwgAyJsBHIERtXXBV/pjnE/wrgUPWqR2Q
         GCDEnJAtVXgRqhgAt8RtIhPKyNOqljnBmcPbwo6e7l0Q1b5BWDTAzzNVRj9gBT6I1QOY
         agzQ==
X-Gm-Message-State: APjAAAUFWvIyOEWWHQvXDMeZeuJWiATLUFyeBTM3XBHOjAkBYAR2QU9u
        fykdP0YjAvbZUCTCCXnWHL/ND0vC
X-Google-Smtp-Source: APXvYqxQFpaibtzE274HNpD03heJLl1mF6Mg6IOEXWyaRLqbDHd/JxMxytqVjEqDZJHaHg/xMek42A==
X-Received: by 2002:a63:5818:: with SMTP id m24mr7729022pgb.358.1581755807690;
        Sat, 15 Feb 2020 00:36:47 -0800 (PST)
Received: from localhost ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id m12sm9555516pfh.37.2020.02.15.00.36.46
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 15 Feb 2020 00:36:47 -0800 (PST)
From:   qiwuchen55@gmail.com
To:     vigneshr@ti.com, tony@atomide.com, aaro.koskinen@iki.fi
Cc:     linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        chenqiwu <chenqiwu@xiaomi.com>
Subject: [PATCH] i2c: omap: use devm_platform_ioremap_resource()
Date:   Sat, 15 Feb 2020 16:36:43 +0800
Message-Id: <1581755803-11242-1-git-send-email-qiwuchen55@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: chenqiwu <chenqiwu@xiaomi.com>

Use a new API devm_platform_ioremap_resource() to simplify code.

Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
---
 drivers/i2c/busses/i2c-omap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 2dfea35..47d994a 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1355,7 +1355,6 @@ static void omap_i2c_unprepare_recovery(struct i2c_adapter *adap)
 {
 	struct omap_i2c_dev	*omap;
 	struct i2c_adapter	*adap;
-	struct resource		*mem;
 	const struct omap_i2c_bus_platform_data *pdata =
 		dev_get_platdata(&pdev->dev);
 	struct device_node	*node = pdev->dev.of_node;
@@ -1375,8 +1374,7 @@ static void omap_i2c_unprepare_recovery(struct i2c_adapter *adap)
 	if (!omap)
 		return -ENOMEM;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	omap->base = devm_ioremap_resource(&pdev->dev, mem);
+	omap->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(omap->base))
 		return PTR_ERR(omap->base);
 
-- 
1.9.1

