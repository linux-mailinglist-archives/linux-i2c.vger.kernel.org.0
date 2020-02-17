Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67FF3161366
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2020 14:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgBQNar (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Feb 2020 08:30:47 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:11174 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728704AbgBQNaq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Feb 2020 08:30:46 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581946246; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=+WGApTuKqfOHM6DOZbs0hjT7LC6Y7rCmZikPNioYhqE=; b=jPdF7j9AgPBC65nPK3drV6ydUOVfQTdUCTXd5sZlfi8/BZGIjvXcTx54xeQid6d7/YuEuQAw
 zaMGO7SkgcuAbtGzHlO7enjoPeu++eY2ClkGJR7Yzq5dZVLn8Es41h5G4mrebS9prFabYWsE
 Ofpu97tga55VnwYs3mB6RQO6CRs=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4a9585.7f138d7c14c8-smtp-out-n03;
 Mon, 17 Feb 2020 13:30:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AA409C4479C; Mon, 17 Feb 2020 13:30:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E8FF0C43383;
        Mon, 17 Feb 2020 13:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E8FF0C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH 1/6] soc: qcom: geni: Support for ICC voting
Date:   Mon, 17 Feb 2020 19:00:00 +0530
Message-Id: <1581946205-27189-2-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
References: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add necessary enums, macros and structure variables to support ICC BW
voting from individual SE drivers.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
 include/linux/qcom-geni-se.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index dd46494..b0adbfb 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -6,6 +6,8 @@
 #ifndef _LINUX_QCOM_GENI_SE
 #define _LINUX_QCOM_GENI_SE
 
+#include <linux/interconnect.h>
+
 /* Transfer mode supported by GENI Serial Engines */
 enum geni_se_xfer_mode {
 	GENI_SE_INVALID,
@@ -22,6 +24,13 @@ enum geni_se_protocol_type {
 	GENI_SE_I3C,
 };
 
+/* Interconnect paths for GENI */
+enum geni_se_icc_path {
+	GENI_TO_CORE,
+	CPU_TO_GENI,
+	GENI_TO_DDR
+};
+
 struct geni_wrapper;
 struct clk;
 
@@ -33,6 +42,13 @@ struct clk;
  * @clk:		Handle to the core serial engine clock
  * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
  * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
+ * @icc_path:		Array of interconnect path handles
+ * @avg_bw_core:	Average bus bandwidth value for QUP core 2x clock
+ * @peak_bw_core:	Peak bus bandwidth value for QUP core 2x clock
+ * @avg_bw_cpu:		Average bus bandwidth value for CPU
+ * @peak_bw_cpu:	Peak bus bandwidth value for CPU
+ * @avg_bw_ddr:		Average bus bandwidth value for DDR
+ * @peak_bw_ddr:	Peak bus bandwidth value for DDR
  */
 struct geni_se {
 	void __iomem *base;
@@ -41,6 +57,13 @@ struct geni_se {
 	struct clk *clk;
 	unsigned int num_clk_levels;
 	unsigned long *clk_perf_tbl;
+	struct icc_path *icc_path[3];
+	unsigned int avg_bw_core;
+	unsigned int peak_bw_core;
+	unsigned int avg_bw_cpu;
+	unsigned int peak_bw_cpu;
+	unsigned int avg_bw_ddr;
+	unsigned int peak_bw_ddr;
 };
 
 /* Common SE registers */
@@ -229,6 +252,14 @@ struct geni_se {
 #define GENI_SE_VERSION_MINOR(ver) ((ver & HW_VER_MINOR_MASK) >> HW_VER_MINOR_SHFT)
 #define GENI_SE_VERSION_STEP(ver) (ver & HW_VER_STEP_MASK)
 
+/* Core 2X clock frequency to BCM threshold mapping */
+#define CORE_2X_19_2_MHZ		960
+#define CORE_2X_50_MHZ			2500
+#define CORE_2X_100_MHZ			5000
+#define CORE_2X_150_MHZ			7500
+#define CORE_2X_200_MHZ			10000
+#define CORE_2X_236_MHZ			16383
+
 #if IS_ENABLED(CONFIG_QCOM_GENI_SE)
 
 u32 geni_se_get_qup_hw_version(struct geni_se *se);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
