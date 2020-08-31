Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE0D25827B
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 22:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728967AbgHaUYB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 16:24:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730008AbgHaUXh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Aug 2020 16:23:37 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C96CC061573;
        Mon, 31 Aug 2020 13:23:37 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id h19so8183393ljg.13;
        Mon, 31 Aug 2020 13:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jmovjAY9j0dVZf96aSac3Dc+xJBuOPrZDQWdllUq+pE=;
        b=fCU/Dx8tvbcoyvNUPtaTDfKJ8A7FbQiEvlY2BmXaOkJS13gveH47Yi45ImNVrGnKZS
         kKmwhsvSb8Kd13lZayV5/MgrEn+RCeYNtQMJ8yKOfsUFjG9EE045P8TN+BqR3gBSUQ7n
         40/RO5jybe72Ty1mQr2Hl97hw0qDX2DuvW0L+F4VIpDZ0tFJ23XzTTYogj1T5Igk2SHH
         ep9xSMIw93HkfMS3Kri8hgKPrljp4xFiff/MTolx5UpCqiS5mGUmrKSjGl0F8Q+F72+j
         LT3mwXPwmWt+hOmvIxVGGc1Id9l5J6dQOYvO836o08ynX3JnMHZ2ylUD695qmZyvayf3
         UZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jmovjAY9j0dVZf96aSac3Dc+xJBuOPrZDQWdllUq+pE=;
        b=RaMmWwmEbLucCfP/Lg6WFEebtGaG/D8HEOCwC8w6aO01qQKhpvgaGRXUNH2yZ6/DE6
         PxTvtHu1DY1byW7SpNrILjCXZ71IvhE+NQYqjf9ke1Dwvt3GoOr9bvOS9yMF5loy+cac
         bjdxhGwFe5cqSgNK1+KZdb1rAMxx17jbWxlDkz0/b5IS5P5SBpLGQLL8gCY74tfTE+Rr
         5hs5oBQcjLX0k77iIOckCWzsV3cttjiYeMD+r5UvLIAOKXz2NmVsbAewDLDYTTtAdGXv
         YN5n/BErmd46PyFtJ2VHj3bVr4s4XCBbJmftK4DYK0WjHpi7C7siUNaYzTNVOBD5YfGW
         sl3A==
X-Gm-Message-State: AOAM530IvnBYqvMNfoavRjzY6qkxGdTETkjSUiFJFIbQfUu8j9MlWTgQ
        9ruSmZ1mSYprfE2/uGReqAs=
X-Google-Smtp-Source: ABdhPJyDsebouJmCUaVM3mg/nCCMNc4U5uho2p+q/dBV12nLUJ5aUkeoZBXZXWR8y3L8cwD7jisoKw==
X-Received: by 2002:a2e:9810:: with SMTP id a16mr1235522ljj.157.1598905415849;
        Mon, 31 Aug 2020 13:23:35 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id z20sm1769054ljk.97.2020.08.31.13.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 13:23:35 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 11/12] i2c: tegra: Remove likely/unlikely from the code
Date:   Mon, 31 Aug 2020 23:23:02 +0300
Message-Id: <20200831202303.15391-12-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200831202303.15391-1-digetx@gmail.com>
References: <20200831202303.15391-1-digetx@gmail.com>
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
index 8c8f3189928e..d9b9fe6b5637 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -910,7 +910,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
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

