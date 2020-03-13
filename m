Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6A2B184791
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Mar 2020 14:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgCMNNG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 09:13:06 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:42852 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726637AbgCMNNF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Mar 2020 09:13:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584105185; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=5sN3Y3/rW3SW/VsnjlWYgkXOxZbeo37VNCiSOHhkq/E=; b=ahwfq9GwBkNltsDkApMmerfCBZtwA1tO1BmLClFbMbt/fMyOMhrMEblwFv1hpiiGoWvoaTp9
 zrzO2DkodpCZyvmj6D15o/ZxxPvW+XXxU2esWv0YS6d9vcuXgyn20BDbhop3Z4ZGMi0UbHGt
 Bo72Q9MUg1I0tj/tA+v1k8Fch4g=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6b86d6.7fdd04d58500-smtp-out-n02;
 Fri, 13 Mar 2020 13:12:54 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3F089C44788; Fri, 13 Mar 2020 13:12:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 18C65C43636;
        Fri, 13 Mar 2020 13:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 18C65C43636
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
        dianders@chromium.org, evgreen@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V2 2/8] soc: qcom: geni: Support for ICC voting
Date:   Fri, 13 Mar 2020 18:42:08 +0530
Message-Id: <1584105134-13583-3-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add necessary macros and structure variables to support ICC BW
voting from individual SE drivers.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
Changes in V2:
 - As per Bjorn's comment dropped enums for ICC paths, given the three
   paths individual members

 include/linux/qcom-geni-se.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index dd46494..eaae16e 100644
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
@@ -33,6 +35,15 @@ struct clk;
  * @clk:		Handle to the core serial engine clock
  * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
  * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
+ * @icc_path_geni_to_core:	ICC path handle for geni to core
+ * @icc_path_cpu_to_geni:	ICC path handle for cpu to geni
+ * @icc_path_geni_to_ddr:	ICC path handle for geni to ddr
+ * @avg_bw_core:	Average bus bandwidth value for QUP core 2x clock
+ * @peak_bw_core:	Peak bus bandwidth value for QUP core 2x clock
+ * @avg_bw_cpu:		Average bus bandwidth value for CPU
+ * @peak_bw_cpu:	Peak bus bandwidth value for CPU
+ * @avg_bw_ddr:		Average bus bandwidth value for DDR
+ * @peak_bw_ddr:	Peak bus bandwidth value for DDR
  */
 struct geni_se {
 	void __iomem *base;
@@ -41,6 +52,15 @@ struct geni_se {
 	struct clk *clk;
 	unsigned int num_clk_levels;
 	unsigned long *clk_perf_tbl;
+	struct icc_path *icc_path_geni_to_core;
+	struct icc_path *icc_path_cpu_to_geni;
+	struct icc_path *icc_path_geni_to_ddr;
+	unsigned int avg_bw_core;
+	unsigned int peak_bw_core;
+	unsigned int avg_bw_cpu;
+	unsigned int peak_bw_cpu;
+	unsigned int avg_bw_ddr;
+	unsigned int peak_bw_ddr;
 };
 
 /* Common SE registers */
@@ -229,6 +249,14 @@ struct geni_se {
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
