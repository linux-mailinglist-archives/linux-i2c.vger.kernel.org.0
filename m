Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F69287E3A
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Oct 2020 23:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728799AbgJHVoq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Oct 2020 17:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgJHVop (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Oct 2020 17:44:45 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE26C0613D2;
        Thu,  8 Oct 2020 14:44:45 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id p15so10195945ejm.7;
        Thu, 08 Oct 2020 14:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2lJmAI/upYsFIPxZmv2LOq2oKjZZBIP7CgRq2l2uWnA=;
        b=YLjr/eUPvLvbNteGaoQ39dXXAW9H+O+O7wrwKrEZx7lDx01lWKIHw6YjRexlY47AlD
         8GSXNYPpd58zWP2VTaYfaAeA1XLIyR50ol8pI4HMUK8/4JPGAKaMZUI/2vw5NiY7EzPW
         2jO0nzWk3Uc6NozrjqLR3CPGQMu/sj6vkN2Irjyw/nTiXQ9/3MiYFntwM3MrNxl0XqJr
         HfBYULSY6SmfaZDrXPW8oULsSJ754s2fj0npusK1hMw6opCN36nvI1lv7Jk2ZVmGfT2I
         6pO/tnJ7yfokVEVBlkga2UhDrjqCBdjCXnHOX/TbKPSFszrtACbPTBcW1zGDQQr0H4Rc
         Qp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2lJmAI/upYsFIPxZmv2LOq2oKjZZBIP7CgRq2l2uWnA=;
        b=CGDw+tGT308FbkHYMbUG5gP9raeFp3nQ4BqXgfvlNwm/Tbu9lP+og84WxeN4MMgzMW
         NFdNdD8+V7wjhKzvNAYW1MgOmw/V3T+ymoyo25WPdbscjGRVT4UXjMxSXtchVdKDujzb
         rR52vMyi+0B5BVs6+kdAwmqiCOLQqGZMq7V1t+EHLdMJ+qd2ri79akHXdyBz6KkN2Uwy
         f0l0QJ8ycxT00s8ASOnwqo6V96xc3YsVcxKMAkxwRRggJ8NpgEpCgw0cspNna3ZbhDuk
         lD/rC5w3/+BQqNxgE1oR8SNSE7CjUoWOO52nv6QLOhysQGHTfk4iTRnwc/Q73kbzBjlH
         ONhA==
X-Gm-Message-State: AOAM530sfL7UDysDyooyN8dnO1VJ7Waomaj9msDFDwyeUnPHdMOn3iTN
        ggxjSEw06swVD1DOn6NNxn0=
X-Google-Smtp-Source: ABdhPJwMvsJr4FPt7pcbDUQ71Qrdz+DQFBWSaqD+HdlVWu6RgLMBMJphJCAWbVs4Ln5cLsMVXLmA1w==
X-Received: by 2002:a17:906:4bd7:: with SMTP id x23mr10525959ejv.92.1602193484064;
        Thu, 08 Oct 2020 14:44:44 -0700 (PDT)
Received: from localhost.localdomain ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id i8sm4831800ejg.84.2020.10.08.14.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 14:44:43 -0700 (PDT)
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org
Subject: [PATCH 1/3] i2c: owl: Clear NACK and BUS error bits
Date:   Fri,  9 Oct 2020 00:44:39 +0300
Message-Id: <6ee573f2904c001ab07e30b386815257c05f6308.1602190168.git.cristian.ciocaltea@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1602190168.git.cristian.ciocaltea@gmail.com>
References: <cover.1602190168.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When the NACK and BUS error bits are set by the hardware, the driver is
responsible for clearing them by writing "1" into the corresponding
status registers.

Hence perform the necessary operations in owl_i2c_interrupt().

Fixes: d211e62af466 ("i2c: Add Actions Semiconductor Owl family S900 I2C driver")
Reported-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
---
 drivers/i2c/busses/i2c-owl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index 672f1f239bd6..a163b8f308c1 100644
--- a/drivers/i2c/busses/i2c-owl.c
+++ b/drivers/i2c/busses/i2c-owl.c
@@ -176,6 +176,9 @@ static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
 	fifostat = readl(i2c_dev->base + OWL_I2C_REG_FIFOSTAT);
 	if (fifostat & OWL_I2C_FIFOSTAT_RNB) {
 		i2c_dev->err = -ENXIO;
+		/* Clear NACK error bit by writing "1" */
+		owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_FIFOSTAT,
+				   OWL_I2C_FIFOSTAT_RNB, true);
 		goto stop;
 	}
 
@@ -183,6 +186,9 @@ static irqreturn_t owl_i2c_interrupt(int irq, void *_dev)
 	stat = readl(i2c_dev->base + OWL_I2C_REG_STAT);
 	if (stat & OWL_I2C_STAT_BEB) {
 		i2c_dev->err = -EIO;
+		/* Clear BUS error bit by writing "1" */
+		owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_STAT,
+				   OWL_I2C_STAT_BEB, true);
 		goto stop;
 	}
 
-- 
2.28.0

