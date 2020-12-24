Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A26D42E2618
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Dec 2020 12:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728166AbgLXLOO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Dec 2020 06:14:14 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:29679 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbgLXLOO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Dec 2020 06:14:14 -0500
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 24 Dec 2020 03:12:57 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 24 Dec 2020 03:12:54 -0800
X-QCInternal: smtphost
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Dec 2020 16:42:16 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id 4D2622DCA; Thu, 24 Dec 2020 16:42:15 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     ulf.hansson@linaro.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, wsa@kernel.org
Cc:     swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, mka@chromium.org,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        parashar@codeaurora.org, rnayak@codeaurora.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linux-i2c@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [PATCH 3/3] i2c: i2c-qcom-geni: Add support for 'assigned-performance-states'
Date:   Thu, 24 Dec 2020 16:42:10 +0530
Message-Id: <20201224111210.1214-4-rojay@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201224111210.1214-1-rojay@codeaurora.org>
References: <20201224111210.1214-1-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

For devices which have 'assigned-performance-states' specified in DT,
set the specified performance state during probe and drop it on remove.
Also drop/set as part of runtime suspend/resume callbacks.

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 49 ++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 046d241183c5..250773784631 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/qcom-geni-se.h>
 #include <linux/spinlock.h>
@@ -86,6 +87,7 @@ struct geni_i2c_dev {
 	u32 clk_freq_out;
 	const struct geni_i2c_clk_fld *clk_fld;
 	int suspended;
+	unsigned int assigned_pstate;
 };
 
 struct geni_i2c_err_log {
@@ -497,6 +499,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	u32 proto, tx_depth;
 	int ret;
 	struct device *dev = &pdev->dev;
+	unsigned int assigned_pstate;
 
 	gi2c = devm_kzalloc(dev, sizeof(*gi2c), GFP_KERNEL);
 	if (!gi2c)
@@ -520,6 +523,20 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		gi2c->clk_freq_out = KHZ(100);
 	}
 
+	/* Set the assigned performance state */
+	if (!of_property_read_u32(pdev->dev.of_node, "assigned-performance-states",
+					&assigned_pstate)) {
+		if (assigned_pstate) {
+			ret = dev_pm_genpd_set_performance_state(dev,
+								 assigned_pstate);
+			if (ret) {
+				dev_err(dev, "Failed to set performance state\n");
+				return ret;
+			}
+			gi2c->assigned_pstate = assigned_pstate;
+		}
+	}
+
 	if (has_acpi_companion(dev))
 		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
 
@@ -616,10 +633,22 @@ static int geni_i2c_probe(struct platform_device *pdev)
 
 static int geni_i2c_remove(struct platform_device *pdev)
 {
+	int ret;
+	struct device *dev = &pdev->dev;
 	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&gi2c->adap);
 	pm_runtime_disable(gi2c->se.dev);
+
+	/* Drop the assigned performance state */
+	if (gi2c->assigned_pstate) {
+		ret = dev_pm_genpd_set_performance_state(dev, 0);
+		if (ret) {
+			dev_err(dev, "Failed to set performance state\n");
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
@@ -629,6 +658,16 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
 	disable_irq(gi2c->irq);
+
+	/* Drop the assigned performance state */
+	if (gi2c->assigned_pstate) {
+		ret = dev_pm_genpd_set_performance_state(dev, 0);
+		if (ret) {
+			dev_err(dev, "Failed to set performance state\n");
+			return ret;
+		}
+	}
+
 	ret = geni_se_resources_off(&gi2c->se);
 	if (ret) {
 		enable_irq(gi2c->irq);
@@ -654,6 +693,16 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
+	/* Set the assigned performance state */
+	if (gi2c->assigned_pstate) {
+		ret = dev_pm_genpd_set_performance_state(dev,
+							 gi2c->assigned_pstate);
+		if (ret) {
+			dev_err(dev, "Failed to set performance state\n");
+			return ret;
+		}
+	}
+
 	enable_irq(gi2c->irq);
 	gi2c->suspended = 0;
 	return 0;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

