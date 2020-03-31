Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBD8E1994C8
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Mar 2020 13:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730343AbgCaLKz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Mar 2020 07:10:55 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:45805 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730358AbgCaLKz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Mar 2020 07:10:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585653055; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=A30pWpOcWWloATde2ShySI8DseQoiLN1y6svK/jE72k=; b=upNjHSKotpk3dehLAA84WrdnrQXtE/KWYEI3PTAu1GM4/eSM46o987l4T5tbvo0wL8Jxq3LZ
 IfFSByrSYXgUdSImKu24rKZb5SCDCz/ckTaV5CSTLZVIAP6UXWFP3aXbi5MI7JDiS5A+ZHCj
 1ZrNULq53ciYqS5bfXv3i96AGVA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e83252f.7f5e16b0a1b8-smtp-out-n01;
 Tue, 31 Mar 2020 11:10:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6697CC433BA; Tue, 31 Mar 2020 11:10:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EE8F3C433D2;
        Tue, 31 Mar 2020 11:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EE8F3C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org, georgi.djakov@linaro.org
Cc:     linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, evgreen@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V3 1/8] interconnect: Add devm_of_icc_get() as exported API for users
Date:   Tue, 31 Mar 2020 16:39:29 +0530
Message-Id: <1585652976-17481-2-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Users can use devm version of of_icc_get() to benefit from automatic
resource release.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
Reviewed by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/interconnect/core.c  | 25 +++++++++++++++++++++++++
 include/linux/interconnect.h |  7 +++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index 2c6515e..f5699ed 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -350,6 +350,31 @@ static struct icc_node *of_icc_get_from_provider(struct of_phandle_args *spec)
 	return node;
 }
 
+static void devm_icc_release(struct device *dev, void *res)
+{
+	icc_put(*(struct icc_path **)res);
+}
+
+struct icc_path *devm_of_icc_get(struct device *dev, const char *name)
+{
+	struct icc_path **ptr, *path;
+
+	ptr = devres_alloc(devm_icc_release, sizeof(**ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	path = of_icc_get(dev, name);
+	if (!IS_ERR(path)) {
+		*ptr = path;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return path;
+}
+EXPORT_SYMBOL_GPL(devm_of_icc_get);
+
 /**
  * of_icc_get() - get a path handle from a DT node based on name
  * @dev: device pointer for the consumer device
diff --git a/include/linux/interconnect.h b/include/linux/interconnect.h
index d70a914..7706924 100644
--- a/include/linux/interconnect.h
+++ b/include/linux/interconnect.h
@@ -28,6 +28,7 @@ struct device;
 struct icc_path *icc_get(struct device *dev, const int src_id,
 			 const int dst_id);
 struct icc_path *of_icc_get(struct device *dev, const char *name);
+struct icc_path *devm_of_icc_get(struct device *dev, const char *name);
 void icc_put(struct icc_path *path);
 int icc_set_bw(struct icc_path *path, u32 avg_bw, u32 peak_bw);
 void icc_set_tag(struct icc_path *path, u32 tag);
@@ -46,6 +47,12 @@ static inline struct icc_path *of_icc_get(struct device *dev,
 	return NULL;
 }
 
+static inline struct icc_path *devm_of_icc_get(struct device *dev,
+						const char *name)
+{
+	return NULL;
+}
+
 static inline void icc_put(struct icc_path *path)
 {
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
