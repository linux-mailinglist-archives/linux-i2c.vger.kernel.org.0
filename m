Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 348F713873B
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2020 18:17:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733174AbgALRRt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Jan 2020 12:17:49 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44726 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732827AbgALRRs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Jan 2020 12:17:48 -0500
Received: by mail-lj1-f196.google.com with SMTP id u71so7388632lje.11;
        Sun, 12 Jan 2020 09:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j37XV7ANVgjgiPiKALeBvbZ2E7R44griMSfBNJCXDRY=;
        b=YxUlMTYbP+mjKXblNt3Ko1I8Jd2YHZyBb2kSWgutntGD7ceWE5nsjMXw/Y4NHChWUf
         J+J7PZUxpgM1oYBudKBrN4Zc9yVM7fYDb427zOP5VDEEf2XNQOja9/CkHaE+Gfc3TpVr
         b5nU5fliYiZSzVWNoiS6QW4NGbuKq0ZdzivY8XSxobdzenNv5gtq0PDcWXMc/uHGOlWN
         7CdDVkoEFshUVMHnvu4DloGPxuzADOtf1haMuED4lrOyokDFg2JavcuujPbyWqqNiVL6
         ce2yiIuHOEfs4rZaSqiZZRwV8tDJuCge5WmHgXsdtu6qniD68gnwONBur9gL7hGpr0kt
         FOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j37XV7ANVgjgiPiKALeBvbZ2E7R44griMSfBNJCXDRY=;
        b=OrIZkqLGsOc0x1Ld/B6i6R7aWHYEhAICLJj15THflX4c8FvQUnsoPPrg8H78k/dwTf
         kbCyXjaB8TRPoKg1LsoWpHaEZwp6oXCHCxUPDVw6/kgWNE276Orr4/ELRlZm23OO8hDK
         +FE89YTdH+HcGxS0y8KEBUFpSBbz5U1rKRLK22pYznuAu+OkExkaLbeFSk8o6WrJ35q0
         1suEfLpiPCUgXe4k5um2QbQHrDVDerNSFGwyvW+W4uBiF34RjzdPuNJYQqiJ45xPyWt/
         F1I1GgJmt8uI2D1Y2L3kQIY+gsiOnUAZde5KgtxblER3GpPHLAKApTX4WoBfU6OoTcrd
         DUUQ==
X-Gm-Message-State: APjAAAXq58jM0jjW+r3XX7ldwo+ZO3sp4/RrEk4BrqH375buJhrwyJ4q
        uhTKZfeEYOLddZLLiICWqZw=
X-Google-Smtp-Source: APXvYqzlP6fpT09HuEaM6B6VsCvyBoTGQq8J42WIHVzQfkxVIvgUVYUlaqr9rJXF7adKs+hbwC2ZWA==
X-Received: by 2002:a2e:2c16:: with SMTP id s22mr8379264ljs.248.1578849466466;
        Sun, 12 Jan 2020 09:17:46 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id i13sm4506628ljg.89.2020.01.12.09.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2020 09:17:46 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/8] i2c: tegra: Check DMA completion status in addition to left time
Date:   Sun, 12 Jan 2020 20:14:30 +0300
Message-Id: <20200112171430.27219-9-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200112171430.27219-1-digetx@gmail.com>
References: <20200112171430.27219-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It is more robust to check completion status in addition to the left time
in a case of DMA transfer because transfer's completion happens in two
phases [one is ISR, other is tasklet] and thus it is possible that DMA is
completed while I2C completion awaiting times out because of the deferred
notification done by the DMA driver. The DMA completion status becomes
100% actual after DMA synchronization. This fixes spurious DMA timeouts
when system is under load.

Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 3c7c86d4b0e4..cbc2ad49043e 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1224,7 +1224,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 					 i2c_dev->rx_dma_chan :
 					 i2c_dev->tx_dma_chan);
 
-		if (time_left == 0) {
+		if (!time_left && !completion_done(&i2c_dev->dma_complete)) {
 			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
 			tegra_i2c_init(i2c_dev, true);
 			return -ETIMEDOUT;
-- 
2.24.0

