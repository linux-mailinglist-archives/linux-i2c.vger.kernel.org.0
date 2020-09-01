Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C146F25A08B
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 23:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729501AbgIAVM0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 17:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729064AbgIAVLk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 17:11:40 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321E3C061249;
        Tue,  1 Sep 2020 14:11:39 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v23so3303453ljd.1;
        Tue, 01 Sep 2020 14:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IatbyruaBr7ZVBT4RiIWWB+zJJESjMXJ8GJDpXBSsnU=;
        b=CKO27SUkg+BYq+pN3KSibuwZtv/VwqiJQF0750cRmskuHl5cQdRFWvwGCv0SQoAvG/
         7a6M2281yunEy5TVnTrRa2Zx5C+GD/VBwBXTNoX+yF9ujgxZT8o8gY8qHxd9xn6Daiea
         6+akDKgRpb09x/LY3WUUlv5hJ3eWCtph5XcHX//3fNA9SLa6d/xxfwha/ojS2dJHmeaz
         0ls74hh6/N7Up1jZBgIwTc5G1BEYIRqDIn/6wx/Hnwb70ZkjjYU/x6aKfouba9fmfijw
         ac+fdBEshqYXfiOfMja2xCB32IbtbNXQx9LpCnkeQrmhWf4Y9HvdOEhnSoonndOeNXB7
         /WeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IatbyruaBr7ZVBT4RiIWWB+zJJESjMXJ8GJDpXBSsnU=;
        b=ihrloC9okWY3gHQoinwZatSH1/mb9eB/JIc9PjA+ZuH6VEvmxrvk5O15mgnwRJ6H1J
         1qM2J86YDtIssL4fyTB39Ym9gNnI31EP6dtsMXpqfIYoQvI4J9khAdCyWTjaJMo9mdr6
         +sxbXpl0LYSyXSXe24ogMQ2U9ouf7g94NZXAeQXtEm3TIs9GoaJ+r2NZGPHmNZTdYe8k
         qvUGSajF5hMYIkZmlmpuJyCKWNJcbIILIZS06v26IsH3IUk7HU31O7oyt/Xb7p25c1MH
         xhrL/ECrFrbQxG+ObpBgGAo2pBPf/cDt5hZdOzzfXO9fLPqhd2dXTd034wpgvtzpyeGJ
         dwvg==
X-Gm-Message-State: AOAM533BkucNYaMiU5zKAyRwwSDyYnwisC/848/MKh94rO+mRf10mtei
        3yyvXXwRocNInt5UdpvTRp8=
X-Google-Smtp-Source: ABdhPJyX4rN70uekb7zWu1dM3PrnrmKNSTkWQlw3fh74qyfuuGNKqleI2p2rAl572LOpYanly+950A==
X-Received: by 2002:a2e:9dd3:: with SMTP id x19mr1393967ljj.459.1598994697678;
        Tue, 01 Sep 2020 14:11:37 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g19sm502656ljk.125.2020.09.01.14.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 14:11:37 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/17] i2c: tegra: Remove unnecessary whitespaces and newlines
Date:   Wed,  2 Sep 2020 00:11:00 +0300
Message-Id: <20200901211102.11072-16-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200901211102.11072-1-digetx@gmail.com>
References: <20200901211102.11072-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Clean up couple places in the code by removing unnecessary whitespaces and
newlines.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 70691179f170..bdfccf055959 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1345,8 +1345,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 						i2c_dev->dma_phys,
 						xfer_size,
 						DMA_FROM_DEVICE);
-			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf,
-			       msg->len);
+			memcpy(i2c_dev->msg_buf, i2c_dev->dma_buf, msg->len);
 		}
 	}
 
@@ -2008,15 +2007,14 @@ static const struct dev_pm_ops tegra_i2c_pm = {
 };
 
 static struct platform_driver tegra_i2c_driver = {
-	.probe   = tegra_i2c_probe,
-	.remove  = tegra_i2c_remove,
-	.driver  = {
-		.name  = "tegra-i2c",
+	.probe = tegra_i2c_probe,
+	.remove = tegra_i2c_remove,
+	.driver = {
+		.name = "tegra-i2c",
 		.of_match_table = tegra_i2c_of_match,
-		.pm    = &tegra_i2c_pm,
+		.pm = &tegra_i2c_pm,
 	},
 };
-
 module_platform_driver(tegra_i2c_driver);
 
 MODULE_DESCRIPTION("nVidia Tegra2 I2C Bus Controller driver");
-- 
2.27.0

