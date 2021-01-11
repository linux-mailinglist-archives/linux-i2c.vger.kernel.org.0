Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FEB52F1966
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 16:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733035AbhAKPSI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 10:18:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:54002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732254AbhAKPSI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 10:18:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CA0622A83;
        Mon, 11 Jan 2021 15:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610378247;
        bh=mgPG975hZ/zT7DR9gnPDc3VlS/vIBBlXErvGoIyOQWs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CEU/R6qRPr5KhtJFMPm17zQv7HLG6IaERWmPfyAX+1j3ziELESpn8Jfmv38x6wngQ
         QVSXOnFmqxwcjWSEocK7IwNRO6mWPo8EOLXTcH7spsoKGiBGxZ+Cxa1dO68MVN8EAr
         zDB5+vsWo9uc42skVoiaqbGeUGXvuT7ugiryLoIXn1U74+ICw1vHy1bgATy2Ui8UNv
         kdMnNc8xjmrJiFLzdYxSt3W65LYJdoixUPIsOiKVetdIHK9DNDyjEOpvjOMIxQaxZW
         NxDVhfhUjP3lEcja809HaEWeZ//NekLEWwN5W0wAy5+mHh3bw7ZvuUiZCB1O+EMKAt
         U42i/cUB8ctew==
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
Subject: [PATCH 2/7] soc: qcom: geni: move struct geni_wrapper to header
Date:   Mon, 11 Jan 2021 20:46:46 +0530
Message-Id: <20210111151651.1616813-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111151651.1616813-1-vkoul@kernel.org>
References: <20210111151651.1616813-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I2C geni driver needs to access struct geni_wrapper, so move it to
header.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 15 ---------------
 include/linux/qcom-geni-se.h    | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 285ed86c2bab..a3868228ea05 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -79,21 +79,6 @@
  */
 
 #define MAX_CLK_PERF_LEVEL 32
-#define NUM_AHB_CLKS 2
-
-/**
- * struct geni_wrapper - Data structure to represent the QUP Wrapper Core
- * @dev:		Device pointer of the QUP wrapper core
- * @base:		Base address of this instance of QUP wrapper core
- * @ahb_clks:		Handle to the primary & secondary AHB clocks
- * @to_core:		Core ICC path
- */
-struct geni_wrapper {
-	struct device *dev;
-	void __iomem *base;
-	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
-	struct geni_icc_path to_core;
-};
 
 static const char * const icc_path_names[] = {"qup-core", "qup-config",
 						"qup-memory"};
diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index e3f4b16040d9..cb4e40908f9f 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -38,6 +38,21 @@ struct geni_icc_path {
 	unsigned int avg_bw;
 };
 
+#define NUM_AHB_CLKS 2
+
+/**
+ * @struct geni_wrapper - Data structure to represent the QUP Wrapper Core
+ * @dev:		Device pointer of the QUP wrapper core
+ * @base:		Base address of this instance of QUP wrapper core
+ * @ahb_clks:		Handle to the primary & secondary AHB clocks
+ */
+struct geni_wrapper {
+	struct device *dev;
+	void __iomem *base;
+	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
+	struct geni_icc_path to_core;
+};
+
 /**
  * struct geni_se - GENI Serial Engine
  * @base:		Base Address of the Serial Engine's register block
-- 
2.26.2

