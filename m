Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9BB725A095
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 23:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729429AbgIAVMZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 17:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729108AbgIAVLm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 17:11:42 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1BC3C061244;
        Tue,  1 Sep 2020 14:11:41 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id h19so3257543ljg.13;
        Tue, 01 Sep 2020 14:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eqKOQDvIcPzfOGcXYYks52bq5lwS718ve2YcDrMIuHM=;
        b=H55wt3uHOE3KFKRMg3AiFK/LitlwYRTebZTN0sIEM2Qv3KVWp5CGA6XqfSI4uuour9
         RoCs+v0iVZeazrK//glLCXRzKXNdAEo2cpmknQi+iy0pG6vb8uKjY0sxatROPi2NATp7
         JnRU1CTIqIir4y+IU3rlsXu6Hf/LWDIApe2LGFJI9Cuv72nZaPAgZkCEd4rEpqpsaa7c
         PGbL60fW0kt0t7IMHpVcCZbKWGfPRbwBGq7ClKkoJ0KogTCylnOqKDMGABZ1V93X+clY
         eLS8zU7cHWQ/QYOAL5PeqFZWRj/FqwN2lErO5f1TeUYnSPbuL2lI/xVTMRVXXu1GXPBs
         8D2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eqKOQDvIcPzfOGcXYYks52bq5lwS718ve2YcDrMIuHM=;
        b=VmBVFOnKbvnLhhDgcmQqLloJZfM2rQuQVzgEkE8QbK0nlWyCLqj2pUClFDnz6Lx9x3
         /6YaxcCVezRIvavk9H5iHSLHKA7gG3HORBg007vzkkNh1a4aCTmzteyGSnTAdjglwK8F
         /fZoU3NqcyQMzcLz8JZS4wnhMEzuPFdmQbTa8vAgDkJBO+AG5xVupx/hhoM7H2PIuv85
         cGn+5psaCovO0Tfd97mnrxGO5+z5b6+tjemQvQVE46tZiA/mgYsP/yGlqngARJYJVT9m
         mf61NLRaLCRKDEPe+c6obbTT1uR0nx2utsz0MDpt2TCZlXCaWek1nPILKxrgvom8hOLU
         PA+w==
X-Gm-Message-State: AOAM5317lWPnb9fHFDQMMrc9BdVzZoCVxjNdPMQlLsQGKeARtY3QxaPM
        HW6xjlD06vBEjfjFwQbozIM=
X-Google-Smtp-Source: ABdhPJzZqZPe1kDWmHV13iCdd5DCKNtWdqOLR8U8Wx8xVnIfc736WAtYtQhy3sl7/ejKYd4ADp1Xkg==
X-Received: by 2002:a2e:b174:: with SMTP id a20mr1686334ljm.200.1598994699484;
        Tue, 01 Sep 2020 14:11:39 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g19sm502656ljk.125.2020.09.01.14.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 14:11:39 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/17] i2c: tegra: Improve driver module description
Date:   Wed,  2 Sep 2020 00:11:02 +0300
Message-Id: <20200901211102.11072-18-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200901211102.11072-1-digetx@gmail.com>
References: <20200901211102.11072-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use proper spelling of "NVIDIA" and don't designate driver as Tegra2-only
since newer SoC generations are supported as well.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 628674ed8440..a3113faa2d0b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -2017,6 +2017,6 @@ static struct platform_driver tegra_i2c_driver = {
 };
 module_platform_driver(tegra_i2c_driver);
 
-MODULE_DESCRIPTION("nVidia Tegra2 I2C Bus Controller driver");
+MODULE_DESCRIPTION("NVIDIA Tegra I2C Bus Controller driver");
 MODULE_AUTHOR("Colin Cross");
 MODULE_LICENSE("GPL v2");
-- 
2.27.0

