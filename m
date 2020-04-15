Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21F3A1A9AF8
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 12:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408837AbgDOKkW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 06:40:22 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:30736 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2408543AbgDOKY3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 06:24:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586946264; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=UHmbG4LfqhHV9oDAiwB048aBzokk4ajlnillzezvToc=; b=aX/jBPcgpwNbJ/sxuPxlTrgkGHtXnZww64hm1DbriUVpR9Gjfo/ta1+2N9QPGt1lIOfQ06tG
 uG4RO4H8r2LEFy0v/qOWpPKKj1HTvj9MUKxyWRAHW/GYs/JEJbe4l/IZ06dw6jdrQyZQ/Lka
 Xr0tNqb/Wc6Vs/8EWtvzvuuORyA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e96e0ca.7f832cb47148-smtp-out-n01;
 Wed, 15 Apr 2020 10:24:10 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4BF99C432C2; Wed, 15 Apr 2020 10:24:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 48D58C433CB;
        Wed, 15 Apr 2020 10:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 48D58C433CB
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
Subject: [PATCH V4 2/9] interconnect: Set peak requirement as twice of average
Date:   Wed, 15 Apr 2020 15:53:11 +0530
Message-Id: <1586946198-13912-3-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586946198-13912-1-git-send-email-akashast@codeaurora.org>
References: <1586946198-13912-1-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Lot of ICC clients are not aware of their actual peak requirement,
most commonly they tend to guess their peak requirement as
(some factor) * avg_bw.

Centralize random peak guess as twice of average, out into the core
to maintain consistency across the clients. Client can always
override this setting if they got a better idea.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
 drivers/interconnect/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
index f5699ed..ad3938e 100644
--- a/drivers/interconnect/core.c
+++ b/drivers/interconnect/core.c
@@ -516,6 +516,10 @@ EXPORT_SYMBOL_GPL(icc_set_tag);
  * The @path can be NULL when the "interconnects" DT properties is missing,
  * which will mean that no constraints will be set.
  *
+ * This function assumes peak_bw as twice of avg_bw, if peak_bw is not mentioned
+ * explicitly by clients. Clients can pass peak_bw as 0 < peak_bw <=avg_bw to
+ * make it a noops.
+ *
  * Returns 0 on success, or an appropriate error code otherwise.
  */
 int icc_set_bw(struct icc_path *path, u32 avg_bw, u32 peak_bw)
@@ -531,6 +535,12 @@ int icc_set_bw(struct icc_path *path, u32 avg_bw, u32 peak_bw)
 	if (WARN_ON(IS_ERR(path) || !path->num_nodes))
 		return -EINVAL;
 
+	/*
+	 * Assume peak requirement as twice of avg requirement, if it is not
+	 * mentioned explicitly.
+	 */
+	peak_bw = peak_bw ? peak_bw : 2 * avg_bw;
+
 	mutex_lock(&icc_lock);
 
 	old_avg = path->reqs[0].avg_bw;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
