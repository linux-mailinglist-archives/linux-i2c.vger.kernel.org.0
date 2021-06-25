Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 350E83B3C1E
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jun 2021 07:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbhFYFYw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Jun 2021 01:24:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:46174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233129AbhFYFYv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 25 Jun 2021 01:24:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E269161423;
        Fri, 25 Jun 2021 05:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624598551;
        bh=9CpDYd6V2+ZRataORv0JLj011dFvZe8nxIM9fHBFhSA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KcXhZM/MpToxLGfI//7R+vEgoTnrXwjgeQAdZfu0TQ40FoIiEJyUzv4zb7me9cw0a
         28kBq8fLaAWtKLIUn5vH6yOgJlWuBMtybVTVvcv2eRJSzc4boQOZRBXtUZryzm3tP4
         ATjLmyBJ/vznuwchZXvHxqhWmHoi/B5UAD19q51HKgKaW2i9hsfbnvkaXZVUPOMHuQ
         udTWSfFluKQVqYZv8Q6DMl1hL/bSOKanpmp2tCLlG5BAkx3FZ8SQiCzBnT7TL09OAK
         q3G4LcERwvNPTBl0dx6kEcuExJmZMwLQBolibw44UskILSyRqL3/96fN8CIw2YfxAP
         wnd41dDJw7+eA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] soc: qcom: geni: move GENI_IF_DISABLE_RO to common header
Date:   Fri, 25 Jun 2021 10:52:09 +0530
Message-Id: <20210625052213.32260-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625052213.32260-1-vkoul@kernel.org>
References: <20210625052213.32260-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

GENI_IF_DISABLE_RO is used by geni spi driver as well to check the
status if GENI, so move this to common header qcom-geni-se.h

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 1 -
 include/linux/qcom-geni-se.h    | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 5bdfb1565c14..fe666ea0c487 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -104,7 +104,6 @@ static const char * const icc_path_names[] = {"qup-core", "qup-config",
 #define GENI_OUTPUT_CTRL		0x24
 #define GENI_CGC_CTRL			0x28
 #define GENI_CLK_CTRL_RO		0x60
-#define GENI_IF_DISABLE_RO		0x64
 #define GENI_FW_S_REVISION_RO		0x6c
 #define SE_GENI_BYTE_GRAN		0x254
 #define SE_GENI_TX_PACKING_CFG0		0x260
diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index 7c811eebcaab..5114e2144b17 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -63,6 +63,7 @@ struct geni_se {
 #define SE_GENI_STATUS			0x40
 #define GENI_SER_M_CLK_CFG		0x48
 #define GENI_SER_S_CLK_CFG		0x4c
+#define GENI_IF_DISABLE_RO		0x64
 #define GENI_FW_REVISION_RO		0x68
 #define SE_GENI_CLK_SEL			0x7c
 #define SE_GENI_DMA_MODE_EN		0x258
@@ -105,6 +106,9 @@ struct geni_se {
 #define CLK_DIV_MSK			GENMASK(15, 4)
 #define CLK_DIV_SHFT			4
 
+/* GENI_IF_DISABLE_RO fields */
+#define FIFO_IF_DISABLE			(BIT(0))
+
 /* GENI_FW_REVISION_RO fields */
 #define FW_REV_PROTOCOL_MSK		GENMASK(15, 8)
 #define FW_REV_PROTOCOL_SHFT		8
-- 
2.31.1

