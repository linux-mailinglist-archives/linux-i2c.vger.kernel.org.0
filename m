Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB16828DD37
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Oct 2020 11:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgJNJXN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 05:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731040AbgJNJWw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Oct 2020 05:22:52 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1575DC0613DB
        for <linux-i2c@vger.kernel.org>; Tue, 13 Oct 2020 14:26:24 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id n14so618812pff.6
        for <linux-i2c@vger.kernel.org>; Tue, 13 Oct 2020 14:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8emszWUEydnaDuASluTEaLP6IQxhJiyG+Sdg8L/FF9A=;
        b=NK1OdlR3WP11CVF2y113zjl7VJMJe3PpbX5vvN2tkTzBZDQ9Js9EotP6+HM9DR86Y6
         KWEy+KX2WfMP7WQy83igiJ6GLL/BZspv3He3hTxhy963KZ4+EUSxMeorxgEhT5irtZYf
         xAgNPajbLPpjLycPnIG6tAENSjIXj0X164grw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8emszWUEydnaDuASluTEaLP6IQxhJiyG+Sdg8L/FF9A=;
        b=I5g767BMfxwAsLL0JHY0y+lcz1F4AkGl1AKqvhDDtfmV1gwSAufVkrgqBTo5L3TJzS
         a09e4cDRxdL+VE3d9W2E65WftqLeX1gO9u9WWVBZnJqLFwCREuiS7qlo3DbCLFWVBO1A
         Y4aUj8K/PJ0f/h1yKroHiEPoyRklXt4hk2rzCu+oZdAt7epr2hSpbjjao58ZbVMTyqcB
         vsbvTw5a7xJfXpUCZ4ABU9PZLWWv1VMHQJ47lv/5wP1yUFvl1I9ysXcPLYaunjStvIxH
         4XiCrA4/TJeO1MGmiKypJAy5m7IQaFt/hQ8EJGax87N3njxdzbtpoX9IVt0W8trgMqJV
         bo5A==
X-Gm-Message-State: AOAM530SE65vsiXWOfz0qni7nkH5vtwcsGYLRpJomR88pICam4d/JH69
        RP8qjobNeComJeivPXDsXXOm2g==
X-Google-Smtp-Source: ABdhPJwt1IzKXrttcWDZhkMbn21U9Tie+bRQG4Zddvl3JpkIMxKMTivZJV2Ph0NiPyaJ7SjvwhTrFw==
X-Received: by 2002:a63:511d:: with SMTP id f29mr1218104pgb.11.1602624383571;
        Tue, 13 Oct 2020 14:26:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id b15sm167713pju.16.2020.10.13.14.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 14:26:23 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>
Cc:     linux-i2c@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Mukesh Kumar Savaliya <msavaliy@codeaurora.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] soc: qcom: geni: More properly switch to DMA mode
Date:   Tue, 13 Oct 2020 14:25:28 -0700
Message-Id: <20201013142448.v2.1.Ifdb1b69fa3367b81118e16e9e4e63299980ca798@changeid>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
In-Reply-To: <20201013212531.428538-1-dianders@chromium.org>
References: <20201013212531.428538-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On geni-i2c transfers using DMA, it was seen that if you program the
command (I2C_READ) before calling geni_se_rx_dma_prep() that it could
cause interrupts to fire.  If we get unlucky, these interrupts can
just keep firing (and not be handled) blocking further progress and
hanging the system.

In commit 02b9aec59243 ("i2c: i2c-qcom-geni: Fix DMA transfer race")
we avoided that by making sure we didn't program the command until
after geni_se_rx_dma_prep() was called.  While that avoided the
problems, it also turns out to be invalid.  At least in the TX case we
started seeing sporadic corrupted transfers.  This is easily seen by
adding an msleep() between the DMA prep and the writing of the
command, which makes the problem worse.  That means we need to revert
that commit and find another way to fix the bogus IRQs.

Specifically, after reverting commit 02b9aec59243 ("i2c:
i2c-qcom-geni: Fix DMA transfer race"), I put some traces in.  I found
that the when the interrupts were firing like crazy:
- "m_stat" had bits for M_RX_IRQ_EN, M_RX_FIFO_WATERMARK_EN set.
- "dma" was set.

Further debugging showed that I could make the problem happen more
reliably by adding an "msleep(1)" any time after geni_se_setup_m_cmd()
ran up until geni_se_rx_dma_prep() programmed the length.

A rather simple fix is to change geni_se_select_dma_mode() so it's a
true inverse of geni_se_select_fifo_mode() and disables all the FIFO
related interrupts.  Now the problematic interrupts can't fire and we
can program things in the correct order without worrying.

As part of this, let's also change the writel_relaxed() in the prepare
function to a writel() so that our DMA is guaranteed to be prepared
now that we can't rely on geni_se_setup_m_cmd()'s writel().

NOTE: the only current user of GENI_SE_DMA in mainline is i2c.

Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
Fixes: 02b9aec59243 ("i2c: i2c-qcom-geni: Fix DMA transfer race")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Akash Asthana <akashast@codeaurora.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

(no changes since v1)

 drivers/soc/qcom/qcom-geni-se.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index d0e4f520cff8..751a49f6534f 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -289,10 +289,23 @@ static void geni_se_select_fifo_mode(struct geni_se *se)
 
 static void geni_se_select_dma_mode(struct geni_se *se)
 {
+	u32 proto = geni_se_read_proto(se);
 	u32 val;
 
 	geni_se_irq_clear(se);
 
+	val = readl_relaxed(se->base + SE_GENI_M_IRQ_EN);
+	if (proto != GENI_SE_UART) {
+		val &= ~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN);
+		val &= ~(M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN);
+	}
+	writel_relaxed(val, se->base + SE_GENI_M_IRQ_EN);
+
+	val = readl_relaxed(se->base + SE_GENI_S_IRQ_EN);
+	if (proto != GENI_SE_UART)
+		val &= ~S_CMD_DONE_EN;
+	writel_relaxed(val, se->base + SE_GENI_S_IRQ_EN);
+
 	val = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
 	val |= GENI_DMA_MODE_EN;
 	writel_relaxed(val, se->base + SE_GENI_DMA_MODE_EN);
@@ -651,7 +664,7 @@ int geni_se_tx_dma_prep(struct geni_se *se, void *buf, size_t len,
 	writel_relaxed(lower_32_bits(*iova), se->base + SE_DMA_TX_PTR_L);
 	writel_relaxed(upper_32_bits(*iova), se->base + SE_DMA_TX_PTR_H);
 	writel_relaxed(GENI_SE_DMA_EOT_BUF, se->base + SE_DMA_TX_ATTR);
-	writel_relaxed(len, se->base + SE_DMA_TX_LEN);
+	writel(len, se->base + SE_DMA_TX_LEN);
 	return 0;
 }
 EXPORT_SYMBOL(geni_se_tx_dma_prep);
@@ -688,7 +701,7 @@ int geni_se_rx_dma_prep(struct geni_se *se, void *buf, size_t len,
 	writel_relaxed(upper_32_bits(*iova), se->base + SE_DMA_RX_PTR_H);
 	/* RX does not have EOT buffer type bit. So just reset RX_ATTR */
 	writel_relaxed(0, se->base + SE_DMA_RX_ATTR);
-	writel_relaxed(len, se->base + SE_DMA_RX_LEN);
+	writel(len, se->base + SE_DMA_RX_LEN);
 	return 0;
 }
 EXPORT_SYMBOL(geni_se_rx_dma_prep);
-- 
2.28.0.1011.ga647a8990f-goog

