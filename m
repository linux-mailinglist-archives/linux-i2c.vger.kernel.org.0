Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E787B287ED8
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Oct 2020 00:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730706AbgJHWxE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Oct 2020 18:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728890AbgJHWxA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Oct 2020 18:53:00 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC05C0613D2
        for <linux-i2c@vger.kernel.org>; Thu,  8 Oct 2020 15:52:58 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x22so5187136pfo.12
        for <linux-i2c@vger.kernel.org>; Thu, 08 Oct 2020 15:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JqHlvYS/nUyuuUVkp5zanpXouWo0jl8ps/632AK5Tl4=;
        b=YOE0Wl3PeOp/Btq95AWsudLkZhaYipMAqAe17Y6oLaTjaqlL2QCzfBTTeD20EdMvoL
         fXLPpqXgsiF5aRQD8FwAuI82R+k5kZf/R8dPcPli2/VIZu9ZAlyK4df7MGZVev521chQ
         gdibFwzbcjksBBNG4J6EMOpv6+wiccx1P0PaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JqHlvYS/nUyuuUVkp5zanpXouWo0jl8ps/632AK5Tl4=;
        b=pgdrKqNELkun17ckrvPGc/B6LP92jn0XrNh9sYLdFvstfTHwycxUwQcM51EDMICK5+
         07jlSeNyy7FuEsP3fAW9cuUkkBWw+vQW1ws9pHLfPC7/lrtnVe/ggOer1pVvC/Hr+9en
         gQuu/bH6mUpKe7VXI1rTHIsatqVkU5oVaonKoAY+CxIPxfe88nqm2Qy/SHHAIC8ZaDzf
         FMXsOVb0LT8Qa7HKW/dOC4qYVA5jj4P5XnVlZ0dfTQd2d4MlqVGvGR8GoL5Kb2S2G/BO
         bXsqjOOb1pRdlfscBukKhtoiJa3ESNxED2pezUH45SgtilTFrMd4CtOqXfaZ7kq40iJH
         RFXA==
X-Gm-Message-State: AOAM5322V7xdyxoPS4qlkJ6KMBmRiOjgFfz3WxwfcgfM1aFz7YDufbLG
        5TJC1UYE9Q/Ck3Ceqn0x1RWJmw==
X-Google-Smtp-Source: ABdhPJyLMsvK9tWb74s1XR8v4qYe6UeK5+cQ51iDyu1MToPy/Tz9RvaCeozqlVgNRBBIKEMwQmzLFg==
X-Received: by 2002:a62:d10b:0:b029:152:56c0:df72 with SMTP id z11-20020a62d10b0000b029015256c0df72mr9933786pfg.10.1602197578485;
        Thu, 08 Oct 2020 15:52:58 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id jx17sm8386369pjb.10.2020.10.08.15.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 15:52:57 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-i2c@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] Revert "i2c: i2c-qcom-geni: Fix DMA transfer race"
Date:   Thu,  8 Oct 2020 15:52:34 -0700
Message-Id: <20201008155154.2.I7b22281453b8a18ab16ef2bfd4c641fb1cc6a92c@changeid>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
In-Reply-To: <20201008225235.2035820-1-dianders@chromium.org>
References: <20201008225235.2035820-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This reverts commit 02b9aec59243c6240fc42884acc958602146ddf6.

As talked about in the patch ("soc: qcom: geni: More properly switch
to DMA mode"), swapping the order of geni_se_setup_m_cmd() and
geni_se_xx_dma_prep() can sometimes cause corrupted transfers.  Thus
we traded one problem for another.  Now that we've debugged the
problem further and fixed the geni helper functions to more disable
FIFO interrupts when we move to DMA mode we can revert it and end up
with (hopefully) zero problems!

To be explicit, the patch ("soc: qcom: geni: More properly switch
to DMA mode") is a prerequisite for this one.

Fixes: 02b9aec59243 ("i2c: i2c-qcom-geni: Fix DMA transfer race")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/i2c/busses/i2c-qcom-geni.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index dead5db3315a..32b2a9921b14 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -367,6 +367,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		geni_se_select_mode(se, GENI_SE_FIFO);
 
 	writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
+	geni_se_setup_m_cmd(se, I2C_READ, m_param);
 
 	if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &rx_dma)) {
 		geni_se_select_mode(se, GENI_SE_FIFO);
@@ -374,8 +375,6 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		dma_buf = NULL;
 	}
 
-	geni_se_setup_m_cmd(se, I2C_READ, m_param);
-
 	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
 	if (!time_left)
 		geni_i2c_abort_xfer(gi2c);
@@ -409,6 +408,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		geni_se_select_mode(se, GENI_SE_FIFO);
 
 	writel_relaxed(len, se->base + SE_I2C_TX_TRANS_LEN);
+	geni_se_setup_m_cmd(se, I2C_WRITE, m_param);
 
 	if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, len, &tx_dma)) {
 		geni_se_select_mode(se, GENI_SE_FIFO);
@@ -416,8 +416,6 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		dma_buf = NULL;
 	}
 
-	geni_se_setup_m_cmd(se, I2C_WRITE, m_param);
-
 	if (!dma_buf) /* Get FIFO IRQ */
 		writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
 
-- 
2.28.0.1011.ga647a8990f-goog

