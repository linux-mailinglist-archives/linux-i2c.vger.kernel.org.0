Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBC7D3901C8
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 15:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233101AbhEYNNh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 09:13:37 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:25080 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233057AbhEYNN0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 May 2021 09:13:26 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 25 May 2021 06:11:41 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 May 2021 06:11:39 -0700
X-QCInternal: smtphost
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg01-blr.qualcomm.com with ESMTP; 25 May 2021 18:40:58 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id 262F6334E; Tue, 25 May 2021 18:40:57 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     wsa@kernel.org
Cc:     swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, skananth@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [PATCH V11 2/2] i2c: i2c-qcom-geni: Suspend and resume the bus during SYSTEM_SLEEP_PM ops
Date:   Tue, 25 May 2021 18:40:51 +0530
Message-Id: <20210525131051.31250-3-rojay@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210525131051.31250-1-rojay@codeaurora.org>
References: <20210525131051.31250-1-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Mark bus as suspended during system suspend to block the future
transfers. Implement geni_i2c_resume_noirq() to resume the bus.

Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
---
Changes in V11:
 - This is newly added patch in this V11 series.

 drivers/i2c/busses/i2c-qcom-geni.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index c3ae66ba6345..671f4a52275e 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -698,6 +698,8 @@ static int __maybe_unused geni_i2c_suspend_noirq(struct device *dev)
 {
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
+	i2c_mark_adapter_suspended(&gi2c->adap);
+
 	if (!gi2c->suspended) {
 		geni_i2c_runtime_suspend(dev);
 		pm_runtime_disable(dev);
@@ -707,8 +709,16 @@ static int __maybe_unused geni_i2c_suspend_noirq(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused geni_i2c_resume_noirq(struct device *dev)
+{
+	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
+
+	i2c_mark_adapter_resumed(&gi2c->adap);
+	return 0;
+}
+
 static const struct dev_pm_ops geni_i2c_pm_ops = {
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(geni_i2c_suspend_noirq, NULL)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(geni_i2c_suspend_noirq, geni_i2c_resume_noirq)
 	SET_RUNTIME_PM_OPS(geni_i2c_runtime_suspend, geni_i2c_runtime_resume,
 									NULL)
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

