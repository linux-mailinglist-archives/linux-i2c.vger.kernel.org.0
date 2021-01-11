Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45C0D2F1964
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 16:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732793AbhAKPSC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 10:18:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:53966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732254AbhAKPR7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 10:17:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6CBAB229CA;
        Mon, 11 Jan 2021 15:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610378239;
        bh=63qwzC9c0LlBIqqdfrjnZd4HsZDhESbEoY3niqpxfyg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y3CO8hkTtE7BZXBnSJnv29JeOD5i2ZnKkojIQfA/pB79i6sv53lWcObDppbw5u62r
         CpydZDc2Lx3IwOsWEHG+RMIRJpGKr3AIa7/gtltO1UGqxXByZ1XE6LcLyENYrx/flI
         GhfF/72cyGL5ffo/FZQiPdGo6u7yrTiVA6s1H4PgX9LlIZy8XH6q/RH+FQFLwRW2hG
         yZaEmvIDknCa93OFiz0BYyeXaSItoGPLyV5XO012LERrAjJV2Ejudf3vVnXkOlh18Y
         FdsnLzYUo5be1HmmJRLHka6Sebu/fihtHqFLQd+6ntNy+S5zkLCG58SPE9M5IYUy5+
         PZE5T3slHpppg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] soc: qcom: geni: move GENI_IF_DISABLE_RO to common header
Date:   Mon, 11 Jan 2021 20:46:45 +0530
Message-Id: <20210111151651.1616813-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111151651.1616813-1-vkoul@kernel.org>
References: <20210111151651.1616813-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

GENI_IF_DISABLE_RO is used by geni spi driver as well to check the
status if GENI, so move this to common header qcom-geni-se.h

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 1 -
 include/linux/qcom-geni-se.h    | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index f42954e2c98e..285ed86c2bab 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -108,7 +108,6 @@ static struct geni_wrapper *earlycon_wrapper;
 #define GENI_OUTPUT_CTRL		0x24
 #define GENI_CGC_CTRL			0x28
 #define GENI_CLK_CTRL_RO		0x60
-#define GENI_IF_DISABLE_RO		0x64
 #define GENI_FW_S_REVISION_RO		0x6c
 #define SE_GENI_BYTE_GRAN		0x254
 #define SE_GENI_TX_PACKING_CFG0		0x260
diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index ec2ad4b0fe14..e3f4b16040d9 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -65,6 +65,7 @@ struct geni_se {
 #define SE_GENI_STATUS			0x40
 #define GENI_SER_M_CLK_CFG		0x48
 #define GENI_SER_S_CLK_CFG		0x4c
+#define GENI_IF_DISABLE_RO		0x64
 #define GENI_FW_REVISION_RO		0x68
 #define SE_GENI_CLK_SEL			0x7c
 #define SE_GENI_DMA_MODE_EN		0x258
-- 
2.26.2

