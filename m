Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28CDC22A1AD
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 00:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730297AbgGVWAb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 18:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728914AbgGVWAa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jul 2020 18:00:30 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B56C0619E1
        for <linux-i2c@vger.kernel.org>; Wed, 22 Jul 2020 15:00:29 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id b9so1642792plx.6
        for <linux-i2c@vger.kernel.org>; Wed, 22 Jul 2020 15:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N8+S2bs/z4ong2YrfE5GwRztsvmrOV1x6iJptONruQ0=;
        b=J8nGwE8Z6AcRTaG73HoFvoUiIYSNEt7re2zANYCmw5IQOU7tN6t8rgdNm/mCE7mulD
         2DqGU0X4O5Fxqm6nc1MusIKF/IPRHB1DME6QXlO0DxV6HdW+kjuX7WZ8rTD28AR1YBDb
         XwFB/CcyJ65OruUfOL8Dv8PHJcs54lVFMKPH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N8+S2bs/z4ong2YrfE5GwRztsvmrOV1x6iJptONruQ0=;
        b=JMBP0869Gi4tptLCAbChS0LjvkU9wFCAiW90kbXwqoqkxjx5i0lppsnmNAFj6Xgagh
         +VD+OUKlg1dRB8vOzikWODseYzP/dyPneRPAwWN1qzcNEImh1RbV7X7GK4Qha2eDPdNa
         BMSOE+hLXw7T9rMUNP7jBXkRjMV3NbQSj5aN/DCBJAbLBhmjJ8ymku/2CvP4I8ncjdRK
         YuGal8G8moB2dcSJl1HS25y7oma1onQ+qdG1lvhRKNMcezJfRUMZ/a7kHzrWmPeXVQDs
         tHMZ/SBssh1tzeA52SEemKUf1Pl4D2RgtqKdsJmdBOFu6tqzdvL7RkCMQ7hQsDnpRbKC
         kbUA==
X-Gm-Message-State: AOAM531HsVct0XXgVdj/2FBFcBb0KcXg5b+WdeHTkNzl9QumeF+ZvnXd
        B60gonjhu3hUoSfK5hDCZnaYNA==
X-Google-Smtp-Source: ABdhPJy2c6o/MRrkKFm8aPWmkth//QhJMrLmzY21twfgd+iLnkoZPn9A4WSB+3YAdPMnaGK6BeC/mQ==
X-Received: by 2002:a17:90b:f16:: with SMTP id br22mr1417424pjb.170.1595455228985;
        Wed, 22 Jul 2020 15:00:28 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id kx3sm641235pjb.32.2020.07.22.15.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 15:00:28 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     swboyd@chromium.org, msavaliy@codeaurora.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: i2c-qcom-geni: Fix DMA transfer race
Date:   Wed, 22 Jul 2020 15:00:21 -0700
Message-Id: <20200722145948.v2.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When I have KASAN enabled on my kernel and I start stressing the
touchscreen my system tends to hang.  The touchscreen is one of the
only things that does a lot of big i2c transfers and ends up hitting
the DMA paths in the geni i2c driver.  It appears that KASAN adds
enough delay in my system to tickle a race condition in the DMA setup
code.

When the system hangs, I found that it was running the geni_i2c_irq()
over and over again.  It had these:

m_stat   = 0x04000080
rx_st    = 0x30000011
dm_tx_st = 0x00000000
dm_rx_st = 0x00000000
dma      = 0x00000001

Notably we're in DMA mode but are getting M_RX_IRQ_EN and
M_RX_FIFO_WATERMARK_EN over and over again.

Putting some traces in geni_i2c_rx_one_msg() showed that when we
failed we were getting to the start of geni_i2c_rx_one_msg() but were
never executing geni_se_rx_dma_prep().

I believe that the problem here is that we are starting the geni
command before we run geni_se_rx_dma_prep().  If a transfer makes it
far enough before we do that then we get into the state I have
observed.  Let's change the order, which seems to work fine.

Although problems were seen on the RX path, code inspection suggests
that the TX should be changed too.  Change it as well.

Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Reviewed-by: Akash Asthana <akashast@codeaurora.org>
---
Even though this patch is slightly different than v1 I have kept tags.
Hopefully this is OK.

Changes in v2:
- Fix both TX and RX.
- Only move the setting up of the command, not the set of the length.

 drivers/i2c/busses/i2c-qcom-geni.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 18d1e4fd4cf3..7f130829bf01 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -367,7 +367,6 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		geni_se_select_mode(se, GENI_SE_FIFO);
 
 	writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
-	geni_se_setup_m_cmd(se, I2C_READ, m_param);
 
 	if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &rx_dma)) {
 		geni_se_select_mode(se, GENI_SE_FIFO);
@@ -375,6 +374,8 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		dma_buf = NULL;
 	}
 
+	geni_se_setup_m_cmd(se, I2C_READ, m_param);
+
 	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
 	if (!time_left)
 		geni_i2c_abort_xfer(gi2c);
@@ -408,7 +409,6 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		geni_se_select_mode(se, GENI_SE_FIFO);
 
 	writel_relaxed(len, se->base + SE_I2C_TX_TRANS_LEN);
-	geni_se_setup_m_cmd(se, I2C_WRITE, m_param);
 
 	if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, len, &tx_dma)) {
 		geni_se_select_mode(se, GENI_SE_FIFO);
@@ -416,6 +416,8 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		dma_buf = NULL;
 	}
 
+	geni_se_setup_m_cmd(se, I2C_WRITE, m_param);
+
 	if (!dma_buf) /* Get FIFO IRQ */
 		writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
 
-- 
2.28.0.rc0.142.g3c755180ce-goog

