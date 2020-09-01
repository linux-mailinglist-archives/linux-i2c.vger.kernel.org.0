Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF6B25A089
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 23:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729177AbgIAVLp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 17:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728843AbgIAVLg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 17:11:36 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8038BC061247;
        Tue,  1 Sep 2020 14:11:35 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id w14so3293559ljj.4;
        Tue, 01 Sep 2020 14:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PE+51mzkRfodkBHluZb3ZpTwH4zdJTxXbM6Sc21BBt8=;
        b=YM54XCY/NWq5AUZM9UIBbqtJfLQlF3oW+xLX52tBPf7FuzZZEGJa0ITjVNnneQeZfj
         mIRCCUMonJWoLi/cSrFQSuLwbovj6U8Po/cPDDRacG5uQURjNxJSea6yXWyTjmWeo+U6
         8RsSgw94hQXPurif3rZC9AXvNNS4SnVYj1anxwmiH1eSpwx41DJhpd1UEEW7fWV237R8
         51LbYtJ6dKQWleQRkg3xirrJCCr3JlIYvhZkOCTvywsw58J7aBDhIUqK9HJuZ9p6PDV+
         DxyDsgsuZ23Rn7xANGEfsrqNfnsV4io4U/5dPTaNZXbrxYF0TA/du8qtAY1mUQgsn9Ri
         9yNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PE+51mzkRfodkBHluZb3ZpTwH4zdJTxXbM6Sc21BBt8=;
        b=DLxB2iJRLP8zzhdNg9gWlodieRdmSRLi4HyfmloCJ4l2BWd8nAnCNBw/M/MgRE6xnx
         PhLpPTXl6WmL7ZKH9CvCnr50hfa+KY+MobBieJ7ihoNL3MrqFkVt6t6kSiAgwYVMBaRP
         WVKHMq+PFb1pWC49xrKptFhSbL7IBi6cw1UWWbu4RKI4jsO2ZHYddlJUKJwBY0HivrRL
         DfYrB4wtL7RL4kp2GO4nP24PCeB6eOJPxSxoZOUiyLNmBv1Y6X+RaEpfSAgoPh+tBfCy
         S2zry8P21O4Iaic94l+v2OTJZygm6R+I60OLR6BjKrxLHDCJzSpg3czxmZWMY5DubwYq
         BZAA==
X-Gm-Message-State: AOAM533IGiuU28W7S5/Gyh/XXbXwrQ8wYJXLouPy64cQIhVxHCx1pEHt
        btJBMnh4Yva+iuefSHWlcc4=
X-Google-Smtp-Source: ABdhPJwBi0QGvhGpUn7aOD1FWvMtn5SZDy/E5hSlsAQitcdpFwiegQrO4PNHxfM7NjK2yKimCOO+5g==
X-Received: by 2002:a2e:88da:: with SMTP id a26mr1672597ljk.366.1598994693991;
        Tue, 01 Sep 2020 14:11:33 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g19sm502656ljk.125.2020.09.01.14.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 14:11:33 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/17] i2c: tegra: Remove likely/unlikely from the code
Date:   Wed,  2 Sep 2020 00:10:56 +0300
Message-Id: <20200901211102.11072-12-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200901211102.11072-1-digetx@gmail.com>
References: <20200901211102.11072-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The likely/unlikely annotations should be used only in a hot paths of
performance-critical code. The I2C driver doesn't have such paths, and
thus, there is no justification for usage of likely/unlikely annotations
in the code. Hence remove them.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 3d6189e200ba..300a6576ff94 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -911,7 +911,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 		goto err;
 	}
 
-	if (unlikely(status & status_err)) {
+	if (status & status_err) {
 		tegra_i2c_disable_packet_mode(i2c_dev);
 		if (status & I2C_INT_NO_ACK)
 			i2c_dev->msg_err |= I2C_ERR_NO_ACK;
@@ -1341,7 +1341,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		i2c_dev->msg_err);
 
 	i2c_dev->is_curr_dma_xfer = false;
-	if (likely(i2c_dev->msg_err == I2C_ERR_NONE))
+	if (i2c_dev->msg_err == I2C_ERR_NONE)
 		return 0;
 
 	tegra_i2c_init(i2c_dev, true);
-- 
2.27.0

